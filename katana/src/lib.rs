//! Backend for a BOSS KATANA-50 MK1 editor. The UI owns one `Katana` on a worker thread, keeps a `Memory` image of
//! the edit buffer (filled by `read_patch`, updated by `events`), and reads/writes parameters by name via `Catalog`.

pub mod amp;
pub mod audio;
pub mod catalog;
pub mod response;
pub mod sysex;

pub use amp::{Error, Katana, Memory};
pub use catalog::{Catalog, Param, Tone};
