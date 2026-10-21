//! Output meters from the amp's USB audio (cpal: WASAPI on Windows, ALSA on Linux).
//! The amp sends no levels over MIDI, but its USB audio out carries the processed signal, tapped where the
//! USB block sits in the FX chain. So the meter shows the USB send level, not the speaker volume (MASTER and
//! power control don't affect it).

use std::sync::atomic::{AtomicU32, Ordering};
use std::sync::Arc;

use cpal::traits::{DeviceTrait, HostTrait, StreamTrait};
use cpal::{FromSample, Sample, SampleFormat, SizedSample};

use crate::amp::Error;

/// Peak meter on the KATANA's USB input. Keep it alive to keep metering; drop it to stop.
/// `cpal::Stream` isn't `Send` on every platform, so create it on the thread that reads it (the UI thread).
pub struct Meter {
    _stream: cpal::Stream,
    peaks: Arc<[AtomicU32; 2]>,
}

impl Meter {
    pub fn open() -> Result<Meter, Error> {
        let err = |e: &dyn std::fmt::Display| Error::Midi(format!("audio: {e}"));
        let host = cpal::default_host();
        let dev = host
            .input_devices()
            .map_err(|e| err(&e))?
            .find(|d| d.description().is_ok_and(|n| n.name().to_uppercase().contains("KATANA")))
            .ok_or_else(|| Error::NotFound("no KATANA audio input".into()))?;
        let cfg = dev.default_input_config().map_err(|e| err(&e))?;
        let peaks: Arc<[AtomicU32; 2]> = Arc::new([AtomicU32::new(0), AtomicU32::new(0)]);
        let (ch, p) = (cfg.channels() as usize, peaks.clone());
        let stream = match cfg.sample_format() {
            SampleFormat::F32 => build::<f32>(&dev, &cfg.into(), ch, p),
            SampleFormat::I16 => build::<i16>(&dev, &cfg.into(), ch, p),
            SampleFormat::I32 => build::<i32>(&dev, &cfg.into(), ch, p),
            f => return Err(err(&format!("unsupported sample format {f}"))),
        }
        .map_err(|e| err(&e))?;
        stream.play().map_err(|e| err(&e))?;
        Ok(Meter { _stream: stream, peaks })
    }

    /// Peak |sample| (0.0–1.0) per channel since the last call. The UI applies its own fall-off.
    pub fn take_peaks(&self) -> [f32; 2] {
        [0, 1].map(|i| f32::from_bits(self.peaks[i].swap(0, Ordering::Relaxed)))
    }
}

fn build<T: SizedSample>(
    dev: &cpal::Device,
    cfg: &cpal::StreamConfig,
    channels: usize,
    peaks: Arc<[AtomicU32; 2]>,
) -> Result<cpal::Stream, cpal::Error>
where
    f32: FromSample<T>,
{
    dev.build_input_stream(
        *cfg,
        move |data: &[T], _| {
            for frame in data.chunks(channels) {
                for (i, &s) in frame.iter().take(2).enumerate() {
                    // non-negative floats order the same as their bits, so fetch_max works on them
                    peaks[i].fetch_max(f32::from_sample(s).abs().to_bits(), Ordering::Relaxed);
                }
            }
        },
        |e| eprintln!("audio stream error: {e}"),
        None,
    )
}
