package tonecentral.parametors
{
   import mx.utils.ObjectUtil;
   import tonecentral.common.util.DataUtil;
   import tonecentral.common.util.ToneCentralUtil;
   import tonecentral.mediator.ToneCentralMediator;
   
   public class TemporaryParams
   {
      
      private var mediator:ToneCentralMediator;
      
      public var patch_name1:int;
      
      public var patch_name2:int;
      
      public var patch_name3:int;
      
      public var patch_name4:int;
      
      public var patch_name5:int;
      
      public var patch_name6:int;
      
      public var patch_name7:int;
      
      public var patch_name8:int;
      
      public var patch_name9:int;
      
      public var patch_name10:int;
      
      public var patch_name11:int;
      
      public var patch_name12:int;
      
      public var patch_name13:int;
      
      public var patch_name14:int;
      
      public var patch_name15:int;
      
      public var patch_name16:int;
      
      public var output_select:int;
      
      public var comp_on_off:int;
      
      public var comp_type:int;
      
      public var comp_sustain:int;
      
      public var comp_attack:int;
      
      public var comp_tone:int;
      
      public var comp_level:int;
      
      public var od_ds_on_off:int;
      
      public var od_ds_type:int;
      
      public var od_ds_drive:int;
      
      public var od_ds_bottom:int;
      
      public var od_ds_tone:int;
      
      public var od_ds_solo_sw:int;
      
      public var od_ds_solo_level:int;
      
      public var od_ds_effect_level:int;
      
      public var od_ds_direct_mix:int;
      
      public var od_ds_custom_type:int;
      
      public var od_ds_custom_bottom:int;
      
      public var od_ds_custom_top:int;
      
      public var od_ds_custom_low:int;
      
      public var od_ds_custom_high:int;
      
      public var od_ds_custom_character:int;
      
      public var preamp_a_on_off:int;
      
      public var preamp_a_type:int;
      
      public var preamp_a_gain:int;
      
      public var preamp_a_t_comp:int;
      
      public var preamp_a_bass:int;
      
      public var preamp_a_middle:int;
      
      public var preamp_a_treble:int;
      
      public var preamp_a_presence:int;
      
      public var preamp_a_level:int;
      
      public var preamp_a_bright:int;
      
      public var preamp_a_gain_sw:int;
      
      public var preamp_a_solo_sw:int;
      
      public var preamp_a_solo_level:int;
      
      public var preamp_a_sp_type:int;
      
      public var preamp_a_mic_type:int;
      
      public var preamp_a_mic_dis:int;
      
      public var preamp_a_mic_pos:int;
      
      public var preamp_a_mic_level:int;
      
      public var preamp_a_direct_mix:int;
      
      public var preamp_a_custom_type:int;
      
      public var preamp_a_custom_bottom:int;
      
      public var preamp_a_custom_edge:int;
      
      public var preamp_a_custom_preamp_low:int;
      
      public var preamp_a_custom_preamp_high:int;
      
      public var preamp_a_custom_char:int;
      
      public var preamp_a_custom_sp_size:int;
      
      public var preamp_a_custom_sp_color_low:int;
      
      public var preamp_a_custom_sp_color_high:int;
      
      public var preamp_a_custom_sp_num:int;
      
      public var preamp_a_custom_sp_cabinet:int;
      
      public var preamp_b_on_off:int;
      
      public var preamp_b_type:int;
      
      public var preamp_b_gain:int;
      
      public var preamp_b_t_comp:int;
      
      public var preamp_b_bass:int;
      
      public var preamp_b_middle:int;
      
      public var preamp_b_treble:int;
      
      public var preamp_b_presence:int;
      
      public var preamp_b_level:int;
      
      public var preamp_b_bright:int;
      
      public var preamp_b_gain_sw:int;
      
      public var preamp_b_solo_sw:int;
      
      public var preamp_b_solo_level:int;
      
      public var preamp_b_sp_type:int;
      
      public var preamp_b_mic_type:int;
      
      public var preamp_b_mic_dis:int;
      
      public var preamp_b_mic_pos:int;
      
      public var preamp_b_mic_level:int;
      
      public var preamp_b_direct_mix:int;
      
      public var preamp_b_custom_type:int;
      
      public var preamp_b_custom_bottom:int;
      
      public var preamp_b_custom_edge:int;
      
      public var preamp_b_custom_preamp_low:int;
      
      public var preamp_b_custom_preamp_high:int;
      
      public var preamp_b_custom_char:int;
      
      public var preamp_b_custom_sp_size:int;
      
      public var preamp_b_custom_sp_color_low:int;
      
      public var preamp_b_custom_sp_color_high:int;
      
      public var preamp_b_custom_sp_num:int;
      
      public var preamp_b_custom_sp_cabinet:int;
      
      public var eq_on_off:int;
      
      public var eq_low_cut:int;
      
      public var eq_low_gain:int;
      
      public var eq_low_mid_freq:int;
      
      public var eq_low_mid_q:int;
      
      public var eq_low_mid_gain:int;
      
      public var eq_high_mid_freq:int;
      
      public var eq_high_mid_q:int;
      
      public var eq_high_mid_gain:int;
      
      public var eq_high_gain:int;
      
      public var eq_high_cut:int;
      
      public var eq_level:int;
      
      public var fx1_on_off:int;
      
      public var fx1_fx_type:int;
      
      public var fx1_sub_od_ds_type:int;
      
      public var fx1_sub_od_ds_drive:int;
      
      public var fx1_sub_od_ds_bottom:int;
      
      public var fx1_sub_od_ds_tone:int;
      
      public var fx1_sub_od_ds_solo_sw:int;
      
      public var fx1_sub_od_ds_solo_level:int;
      
      public var fx1_sub_od_ds_effect_level:int;
      
      public var fx1_sub_od_ds_direct_mix:int;
      
      public var fx1_t_wah_mode:int;
      
      public var fx1_t_wah_polar:int;
      
      public var fx1_t_wah_sens:int;
      
      public var fx1_t_wah_freq:int;
      
      public var fx1_t_wah_peak:int;
      
      public var fx1_t_wah_direct_mix:int;
      
      public var fx1_t_wah_effect_level:int;
      
      public var fx1_auto_wah_mode:int;
      
      public var fx1_auto_wah_freq:int;
      
      public var fx1_auto_wah_peak:int;
      
      public var fx1_auto_wah_rate:int;
      
      public var fx1_auto_wah_depth:int;
      
      public var fx1_auto_wah_direct_mix:int;
      
      public var fx1_auto_wah_effect_level:int;
      
      public var fx1_sub_wah_type:int;
      
      public var fx1_sub_wah_pedal_pos:int;
      
      public var fx1_sub_wah_pedal_min:int;
      
      public var fx1_sub_wah_pedal_max:int;
      
      public var fx1_sub_wah_effect_level:int;
      
      public var fx1_sub_wah_direct_mix:int;
      
      public var fx1_adv_comp_type:int;
      
      public var fx1_adv_comp_sustain:int;
      
      public var fx1_adv_comp_attack:int;
      
      public var fx1_adv_comp_tone:int;
      
      public var fx1_adv_comp_level:int;
      
      public var fx1_limiter_type:int;
      
      public var fx1_limiter_attack:int;
      
      public var fx1_limiter_thresh:int;
      
      public var fx1_limiter_ratio:int;
      
      public var fx1_limiter_release:int;
      
      public var fx1_limiter_level:int;
      
      public var fx1_graphic_eq_31hz:int;
      
      public var fx1_graphic_eq_62hz:int;
      
      public var fx1_graphic_eq_125hz:int;
      
      public var fx1_graphic_eq_250hz:int;
      
      public var fx1_graphic_eq_500hz:int;
      
      public var fx1_graphic_eq_1khz:int;
      
      public var fx1_graphic_eq_2khz:int;
      
      public var fx1_graphic_eq_4khz:int;
      
      public var fx1_graphic_eq_8khz:int;
      
      public var fx1_graphic_eq_16khz:int;
      
      public var fx1_graphic_eq_level:int;
      
      public var fx1_parametric_eq_low_cut:int;
      
      public var fx1_parametric_eq_low_gain:int;
      
      public var fx1_parametric_eq_low_mid_freq:int;
      
      public var fx1_parametric_eq_low_mid_q:int;
      
      public var fx1_parametric_eq_low_mid_gain:int;
      
      public var fx1_parametric_eq_high_mid_freq:int;
      
      public var fx1_parametric_eq_high_mid_q:int;
      
      public var fx1_parametric_eq_high_mid_gain:int;
      
      public var fx1_parametric_eq_high_gain:int;
      
      public var fx1_parametric_eq_high_cut:int;
      
      public var fx1_parametric_eq_level:int;
      
      public var fx1_tone_modify_type:int;
      
      public var fx1_tone_modify_reso:int;
      
      public var fx1_tone_modify_low:int;
      
      public var fx1_tone_modify_high:int;
      
      public var fx1_tone_modify_level:int;
      
      public var fx1_guitar_sim_type:int;
      
      public var fx1_guitar_sim_low:int;
      
      public var fx1_guitar_sim_high:int;
      
      public var fx1_guitar_sim_level:int;
      
      public var fx1_guitar_sim_body:int;
      
      public var fx1_slow_gear_sens:int;
      
      public var fx1_slow_gear_rise_time:int;
      
      public var fx1_slow_gear_level:int;
      
      public var fx1_defretter_tone:int;
      
      public var fx1_defretter_sens:int;
      
      public var fx1_defretter_attack:int;
      
      public var fx1_defretter_depth:int;
      
      public var fx1_defretter_reso:int;
      
      public var fx1_defretter_effect_level:int;
      
      public var fx1_defretter_direct_mix:int;
      
      public var fx1_wave_synth_wave:int;
      
      public var fx1_wave_synth_cutoff:int;
      
      public var fx1_wave_synth_reso:int;
      
      public var fx1_wave_synth_filter_sens:int;
      
      public var fx1_wave_synth_filter_decay:int;
      
      public var fx1_wave_synth_filter_depth:int;
      
      public var fx1_wave_synth_synth_level:int;
      
      public var fx1_wave_synth_direct_mix:int;
      
      public var fx1_sitar_sim_tone:int;
      
      public var fx1_sitar_sim_sens:int;
      
      public var fx1_sitar_sim_depth:int;
      
      public var fx1_sitar_sim_reso:int;
      
      public var fx1_sitar_sim_buzz:int;
      
      public var fx1_sitar_sim_effect_level:int;
      
      public var fx1_sitar_sim_direct_mix:int;
      
      public var fx1_octave_range:int;
      
      public var fx1_octave_level:int;
      
      public var fx1_octave_direct_mix:int;
      
      public var fx1_pitch_shifter_voice:int;
      
      public var fx1_pitch_shifter_ps1mode:int;
      
      public var fx1_pitch_shifter_ps1pitch:int;
      
      public var fx1_pitch_shifter_ps1fine:int;
      
      public var fx1_pitch_shifter_ps1pre_dly_l:int;
      
      public var fx1_pitch_shifter_ps1pre_dly_h:int;
      
      public var fx1_pitch_shifter_ps1level:int;
      
      public var fx1_pitch_shifter_ps2mode:int;
      
      public var fx1_pitch_shifter_ps2pitch:int;
      
      public var fx1_pitch_shifter_ps2fine:int;
      
      public var fx1_pitch_shifter_ps2pre_dly_l:int;
      
      public var fx1_pitch_shifter_ps2pre_dly_h:int;
      
      public var fx1_pitch_shifter_ps2level:int;
      
      public var fx1_pitch_shifter_ps1f_back:int;
      
      public var fx1_pitch_shifter_direct_mix:int;
      
      public var fx1_harmonist_voice:int;
      
      public var fx1_harmonist_hr1harm:int;
      
      public var fx1_harmonist_hr1pre_dly_l:int;
      
      public var fx1_harmonist_hr1pre_dly_h:int;
      
      public var fx1_harmonist_hr1level:int;
      
      public var fx1_harmonist_hr2harm:int;
      
      public var fx1_harmonist_hr2pre_dly_l:int;
      
      public var fx1_harmonist_hr2pre_dly_h:int;
      
      public var fx1_harmonist_hr2level:int;
      
      public var fx1_harmonist_hr1f_back:int;
      
      public var fx1_harmonist_direct_mix:int;
      
      public var fx1_harmonist_hr1c:int;
      
      public var fx1_harmonist_hr1db:int;
      
      public var fx1_harmonist_hr1d:int;
      
      public var fx1_harmonist_hr1eb:int;
      
      public var fx1_harmonist_hr1e:int;
      
      public var fx1_harmonist_hr1f:int;
      
      public var fx1_harmonist_hr1f_s:int;
      
      public var fx1_harmonist_hr1g:int;
      
      public var fx1_harmonist_hr1ab:int;
      
      public var fx1_harmonist_hr1a:int;
      
      public var fx1_harmonist_hr1bb:int;
      
      public var fx1_harmonist_hr1b:int;
      
      public var fx1_harmonist_hr2c:int;
      
      public var fx1_harmonist_hr2db:int;
      
      public var fx1_harmonist_hr2d:int;
      
      public var fx1_harmonist_hr2eb:int;
      
      public var fx1_harmonist_hr2e:int;
      
      public var fx1_harmonist_hr2f:int;
      
      public var fx1_harmonist_hr2f_s:int;
      
      public var fx1_harmonist_hr2g:int;
      
      public var fx1_harmonist_hr2ab:int;
      
      public var fx1_harmonist_hr2a:int;
      
      public var fx1_harmonist_hr2bb:int;
      
      public var fx1_harmonist_hr2b:int;
      
      public var fx1_sound_hold_hold:int;
      
      public var fx1_sound_hold_rise_time:int;
      
      public var fx1_sound_hold_effect_level:int;
      
      public var fx1_ac_processor_type:int;
      
      public var fx1_ac_processor_bass:int;
      
      public var fx1_ac_processor_middle:int;
      
      public var fx1_ac_processor_middle_freq:int;
      
      public var fx1_ac_processor_treble:int;
      
      public var fx1_ac_processor_presence:int;
      
      public var fx1_ac_processor_level:int;
      
      public var fx1_phaser_type:int;
      
      public var fx1_phaser_rate:int;
      
      public var fx1_phaser_depth:int;
      
      public var fx1_phaser_manual:int;
      
      public var fx1_phaser_reso:int;
      
      public var fx1_phaser_step_rate:int;
      
      public var fx1_phaser_effect_level:int;
      
      public var fx1_phaser_direct_mix:int;
      
      public var fx1_flanger_rate:int;
      
      public var fx1_flanger_depth:int;
      
      public var fx1_flanger_manual:int;
      
      public var fx1_flanger_reso:int;
      
      public var fx1_flanger_separation:int;
      
      public var fx1_flanger_low_cut:int;
      
      public var fx1_flanger_effect_level:int;
      
      public var fx1_flanger_direct_mix:int;
      
      public var fx1_tremolo_wave_shape:int;
      
      public var fx1_tremolo_rate:int;
      
      public var fx1_tremolo_depth:int;
      
      public var fx1_tremolo_level:int;
      
      public var fx1_rotary_speed_select:int;
      
      public var fx1_rotary_rate_slow:int;
      
      public var fx1_rotary_rate_fast:int;
      
      public var fx1_rotary_rise_time:int;
      
      public var fx1_rotary_fall_time:int;
      
      public var fx1_rotary_depth:int;
      
      public var fx1_rotary_level:int;
      
      public var fx1_uni_v_rate:int;
      
      public var fx1_uni_v_depth:int;
      
      public var fx1_uni_v_level:int;
      
      public var fx1_pan_type:int;
      
      public var fx1_pan_pos:int;
      
      public var fx1_pan_wave_shape:int;
      
      public var fx1_pan_rate:int;
      
      public var fx1_pan_depth:int;
      
      public var fx1_pan_level:int;
      
      public var fx1_slicer_pattern:int;
      
      public var fx1_slicer_rate:int;
      
      public var fx1_slicer_trigger_sens:int;
      
      public var fx1_slicer_effect_level:int;
      
      public var fx1_slicer_direct_mix:int;
      
      public var fx1_vibrato_rate:int;
      
      public var fx1_vibrato_depth:int;
      
      public var fx1_vibrato_trigger:int;
      
      public var fx1_vibrato_rise_time:int;
      
      public var fx1_vibrato_level:int;
      
      public var fx1_ring_mod_mode:int;
      
      public var fx1_ring_mod_freq:int;
      
      public var fx1_ring_mod_effect_level:int;
      
      public var fx1_ring_mod_direct_mix:int;
      
      public var fx1_humanizer_mode:int;
      
      public var fx1_humanizer_vowel1:int;
      
      public var fx1_humanizer_vowel2:int;
      
      public var fx1_humanizer_sens:int;
      
      public var fx1_humanizer_rate:int;
      
      public var fx1_humanizer_depth:int;
      
      public var fx1_humanizer_manual:int;
      
      public var fx1_humanizer_level:int;
      
      public var fx1_2x2_chorus_xover_freq:int;
      
      public var fx1_2x2_chorus_low_rate:int;
      
      public var fx1_2x2_chorus_low_depth:int;
      
      public var fx1_2x2_chorus_low_pre_delay:int;
      
      public var fx1_2x2_chorus_low_level:int;
      
      public var fx1_2x2_chorus_high_rate:int;
      
      public var fx1_2x2_chorus_high_depth:int;
      
      public var fx1_2x2_chorus_high_pre_delay:int;
      
      public var fx1_2x2_chorus_high_level:int;
      
      public var fx1_2x2_chorus_direct_level:int;
      
      public var fx1_sub_delay_type:int;
      
      public var fx1_sub_delay_time_l:int;
      
      public var fx1_sub_delay_time_h:int;
      
      public var fx1_sub_delay_f_back:int;
      
      public var fx1_sub_delay_high_cut:int;
      
      public var fx1_sub_delay_effect_level:int;
      
      public var fx1_sub_delay_direct_mix:int;
      
      public var fx1_sub_delay_tap_time:int;
      
      public var fx2_on_off:int;
      
      public var fx2_fx_type:int;
      
      public var fx2_sub_od_ds_type:int;
      
      public var fx2_sub_od_ds_drive:int;
      
      public var fx2_sub_od_ds_bottom:int;
      
      public var fx2_sub_od_ds_tone:int;
      
      public var fx2_sub_od_ds_solo_sw:int;
      
      public var fx2_sub_od_ds_solo_level:int;
      
      public var fx2_sub_od_ds_effect_level:int;
      
      public var fx2_sub_od_ds_direct_mix:int;
      
      public var fx2_t_wah_mode:int;
      
      public var fx2_t_wah_polar:int;
      
      public var fx2_t_wah_sens:int;
      
      public var fx2_t_wah_freq:int;
      
      public var fx2_t_wah_peak:int;
      
      public var fx2_t_wah_direct_mix:int;
      
      public var fx2_t_wah_effect_level:int;
      
      public var fx2_auto_wah_mode:int;
      
      public var fx2_auto_wah_freq:int;
      
      public var fx2_auto_wah_peak:int;
      
      public var fx2_auto_wah_rate:int;
      
      public var fx2_auto_wah_depth:int;
      
      public var fx2_auto_wah_direct_mix:int;
      
      public var fx2_auto_wah_effect_level:int;
      
      public var fx2_sub_wah_type:int;
      
      public var fx2_sub_wah_pedal_pos:int;
      
      public var fx2_sub_wah_pedal_min:int;
      
      public var fx2_sub_wah_pedal_max:int;
      
      public var fx2_sub_wah_effect_level:int;
      
      public var fx2_sub_wah_direct_mix:int;
      
      public var fx2_adv_comp_type:int;
      
      public var fx2_adv_comp_sustain:int;
      
      public var fx2_adv_comp_attack:int;
      
      public var fx2_adv_comp_tone:int;
      
      public var fx2_adv_comp_level:int;
      
      public var fx2_limiter_type:int;
      
      public var fx2_limiter_attack:int;
      
      public var fx2_limiter_thresh:int;
      
      public var fx2_limiter_ratio:int;
      
      public var fx2_limiter_release:int;
      
      public var fx2_limiter_level:int;
      
      public var fx2_graphic_eq_31hz:int;
      
      public var fx2_graphic_eq_62hz:int;
      
      public var fx2_graphic_eq_125hz:int;
      
      public var fx2_graphic_eq_250hz:int;
      
      public var fx2_graphic_eq_500hz:int;
      
      public var fx2_graphic_eq_1khz:int;
      
      public var fx2_graphic_eq_2khz:int;
      
      public var fx2_graphic_eq_4khz:int;
      
      public var fx2_graphic_eq_8khz:int;
      
      public var fx2_graphic_eq_16khz:int;
      
      public var fx2_graphic_eq_level:int;
      
      public var fx2_parametric_eq_low_cut:int;
      
      public var fx2_parametric_eq_low_gain:int;
      
      public var fx2_parametric_eq_low_mid_freq:int;
      
      public var fx2_parametric_eq_low_mid_q:int;
      
      public var fx2_parametric_eq_low_mid_gain:int;
      
      public var fx2_parametric_eq_high_mid_freq:int;
      
      public var fx2_parametric_eq_high_mid_q:int;
      
      public var fx2_parametric_eq_high_mid_gain:int;
      
      public var fx2_parametric_eq_high_gain:int;
      
      public var fx2_parametric_eq_high_cut:int;
      
      public var fx2_parametric_eq_level:int;
      
      public var fx2_tone_modify_type:int;
      
      public var fx2_tone_modify_reso:int;
      
      public var fx2_tone_modify_low:int;
      
      public var fx2_tone_modify_high:int;
      
      public var fx2_tone_modify_level:int;
      
      public var fx2_guitar_sim_type:int;
      
      public var fx2_guitar_sim_low:int;
      
      public var fx2_guitar_sim_high:int;
      
      public var fx2_guitar_sim_level:int;
      
      public var fx2_guitar_sim_body:int;
      
      public var fx2_slow_gear_sens:int;
      
      public var fx2_slow_gear_rise_time:int;
      
      public var fx2_slow_gear_level:int;
      
      public var fx2_defretter_tone:int;
      
      public var fx2_defretter_sens:int;
      
      public var fx2_defretter_attack:int;
      
      public var fx2_defretter_depth:int;
      
      public var fx2_defretter_reso:int;
      
      public var fx2_defretter_effect_level:int;
      
      public var fx2_defretter_direct_mix:int;
      
      public var fx2_wave_synth_wave:int;
      
      public var fx2_wave_synth_cutoff:int;
      
      public var fx2_wave_synth_reso:int;
      
      public var fx2_wave_synth_filter_sens:int;
      
      public var fx2_wave_synth_filter_decay:int;
      
      public var fx2_wave_synth_filter_depth:int;
      
      public var fx2_wave_synth_synth_level:int;
      
      public var fx2_wave_synth_direct_mix:int;
      
      public var fx2_sitar_sim_tone:int;
      
      public var fx2_sitar_sim_sens:int;
      
      public var fx2_sitar_sim_depth:int;
      
      public var fx2_sitar_sim_reso:int;
      
      public var fx2_sitar_sim_buzz:int;
      
      public var fx2_sitar_sim_effect_level:int;
      
      public var fx2_sitar_sim_direct_mix:int;
      
      public var fx2_octave_range:int;
      
      public var fx2_octave_level:int;
      
      public var fx2_octave_direct_mix:int;
      
      public var fx2_pitch_shifter_voice:int;
      
      public var fx2_pitch_shifter_ps1mode:int;
      
      public var fx2_pitch_shifter_ps1pitch:int;
      
      public var fx2_pitch_shifter_ps1fine:int;
      
      public var fx2_pitch_shifter_ps1pre_dly_l:int;
      
      public var fx2_pitch_shifter_ps1pre_dly_h:int;
      
      public var fx2_pitch_shifter_ps1level:int;
      
      public var fx2_pitch_shifter_ps2mode:int;
      
      public var fx2_pitch_shifter_ps2pitch:int;
      
      public var fx2_pitch_shifter_ps2fine:int;
      
      public var fx2_pitch_shifter_ps2pre_dly_l:int;
      
      public var fx2_pitch_shifter_ps2pre_dly_h:int;
      
      public var fx2_pitch_shifter_ps2level:int;
      
      public var fx2_pitch_shifter_ps1f_back:int;
      
      public var fx2_pitch_shifter_direct_mix:int;
      
      public var fx2_harmonist_voice:int;
      
      public var fx2_harmonist_hr1harm:int;
      
      public var fx2_harmonist_hr1pre_dly_l:int;
      
      public var fx2_harmonist_hr1pre_dly_h:int;
      
      public var fx2_harmonist_hr1level:int;
      
      public var fx2_harmonist_hr2harm:int;
      
      public var fx2_harmonist_hr2pre_dly_l:int;
      
      public var fx2_harmonist_hr2pre_dly_h:int;
      
      public var fx2_harmonist_hr2level:int;
      
      public var fx2_harmonist_hr1f_back:int;
      
      public var fx2_harmonist_direct_mix:int;
      
      public var fx2_harmonist_hr1c:int;
      
      public var fx2_harmonist_hr1db:int;
      
      public var fx2_harmonist_hr1d:int;
      
      public var fx2_harmonist_hr1eb:int;
      
      public var fx2_harmonist_hr1e:int;
      
      public var fx2_harmonist_hr1f:int;
      
      public var fx2_harmonist_hr1f_s:int;
      
      public var fx2_harmonist_hr1g:int;
      
      public var fx2_harmonist_hr1ab:int;
      
      public var fx2_harmonist_hr1a:int;
      
      public var fx2_harmonist_hr1bb:int;
      
      public var fx2_harmonist_hr1b:int;
      
      public var fx2_harmonist_hr2c:int;
      
      public var fx2_harmonist_hr2db:int;
      
      public var fx2_harmonist_hr2d:int;
      
      public var fx2_harmonist_hr2eb:int;
      
      public var fx2_harmonist_hr2e:int;
      
      public var fx2_harmonist_hr2f:int;
      
      public var fx2_harmonist_hr2f_s:int;
      
      public var fx2_harmonist_hr2g:int;
      
      public var fx2_harmonist_hr2ab:int;
      
      public var fx2_harmonist_hr2a:int;
      
      public var fx2_harmonist_hr2bb:int;
      
      public var fx2_harmonist_hr2b:int;
      
      public var fx2_sound_hold_hold:int;
      
      public var fx2_sound_hold_rise_time:int;
      
      public var fx2_sound_hold_effect_level:int;
      
      public var fx2_ac_processor_type:int;
      
      public var fx2_ac_processor_bass:int;
      
      public var fx2_ac_processor_middle:int;
      
      public var fx2_ac_processor_middle_freq:int;
      
      public var fx2_ac_processor_treble:int;
      
      public var fx2_ac_processor_presence:int;
      
      public var fx2_ac_processor_level:int;
      
      public var fx2_phaser_type:int;
      
      public var fx2_phaser_rate:int;
      
      public var fx2_phaser_depth:int;
      
      public var fx2_phaser_manual:int;
      
      public var fx2_phaser_reso:int;
      
      public var fx2_phaser_step_rate:int;
      
      public var fx2_phaser_effect_level:int;
      
      public var fx2_phaser_direct_mix:int;
      
      public var fx2_flanger_rate:int;
      
      public var fx2_flanger_depth:int;
      
      public var fx2_flanger_manual:int;
      
      public var fx2_flanger_reso:int;
      
      public var fx2_flanger_separation:int;
      
      public var fx2_flanger_low_cut:int;
      
      public var fx2_flanger_effect_level:int;
      
      public var fx2_flanger_direct_mix:int;
      
      public var fx2_tremolo_wave_shape:int;
      
      public var fx2_tremolo_rate:int;
      
      public var fx2_tremolo_depth:int;
      
      public var fx2_tremolo_level:int;
      
      public var fx2_rotary_speed_select:int;
      
      public var fx2_rotary_rate_slow:int;
      
      public var fx2_rotary_rate_fast:int;
      
      public var fx2_rotary_rise_time:int;
      
      public var fx2_rotary_fall_time:int;
      
      public var fx2_rotary_depth:int;
      
      public var fx2_rotary_level:int;
      
      public var fx2_uni_v_rate:int;
      
      public var fx2_uni_v_depth:int;
      
      public var fx2_uni_v_level:int;
      
      public var fx2_pan_type:int;
      
      public var fx2_pan_pos:int;
      
      public var fx2_pan_wave_shape:int;
      
      public var fx2_pan_rate:int;
      
      public var fx2_pan_depth:int;
      
      public var fx2_pan_level:int;
      
      public var fx2_slicer_pattern:int;
      
      public var fx2_slicer_rate:int;
      
      public var fx2_slicer_trigger_sens:int;
      
      public var fx2_slicer_effect_level:int;
      
      public var fx2_slicer_direct_mix:int;
      
      public var fx2_vibrato_rate:int;
      
      public var fx2_vibrato_depth:int;
      
      public var fx2_vibrato_trigger:int;
      
      public var fx2_vibrato_rise_time:int;
      
      public var fx2_vibrato_level:int;
      
      public var fx2_ring_mod_mode:int;
      
      public var fx2_ring_mod_freq:int;
      
      public var fx2_ring_mod_effect_level:int;
      
      public var fx2_ring_mod_direct_mix:int;
      
      public var fx2_humanizer_mode:int;
      
      public var fx2_humanizer_vowel1:int;
      
      public var fx2_humanizer_vowel2:int;
      
      public var fx2_humanizer_sens:int;
      
      public var fx2_humanizer_rate:int;
      
      public var fx2_humanizer_depth:int;
      
      public var fx2_humanizer_manual:int;
      
      public var fx2_humanizer_level:int;
      
      public var fx2_2x2_chorus_xover_freq:int;
      
      public var fx2_2x2_chorus_low_rate:int;
      
      public var fx2_2x2_chorus_low_depth:int;
      
      public var fx2_2x2_chorus_low_pre_delay:int;
      
      public var fx2_2x2_chorus_low_level:int;
      
      public var fx2_2x2_chorus_high_rate:int;
      
      public var fx2_2x2_chorus_high_depth:int;
      
      public var fx2_2x2_chorus_high_pre_delay:int;
      
      public var fx2_2x2_chorus_high_level:int;
      
      public var fx2_2x2_chorus_direct_level:int;
      
      public var fx2_sub_delay_type:int;
      
      public var fx2_sub_delay_time_l:int;
      
      public var fx2_sub_delay_time_h:int;
      
      public var fx2_sub_delay_f_back:int;
      
      public var fx2_sub_delay_high_cut:int;
      
      public var fx2_sub_delay_effect_level:int;
      
      public var fx2_sub_delay_direct_mix:int;
      
      public var fx2_sub_delay_tap_time:int;
      
      public var delay_on_off:int;
      
      public var delay_type:int;
      
      public var delay_delay_time_l:int;
      
      public var delay_delay_time_h:int;
      
      public var delay_f_back:int;
      
      public var delay_high_cut:int;
      
      public var delay_effect_level:int;
      
      public var delay_direct_mix:int;
      
      public var delay_tap_time:int;
      
      public var delay_d1_time_l:int;
      
      public var delay_d1_time_h:int;
      
      public var delay_d1_f_back:int;
      
      public var delay_d1_hi_cut:int;
      
      public var delay_d1_level:int;
      
      public var delay_d2_time_l:int;
      
      public var delay_d2_time_h:int;
      
      public var delay_d2_f_back:int;
      
      public var delay_d2_hi_cut:int;
      
      public var delay_d2_level:int;
      
      public var delay_mod_rate:int;
      
      public var delay_mod_depth:int;
      
      public var chorus_on_off:int;
      
      public var chorus_mode:int;
      
      public var chorus_rate:int;
      
      public var chorus_depth:int;
      
      public var chorus_pre_delay:int;
      
      public var chorus_low_cut:int;
      
      public var chorus_high_cut:int;
      
      public var chorus_effect_level:int;
      
      public var chorus_direct_level:int;
      
      public var reverb_on_off:int;
      
      public var reverb_type:int;
      
      public var reverb_time:int;
      
      public var reverb_pre_delay_l:int;
      
      public var reverb_pre_delay_h:int;
      
      public var reverb_low_cut:int;
      
      public var reverb_high_cut:int;
      
      public var reverb_density:int;
      
      public var reverb_effect_level:int;
      
      public var reverb_direct_mix:int;
      
      public var reverb_spring_sens:int;
      
      public var pedal_fx_on_off:int;
      
      public var pedal_fx_pedal_bend_pitch:int;
      
      public var pedal_fx_pedal_bend_position:int;
      
      public var pedal_fx_pedal_bend_effect_level:int;
      
      public var pedal_fx_pedal_bend_direct_mix:int;
      
      public var pedal_fx_wah_type:int;
      
      public var pedal_fx_wah_position:int;
      
      public var pedal_fx_wah_pedal_min:int;
      
      public var pedal_fx_wah_pedal_max:int;
      
      public var pedal_fx_wah_effect_level:int;
      
      public var pedal_fx_wah_direct_mix:int;
      
      public var foot_volume_volume_curve:int;
      
      public var foot_volume_volume_min:int;
      
      public var foot_volume_volume_max:int;
      
      public var foot_volume_level:int;
      
      public var divider_mode:int;
      
      public var divider_ch_select:int;
      
      public var divider_ch_a_dynamic:int;
      
      public var divider_ch_a_dynamic_sens:int;
      
      public var divider_ch_a_filter:int;
      
      public var divider_ch_a_cutoff_freq:int;
      
      public var divider_ch_b_dynamic:int;
      
      public var divider_ch_b_dynamic_sens:int;
      
      public var divider_ch_b_filter:int;
      
      public var divider_ch_b_cutoff_freq:int;
      
      public var mixer_mode:int;
      
      public var mixer_ch_a_b_balance:int;
      
      public var mixer_spread:int;
      
      public var send_return_on_off:int;
      
      public var send_return_mode:int;
      
      public var send_return_send_level:int;
      
      public var send_return_return_level:int;
      
      public var send_return_adjust:int;
      
      public var amp_control:int;
      
      public var ns1_on_off:int;
      
      public var ns1_threshold:int;
      
      public var ns1_release:int;
      
      public var ns1_detect:int;
      
      public var ns2_on_off:int;
      
      public var ns2_threshold:int;
      
      public var ns2_release:int;
      
      public var ns2_detect:int;
      
      public var accel_fx_type:int;
      
      public var accel_fx_s_bend_pitch:int;
      
      public var accel_fx_s_bend_rise_time:int;
      
      public var accel_fx_s_bend_fall_time:int;
      
      public var accel_fx_laser_beam_rate:int;
      
      public var accel_fx_laser_beam_depth:int;
      
      public var accel_fx_laser_beam_rise_time:int;
      
      public var accel_fx_laser_beam_fall_time:int;
      
      public var accel_fx_ring_mod_freq:int;
      
      public var accel_fx_ring_mod_rise_time:int;
      
      public var accel_fx_ring_mod_fall_time:int;
      
      public var accel_fx_ring_mod_ring_level:int;
      
      public var accel_fx_ring_mod_octave_level:int;
      
      public var accel_fx_ring_mod_direct_mix:int;
      
      public var accel_fx_twist_level:int;
      
      public var accel_fx_twist_rise_time:int;
      
      public var accel_fx_twist_fall_time:int;
      
      public var accel_fx_warp_level:int;
      
      public var accel_fx_warp_rise_time:int;
      
      public var accel_fx_warp_fall_time:int;
      
      public var accel_fx_feedbacker_mode:int;
      
      public var accel_fx_feedbacker_depth:int;
      
      public var accel_fx_feedbacker_rise_time:int;
      
      public var accel_fx_feedbacker_octave_rise_time:int;
      
      public var accel_fx_feedbacker_f_back_level:int;
      
      public var accel_fx_feedbacker_octave_f_back_level:int;
      
      public var accel_fx_feedbacker_vib_rate:int;
      
      public var accel_fx_feedbacker_vib_depth:int;
      
      public var patch_category:int;
      
      public var patch_level:int;
      
      public var master_eq_low_gain:int;
      
      public var master_eq_mid_freq:int;
      
      public var master_eq_mid_q:int;
      
      public var master_eq_mid_gain:int;
      
      public var master_eq_high_gain:int;
      
      public var master_bpm_l:int;
      
      public var master_bpm_h:int;
      
      public var master_key:int;
      
      public var master_beat:int;
      
      public var pitch_detection:int;
      
      public var fx_chain_position1:int;
      
      public var fx_chain_position2:int;
      
      public var fx_chain_position3:int;
      
      public var fx_chain_position4:int;
      
      public var fx_chain_position5:int;
      
      public var fx_chain_position6:int;
      
      public var fx_chain_position7:int;
      
      public var fx_chain_position8:int;
      
      public var fx_chain_position9:int;
      
      public var fx_chain_position10:int;
      
      public var fx_chain_position11:int;
      
      public var fx_chain_position12:int;
      
      public var fx_chain_position13:int;
      
      public var fx_chain_position14:int;
      
      public var fx_chain_position15:int;
      
      public var fx_chain_position16:int;
      
      public var fx_chain_position17:int;
      
      public var fx_chain_position18:int;
      
      public var fx_chain_position19:int;
      
      public var fx_chain_position20:int;
      
      public var manual_mode_bank_down:int;
      
      public var manual_mode_bank_up:int;
      
      public var manual_mode_number_pedal1:int;
      
      public var manual_mode_number_pedal2:int;
      
      public var manual_mode_number_pedal3:int;
      
      public var manual_mode_number_pedal4:int;
      
      public var manual_mode_phrase_loop:int;
      
      public var manual_mode_accel_ctrl:int;
      
      public var ctl_exp_accel_ctl_func:int;
      
      public var ctl_exp_accel_ctl_min:int;
      
      public var ctl_exp_accel_ctl_max:int;
      
      public var ctl_exp_accel_ctl_src_mode:int;
      
      public var ctl_exp_exp_sw_func:int;
      
      public var ctl_exp_exp_sw_min:int;
      
      public var ctl_exp_exp_sw_max:int;
      
      public var ctl_exp_exp_sw_src_mode:int;
      
      public var ctl_exp_sub_ctl1_func:int;
      
      public var ctl_exp_sub_ctl1_min:int;
      
      public var ctl_exp_sub_ctl1_max:int;
      
      public var ctl_exp_sub_ctl1_src_mode:int;
      
      public var ctl_exp_sub_ctl2_func:int;
      
      public var ctl_exp_sub_ctl2_min:int;
      
      public var ctl_exp_sub_ctl2_max:int;
      
      public var ctl_exp_sub_ctl2_src_mode:int;
      
      public var ctl_exp_exp_func:int;
      
      public var ctl_exp_exp_patch_level_min:int;
      
      public var ctl_exp_exp_patch_level_max:int;
      
      public var ctl_exp_sub_exp_func:int;
      
      public var ctl_exp_sub_exp_patch_level_min:int;
      
      public var ctl_exp_sub_exp_patch_level_max:int;
      
      public var assign1_on_off:int;
      
      public var assign1_target_l:int;
      
      public var assign1_target_h:int;
      
      public var assign1_target_min_l:int;
      
      public var assign1_target_min_h:int;
      
      public var assign1_target_max_l:int;
      
      public var assign1_target_max_h:int;
      
      public var assign1_source:int;
      
      public var assign1_source_mode:int;
      
      public var assign1_act_range_lo:int;
      
      public var assign1_act_range_hi:int;
      
      public var assign1_int_pdl_trigger:int;
      
      public var assign1_int_pdl_time:int;
      
      public var assign1_int_pdl_curve:int;
      
      public var assign1_wave_rate:int;
      
      public var assign1_waveform:int;
      
      public var assign2_on_off:int;
      
      public var assign2_target_l:int;
      
      public var assign2_target_h:int;
      
      public var assign2_target_min_l:int;
      
      public var assign2_target_min_h:int;
      
      public var assign2_target_max_l:int;
      
      public var assign2_target_max_h:int;
      
      public var assign2_source:int;
      
      public var assign2_source_mode:int;
      
      public var assign2_act_range_lo:int;
      
      public var assign2_act_range_hi:int;
      
      public var assign2_int_pdl_trigger:int;
      
      public var assign2_int_pdl_time:int;
      
      public var assign2_int_pdl_curve:int;
      
      public var assign2_wave_rate:int;
      
      public var assign2_waveform:int;
      
      public var assign3_on_off:int;
      
      public var assign3_target_l:int;
      
      public var assign3_target_h:int;
      
      public var assign3_target_min_l:int;
      
      public var assign3_target_min_h:int;
      
      public var assign3_target_max_l:int;
      
      public var assign3_target_max_h:int;
      
      public var assign3_source:int;
      
      public var assign3_source_mode:int;
      
      public var assign3_act_range_lo:int;
      
      public var assign3_act_range_hi:int;
      
      public var assign3_int_pdl_trigger:int;
      
      public var assign3_int_pdl_time:int;
      
      public var assign3_int_pdl_curve:int;
      
      public var assign3_wave_rate:int;
      
      public var assign3_waveform:int;
      
      public var assign4_on_off:int;
      
      public var assign4_target_l:int;
      
      public var assign4_target_h:int;
      
      public var assign4_target_min_l:int;
      
      public var assign4_target_min_h:int;
      
      public var assign4_target_max_l:int;
      
      public var assign4_target_max_h:int;
      
      public var assign4_source:int;
      
      public var assign4_source_mode:int;
      
      public var assign4_act_range_lo:int;
      
      public var assign4_act_range_hi:int;
      
      public var assign4_int_pdl_trigger:int;
      
      public var assign4_int_pdl_time:int;
      
      public var assign4_int_pdl_curve:int;
      
      public var assign4_wave_rate:int;
      
      public var assign4_waveform:int;
      
      public var assign5_on_off:int;
      
      public var assign5_target_l:int;
      
      public var assign5_target_h:int;
      
      public var assign5_target_min_l:int;
      
      public var assign5_target_min_h:int;
      
      public var assign5_target_max_l:int;
      
      public var assign5_target_max_h:int;
      
      public var assign5_source:int;
      
      public var assign5_source_mode:int;
      
      public var assign5_act_range_lo:int;
      
      public var assign5_act_range_hi:int;
      
      public var assign5_int_pdl_trigger:int;
      
      public var assign5_int_pdl_time:int;
      
      public var assign5_int_pdl_curve:int;
      
      public var assign5_wave_rate:int;
      
      public var assign5_waveform:int;
      
      public var assign6_on_off:int;
      
      public var assign6_target_l:int;
      
      public var assign6_target_h:int;
      
      public var assign6_target_min_l:int;
      
      public var assign6_target_min_h:int;
      
      public var assign6_target_max_l:int;
      
      public var assign6_target_max_h:int;
      
      public var assign6_source:int;
      
      public var assign6_source_mode:int;
      
      public var assign6_act_range_lo:int;
      
      public var assign6_act_range_hi:int;
      
      public var assign6_int_pdl_trigger:int;
      
      public var assign6_int_pdl_time:int;
      
      public var assign6_int_pdl_curve:int;
      
      public var assign6_wave_rate:int;
      
      public var assign6_waveform:int;
      
      public var assign7_on_off:int;
      
      public var assign7_target_l:int;
      
      public var assign7_target_h:int;
      
      public var assign7_target_min_l:int;
      
      public var assign7_target_min_h:int;
      
      public var assign7_target_max_l:int;
      
      public var assign7_target_max_h:int;
      
      public var assign7_source:int;
      
      public var assign7_source_mode:int;
      
      public var assign7_act_range_lo:int;
      
      public var assign7_act_range_hi:int;
      
      public var assign7_int_pdl_trigger:int;
      
      public var assign7_int_pdl_time:int;
      
      public var assign7_int_pdl_curve:int;
      
      public var assign7_wave_rate:int;
      
      public var assign7_waveform:int;
      
      public var assign8_on_off:int;
      
      public var assign8_target_l:int;
      
      public var assign8_target_h:int;
      
      public var assign8_target_min_l:int;
      
      public var assign8_target_min_h:int;
      
      public var assign8_target_max_l:int;
      
      public var assign8_target_max_h:int;
      
      public var assign8_source:int;
      
      public var assign8_source_mode:int;
      
      public var assign8_act_range_lo:int;
      
      public var assign8_act_range_hi:int;
      
      public var assign8_int_pdl_trigger:int;
      
      public var assign8_int_pdl_time:int;
      
      public var assign8_int_pdl_curve:int;
      
      public var assign8_wave_rate:int;
      
      public var assign8_waveform:int;
      
      public var assign_common_input_sens:int;
      
      public var fx1_acsim_high:int;
      
      public var fx1_acsim_body:int;
      
      public var fx1_acsim_low:int;
      
      public var fx1_acsim_level:int;
      
      public var fx1_rotary2_balance:int;
      
      public var fx1_rotary2_speed_sel:int;
      
      public var fx1_rotary2_rate_slow:int;
      
      public var fx1_rotary2_rate_fast:int;
      
      public var fx1_rotary2_risetime:int;
      
      public var fx1_rotary2_falltime:int;
      
      public var fx1_rotary2_depth:int;
      
      public var fx1_rotary2_level:int;
      
      public var fx1_rotary2_direct_mix:int;
      
      public var fx2_acsim_high:int;
      
      public var fx2_acsim_body:int;
      
      public var fx2_acsim_low:int;
      
      public var fx2_acsim_level:int;
      
      public var fx2_rotary2_balance:int;
      
      public var fx2_rotary2_speed_sel:int;
      
      public var fx2_rotary2_rate_slow:int;
      
      public var fx2_rotary2_rate_fast:int;
      
      public var fx2_rotary2_risetime:int;
      
      public var fx2_rotary2_falltime:int;
      
      public var fx2_rotary2_depth:int;
      
      public var fx2_rotary2_level:int;
      
      public var fx2_rotary2_direct_mix:int;
      
      public var prm_fx2_teraecho_mode:int;
      
      public var prm_fx2_teraecho_time:int;
      
      public var prm_fx2_teraecho_feedback:int;
      
      public var prm_fx2_teraecho_tone:int;
      
      public var prm_fx2_teraecho_effect_level:int;
      
      public var prm_fx2_teraecho_direct_mix:int;
      
      public var prm_fx2_teraecho_hold:int;
      
      public var prm_fx2_overtone_detune:int;
      
      public var prm_fx2_overtone_tone:int;
      
      public var prm_fx2_overtone_upper_level:int;
      
      public var prm_fx2_overtone_lower_level:int;
      
      public var prm_fx2_overtone_direct_level:int;
      
      public var fx1_phaser90e_script:int;
      
      public var fx1_phaser90e_speed:int;
      
      public var fx1_flanger117e_manual:int;
      
      public var fx1_flanger117e_width:int;
      
      public var fx1_flanger117e_speed:int;
      
      public var fx1_flanger117e_regen:int;
      
      public var fx2_phaser90e_script:int;
      
      public var fx2_phaser90e_speed:int;
      
      public var fx2_flanger117e_manual:int;
      
      public var fx2_flanger117e_width:int;
      
      public var fx2_flanger117e_speed:int;
      
      public var fx2_flanger117e_regen:int;
      
      public var delay_vtg_lpf:int;
      
      public var delay_vtg_filter:int;
      
      public var delay_vtg_feedback_phase:int;
      
      public var delay_vtg_effect_phase:int;
      
      public var delay_vtg_mod_sw:int;
      
      public var delay2_on_off:int;
      
      public var delay2_type:int;
      
      public var delay2_delay_time_l:int;
      
      public var delay2_delay_time_h:int;
      
      public var delay2_f_back:int;
      
      public var delay2_high_cut:int;
      
      public var delay2_effect_level:int;
      
      public var delay2_direct_mix:int;
      
      public var delay2_tap_time:int;
      
      public var delay2_d1_time_l:int;
      
      public var delay2_d1_time_h:int;
      
      public var delay2_d1_f_back:int;
      
      public var delay2_d1_hi_cut:int;
      
      public var delay2_d1_level:int;
      
      public var delay2_d2_time_l:int;
      
      public var delay2_d2_time_h:int;
      
      public var delay2_d2_f_back:int;
      
      public var delay2_d2_hi_cut:int;
      
      public var delay2_d2_level:int;
      
      public var delay2_mod_rate:int;
      
      public var delay2_mod_depth:int;
      
      public var delay2_vtg_lpf:int;
      
      public var delay2_vtg_filter:int;
      
      public var delay2_vtg_feedback_phase:int;
      
      public var delay2_vtg_effect_phase:int;
      
      public var delay2_vtg_mod_sw:int;
      
      public var fx1_wah95e_pedal_pos:int;
      
      public var fx1_wah95e_pedal_min:int;
      
      public var fx1_wah95e_pedal_max:int;
      
      public var fx1_wah95e_effect_level:int;
      
      public var fx1_wah95e_direct_mix:int;
      
      public var fx1_dc30_selector:int;
      
      public var fx1_dc30_input_volume:int;
      
      public var fx1_dc30_chorus_intensity:int;
      
      public var fx1_dc30_echo_repeat_rate_l:int;
      
      public var fx1_dc30_echo_repeat_rate_h:int;
      
      public var fx1_dc30_echo_intensity:int;
      
      public var fx1_dc30_echo_volume:int;
      
      public var fx1_dc30_tone:int;
      
      public var fx1_dc30_output:int;
      
      public var fx2_wah95e_pedal_pos:int;
      
      public var fx2_wah95e_pedal_min:int;
      
      public var fx2_wah95e_pedal_max:int;
      
      public var fx2_wah95e_effect_level:int;
      
      public var fx2_wah95e_direct_mix:int;
      
      public var fx2_dc30_selector:int;
      
      public var fx2_dc30_input_volume:int;
      
      public var fx2_dc30_chorus_intensity:int;
      
      public var fx2_dc30_echo_repeat_rate_l:int;
      
      public var fx2_dc30_echo_repeat_rate_h:int;
      
      public var fx2_dc30_echo_intensity:int;
      
      public var fx2_dc30_echo_volume:int;
      
      public var fx2_dc30_tone:int;
      
      public var fx2_dc30_output:int;
      
      public var eq_type:int;
      
      public var eq_geq_31hz:int;
      
      public var eq_geq_62hz:int;
      
      public var eq_geq_125hz:int;
      
      public var eq_geq_250hz:int;
      
      public var eq_geq_500hz:int;
      
      public var eq_geq_1khz:int;
      
      public var eq_geq_2khz:int;
      
      public var eq_geq_4khz:int;
      
      public var eq_geq_8khz:int;
      
      public var eq_geq_16khz:int;
      
      public var eq_geq_level:int;
      
      public var pedal_fx_position:int;
      
      public var pedal_fx_type:int;
      
      public var pedal_fx_evh95_position:int;
      
      public var pedal_fx_evh95_pedal_min:int;
      
      public var pedal_fx_evh95_pedal_max:int;
      
      public var pedal_fx_evh95_effect_level:int;
      
      public var pedal_fx_evh95_direct_mix:int;
      
      public var fx1_heavy_oct_1oct_level:int;
      
      public var fx1_heavy_oct_2oct_level:int;
      
      public var fx1_heavy_oct_direct_mix:int;
      
      public var fx2_heavy_oct_1oct_level:int;
      
      public var fx2_heavy_oct_2oct_level:int;
      
      public var fx2_heavy_oct_direct_mix:int;
      
      public var chain_ptn:int;
      
      public var fxbox_asgn_fx1a_g:int;
      
      public var fxbox_asgn_fx1a_r:int;
      
      public var fxbox_asgn_fx1a_y:int;
      
      public var fxbox_asgn_fx1b_g:int;
      
      public var fxbox_asgn_fx1b_r:int;
      
      public var fxbox_asgn_fx1b_y:int;
      
      public var fxbox_asgn_fx2a_g:int;
      
      public var fxbox_asgn_fx2a_r:int;
      
      public var fxbox_asgn_fx2a_y:int;
      
      public var fxbox_asgn_fx2b_g:int;
      
      public var fxbox_asgn_fx2b_r:int;
      
      public var fxbox_asgn_fx2b_y:int;
      
      public var fxbox_asgn_fx3_g:int;
      
      public var fxbox_asgn_fx3_r:int;
      
      public var fxbox_asgn_fx3_y:int;
      
      public var fxbox_sel_fx1b:int;
      
      public var fxbox_sel_fx2a:int;
      
      public var fxbox_sel_fx3:int;
      
      public var fx_active_ab_fx1:int;
      
      public var fx_active_ab_fx2:int;
      
      public var fxbox_sel_fx1a:int;
      
      public var fxbox_sel_fx2b:int;
      
      public var send_return_position:int;
      
      public var eq_position:int;
      
      public var fxbox_asgn_fx3b_g:int;
      
      public var fxbox_asgn_fx3b_r:int;
      
      public var fxbox_asgn_fx3b_y:int;
      
      public var fxbox_layer_fx3_g:int;
      
      public var fxbox_layer_fx3_r:int;
      
      public var fxbox_layer_fx3_y:int;
      
      public var pedal_function_exp_pedal:int;
      
      public var pedal_function_gafc_exp1:int;
      
      public var pedal_function_gafc_exp2:int;
      
      public var knob_assign_booster:int;
      
      public var knob_assign_delay:int;
      
      public var knob_assign_reverb:int;
      
      public var knob_assign_chorus:int;
      
      public var knob_assign_flanger:int;
      
      public var knob_assign_phaser:int;
      
      public var knob_assign_uni_v:int;
      
      public var knob_assign_tremolo:int;
      
      public var knob_assign_vibrato:int;
      
      public var knob_assign_rotary:int;
      
      public var knob_assign_ring_mod:int;
      
      public var knob_assign_slow_gear:int;
      
      public var knob_assign_slicer:int;
      
      public var knob_assign_comp:int;
      
      public var knob_assign_limiter:int;
      
      public var knob_assign_t_wah:int;
      
      public var knob_assign_auto_wah:int;
      
      public var knob_assign_pedal_wah:int;
      
      public var knob_assign_geq:int;
      
      public var knob_assign_peq:int;
      
      public var knob_assign_guitar_sim:int;
      
      public var knob_assign_ac_guitar_sim:int;
      
      public var knob_assign_ac_processor:int;
      
      public var knob_assign_wave_synth:int;
      
      public var knob_assign_octave:int;
      
      public var knob_assign_pitch_shifter:int;
      
      public var knob_assign_harmonist:int;
      
      public var knob_assign_humanizer:int;
      
      public var knob_assign_evh_phaser:int;
      
      public var knob_assign_evh_flanger:int;
      
      public var knob_assign_evh_wah:int;
      
      public var knob_assign_dc30:int;
      
      public var knob_assign_heavy_oct:int;
      
      public var exp_pedal_assign_booster:int;
      
      public var exp_pedal_assign_delay:int;
      
      public var exp_pedal_assign_reverb:int;
      
      public var exp_pedal_assign_chorus:int;
      
      public var exp_pedal_assign_flanger:int;
      
      public var exp_pedal_assign_phaser:int;
      
      public var exp_pedal_assign_uni_v:int;
      
      public var exp_pedal_assign_tremolo:int;
      
      public var exp_pedal_assign_vibrato:int;
      
      public var exp_pedal_assign_rotary:int;
      
      public var exp_pedal_assign_ring_mod:int;
      
      public var exp_pedal_assign_slow_gear:int;
      
      public var exp_pedal_assign_slicer:int;
      
      public var exp_pedal_assign_comp:int;
      
      public var exp_pedal_assign_limiter:int;
      
      public var exp_pedal_assign_t_wah:int;
      
      public var exp_pedal_assign_auto_wah:int;
      
      public var exp_pedal_assign_pedal_wah:int;
      
      public var exp_pedal_assign_geq:int;
      
      public var exp_pedal_assign_peq:int;
      
      public var exp_pedal_assign_guitar_sim:int;
      
      public var exp_pedal_assign_ac_guitar_sim:int;
      
      public var exp_pedal_assign_ac_processor:int;
      
      public var exp_pedal_assign_wave_synth:int;
      
      public var exp_pedal_assign_octave:int;
      
      public var exp_pedal_assign_pitch_shifter:int;
      
      public var exp_pedal_assign_harmonist:int;
      
      public var exp_pedal_assign_humanizer:int;
      
      public var exp_pedal_assign_evh_phaser:int;
      
      public var exp_pedal_assign_evh_flanger:int;
      
      public var exp_pedal_assign_evh_wah:int;
      
      public var exp_pedal_assign_dc30:int;
      
      public var exp_pedal_assign_booster_min:int;
      
      public var exp_pedal_assign_booster_max:int;
      
      public var exp_pedal_assign_delay_min_l:int;
      
      public var exp_pedal_assign_delay_min_h:int;
      
      public var exp_pedal_assign_delay_max_l:int;
      
      public var exp_pedal_assign_delay_max_h:int;
      
      public var exp_pedal_assign_reverb_min_l:int;
      
      public var exp_pedal_assign_reverb_min_h:int;
      
      public var exp_pedal_assign_reverb_max_l:int;
      
      public var exp_pedal_assign_reverb_max_h:int;
      
      public var exp_pedal_assign_chorus_min:int;
      
      public var exp_pedal_assign_chorus_max:int;
      
      public var exp_pedal_assign_flanger_min:int;
      
      public var exp_pedal_assign_flanger_max:int;
      
      public var exp_pedal_assign_phaser_min:int;
      
      public var exp_pedal_assign_phaser_max:int;
      
      public var exp_pedal_assign_uni_v_min:int;
      
      public var exp_pedal_assign_uni_v_max:int;
      
      public var exp_pedal_assign_tremolo_min:int;
      
      public var exp_pedal_assign_tremolo_max:int;
      
      public var exp_pedal_assign_vibrato_min:int;
      
      public var exp_pedal_assign_vibrato_max:int;
      
      public var exp_pedal_assign_rotary_min:int;
      
      public var exp_pedal_assign_rotary_max:int;
      
      public var exp_pedal_assign_ring_mod_min:int;
      
      public var exp_pedal_assign_ring_mod_max:int;
      
      public var exp_pedal_assign_slow_gear_min:int;
      
      public var exp_pedal_assign_slow_gear_max:int;
      
      public var exp_pedal_assign_slicer_min:int;
      
      public var exp_pedal_assign_slicer_max:int;
      
      public var exp_pedal_assign_comp_min:int;
      
      public var exp_pedal_assign_comp_max:int;
      
      public var exp_pedal_assign_limiter_min:int;
      
      public var exp_pedal_assign_limiter_max:int;
      
      public var exp_pedal_assign_t_wah_min:int;
      
      public var exp_pedal_assign_t_wah_max:int;
      
      public var exp_pedal_assign_auto_wah_min:int;
      
      public var exp_pedal_assign_auto_wah_max:int;
      
      public var exp_pedal_assign_pedal_wah_min:int;
      
      public var exp_pedal_assign_pedal_wah_max:int;
      
      public var exp_pedal_assign_geq_min:int;
      
      public var exp_pedal_assign_geq_max:int;
      
      public var exp_pedal_assign_peq_min:int;
      
      public var exp_pedal_assign_peq_max:int;
      
      public var exp_pedal_assign_guitar_sim_min:int;
      
      public var exp_pedal_assign_guitar_sim_max:int;
      
      public var exp_pedal_assign_ac_guitar_sim_min:int;
      
      public var exp_pedal_assign_ac_guitar_sim_max:int;
      
      public var exp_pedal_assign_ac_processor_min:int;
      
      public var exp_pedal_assign_ac_processor_max:int;
      
      public var exp_pedal_assign_wave_synth_min:int;
      
      public var exp_pedal_assign_wave_synth_max:int;
      
      public var exp_pedal_assign_octave_min:int;
      
      public var exp_pedal_assign_octave_max:int;
      
      public var exp_pedal_assign_pitch_shifter_min_l:int;
      
      public var exp_pedal_assign_pitch_shifter_min_h:int;
      
      public var exp_pedal_assign_pitch_shifter_max_l:int;
      
      public var exp_pedal_assign_pitch_shifter_max_h:int;
      
      public var exp_pedal_assign_harmonist_min_l:int;
      
      public var exp_pedal_assign_harmonist_min_h:int;
      
      public var exp_pedal_assign_harmonist_max_l:int;
      
      public var exp_pedal_assign_harmonist_max_h:int;
      
      public var exp_pedal_assign_humanizer_min:int;
      
      public var exp_pedal_assign_humanizer_max:int;
      
      public var exp_pedal_assign_evh_phaser_min:int;
      
      public var exp_pedal_assign_evh_phaser_max:int;
      
      public var exp_pedal_assign_evh_flanger_min:int;
      
      public var exp_pedal_assign_evh_flanger_max:int;
      
      public var exp_pedal_assign_evh_wah_min:int;
      
      public var exp_pedal_assign_evh_wah_max:int;
      
      public var exp_pedal_assign_dc30_min_l:int;
      
      public var exp_pedal_assign_dc30_min_h:int;
      
      public var exp_pedal_assign_dc30_max_l:int;
      
      public var exp_pedal_assign_dc30_max_h:int;
      
      public var exp_pedal_assign_heavy_oct:int;
      
      public var exp_pedal_assign_heavy_oct_min:int;
      
      public var exp_pedal_assign_heavy_oct_max:int;
      
      public var gafc_exp1_assign_booster:int;
      
      public var gafc_exp1_assign_delay:int;
      
      public var gafc_exp1_assign_reverb:int;
      
      public var gafc_exp1_assign_chorus:int;
      
      public var gafc_exp1_assign_flanger:int;
      
      public var gafc_exp1_assign_phaser:int;
      
      public var gafc_exp1_assign_uni_v:int;
      
      public var gafc_exp1_assign_tremolo:int;
      
      public var gafc_exp1_assign_vibrato:int;
      
      public var gafc_exp1_assign_rotary:int;
      
      public var gafc_exp1_assign_ring_mod:int;
      
      public var gafc_exp1_assign_slow_gear:int;
      
      public var gafc_exp1_assign_slicer:int;
      
      public var gafc_exp1_assign_comp:int;
      
      public var gafc_exp1_assign_limiter:int;
      
      public var gafc_exp1_assign_t_wah:int;
      
      public var gafc_exp1_assign_auto_wah:int;
      
      public var gafc_exp1_assign_pedal_wah:int;
      
      public var gafc_exp1_assign_geq:int;
      
      public var gafc_exp1_assign_peq:int;
      
      public var gafc_exp1_assign_guitar_sim:int;
      
      public var gafc_exp1_assign_ac_guitar_sim:int;
      
      public var gafc_exp1_assign_ac_processor:int;
      
      public var gafc_exp1_assign_wave_synth:int;
      
      public var gafc_exp1_assign_octave:int;
      
      public var gafc_exp1_assign_pitch_shifter:int;
      
      public var gafc_exp1_assign_harmonist:int;
      
      public var gafc_exp1_assign_humanizer:int;
      
      public var gafc_exp1_assign_evh_phaser:int;
      
      public var gafc_exp1_assign_evh_flanger:int;
      
      public var gafc_exp1_assign_evh_wah:int;
      
      public var gafc_exp1_assign_dc30:int;
      
      public var gafc_exp1_assign_booster_min:int;
      
      public var gafc_exp1_assign_booster_max:int;
      
      public var gafc_exp1_assign_delay_min_l:int;
      
      public var gafc_exp1_assign_delay_min_h:int;
      
      public var gafc_exp1_assign_delay_max_l:int;
      
      public var gafc_exp1_assign_delay_max_h:int;
      
      public var gafc_exp1_assign_reverb_min_l:int;
      
      public var gafc_exp1_assign_reverb_min_h:int;
      
      public var gafc_exp1_assign_reverb_max_l:int;
      
      public var gafc_exp1_assign_reverb_max_h:int;
      
      public var gafc_exp1_assign_chorus_min:int;
      
      public var gafc_exp1_assign_chorus_max:int;
      
      public var gafc_exp1_assign_flanger_min:int;
      
      public var gafc_exp1_assign_flanger_max:int;
      
      public var gafc_exp1_assign_phaser_min:int;
      
      public var gafc_exp1_assign_phaser_max:int;
      
      public var gafc_exp1_assign_uni_v_min:int;
      
      public var gafc_exp1_assign_uni_v_max:int;
      
      public var gafc_exp1_assign_tremolo_min:int;
      
      public var gafc_exp1_assign_tremolo_max:int;
      
      public var gafc_exp1_assign_vibrato_min:int;
      
      public var gafc_exp1_assign_vibrato_max:int;
      
      public var gafc_exp1_assign_rotary_min:int;
      
      public var gafc_exp1_assign_rotary_max:int;
      
      public var gafc_exp1_assign_ring_mod_min:int;
      
      public var gafc_exp1_assign_ring_mod_max:int;
      
      public var gafc_exp1_assign_slow_gear_min:int;
      
      public var gafc_exp1_assign_slow_gear_max:int;
      
      public var gafc_exp1_assign_slicer_min:int;
      
      public var gafc_exp1_assign_slicer_max:int;
      
      public var gafc_exp1_assign_comp_min:int;
      
      public var gafc_exp1_assign_comp_max:int;
      
      public var gafc_exp1_assign_limiter_min:int;
      
      public var gafc_exp1_assign_limiter_max:int;
      
      public var gafc_exp1_assign_t_wah_min:int;
      
      public var gafc_exp1_assign_t_wah_max:int;
      
      public var gafc_exp1_assign_auto_wah_min:int;
      
      public var gafc_exp1_assign_auto_wah_max:int;
      
      public var gafc_exp1_assign_pedal_wah_min:int;
      
      public var gafc_exp1_assign_pedal_wah_max:int;
      
      public var gafc_exp1_assign_geq_min:int;
      
      public var gafc_exp1_assign_geq_max:int;
      
      public var gafc_exp1_assign_peq_min:int;
      
      public var gafc_exp1_assign_peq_max:int;
      
      public var gafc_exp1_assign_guitar_sim_min:int;
      
      public var gafc_exp1_assign_guitar_sim_max:int;
      
      public var gafc_exp1_assign_ac_guitar_sim_min:int;
      
      public var gafc_exp1_assign_ac_guitar_sim_max:int;
      
      public var gafc_exp1_assign_ac_processor_min:int;
      
      public var gafc_exp1_assign_ac_processor_max:int;
      
      public var gafc_exp1_assign_wave_synth_min:int;
      
      public var gafc_exp1_assign_wave_synth_max:int;
      
      public var gafc_exp1_assign_octave_min:int;
      
      public var gafc_exp1_assign_octave_max:int;
      
      public var gafc_exp1_assign_pitch_shifter_min_l:int;
      
      public var gafc_exp1_assign_pitch_shifter_min_h:int;
      
      public var gafc_exp1_assign_pitch_shifter_max_l:int;
      
      public var gafc_exp1_assign_pitch_shifter_max_h:int;
      
      public var gafc_exp1_assign_harmonist_min_l:int;
      
      public var gafc_exp1_assign_harmonist_min_h:int;
      
      public var gafc_exp1_assign_harmonist_max_l:int;
      
      public var gafc_exp1_assign_harmonist_max_h:int;
      
      public var gafc_exp1_assign_humanizer_min:int;
      
      public var gafc_exp1_assign_humanizer_max:int;
      
      public var gafc_exp1_assign_evh_phaser_min:int;
      
      public var gafc_exp1_assign_evh_phaser_max:int;
      
      public var gafc_exp1_assign_evh_flanger_min:int;
      
      public var gafc_exp1_assign_evh_flanger_max:int;
      
      public var gafc_exp1_assign_evh_wah_min:int;
      
      public var gafc_exp1_assign_evh_wah_max:int;
      
      public var gafc_exp1_assign_dc30_min_l:int;
      
      public var gafc_exp1_assign_dc30_min_h:int;
      
      public var gafc_exp1_assign_dc30_max_l:int;
      
      public var gafc_exp1_assign_dc30_max_h:int;
      
      public var gafc_exp1_assign_heavy_oct:int;
      
      public var gafc_exp1_assign_heavy_oct_min:int;
      
      public var gafc_exp1_assign_heavy_oct_max:int;
      
      public var gafc_exp2_assign_booster:int;
      
      public var gafc_exp2_assign_delay:int;
      
      public var gafc_exp2_assign_reverb:int;
      
      public var gafc_exp2_assign_chorus:int;
      
      public var gafc_exp2_assign_flanger:int;
      
      public var gafc_exp2_assign_phaser:int;
      
      public var gafc_exp2_assign_uni_v:int;
      
      public var gafc_exp2_assign_tremolo:int;
      
      public var gafc_exp2_assign_vibrato:int;
      
      public var gafc_exp2_assign_rotary:int;
      
      public var gafc_exp2_assign_ring_mod:int;
      
      public var gafc_exp2_assign_slow_gear:int;
      
      public var gafc_exp2_assign_slicer:int;
      
      public var gafc_exp2_assign_comp:int;
      
      public var gafc_exp2_assign_limiter:int;
      
      public var gafc_exp2_assign_t_wah:int;
      
      public var gafc_exp2_assign_auto_wah:int;
      
      public var gafc_exp2_assign_pedal_wah:int;
      
      public var gafc_exp2_assign_geq:int;
      
      public var gafc_exp2_assign_peq:int;
      
      public var gafc_exp2_assign_guitar_sim:int;
      
      public var gafc_exp2_assign_ac_guitar_sim:int;
      
      public var gafc_exp2_assign_ac_processor:int;
      
      public var gafc_exp2_assign_wave_synth:int;
      
      public var gafc_exp2_assign_octave:int;
      
      public var gafc_exp2_assign_pitch_shifter:int;
      
      public var gafc_exp2_assign_harmonist:int;
      
      public var gafc_exp2_assign_humanizer:int;
      
      public var gafc_exp2_assign_evh_phaser:int;
      
      public var gafc_exp2_assign_evh_flanger:int;
      
      public var gafc_exp2_assign_evh_wah:int;
      
      public var gafc_exp2_assign_dc30:int;
      
      public var gafc_exp2_assign_booster_min:int;
      
      public var gafc_exp2_assign_booster_max:int;
      
      public var gafc_exp2_assign_delay_min_l:int;
      
      public var gafc_exp2_assign_delay_min_h:int;
      
      public var gafc_exp2_assign_delay_max_l:int;
      
      public var gafc_exp2_assign_delay_max_h:int;
      
      public var gafc_exp2_assign_reverb_min_l:int;
      
      public var gafc_exp2_assign_reverb_min_h:int;
      
      public var gafc_exp2_assign_reverb_max_l:int;
      
      public var gafc_exp2_assign_reverb_max_h:int;
      
      public var gafc_exp2_assign_chorus_min:int;
      
      public var gafc_exp2_assign_chorus_max:int;
      
      public var gafc_exp2_assign_flanger_min:int;
      
      public var gafc_exp2_assign_flanger_max:int;
      
      public var gafc_exp2_assign_phaser_min:int;
      
      public var gafc_exp2_assign_phaser_max:int;
      
      public var gafc_exp2_assign_uni_v_min:int;
      
      public var gafc_exp2_assign_uni_v_max:int;
      
      public var gafc_exp2_assign_tremolo_min:int;
      
      public var gafc_exp2_assign_tremolo_max:int;
      
      public var gafc_exp2_assign_vibrato_min:int;
      
      public var gafc_exp2_assign_vibrato_max:int;
      
      public var gafc_exp2_assign_rotary_min:int;
      
      public var gafc_exp2_assign_rotary_max:int;
      
      public var gafc_exp2_assign_ring_mod_min:int;
      
      public var gafc_exp2_assign_ring_mod_max:int;
      
      public var gafc_exp2_assign_slow_gear_min:int;
      
      public var gafc_exp2_assign_slow_gear_max:int;
      
      public var gafc_exp2_assign_slicer_min:int;
      
      public var gafc_exp2_assign_slicer_max:int;
      
      public var gafc_exp2_assign_comp_min:int;
      
      public var gafc_exp2_assign_comp_max:int;
      
      public var gafc_exp2_assign_limiter_min:int;
      
      public var gafc_exp2_assign_limiter_max:int;
      
      public var gafc_exp2_assign_t_wah_min:int;
      
      public var gafc_exp2_assign_t_wah_max:int;
      
      public var gafc_exp2_assign_auto_wah_min:int;
      
      public var gafc_exp2_assign_auto_wah_max:int;
      
      public var gafc_exp2_assign_pedal_wah_min:int;
      
      public var gafc_exp2_assign_pedal_wah_max:int;
      
      public var gafc_exp2_assign_geq_min:int;
      
      public var gafc_exp2_assign_geq_max:int;
      
      public var gafc_exp2_assign_peq_min:int;
      
      public var gafc_exp2_assign_peq_max:int;
      
      public var gafc_exp2_assign_guitar_sim_min:int;
      
      public var gafc_exp2_assign_guitar_sim_max:int;
      
      public var gafc_exp2_assign_ac_guitar_sim_min:int;
      
      public var gafc_exp2_assign_ac_guitar_sim_max:int;
      
      public var gafc_exp2_assign_ac_processor_min:int;
      
      public var gafc_exp2_assign_ac_processor_max:int;
      
      public var gafc_exp2_assign_wave_synth_min:int;
      
      public var gafc_exp2_assign_wave_synth_max:int;
      
      public var gafc_exp2_assign_octave_min:int;
      
      public var gafc_exp2_assign_octave_max:int;
      
      public var gafc_exp2_assign_pitch_shifter_min_l:int;
      
      public var gafc_exp2_assign_pitch_shifter_min_h:int;
      
      public var gafc_exp2_assign_pitch_shifter_max_l:int;
      
      public var gafc_exp2_assign_pitch_shifter_max_h:int;
      
      public var gafc_exp2_assign_harmonist_min_l:int;
      
      public var gafc_exp2_assign_harmonist_min_h:int;
      
      public var gafc_exp2_assign_harmonist_max_l:int;
      
      public var gafc_exp2_assign_harmonist_max_h:int;
      
      public var gafc_exp2_assign_humanizer_min:int;
      
      public var gafc_exp2_assign_humanizer_max:int;
      
      public var gafc_exp2_assign_evh_phaser_min:int;
      
      public var gafc_exp2_assign_evh_phaser_max:int;
      
      public var gafc_exp2_assign_evh_flanger_min:int;
      
      public var gafc_exp2_assign_evh_flanger_max:int;
      
      public var gafc_exp2_assign_evh_wah_min:int;
      
      public var gafc_exp2_assign_evh_wah_max:int;
      
      public var gafc_exp2_assign_dc30_min_l:int;
      
      public var gafc_exp2_assign_dc30_min_h:int;
      
      public var gafc_exp2_assign_dc30_max_l:int;
      
      public var gafc_exp2_assign_dc30_max_h:int;
      
      public var gafc_exp2_assign_heavy_oct:int;
      
      public var gafc_exp2_assign_heavy_oct_min:int;
      
      public var gafc_exp2_assign_heavy_oct_max:int;
      
      public var comp_name0:int;
      
      public var comp_name1:int;
      
      public var comp_name2:int;
      
      public var comp_name3:int;
      
      public var comp_name4:int;
      
      public var comp_name5:int;
      
      public var comp_name6:int;
      
      public var comp_name7:int;
      
      public var comp_name8:int;
      
      public var comp_name9:int;
      
      public var comp_name10:int;
      
      public var comp_name11:int;
      
      public var patchCategoryName:String;
      
      public var currentPatchNo:int;
      
      public var prevCurrentPatchNo:int;
      
      public var chainParams:ChainParams;
      
      public function TemporaryParams()
      {
         super();
         this.mediator = ToneCentralMediator.getInstance();
      }
      
      public static function restore(param1:Object) : TemporaryParams
      {
         var _loc3_:String = null;
         var _loc2_:TemporaryParams = new TemporaryParams();
         for(_loc3_ in param1)
         {
            if(_loc3_ != "chainParams" && _loc2_.hasOwnProperty(_loc3_))
            {
               _loc2_[_loc3_] = param1[_loc3_];
            }
         }
         _loc2_.setChainParams();
         switch(_loc2_.WhichVer())
         {
            case 1:
               _loc2_.SetV2fromV1();
               _loc2_.SetV3fromV2();
               _loc2_.SetV4fromV3();
               break;
            case 2:
               _loc2_.SetV3fromV2();
               _loc2_.SetV4fromV3();
               break;
            case 3:
               _loc2_.SetV4fromV3();
         }
         _loc2_.setChainParams();
         return _loc2_;
      }
      
      public function get assign1_target() : int
      {
         return this.assign1_target_h * 128 + this.assign1_target_l;
      }
      
      public function get assign1_target_min() : int
      {
         return this.assign1_target_min_h * 128 + this.assign1_target_min_l;
      }
      
      public function get assign1_target_max() : int
      {
         return this.assign1_target_max_h * 128 + this.assign1_target_max_l;
      }
      
      public function get assign2_target() : int
      {
         return this.assign2_target_h * 128 + this.assign2_target_l;
      }
      
      public function get assign2_target_min() : int
      {
         return this.assign2_target_min_h * 128 + this.assign2_target_min_l;
      }
      
      public function get assign2_target_max() : int
      {
         return this.assign2_target_max_h * 128 + this.assign2_target_max_l;
      }
      
      public function get assign3_target() : int
      {
         return this.assign3_target_h * 128 + this.assign3_target_l;
      }
      
      public function get assign3_target_min() : int
      {
         return this.assign3_target_min_h * 128 + this.assign3_target_min_l;
      }
      
      public function get assign3_target_max() : int
      {
         return this.assign3_target_max_h * 128 + this.assign3_target_max_l;
      }
      
      public function get assign4_target() : int
      {
         return this.assign4_target_h * 128 + this.assign4_target_l;
      }
      
      public function get assign4_target_min() : int
      {
         return this.assign4_target_min_h * 128 + this.assign4_target_min_l;
      }
      
      public function get assign4_target_max() : int
      {
         return this.assign4_target_max_h * 128 + this.assign4_target_max_l;
      }
      
      public function get assign5_target() : int
      {
         return this.assign5_target_h * 128 + this.assign5_target_l;
      }
      
      public function get assign5_target_min() : int
      {
         return this.assign5_target_min_h * 128 + this.assign5_target_min_l;
      }
      
      public function get assign5_target_max() : int
      {
         return this.assign5_target_max_h * 128 + this.assign5_target_max_l;
      }
      
      public function get assign6_target() : int
      {
         return this.assign6_target_h * 128 + this.assign6_target_l;
      }
      
      public function get assign6_target_min() : int
      {
         return this.assign6_target_min_h * 128 + this.assign6_target_min_l;
      }
      
      public function get assign6_target_max() : int
      {
         return this.assign6_target_max_h * 128 + this.assign6_target_max_l;
      }
      
      public function get assign7_target() : int
      {
         return this.assign7_target_h * 128 + this.assign7_target_l;
      }
      
      public function get assign7_target_min() : int
      {
         return this.assign7_target_min_h * 128 + this.assign7_target_min_l;
      }
      
      public function get assign7_target_max() : int
      {
         return this.assign7_target_max_h * 128 + this.assign7_target_max_l;
      }
      
      public function get assign8_target() : int
      {
         return this.assign8_target_h * 128 + this.assign8_target_l;
      }
      
      public function get assign8_target_min() : int
      {
         return this.assign8_target_min_h * 128 + this.assign8_target_min_l;
      }
      
      public function get assign8_target_max() : int
      {
         return this.assign8_target_max_h * 128 + this.assign8_target_max_l;
      }
      
      public function get delay_delay_time() : int
      {
         return this.delay_delay_time_h * 128 + this.delay_delay_time_l;
      }
      
      public function get delay_d1_time() : int
      {
         return this.delay_d1_time_h * 128 + this.delay_d1_time_l;
      }
      
      public function get delay_d2_time() : int
      {
         return this.delay_d2_time_h * 128 + this.delay_d2_time_l;
      }
      
      public function get delay2_delay_time() : int
      {
         return this.delay2_delay_time_h * 128 + this.delay2_delay_time_l;
      }
      
      public function get delay2_d1_time() : int
      {
         return this.delay2_d1_time_h * 128 + this.delay2_d1_time_l;
      }
      
      public function get delay2_d2_time() : int
      {
         return this.delay2_d2_time_h * 128 + this.delay2_d2_time_l;
      }
      
      public function get reverb_pre_delay() : int
      {
         return this.reverb_pre_delay_h * 128 + this.reverb_pre_delay_l;
      }
      
      public function get master_bpm() : int
      {
         return this.master_bpm_h * 128 + this.master_bpm_l;
      }
      
      public function get fx1_pitch_shifter_ps1pre_dly() : int
      {
         return this.fx1_pitch_shifter_ps1pre_dly_h * 128 + this.fx1_pitch_shifter_ps1pre_dly_l;
      }
      
      public function get fx1_harmonist_hr1pre_dly() : int
      {
         return this.fx1_harmonist_hr1pre_dly_h * 128 + this.fx1_harmonist_hr1pre_dly_l;
      }
      
      public function get fx1_harmonist_hr2pre_dly() : int
      {
         return this.fx1_harmonist_hr2pre_dly_h * 128 + this.fx1_harmonist_hr2pre_dly_l;
      }
      
      public function get fx1_sub_delay_time() : int
      {
         return this.fx1_sub_delay_time_h * 128 + this.fx1_sub_delay_time_l;
      }
      
      public function get fx2_pitch_shifter_ps1pre_dly() : int
      {
         return this.fx2_pitch_shifter_ps1pre_dly_h * 128 + this.fx2_pitch_shifter_ps1pre_dly_l;
      }
      
      public function get fx2_harmonist_hr1pre_dly() : int
      {
         return this.fx2_harmonist_hr1pre_dly_h * 128 + this.fx2_harmonist_hr1pre_dly_l;
      }
      
      public function get fx2_harmonist_hr2pre_dly() : int
      {
         return this.fx2_harmonist_hr2pre_dly_h * 128 + this.fx2_harmonist_hr2pre_dly_l;
      }
      
      public function get fx2_sub_delay_time() : int
      {
         return this.fx2_sub_delay_time_h * 128 + this.fx2_sub_delay_time_l;
      }
      
      public function get fx1_pitch_shifter_ps2pre_dly() : int
      {
         return this.fx1_pitch_shifter_ps2pre_dly_h * 128 + this.fx1_pitch_shifter_ps2pre_dly_l;
      }
      
      public function get fx2_pitch_shifter_ps2pre_dly() : int
      {
         return this.fx2_pitch_shifter_ps2pre_dly_h * 128 + this.fx2_pitch_shifter_ps2pre_dly_l;
      }
      
      public function get fx1_dc30_echo_repeat_rate() : int
      {
         return this.fx1_dc30_echo_repeat_rate_h * 128 + this.fx1_dc30_echo_repeat_rate_l;
      }
      
      public function get fx2_dc30_echo_repeat_rate() : int
      {
         return this.fx2_dc30_echo_repeat_rate_h * 128 + this.fx2_dc30_echo_repeat_rate_l;
      }
      
      public function get exp_pedal_assign_delay_min() : int
      {
         return this.exp_pedal_assign_delay_min_h * 128 + this.exp_pedal_assign_delay_min_l;
      }
      
      public function get exp_pedal_assign_delay_max() : int
      {
         return this.exp_pedal_assign_delay_max_h * 128 + this.exp_pedal_assign_delay_max_l;
      }
      
      public function get exp_pedal_assign_reverb_min() : int
      {
         return this.exp_pedal_assign_reverb_min_h * 128 + this.exp_pedal_assign_reverb_min_l;
      }
      
      public function get exp_pedal_assign_reverb_max() : int
      {
         return this.exp_pedal_assign_reverb_max_h * 128 + this.exp_pedal_assign_reverb_max_l;
      }
      
      public function get exp_pedal_assign_pitch_shifter_min() : int
      {
         return this.exp_pedal_assign_pitch_shifter_min_h * 128 + this.exp_pedal_assign_pitch_shifter_min_l;
      }
      
      public function get exp_pedal_assign_pitch_shifter_max() : int
      {
         return this.exp_pedal_assign_pitch_shifter_max_h * 128 + this.exp_pedal_assign_pitch_shifter_max_l;
      }
      
      public function get exp_pedal_assign_harmonist_min() : int
      {
         return this.exp_pedal_assign_harmonist_min_h * 128 + this.exp_pedal_assign_harmonist_min_l;
      }
      
      public function get exp_pedal_assign_harmonist_max() : int
      {
         return this.exp_pedal_assign_harmonist_max_h * 128 + this.exp_pedal_assign_harmonist_max_l;
      }
      
      public function get exp_pedal_assign_dc30_min() : int
      {
         return this.exp_pedal_assign_dc30_min_h * 128 + this.exp_pedal_assign_dc30_min_l;
      }
      
      public function get exp_pedal_assign_dc30_max() : int
      {
         return this.exp_pedal_assign_dc30_max_h * 128 + this.exp_pedal_assign_dc30_max_l;
      }
      
      public function get gafc_exp1_assign_delay_min() : int
      {
         return this.gafc_exp1_assign_delay_min_h * 128 + this.gafc_exp1_assign_delay_min_l;
      }
      
      public function get gafc_exp1_assign_delay_max() : int
      {
         return this.gafc_exp1_assign_delay_max_h * 128 + this.gafc_exp1_assign_delay_max_l;
      }
      
      public function get gafc_exp1_assign_reverb_min() : int
      {
         return this.gafc_exp1_assign_reverb_min_h * 128 + this.gafc_exp1_assign_reverb_min_l;
      }
      
      public function get gafc_exp1_assign_reverb_max() : int
      {
         return this.gafc_exp1_assign_reverb_max_h * 128 + this.gafc_exp1_assign_reverb_max_l;
      }
      
      public function get gafc_exp1_assign_pitch_shifter_min() : int
      {
         return this.gafc_exp1_assign_pitch_shifter_min_h * 128 + this.gafc_exp1_assign_pitch_shifter_min_l;
      }
      
      public function get gafc_exp1_assign_pitch_shifter_max() : int
      {
         return this.gafc_exp1_assign_pitch_shifter_max_h * 128 + this.gafc_exp1_assign_pitch_shifter_max_l;
      }
      
      public function get gafc_exp1_assign_harmonist_min() : int
      {
         return this.gafc_exp1_assign_harmonist_min_h * 128 + this.gafc_exp1_assign_harmonist_min_l;
      }
      
      public function get gafc_exp1_assign_harmonist_max() : int
      {
         return this.gafc_exp1_assign_harmonist_max_h * 128 + this.gafc_exp1_assign_harmonist_max_l;
      }
      
      public function get gafc_exp1_assign_dc30_min() : int
      {
         return this.gafc_exp1_assign_dc30_min_h * 128 + this.gafc_exp1_assign_dc30_min_l;
      }
      
      public function get gafc_exp1_assign_dc30_max() : int
      {
         return this.gafc_exp1_assign_dc30_max_h * 128 + this.gafc_exp1_assign_dc30_max_l;
      }
      
      public function get gafc_exp2_assign_delay_min() : int
      {
         return this.gafc_exp2_assign_delay_min_h * 128 + this.gafc_exp2_assign_delay_min_l;
      }
      
      public function get gafc_exp2_assign_delay_max() : int
      {
         return this.gafc_exp2_assign_delay_max_h * 128 + this.gafc_exp2_assign_delay_max_l;
      }
      
      public function get gafc_exp2_assign_reverb_min() : int
      {
         return this.gafc_exp2_assign_reverb_min_h * 128 + this.gafc_exp2_assign_reverb_min_l;
      }
      
      public function get gafc_exp2_assign_reverb_max() : int
      {
         return this.gafc_exp2_assign_reverb_max_h * 128 + this.gafc_exp2_assign_reverb_max_l;
      }
      
      public function get gafc_exp2_assign_pitch_shifter_min() : int
      {
         return this.gafc_exp2_assign_pitch_shifter_min_h * 128 + this.gafc_exp2_assign_pitch_shifter_min_l;
      }
      
      public function get gafc_exp2_assign_pitch_shifter_max() : int
      {
         return this.gafc_exp2_assign_pitch_shifter_max_h * 128 + this.gafc_exp2_assign_pitch_shifter_max_l;
      }
      
      public function get gafc_exp2_assign_harmonist_min() : int
      {
         return this.gafc_exp2_assign_harmonist_min_h * 128 + this.gafc_exp2_assign_harmonist_min_l;
      }
      
      public function get gafc_exp2_assign_harmonist_max() : int
      {
         return this.gafc_exp2_assign_harmonist_max_h * 128 + this.gafc_exp2_assign_harmonist_max_l;
      }
      
      public function get gafc_exp2_assign_dc30_min() : int
      {
         return this.gafc_exp2_assign_dc30_min_h * 128 + this.gafc_exp2_assign_dc30_min_l;
      }
      
      public function get gafc_exp2_assign_dc30_max() : int
      {
         return this.gafc_exp2_assign_dc30_max_h * 128 + this.gafc_exp2_assign_dc30_max_l;
      }
      
      public function set delay_delay_time(param1:int) : void
      {
      }
      
      public function set delay_d1_time(param1:int) : void
      {
      }
      
      public function set delay_d2_time(param1:int) : void
      {
      }
      
      public function set delay2_delay_time(param1:int) : void
      {
      }
      
      public function set delay2_d1_time(param1:int) : void
      {
      }
      
      public function set delay2_d2_time(param1:int) : void
      {
      }
      
      public function set reverb_pre_delay(param1:int) : void
      {
      }
      
      public function set master_bpm(param1:int) : void
      {
      }
      
      public function set fx1_pitch_shifter_ps1pre_dly(param1:int) : void
      {
      }
      
      public function set fx1_harmonist_hr1pre_dly(param1:int) : void
      {
      }
      
      public function set fx1_harmonist_hr2pre_dly(param1:int) : void
      {
      }
      
      public function set fx1_sub_delay_time(param1:int) : void
      {
      }
      
      public function set fx2_pitch_shifter_ps1pre_dly(param1:int) : void
      {
      }
      
      public function set fx2_harmonist_hr1pre_dly(param1:int) : void
      {
      }
      
      public function set fx2_harmonist_hr2pre_dly(param1:int) : void
      {
      }
      
      public function set fx2_sub_delay_time(param1:int) : void
      {
      }
      
      public function set fx1_pitch_shifter_ps2pre_dly(param1:int) : void
      {
      }
      
      public function set fx2_pitch_shifter_ps2pre_dly(param1:int) : void
      {
      }
      
      public function set assign1_target(param1:int) : void
      {
      }
      
      public function set assign1_target_min(param1:int) : void
      {
      }
      
      public function set assign1_target_max(param1:int) : void
      {
      }
      
      public function set assign2_target(param1:int) : void
      {
      }
      
      public function set assign2_target_min(param1:int) : void
      {
      }
      
      public function set assign2_target_max(param1:int) : void
      {
      }
      
      public function set assign3_target(param1:int) : void
      {
      }
      
      public function set assign3_target_min(param1:int) : void
      {
      }
      
      public function set assign3_target_max(param1:int) : void
      {
      }
      
      public function set assign4_target(param1:int) : void
      {
      }
      
      public function set assign4_target_min(param1:int) : void
      {
      }
      
      public function set assign4_target_max(param1:int) : void
      {
      }
      
      public function set assign5_target(param1:int) : void
      {
      }
      
      public function set assign5_target_min(param1:int) : void
      {
      }
      
      public function set assign5_target_max(param1:int) : void
      {
      }
      
      public function set assign6_target(param1:int) : void
      {
      }
      
      public function set assign6_target_min(param1:int) : void
      {
      }
      
      public function set assign6_target_max(param1:int) : void
      {
      }
      
      public function set assign7_target(param1:int) : void
      {
      }
      
      public function set assign7_target_min(param1:int) : void
      {
      }
      
      public function set assign7_target_max(param1:int) : void
      {
      }
      
      public function set assign8_target(param1:int) : void
      {
      }
      
      public function set assign8_target_min(param1:int) : void
      {
      }
      
      public function set assign8_target_max(param1:int) : void
      {
      }
      
      public function set fx1_dc30_echo_repeat_rate(param1:int) : void
      {
      }
      
      public function set fx2_dc30_echo_repeat_rate(param1:int) : void
      {
      }
      
      public function set exp_pedal_assign_delay_min(param1:int) : void
      {
      }
      
      public function set exp_pedal_assign_delay_max(param1:int) : void
      {
      }
      
      public function set exp_pedal_assign_reverb_min(param1:int) : void
      {
      }
      
      public function set exp_pedal_assign_reverb_max(param1:int) : void
      {
      }
      
      public function set exp_pedal_assign_pitch_shifter_min(param1:int) : void
      {
      }
      
      public function set exp_pedal_assign_pitch_shifter_max(param1:int) : void
      {
      }
      
      public function set exp_pedal_assign_harmonist_min(param1:int) : void
      {
      }
      
      public function set exp_pedal_assign_harmonist_max(param1:int) : void
      {
      }
      
      public function set exp_pedal_assign_dc30_min(param1:int) : void
      {
      }
      
      public function set exp_pedal_assign_dc30_max(param1:int) : void
      {
      }
      
      public function set gafc_exp1_assign_delay_min(param1:int) : void
      {
      }
      
      public function set gafc_exp1_assign_delay_max(param1:int) : void
      {
      }
      
      public function set gafc_exp1_assign_reverb_min(param1:int) : void
      {
      }
      
      public function set gafc_exp1_assign_reverb_max(param1:int) : void
      {
      }
      
      public function set gafc_exp1_assign_pitch_shifter_min(param1:int) : void
      {
      }
      
      public function set gafc_exp1_assign_pitch_shifter_max(param1:int) : void
      {
      }
      
      public function set gafc_exp1_assign_harmonist_min(param1:int) : void
      {
      }
      
      public function set gafc_exp1_assign_harmonist_max(param1:int) : void
      {
      }
      
      public function set gafc_exp1_assign_dc30_min(param1:int) : void
      {
      }
      
      public function set gafc_exp1_assign_dc30_max(param1:int) : void
      {
      }
      
      public function set gafc_exp2_assign_delay_min(param1:int) : void
      {
      }
      
      public function set gafc_exp2_assign_delay_max(param1:int) : void
      {
      }
      
      public function set gafc_exp2_assign_reverb_min(param1:int) : void
      {
      }
      
      public function set gafc_exp2_assign_reverb_max(param1:int) : void
      {
      }
      
      public function set gafc_exp2_assign_pitch_shifter_min(param1:int) : void
      {
      }
      
      public function set gafc_exp2_assign_pitch_shifter_max(param1:int) : void
      {
      }
      
      public function set gafc_exp2_assign_harmonist_min(param1:int) : void
      {
      }
      
      public function set gafc_exp2_assign_harmonist_max(param1:int) : void
      {
      }
      
      public function set gafc_exp2_assign_dc30_min(param1:int) : void
      {
      }
      
      public function set gafc_exp2_assign_dc30_max(param1:int) : void
      {
      }
      
      public function setAlldata(param1:Array) : void
      {
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc2_:int = 0;
         while(_loc2_ < param1.length)
         {
            _loc3_ = parseInt("0x" + param1[_loc2_].address,16);
            _loc4_ = int(param1[_loc2_].data);
            this.setData(_loc3_,_loc4_);
            _loc2_++;
         }
         this.setChainParams();
      }
      
      private function setChainParams() : void
      {
         this.chainParams = new ChainParams();
         this.chainParams.position1 = this.fx_chain_position1;
         this.chainParams.position2 = this.fx_chain_position2;
         this.chainParams.position3 = this.fx_chain_position3;
         this.chainParams.position4 = this.fx_chain_position4;
         this.chainParams.position5 = this.fx_chain_position5;
         this.chainParams.position6 = this.fx_chain_position6;
         this.chainParams.position7 = this.fx_chain_position7;
         this.chainParams.position8 = this.fx_chain_position8;
         this.chainParams.position9 = this.fx_chain_position9;
         this.chainParams.position10 = this.fx_chain_position10;
         this.chainParams.position11 = this.fx_chain_position11;
         this.chainParams.position12 = this.fx_chain_position12;
         this.chainParams.position13 = this.fx_chain_position13;
         this.chainParams.position14 = this.fx_chain_position14;
         this.chainParams.position15 = this.fx_chain_position15;
         this.chainParams.position16 = this.fx_chain_position16;
         this.chainParams.position17 = this.fx_chain_position17;
         this.chainParams.position18 = this.fx_chain_position18;
         this.chainParams.position19 = this.fx_chain_position19;
         this.chainParams.position20 = this.fx_chain_position20;
      }
      
      private function WhichVer() : int
      {
         if(this.fx_chain_position11 == 18)
         {
            if(this.fxbox_asgn_fx3b_g == 0 && this.fxbox_asgn_fx3b_r == 0 && this.fxbox_asgn_fx3b_y == 0)
            {
               return 1;
            }
            return 2;
         }
         if(this.fx_chain_position14 == 18 && this.fx_chain_position17 == 11)
         {
            if(this.eq_geq_31hz == 0 && this.eq_geq_level == 0 && this.exp_pedal_assign_booster_max == 0 && this.gafc_exp1_assign_chorus_max == 0)
            {
               return 2;
            }
            return 3;
         }
         if(this.fx_chain_position13 == 18)
         {
            return 3;
         }
         return 4;
      }
      
      private function SetV2fromV1() : void
      {
         this.fx1_phaser90e_script = 1;
         this.fx1_phaser90e_speed = 50;
         this.fx1_flanger117e_manual = 45;
         this.fx1_flanger117e_width = 50;
         this.fx1_flanger117e_speed = 50;
         this.fx1_flanger117e_regen = 80;
         this.fx2_phaser90e_script = 1;
         this.fx2_phaser90e_speed = 50;
         this.fx2_flanger117e_manual = 45;
         this.fx2_flanger117e_width = 50;
         this.fx2_flanger117e_speed = 50;
         this.fx2_flanger117e_regen = 80;
         this.delay_vtg_lpf = 1;
         this.delay_vtg_filter = 0;
         this.delay_vtg_feedback_phase = 0;
         this.delay_vtg_effect_phase = 0;
         this.delay_vtg_mod_sw = 0;
         this.delay2_on_off = 0;
         this.delay2_type = 0;
         this.delay2_delay_time_l = 16;
         this.delay2_delay_time_h = 3;
         this.delay2_f_back = 22;
         this.delay2_high_cut = 10;
         this.delay2_effect_level = 50;
         this.delay2_direct_mix = 100;
         this.delay2_tap_time = 50;
         this.delay2_d1_time_l = 100;
         this.delay2_d1_time_h = 0;
         this.delay2_d1_f_back = 22;
         this.delay2_d1_hi_cut = 10;
         this.delay2_d1_level = 50;
         this.delay2_d2_time_l = 16;
         this.delay2_d2_time_h = 3;
         this.delay2_d2_f_back = 22;
         this.delay2_d2_hi_cut = 10;
         this.delay2_d2_level = 50;
         this.delay2_mod_rate = 40;
         this.delay2_mod_depth = 55;
         this.delay2_vtg_lpf = 1;
         this.delay2_vtg_filter = 0;
         this.delay2_vtg_feedback_phase = 0;
         this.delay2_vtg_effect_phase = 0;
         this.delay2_vtg_mod_sw = 0;
         this.send_return_on_off = 1;
         this.send_return_mode = 0;
         this.send_return_send_level = 50;
         this.send_return_return_level = 50;
         this.send_return_position = 0;
         this.eq_position = 1;
         this.fxbox_asgn_fx3b_g = 8;
         this.fxbox_asgn_fx3b_r = 10;
         this.fxbox_asgn_fx3b_y = 10;
         this.fxbox_layer_fx3_g = 2;
         this.fxbox_layer_fx3_r = 2;
         this.fxbox_layer_fx3_y = 2;
         if(this.fx_chain_position14 == 14)
         {
            this.fx_chain_position14 = this.fx_chain_position13;
            this.fx_chain_position13 = this.fx_chain_position12;
            this.fx_chain_position12 = this.fx_chain_position11;
            this.fx_chain_position11 = 14;
         }
         if(this.fx_chain_position15 == 8)
         {
            this.fx_chain_position15 = this.fx_chain_position14;
            this.fx_chain_position14 = this.fx_chain_position13;
            this.fx_chain_position13 = this.fx_chain_position12;
            this.fx_chain_position12 = this.fx_chain_position11;
            this.fx_chain_position11 = this.fx_chain_position10;
            this.fx_chain_position10 = 8;
         }
         if(this.fx_chain_position17 == 4)
         {
            this.fx_chain_position17 = this.fx_chain_position16;
            this.fx_chain_position16 = this.fx_chain_position15;
            this.fx_chain_position15 = this.fx_chain_position14;
            this.fx_chain_position14 = this.fx_chain_position13;
            this.fx_chain_position13 = this.fx_chain_position12;
            this.fx_chain_position12 = this.fx_chain_position11;
            this.fx_chain_position11 = this.fx_chain_position10;
            this.fx_chain_position10 = this.fx_chain_position9;
            this.fx_chain_position9 = this.fx_chain_position8;
            this.fx_chain_position8 = this.fx_chain_position7;
            this.fx_chain_position7 = 4;
         }
      }
      
      private function SetV3fromV2() : void
      {
         this.fx1_wah95e_pedal_pos = 50;
         this.fx1_wah95e_pedal_min = 0;
         this.fx1_wah95e_pedal_max = 100;
         this.fx1_wah95e_effect_level = 100;
         this.fx1_dc30_selector = 0;
         this.fx1_dc30_input_volume = 50;
         this.fx1_dc30_chorus_intensity = 50;
         this.fx1_dc30_echo_repeat_rate_h = 3;
         this.fx1_dc30_echo_repeat_rate_l = 16;
         this.fx1_dc30_echo_intensity = 50;
         this.fx1_dc30_echo_volume = 100;
         this.fx1_dc30_tone = 50;
         this.fx1_dc30_output = 0;
         this.fx2_wah95e_pedal_pos = 50;
         this.fx2_wah95e_pedal_min = 0;
         this.fx2_wah95e_pedal_max = 100;
         this.fx2_wah95e_effect_level = 100;
         this.fx2_dc30_selector = 0;
         this.fx2_dc30_input_volume = 50;
         this.fx2_dc30_chorus_intensity = 50;
         this.fx2_dc30_echo_repeat_rate_h = 3;
         this.fx2_dc30_echo_repeat_rate_l = 16;
         this.fx2_dc30_echo_intensity = 50;
         this.fx2_dc30_echo_volume = 100;
         this.fx2_dc30_tone = 50;
         this.fx2_dc30_output = 0;
         this.eq_type = 0;
         this.eq_geq_31hz = 24;
         this.eq_geq_62hz = 24;
         this.eq_geq_125hz = 24;
         this.eq_geq_250hz = 24;
         this.eq_geq_500hz = 24;
         this.eq_geq_1khz = 24;
         this.eq_geq_2khz = 24;
         this.eq_geq_4khz = 24;
         this.eq_geq_8khz = 24;
         this.eq_geq_16khz = 24;
         this.eq_geq_level = 24;
         this.pedal_function_exp_pedal = 2;
         this.pedal_function_gafc_exp1 = 0;
         this.pedal_function_gafc_exp2 = 2;
         this.knob_assign_booster = 0;
         this.knob_assign_delay = 0;
         this.knob_assign_reverb = 0;
         this.knob_assign_chorus = 0;
         this.knob_assign_flanger = 0;
         this.knob_assign_phaser = 0;
         this.knob_assign_uni_v = 0;
         this.knob_assign_tremolo = 0;
         this.knob_assign_vibrato = 0;
         this.knob_assign_rotary = 0;
         this.knob_assign_ring_mod = 0;
         this.knob_assign_slow_gear = 0;
         this.knob_assign_slicer = 0;
         this.knob_assign_comp = 0;
         this.knob_assign_limiter = 0;
         this.knob_assign_t_wah = 0;
         this.knob_assign_auto_wah = 0;
         this.knob_assign_pedal_wah = 0;
         this.knob_assign_geq = 0;
         this.knob_assign_peq = 0;
         this.knob_assign_guitar_sim = 0;
         this.knob_assign_ac_guitar_sim = 0;
         this.knob_assign_ac_processor = 0;
         this.knob_assign_wave_synth = 0;
         this.knob_assign_octave = 0;
         this.knob_assign_pitch_shifter = 0;
         this.knob_assign_harmonist = 0;
         this.knob_assign_humanizer = 0;
         this.knob_assign_evh_phaser = 0;
         this.knob_assign_evh_flanger = 0;
         this.knob_assign_evh_wah = 0;
         this.knob_assign_dc30 = 0;
         this.exp_pedal_assign_booster = 0;
         this.exp_pedal_assign_delay = 0;
         this.exp_pedal_assign_reverb = 0;
         this.exp_pedal_assign_chorus = 0;
         this.exp_pedal_assign_flanger = 0;
         this.exp_pedal_assign_phaser = 0;
         this.exp_pedal_assign_uni_v = 0;
         this.exp_pedal_assign_tremolo = 0;
         this.exp_pedal_assign_vibrato = 0;
         this.exp_pedal_assign_rotary = 0;
         this.exp_pedal_assign_ring_mod = 0;
         this.exp_pedal_assign_slow_gear = 0;
         this.exp_pedal_assign_slicer = 0;
         this.exp_pedal_assign_comp = 0;
         this.exp_pedal_assign_limiter = 0;
         this.exp_pedal_assign_t_wah = 0;
         this.exp_pedal_assign_auto_wah = 0;
         this.exp_pedal_assign_pedal_wah = 0;
         this.exp_pedal_assign_geq = 0;
         this.exp_pedal_assign_peq = 0;
         this.exp_pedal_assign_guitar_sim = 0;
         this.exp_pedal_assign_ac_guitar_sim = 0;
         this.exp_pedal_assign_ac_processor = 0;
         this.exp_pedal_assign_wave_synth = 0;
         this.exp_pedal_assign_octave = 0;
         this.exp_pedal_assign_pitch_shifter = 0;
         this.exp_pedal_assign_harmonist = 0;
         this.exp_pedal_assign_humanizer = 0;
         this.exp_pedal_assign_evh_phaser = 0;
         this.exp_pedal_assign_evh_flanger = 0;
         this.exp_pedal_assign_evh_wah = 0;
         this.exp_pedal_assign_dc30 = 0;
         this.exp_pedal_assign_booster_min = 0;
         this.exp_pedal_assign_booster_max = 100;
         this.exp_pedal_assign_delay_min_h = 0;
         this.exp_pedal_assign_delay_min_l = 0;
         this.exp_pedal_assign_delay_max_h = 0;
         this.exp_pedal_assign_delay_max_l = 100;
         this.exp_pedal_assign_reverb_min_h = 0;
         this.exp_pedal_assign_reverb_min_l = 0;
         this.exp_pedal_assign_reverb_max_h = 0;
         this.exp_pedal_assign_reverb_max_l = 100;
         this.exp_pedal_assign_chorus_min = 0;
         this.exp_pedal_assign_chorus_max = 100;
         this.exp_pedal_assign_flanger_min = 0;
         this.exp_pedal_assign_flanger_max = 100;
         this.exp_pedal_assign_phaser_min = 0;
         this.exp_pedal_assign_phaser_max = 100;
         this.exp_pedal_assign_uni_v_min = 0;
         this.exp_pedal_assign_uni_v_max = 100;
         this.exp_pedal_assign_tremolo_min = 0;
         this.exp_pedal_assign_tremolo_max = 100;
         this.exp_pedal_assign_vibrato_min = 0;
         this.exp_pedal_assign_vibrato_max = 100;
         this.exp_pedal_assign_rotary_min = 0;
         this.exp_pedal_assign_rotary_max = 100;
         this.exp_pedal_assign_ring_mod_min = 0;
         this.exp_pedal_assign_ring_mod_max = 100;
         this.exp_pedal_assign_slow_gear_min = 0;
         this.exp_pedal_assign_slow_gear_max = 100;
         this.exp_pedal_assign_slicer_min = 0;
         this.exp_pedal_assign_slicer_max = 100;
         this.exp_pedal_assign_comp_min = 0;
         this.exp_pedal_assign_comp_max = 100;
         this.exp_pedal_assign_limiter_min = 0;
         this.exp_pedal_assign_limiter_max = 100;
         this.exp_pedal_assign_t_wah_min = 0;
         this.exp_pedal_assign_t_wah_max = 100;
         this.exp_pedal_assign_auto_wah_min = 0;
         this.exp_pedal_assign_auto_wah_max = 100;
         this.exp_pedal_assign_pedal_wah_min = 0;
         this.exp_pedal_assign_pedal_wah_max = 100;
         this.exp_pedal_assign_geq_min = 0;
         this.exp_pedal_assign_geq_max = 100;
         this.exp_pedal_assign_peq_min = 0;
         this.exp_pedal_assign_peq_max = 100;
         this.exp_pedal_assign_guitar_sim_min = 0;
         this.exp_pedal_assign_guitar_sim_max = 100;
         this.exp_pedal_assign_ac_guitar_sim_min = 0;
         this.exp_pedal_assign_ac_guitar_sim_max = 100;
         this.exp_pedal_assign_ac_processor_min = 0;
         this.exp_pedal_assign_ac_processor_max = 100;
         this.exp_pedal_assign_wave_synth_min = 0;
         this.exp_pedal_assign_wave_synth_max = 100;
         this.exp_pedal_assign_octave_min = 0;
         this.exp_pedal_assign_octave_max = 100;
         this.exp_pedal_assign_pitch_shifter_min_h = 0;
         this.exp_pedal_assign_pitch_shifter_min_l = 0;
         this.exp_pedal_assign_pitch_shifter_max_h = 0;
         this.exp_pedal_assign_pitch_shifter_max_l = 100;
         this.exp_pedal_assign_harmonist_min_h = 0;
         this.exp_pedal_assign_harmonist_min_l = 0;
         this.exp_pedal_assign_harmonist_max_h = 0;
         this.exp_pedal_assign_harmonist_max_l = 100;
         this.exp_pedal_assign_humanizer_min = 0;
         this.exp_pedal_assign_humanizer_max = 100;
         this.exp_pedal_assign_evh_phaser_min = 0;
         this.exp_pedal_assign_evh_phaser_max = 100;
         this.exp_pedal_assign_evh_flanger_min = 0;
         this.exp_pedal_assign_evh_flanger_max = 100;
         this.exp_pedal_assign_evh_wah_min = 0;
         this.exp_pedal_assign_evh_wah_max = 100;
         this.exp_pedal_assign_dc30_min_h = 0;
         this.exp_pedal_assign_dc30_min_l = 0;
         this.exp_pedal_assign_dc30_max_h = 0;
         this.exp_pedal_assign_dc30_max_l = 100;
         this.gafc_exp1_assign_booster = 0;
         this.gafc_exp1_assign_delay = 0;
         this.gafc_exp1_assign_reverb = 0;
         this.gafc_exp1_assign_chorus = 0;
         this.gafc_exp1_assign_flanger = 0;
         this.gafc_exp1_assign_phaser = 0;
         this.gafc_exp1_assign_uni_v = 0;
         this.gafc_exp1_assign_tremolo = 0;
         this.gafc_exp1_assign_vibrato = 0;
         this.gafc_exp1_assign_rotary = 0;
         this.gafc_exp1_assign_ring_mod = 0;
         this.gafc_exp1_assign_slow_gear = 0;
         this.gafc_exp1_assign_slicer = 0;
         this.gafc_exp1_assign_comp = 0;
         this.gafc_exp1_assign_limiter = 0;
         this.gafc_exp1_assign_t_wah = 0;
         this.gafc_exp1_assign_auto_wah = 0;
         this.gafc_exp1_assign_pedal_wah = 0;
         this.gafc_exp1_assign_geq = 0;
         this.gafc_exp1_assign_peq = 0;
         this.gafc_exp1_assign_guitar_sim = 0;
         this.gafc_exp1_assign_ac_guitar_sim = 0;
         this.gafc_exp1_assign_ac_processor = 0;
         this.gafc_exp1_assign_wave_synth = 0;
         this.gafc_exp1_assign_octave = 0;
         this.gafc_exp1_assign_pitch_shifter = 0;
         this.gafc_exp1_assign_harmonist = 0;
         this.gafc_exp1_assign_humanizer = 0;
         this.gafc_exp1_assign_evh_phaser = 0;
         this.gafc_exp1_assign_evh_flanger = 0;
         this.gafc_exp1_assign_evh_wah = 0;
         this.gafc_exp1_assign_dc30 = 0;
         this.gafc_exp1_assign_booster_min = 0;
         this.gafc_exp1_assign_booster_max = 100;
         this.gafc_exp1_assign_delay_min_h = 0;
         this.gafc_exp1_assign_delay_min_l = 0;
         this.gafc_exp1_assign_delay_max_h = 0;
         this.gafc_exp1_assign_delay_max_l = 100;
         this.gafc_exp1_assign_reverb_min_h = 0;
         this.gafc_exp1_assign_reverb_min_l = 0;
         this.gafc_exp1_assign_reverb_max_h = 0;
         this.gafc_exp1_assign_reverb_max_l = 100;
         this.gafc_exp1_assign_chorus_min = 0;
         this.gafc_exp1_assign_chorus_max = 100;
         this.gafc_exp1_assign_flanger_min = 0;
         this.gafc_exp1_assign_flanger_max = 100;
         this.gafc_exp1_assign_phaser_min = 0;
         this.gafc_exp1_assign_phaser_max = 100;
         this.gafc_exp1_assign_uni_v_min = 0;
         this.gafc_exp1_assign_uni_v_max = 100;
         this.gafc_exp1_assign_tremolo_min = 0;
         this.gafc_exp1_assign_tremolo_max = 100;
         this.gafc_exp1_assign_vibrato_min = 0;
         this.gafc_exp1_assign_vibrato_max = 100;
         this.gafc_exp1_assign_rotary_min = 0;
         this.gafc_exp1_assign_rotary_max = 100;
         this.gafc_exp1_assign_ring_mod_min = 0;
         this.gafc_exp1_assign_ring_mod_max = 100;
         this.gafc_exp1_assign_slow_gear_min = 0;
         this.gafc_exp1_assign_slow_gear_max = 100;
         this.gafc_exp1_assign_slicer_min = 0;
         this.gafc_exp1_assign_slicer_max = 100;
         this.gafc_exp1_assign_comp_min = 0;
         this.gafc_exp1_assign_comp_max = 100;
         this.gafc_exp1_assign_limiter_min = 0;
         this.gafc_exp1_assign_limiter_max = 100;
         this.gafc_exp1_assign_t_wah_min = 0;
         this.gafc_exp1_assign_t_wah_max = 100;
         this.gafc_exp1_assign_auto_wah_min = 0;
         this.gafc_exp1_assign_auto_wah_max = 100;
         this.gafc_exp1_assign_pedal_wah_min = 0;
         this.gafc_exp1_assign_pedal_wah_max = 100;
         this.gafc_exp1_assign_geq_min = 0;
         this.gafc_exp1_assign_geq_max = 100;
         this.gafc_exp1_assign_peq_min = 0;
         this.gafc_exp1_assign_peq_max = 100;
         this.gafc_exp1_assign_guitar_sim_min = 0;
         this.gafc_exp1_assign_guitar_sim_max = 100;
         this.gafc_exp1_assign_ac_guitar_sim_min = 0;
         this.gafc_exp1_assign_ac_guitar_sim_max = 100;
         this.gafc_exp1_assign_ac_processor_min = 0;
         this.gafc_exp1_assign_ac_processor_max = 100;
         this.gafc_exp1_assign_wave_synth_min = 0;
         this.gafc_exp1_assign_wave_synth_max = 100;
         this.gafc_exp1_assign_octave_min = 0;
         this.gafc_exp1_assign_octave_max = 100;
         this.gafc_exp1_assign_pitch_shifter_min_h = 0;
         this.gafc_exp1_assign_pitch_shifter_min_l = 0;
         this.gafc_exp1_assign_pitch_shifter_max_h = 0;
         this.gafc_exp1_assign_pitch_shifter_max_l = 100;
         this.gafc_exp1_assign_harmonist_min_h = 0;
         this.gafc_exp1_assign_harmonist_min_l = 0;
         this.gafc_exp1_assign_harmonist_max_h = 0;
         this.gafc_exp1_assign_harmonist_max_l = 100;
         this.gafc_exp1_assign_humanizer_min = 0;
         this.gafc_exp1_assign_humanizer_max = 100;
         this.gafc_exp1_assign_evh_phaser_min = 0;
         this.gafc_exp1_assign_evh_phaser_max = 100;
         this.gafc_exp1_assign_evh_flanger_min = 0;
         this.gafc_exp1_assign_evh_flanger_max = 100;
         this.gafc_exp1_assign_evh_wah_min = 0;
         this.gafc_exp1_assign_evh_wah_max = 100;
         this.gafc_exp1_assign_dc30_min_h = 0;
         this.gafc_exp1_assign_dc30_min_l = 0;
         this.gafc_exp1_assign_dc30_max_h = 0;
         this.gafc_exp1_assign_dc30_max_l = 100;
         this.gafc_exp2_assign_booster = 0;
         this.gafc_exp2_assign_delay = 0;
         this.gafc_exp2_assign_reverb = 0;
         this.gafc_exp2_assign_chorus = 0;
         this.gafc_exp2_assign_flanger = 0;
         this.gafc_exp2_assign_phaser = 0;
         this.gafc_exp2_assign_uni_v = 0;
         this.gafc_exp2_assign_tremolo = 0;
         this.gafc_exp2_assign_vibrato = 0;
         this.gafc_exp2_assign_rotary = 0;
         this.gafc_exp2_assign_ring_mod = 0;
         this.gafc_exp2_assign_slow_gear = 0;
         this.gafc_exp2_assign_slicer = 0;
         this.gafc_exp2_assign_comp = 0;
         this.gafc_exp2_assign_limiter = 0;
         this.gafc_exp2_assign_t_wah = 0;
         this.gafc_exp2_assign_auto_wah = 0;
         this.gafc_exp2_assign_pedal_wah = 0;
         this.gafc_exp2_assign_geq = 0;
         this.gafc_exp2_assign_peq = 0;
         this.gafc_exp2_assign_guitar_sim = 0;
         this.gafc_exp2_assign_ac_guitar_sim = 0;
         this.gafc_exp2_assign_ac_processor = 0;
         this.gafc_exp2_assign_wave_synth = 0;
         this.gafc_exp2_assign_octave = 0;
         this.gafc_exp2_assign_pitch_shifter = 0;
         this.gafc_exp2_assign_harmonist = 0;
         this.gafc_exp2_assign_humanizer = 0;
         this.gafc_exp2_assign_evh_phaser = 0;
         this.gafc_exp2_assign_evh_flanger = 0;
         this.gafc_exp2_assign_evh_wah = 0;
         this.gafc_exp2_assign_dc30 = 0;
         this.gafc_exp2_assign_booster_min = 0;
         this.gafc_exp2_assign_booster_max = 100;
         this.gafc_exp2_assign_delay_min_h = 0;
         this.gafc_exp2_assign_delay_min_l = 0;
         this.gafc_exp2_assign_delay_max_h = 0;
         this.gafc_exp2_assign_delay_max_l = 100;
         this.gafc_exp2_assign_reverb_min_h = 0;
         this.gafc_exp2_assign_reverb_min_l = 0;
         this.gafc_exp2_assign_reverb_max_h = 0;
         this.gafc_exp2_assign_reverb_max_l = 100;
         this.gafc_exp2_assign_chorus_min = 0;
         this.gafc_exp2_assign_chorus_max = 100;
         this.gafc_exp2_assign_flanger_min = 0;
         this.gafc_exp2_assign_flanger_max = 100;
         this.gafc_exp2_assign_phaser_min = 0;
         this.gafc_exp2_assign_phaser_max = 100;
         this.gafc_exp2_assign_uni_v_min = 0;
         this.gafc_exp2_assign_uni_v_max = 100;
         this.gafc_exp2_assign_tremolo_min = 0;
         this.gafc_exp2_assign_tremolo_max = 100;
         this.gafc_exp2_assign_vibrato_min = 0;
         this.gafc_exp2_assign_vibrato_max = 100;
         this.gafc_exp2_assign_rotary_min = 0;
         this.gafc_exp2_assign_rotary_max = 100;
         this.gafc_exp2_assign_ring_mod_min = 0;
         this.gafc_exp2_assign_ring_mod_max = 100;
         this.gafc_exp2_assign_slow_gear_min = 0;
         this.gafc_exp2_assign_slow_gear_max = 100;
         this.gafc_exp2_assign_slicer_min = 0;
         this.gafc_exp2_assign_slicer_max = 100;
         this.gafc_exp2_assign_comp_min = 0;
         this.gafc_exp2_assign_comp_max = 100;
         this.gafc_exp2_assign_limiter_min = 0;
         this.gafc_exp2_assign_limiter_max = 100;
         this.gafc_exp2_assign_t_wah_min = 0;
         this.gafc_exp2_assign_t_wah_max = 100;
         this.gafc_exp2_assign_auto_wah_min = 0;
         this.gafc_exp2_assign_auto_wah_max = 100;
         this.gafc_exp2_assign_pedal_wah_min = 0;
         this.gafc_exp2_assign_pedal_wah_max = 100;
         this.gafc_exp2_assign_geq_min = 0;
         this.gafc_exp2_assign_geq_max = 100;
         this.gafc_exp2_assign_peq_min = 0;
         this.gafc_exp2_assign_peq_max = 100;
         this.gafc_exp2_assign_guitar_sim_min = 0;
         this.gafc_exp2_assign_guitar_sim_max = 100;
         this.gafc_exp2_assign_ac_guitar_sim_min = 0;
         this.gafc_exp2_assign_ac_guitar_sim_max = 100;
         this.gafc_exp2_assign_ac_processor_min = 0;
         this.gafc_exp2_assign_ac_processor_max = 100;
         this.gafc_exp2_assign_wave_synth_min = 0;
         this.gafc_exp2_assign_wave_synth_max = 100;
         this.gafc_exp2_assign_octave_min = 0;
         this.gafc_exp2_assign_octave_max = 100;
         this.gafc_exp2_assign_pitch_shifter_min_h = 0;
         this.gafc_exp2_assign_pitch_shifter_min_l = 0;
         this.gafc_exp2_assign_pitch_shifter_max_h = 0;
         this.gafc_exp2_assign_pitch_shifter_max_l = 100;
         this.gafc_exp2_assign_harmonist_min_h = 0;
         this.gafc_exp2_assign_harmonist_min_l = 0;
         this.gafc_exp2_assign_harmonist_max_h = 0;
         this.gafc_exp2_assign_harmonist_max_l = 100;
         this.gafc_exp2_assign_humanizer_min = 0;
         this.gafc_exp2_assign_humanizer_max = 100;
         this.gafc_exp2_assign_evh_phaser_min = 0;
         this.gafc_exp2_assign_evh_phaser_max = 100;
         this.gafc_exp2_assign_evh_flanger_min = 0;
         this.gafc_exp2_assign_evh_flanger_max = 100;
         this.gafc_exp2_assign_evh_wah_min = 0;
         this.gafc_exp2_assign_evh_wah_max = 100;
         this.gafc_exp2_assign_dc30_min_h = 0;
         this.gafc_exp2_assign_dc30_min_l = 0;
         this.gafc_exp2_assign_dc30_max_h = 0;
         this.gafc_exp2_assign_dc30_max_l = 100;
         if(this.fx_chain_position14 == 18)
         {
            this.fx_chain_position14 = this.fx_chain_position15;
            this.fx_chain_position15 = this.fx_chain_position16;
            this.fx_chain_position16 = this.fx_chain_position17;
            this.fx_chain_position17 = this.fx_chain_position18;
            this.fx_chain_position18 = this.fx_chain_position19;
            this.fx_chain_position19 = this.fx_chain_position13;
            this.fx_chain_position13 = 18;
         }
      }
      
      private function SetV4fromV3() : void
      {
         this.pedal_fx_on_off = 0;
         this.pedal_fx_position = 0;
         this.pedal_fx_type = 0;
         this.pedal_fx_pedal_bend_pitch = 36;
         this.pedal_fx_pedal_bend_position = 50;
         this.pedal_fx_pedal_bend_effect_level = 100;
         this.pedal_fx_pedal_bend_direct_mix = 0;
         this.pedal_fx_wah_type = 0;
         this.pedal_fx_wah_position = 100;
         this.pedal_fx_wah_pedal_min = 0;
         this.pedal_fx_wah_pedal_max = 100;
         this.pedal_fx_wah_effect_level = 100;
         this.pedal_fx_wah_direct_mix = 0;
         this.pedal_fx_evh95_position = 100;
         this.pedal_fx_evh95_pedal_min = 0;
         this.pedal_fx_evh95_pedal_max = 100;
         this.pedal_fx_evh95_effect_level = 100;
         this.pedal_fx_evh95_direct_mix = 0;
         this.fx1_heavy_oct_1oct_level = 50;
         this.fx1_heavy_oct_2oct_level = 0;
         this.fx1_heavy_oct_direct_mix = 100;
         this.fx2_heavy_oct_1oct_level = 50;
         this.fx2_heavy_oct_2oct_level = 0;
         this.fx2_heavy_oct_direct_mix = 100;
         this.knob_assign_heavy_oct = 0;
         this.exp_pedal_assign_heavy_oct = 0;
         this.exp_pedal_assign_heavy_oct_min = 0;
         this.exp_pedal_assign_heavy_oct_max = 100;
         this.gafc_exp1_assign_heavy_oct = 0;
         this.gafc_exp1_assign_heavy_oct_min = 0;
         this.gafc_exp1_assign_heavy_oct_max = 100;
         this.gafc_exp2_assign_heavy_oct = 0;
         this.gafc_exp2_assign_heavy_oct_min = 0;
         this.gafc_exp2_assign_heavy_oct_max = 100;
         if(this.fx_chain_position16 == 11)
         {
            this.fx_chain_position16 = this.fx_chain_position15;
            this.fx_chain_position15 = this.fx_chain_position14;
            this.fx_chain_position14 = this.fx_chain_position13;
            this.fx_chain_position13 = this.fx_chain_position12;
            this.fx_chain_position12 = this.fx_chain_position11;
            this.fx_chain_position11 = this.fx_chain_position10;
            this.fx_chain_position10 = this.fx_chain_position9;
            this.fx_chain_position9 = this.fx_chain_position8;
            this.fx_chain_position8 = this.fx_chain_position7;
            this.fx_chain_position7 = this.fx_chain_position6;
            this.fx_chain_position6 = this.fx_chain_position5;
            this.fx_chain_position5 = this.fx_chain_position4;
            this.fx_chain_position4 = this.fx_chain_position3;
            this.fx_chain_position3 = this.fx_chain_position2;
            this.fx_chain_position2 = 11;
         }
         if(this.fx1_fx_type == 2)
         {
            this.pedal_fx_type = 0;
            this.pedal_fx_wah_type = this.fx1_sub_wah_type;
            this.pedal_fx_wah_position = this.fx1_sub_wah_pedal_pos;
            this.pedal_fx_wah_pedal_min = this.fx1_sub_wah_pedal_min;
            this.pedal_fx_wah_pedal_max = this.fx1_sub_wah_pedal_max;
            this.pedal_fx_wah_effect_level = this.fx1_sub_wah_effect_level;
            this.pedal_fx_wah_direct_mix = this.fx1_sub_wah_direct_mix;
            this.pedal_fx_on_off = this.fx1_on_off;
            this.fx1_on_off = 0;
            if(this.chain_ptn == 0)
            {
               this.pedal_fx_position = 1;
            }
            else
            {
               this.pedal_fx_position = 0;
            }
         }
         else if(this.fx1_fx_type == 37)
         {
            this.pedal_fx_type = 2;
            this.pedal_fx_evh95_position = this.fx1_wah95e_pedal_pos;
            this.pedal_fx_evh95_pedal_min = this.fx1_wah95e_pedal_min;
            this.pedal_fx_evh95_pedal_max = this.fx1_wah95e_pedal_max;
            this.pedal_fx_evh95_effect_level = this.fx1_wah95e_effect_level;
            this.pedal_fx_evh95_direct_mix = this.fx1_wah95e_direct_mix;
            this.pedal_fx_on_off = this.fx1_on_off;
            this.fx1_on_off = 0;
            if(this.chain_ptn == 0)
            {
               this.pedal_fx_position = 1;
            }
            else
            {
               this.pedal_fx_position = 0;
            }
         }
         else if(this.fx2_fx_type == 2)
         {
            this.pedal_fx_type = 0;
            this.pedal_fx_wah_type = this.fx2_sub_wah_type;
            this.pedal_fx_wah_position = this.fx2_sub_wah_pedal_pos;
            this.pedal_fx_wah_pedal_min = this.fx2_sub_wah_pedal_min;
            this.pedal_fx_wah_pedal_max = this.fx2_sub_wah_pedal_max;
            this.pedal_fx_wah_effect_level = this.fx2_sub_wah_effect_level;
            this.pedal_fx_wah_direct_mix = this.fx2_sub_wah_direct_mix;
            this.pedal_fx_on_off = this.fx2_on_off;
            this.fx2_on_off = 0;
            if(this.chain_ptn == 2)
            {
               this.pedal_fx_position = 0;
            }
            else
            {
               this.pedal_fx_position = 1;
            }
         }
         else if(this.fx2_fx_type == 37)
         {
            this.pedal_fx_type = 2;
            this.pedal_fx_evh95_position = this.fx2_wah95e_pedal_pos;
            this.pedal_fx_evh95_pedal_min = this.fx2_wah95e_pedal_min;
            this.pedal_fx_evh95_pedal_max = this.fx2_wah95e_pedal_max;
            this.pedal_fx_evh95_effect_level = this.fx2_wah95e_effect_level;
            this.pedal_fx_evh95_direct_mix = this.fx2_wah95e_direct_mix;
            this.pedal_fx_on_off = this.fx2_on_off;
            this.fx2_on_off = 0;
            if(this.chain_ptn == 2)
            {
               this.pedal_fx_position = 0;
            }
            else
            {
               this.pedal_fx_position = 1;
            }
         }
      }
      
      public function set patchname(param1:String) : void
      {
         var _loc4_:int = 0;
         var _loc2_:String = ToneCentralUtil.convertAsciiToHex(param1);
         var _loc3_:Array = _loc2_.split(",");
         _loc4_ = 0;
         while(_loc4_ < _loc3_.length)
         {
            _loc3_[_loc4_] = ToneCentralUtil.convertDecimal(_loc3_[_loc4_]);
            _loc4_++;
         }
         _loc4_ = int(_loc3_.length);
         while(_loc4_ < 16)
         {
            _loc3_[_loc4_] = ToneCentralUtil.convertDecimal("20");
            _loc4_++;
         }
         this.patch_name1 = _loc3_[0];
         this.patch_name2 = _loc3_[1];
         this.patch_name3 = _loc3_[2];
         this.patch_name4 = _loc3_[3];
         this.patch_name5 = _loc3_[4];
         this.patch_name6 = _loc3_[5];
         this.patch_name7 = _loc3_[6];
         this.patch_name8 = _loc3_[7];
         this.patch_name9 = _loc3_[8];
         this.patch_name10 = _loc3_[9];
         this.patch_name11 = _loc3_[10];
         this.patch_name12 = _loc3_[11];
         this.patch_name13 = _loc3_[12];
         this.patch_name14 = _loc3_[13];
         this.patch_name15 = _loc3_[14];
         this.patch_name16 = _loc3_[15];
      }
      
      public function get patchname() : String
      {
         var _loc1_:Array = [];
         _loc1_.push(ToneCentralUtil.convertHexaDecimal(String(this.patch_name1),2));
         _loc1_.push(ToneCentralUtil.convertHexaDecimal(String(this.patch_name2),2));
         _loc1_.push(ToneCentralUtil.convertHexaDecimal(String(this.patch_name3),2));
         _loc1_.push(ToneCentralUtil.convertHexaDecimal(String(this.patch_name4),2));
         _loc1_.push(ToneCentralUtil.convertHexaDecimal(String(this.patch_name5),2));
         _loc1_.push(ToneCentralUtil.convertHexaDecimal(String(this.patch_name6),2));
         _loc1_.push(ToneCentralUtil.convertHexaDecimal(String(this.patch_name7),2));
         _loc1_.push(ToneCentralUtil.convertHexaDecimal(String(this.patch_name8),2));
         _loc1_.push(ToneCentralUtil.convertHexaDecimal(String(this.patch_name9),2));
         _loc1_.push(ToneCentralUtil.convertHexaDecimal(String(this.patch_name10),2));
         _loc1_.push(ToneCentralUtil.convertHexaDecimal(String(this.patch_name11),2));
         _loc1_.push(ToneCentralUtil.convertHexaDecimal(String(this.patch_name12),2));
         _loc1_.push(ToneCentralUtil.convertHexaDecimal(String(this.patch_name13),2));
         _loc1_.push(ToneCentralUtil.convertHexaDecimal(String(this.patch_name14),2));
         _loc1_.push(ToneCentralUtil.convertHexaDecimal(String(this.patch_name15),2));
         _loc1_.push(ToneCentralUtil.convertHexaDecimal(String(this.patch_name16),2));
         return DataUtil.trimSpaceEnd(ToneCentralUtil.convertHexToAscii(_loc1_));
      }
      
      public function updateData(param1:int, param2:Array) : void
      {
         var _loc3_:int = 0;
         var _loc4_:String = param1.toString(16);
         var _loc5_:String = _loc4_.substr(_loc4_.length - 2,2);
         var _loc6_:int = parseInt(_loc5_,16);
         var _loc7_:int = 0;
         param1 -= _loc6_;
         var _loc8_:int = 0;
         while(_loc8_ < param2.length)
         {
            if(_loc6_ == 128)
            {
               _loc6_ = 0;
               _loc7_ += 256;
            }
            _loc3_ = param1 + _loc7_ + _loc6_;
            this.setData(_loc3_,param2[_loc8_]);
            _loc6_++;
            _loc8_++;
         }
         if(_loc3_ >= 1824)
         {
            this.setChainParams();
         }
      }
      
      protected function setData(param1:int, param2:int) : void
      {
         if(0 <= param1 && param1 <= 62)
         {
            if(param1 == 0)
            {
               this.patch_name1 = param2;
            }
            else if(param1 == 1)
            {
               this.patch_name2 = param2;
            }
            else if(param1 == 2)
            {
               this.patch_name3 = param2;
            }
            else if(param1 == 3)
            {
               this.patch_name4 = param2;
            }
            else if(param1 == 4)
            {
               this.patch_name5 = param2;
            }
            else if(param1 == 5)
            {
               this.patch_name6 = param2;
            }
            else if(param1 == 6)
            {
               this.patch_name7 = param2;
            }
            else if(param1 == 7)
            {
               this.patch_name8 = param2;
            }
            else if(param1 == 8)
            {
               this.patch_name9 = param2;
            }
            else if(param1 == 9)
            {
               this.patch_name10 = param2;
            }
            else if(param1 == 10)
            {
               this.patch_name11 = param2;
            }
            else if(param1 == 11)
            {
               this.patch_name12 = param2;
            }
            else if(param1 == 12)
            {
               this.patch_name13 = param2;
            }
            else if(param1 == 13)
            {
               this.patch_name14 = param2;
            }
            else if(param1 == 14)
            {
               this.patch_name15 = param2;
            }
            else if(param1 == 15)
            {
               this.patch_name16 = param2;
            }
            else if(param1 == 16)
            {
               this.output_select = param2;
            }
            else if(param1 == 32)
            {
               this.comp_on_off = param2;
            }
            else if(param1 == 33)
            {
               this.comp_type = param2;
            }
            else if(param1 == 34)
            {
               this.comp_sustain = param2;
            }
            else if(param1 == 35)
            {
               this.comp_attack = param2;
            }
            else if(param1 == 36)
            {
               this.comp_tone = param2;
            }
            else if(param1 == 37)
            {
               this.comp_level = param2;
            }
            else if(param1 == 48)
            {
               this.od_ds_on_off = param2;
            }
            else if(param1 == 49)
            {
               this.od_ds_type = param2;
            }
            else if(param1 == 50)
            {
               this.od_ds_drive = param2;
            }
            else if(param1 == 51)
            {
               this.od_ds_bottom = param2;
            }
            else if(param1 == 52)
            {
               this.od_ds_tone = param2;
            }
            else if(param1 == 53)
            {
               this.od_ds_solo_sw = param2;
            }
            else if(param1 == 54)
            {
               this.od_ds_solo_level = param2;
            }
            else if(param1 == 55)
            {
               this.od_ds_effect_level = param2;
            }
            else if(param1 == 56)
            {
               this.od_ds_direct_mix = param2;
            }
            else if(param1 == 57)
            {
               this.od_ds_custom_type = param2;
            }
            else if(param1 == 58)
            {
               this.od_ds_custom_bottom = param2;
            }
            else if(param1 == 59)
            {
               this.od_ds_custom_top = param2;
            }
            else if(param1 == 60)
            {
               this.od_ds_custom_low = param2;
            }
            else if(param1 == 61)
            {
               this.od_ds_custom_high = param2;
            }
            else if(param1 == 62)
            {
               this.od_ds_custom_character = param2;
            }
         }
         else if(80 <= param1 && param1 <= 111)
         {
            if(param1 == 80)
            {
               this.preamp_a_on_off = param2;
            }
            else if(param1 == 81)
            {
               this.preamp_a_type = param2;
            }
            else if(param1 == 82)
            {
               this.preamp_a_gain = param2;
            }
            else if(param1 == 83)
            {
               this.preamp_a_t_comp = param2;
            }
            else if(param1 == 84)
            {
               this.preamp_a_bass = param2;
            }
            else if(param1 == 85)
            {
               this.preamp_a_middle = param2;
            }
            else if(param1 == 86)
            {
               this.preamp_a_treble = param2;
            }
            else if(param1 == 87)
            {
               this.preamp_a_presence = param2;
            }
            else if(param1 == 88)
            {
               this.preamp_a_level = param2;
            }
            else if(param1 == 89)
            {
               this.preamp_a_bright = param2;
            }
            else if(param1 == 90)
            {
               this.preamp_a_gain_sw = param2;
            }
            else if(param1 == 91)
            {
               this.preamp_a_solo_sw = param2;
            }
            else if(param1 == 92)
            {
               this.preamp_a_solo_level = param2;
            }
            else if(param1 == 93)
            {
               this.preamp_a_sp_type = param2;
            }
            else if(param1 == 94)
            {
               this.preamp_a_mic_type = param2;
            }
            else if(param1 == 95)
            {
               this.preamp_a_mic_dis = param2;
            }
            else if(param1 == 96)
            {
               this.preamp_a_mic_pos = param2;
            }
            else if(param1 == 97)
            {
               this.preamp_a_mic_level = param2;
            }
            else if(param1 == 98)
            {
               this.preamp_a_direct_mix = param2;
            }
            else if(param1 == 99)
            {
               this.preamp_a_custom_type = param2;
            }
            else if(param1 == 100)
            {
               this.preamp_a_custom_bottom = param2;
            }
            else if(param1 == 101)
            {
               this.preamp_a_custom_edge = param2;
            }
            else if(param1 == 104)
            {
               this.preamp_a_custom_preamp_low = param2;
            }
            else if(param1 == 105)
            {
               this.preamp_a_custom_preamp_high = param2;
            }
            else if(param1 == 106)
            {
               this.preamp_a_custom_char = param2;
            }
            else if(param1 == 107)
            {
               this.preamp_a_custom_sp_size = param2;
            }
            else if(param1 == 108)
            {
               this.preamp_a_custom_sp_color_low = param2;
            }
            else if(param1 == 109)
            {
               this.preamp_a_custom_sp_color_high = param2;
            }
            else if(param1 == 110)
            {
               this.preamp_a_custom_sp_num = param2;
            }
            else if(param1 == 111)
            {
               this.preamp_a_custom_sp_cabinet = param2;
            }
         }
         else if(256 <= param1 && param1 <= 287)
         {
            if(param1 == 256)
            {
               this.preamp_b_on_off = param2;
            }
            else if(param1 == 257)
            {
               this.preamp_b_type = param2;
            }
            else if(param1 == 258)
            {
               this.preamp_b_gain = param2;
            }
            else if(param1 == 259)
            {
               this.preamp_b_t_comp = param2;
            }
            else if(param1 == 260)
            {
               this.preamp_b_bass = param2;
            }
            else if(param1 == 261)
            {
               this.preamp_b_middle = param2;
            }
            else if(param1 == 262)
            {
               this.preamp_b_treble = param2;
            }
            else if(param1 == 263)
            {
               this.preamp_b_presence = param2;
            }
            else if(param1 == 264)
            {
               this.preamp_b_level = param2;
            }
            else if(param1 == 265)
            {
               this.preamp_b_bright = param2;
            }
            else if(param1 == 266)
            {
               this.preamp_b_gain_sw = param2;
            }
            else if(param1 == 267)
            {
               this.preamp_b_solo_sw = param2;
            }
            else if(param1 == 268)
            {
               this.preamp_b_solo_level = param2;
            }
            else if(param1 == 269)
            {
               this.preamp_b_sp_type = param2;
            }
            else if(param1 == 270)
            {
               this.preamp_b_mic_type = param2;
            }
            else if(param1 == 271)
            {
               this.preamp_b_mic_dis = param2;
            }
            else if(param1 == 272)
            {
               this.preamp_b_mic_pos = param2;
            }
            else if(param1 == 273)
            {
               this.preamp_b_mic_level = param2;
            }
            else if(param1 == 274)
            {
               this.preamp_b_direct_mix = param2;
            }
            else if(param1 == 275)
            {
               this.preamp_b_custom_type = param2;
            }
            else if(param1 == 276)
            {
               this.preamp_b_custom_bottom = param2;
            }
            else if(param1 == 277)
            {
               this.preamp_b_custom_edge = param2;
            }
            else if(param1 == 280)
            {
               this.preamp_b_custom_preamp_low = param2;
            }
            else if(param1 == 281)
            {
               this.preamp_b_custom_preamp_high = param2;
            }
            else if(param1 == 282)
            {
               this.preamp_b_custom_char = param2;
            }
            else if(param1 == 283)
            {
               this.preamp_b_custom_sp_size = param2;
            }
            else if(param1 == 284)
            {
               this.preamp_b_custom_sp_color_low = param2;
            }
            else if(param1 == 285)
            {
               this.preamp_b_custom_sp_color_high = param2;
            }
            else if(param1 == 286)
            {
               this.preamp_b_custom_sp_num = param2;
            }
            else if(param1 == 287)
            {
               this.preamp_b_custom_sp_cabinet = param2;
            }
         }
         else if(304 <= param1 && param1 <= 315)
         {
            if(param1 == 304)
            {
               this.eq_on_off = param2;
            }
            else if(param1 == 305)
            {
               this.eq_low_cut = param2;
            }
            else if(param1 == 306)
            {
               this.eq_low_gain = param2;
            }
            else if(param1 == 307)
            {
               this.eq_low_mid_freq = param2;
            }
            else if(param1 == 308)
            {
               this.eq_low_mid_q = param2;
            }
            else if(param1 == 309)
            {
               this.eq_low_mid_gain = param2;
            }
            else if(param1 == 310)
            {
               this.eq_high_mid_freq = param2;
            }
            else if(param1 == 311)
            {
               this.eq_high_mid_q = param2;
            }
            else if(param1 == 312)
            {
               this.eq_high_mid_gain = param2;
            }
            else if(param1 == 313)
            {
               this.eq_high_gain = param2;
            }
            else if(param1 == 314)
            {
               this.eq_high_cut = param2;
            }
            else if(param1 == 315)
            {
               this.eq_level = param2;
            }
         }
         else if(320 <= param1 && param1 <= 366)
         {
            if(param1 == 320)
            {
               this.fx1_on_off = param2;
            }
            else if(param1 == 321)
            {
               this.fx1_fx_type = param2;
            }
            else if(param1 == 322)
            {
               this.fx1_sub_od_ds_type = param2;
            }
            else if(param1 == 323)
            {
               this.fx1_sub_od_ds_drive = param2;
            }
            else if(param1 == 324)
            {
               this.fx1_sub_od_ds_bottom = param2;
            }
            else if(param1 == 325)
            {
               this.fx1_sub_od_ds_tone = param2;
            }
            else if(param1 == 326)
            {
               this.fx1_sub_od_ds_solo_sw = param2;
            }
            else if(param1 == 327)
            {
               this.fx1_sub_od_ds_solo_level = param2;
            }
            else if(param1 == 328)
            {
               this.fx1_sub_od_ds_effect_level = param2;
            }
            else if(param1 == 329)
            {
               this.fx1_sub_od_ds_direct_mix = param2;
            }
            else if(param1 == 332)
            {
               this.fx1_t_wah_mode = param2;
            }
            else if(param1 == 333)
            {
               this.fx1_t_wah_polar = param2;
            }
            else if(param1 == 334)
            {
               this.fx1_t_wah_sens = param2;
            }
            else if(param1 == 335)
            {
               this.fx1_t_wah_freq = param2;
            }
            else if(param1 == 336)
            {
               this.fx1_t_wah_peak = param2;
            }
            else if(param1 == 337)
            {
               this.fx1_t_wah_direct_mix = param2;
            }
            else if(param1 == 338)
            {
               this.fx1_t_wah_effect_level = param2;
            }
            else if(param1 == 340)
            {
               this.fx1_auto_wah_mode = param2;
            }
            else if(param1 == 341)
            {
               this.fx1_auto_wah_freq = param2;
            }
            else if(param1 == 342)
            {
               this.fx1_auto_wah_peak = param2;
            }
            else if(param1 == 343)
            {
               this.fx1_auto_wah_rate = param2;
            }
            else if(param1 == 344)
            {
               this.fx1_auto_wah_depth = param2;
            }
            else if(param1 == 345)
            {
               this.fx1_auto_wah_direct_mix = param2;
            }
            else if(param1 == 346)
            {
               this.fx1_auto_wah_effect_level = param2;
            }
            else if(param1 == 348)
            {
               this.fx1_sub_wah_type = param2;
            }
            else if(param1 == 349)
            {
               this.fx1_sub_wah_pedal_pos = param2;
            }
            else if(param1 == 350)
            {
               this.fx1_sub_wah_pedal_min = param2;
            }
            else if(param1 == 351)
            {
               this.fx1_sub_wah_pedal_max = param2;
            }
            else if(param1 == 352)
            {
               this.fx1_sub_wah_effect_level = param2;
            }
            else if(param1 == 353)
            {
               this.fx1_sub_wah_direct_mix = param2;
            }
            else if(param1 == 355)
            {
               this.fx1_adv_comp_type = param2;
            }
            else if(param1 == 356)
            {
               this.fx1_adv_comp_sustain = param2;
            }
            else if(param1 == 357)
            {
               this.fx1_adv_comp_attack = param2;
            }
            else if(param1 == 358)
            {
               this.fx1_adv_comp_tone = param2;
            }
            else if(param1 == 359)
            {
               this.fx1_adv_comp_level = param2;
            }
            else if(param1 == 361)
            {
               this.fx1_limiter_type = param2;
            }
            else if(param1 == 362)
            {
               this.fx1_limiter_attack = param2;
            }
            else if(param1 == 363)
            {
               this.fx1_limiter_thresh = param2;
            }
            else if(param1 == 364)
            {
               this.fx1_limiter_ratio = param2;
            }
            else if(param1 == 365)
            {
               this.fx1_limiter_release = param2;
            }
            else if(param1 == 366)
            {
               this.fx1_limiter_level = param2;
            }
         }
         else if(368 <= param1 && param1 <= 534)
         {
            if(param1 == 368)
            {
               this.fx1_graphic_eq_31hz = param2;
            }
            else if(param1 == 369)
            {
               this.fx1_graphic_eq_62hz = param2;
            }
            else if(param1 == 370)
            {
               this.fx1_graphic_eq_125hz = param2;
            }
            else if(param1 == 371)
            {
               this.fx1_graphic_eq_250hz = param2;
            }
            else if(param1 == 372)
            {
               this.fx1_graphic_eq_500hz = param2;
            }
            else if(param1 == 373)
            {
               this.fx1_graphic_eq_1khz = param2;
            }
            else if(param1 == 374)
            {
               this.fx1_graphic_eq_2khz = param2;
            }
            else if(param1 == 375)
            {
               this.fx1_graphic_eq_4khz = param2;
            }
            else if(param1 == 376)
            {
               this.fx1_graphic_eq_8khz = param2;
            }
            else if(param1 == 377)
            {
               this.fx1_graphic_eq_16khz = param2;
            }
            else if(param1 == 378)
            {
               this.fx1_graphic_eq_level = param2;
            }
            else if(param1 == 380)
            {
               this.fx1_parametric_eq_low_cut = param2;
            }
            else if(param1 == 381)
            {
               this.fx1_parametric_eq_low_gain = param2;
            }
            else if(param1 == 382)
            {
               this.fx1_parametric_eq_low_mid_freq = param2;
            }
            else if(param1 == 383)
            {
               this.fx1_parametric_eq_low_mid_q = param2;
            }
            else if(param1 == 512)
            {
               this.fx1_parametric_eq_low_mid_gain = param2;
            }
            else if(param1 == 513)
            {
               this.fx1_parametric_eq_high_mid_freq = param2;
            }
            else if(param1 == 514)
            {
               this.fx1_parametric_eq_high_mid_q = param2;
            }
            else if(param1 == 515)
            {
               this.fx1_parametric_eq_high_mid_gain = param2;
            }
            else if(param1 == 516)
            {
               this.fx1_parametric_eq_high_gain = param2;
            }
            else if(param1 == 517)
            {
               this.fx1_parametric_eq_high_cut = param2;
            }
            else if(param1 == 518)
            {
               this.fx1_parametric_eq_level = param2;
            }
            else if(param1 == 520)
            {
               this.fx1_tone_modify_type = param2;
            }
            else if(param1 == 521)
            {
               this.fx1_tone_modify_reso = param2;
            }
            else if(param1 == 522)
            {
               this.fx1_tone_modify_low = param2;
            }
            else if(param1 == 523)
            {
               this.fx1_tone_modify_high = param2;
            }
            else if(param1 == 524)
            {
               this.fx1_tone_modify_level = param2;
            }
            else if(param1 == 526)
            {
               this.fx1_guitar_sim_type = param2;
            }
            else if(param1 == 527)
            {
               this.fx1_guitar_sim_low = param2;
            }
            else if(param1 == 528)
            {
               this.fx1_guitar_sim_high = param2;
            }
            else if(param1 == 529)
            {
               this.fx1_guitar_sim_level = param2;
            }
            else if(param1 == 530)
            {
               this.fx1_guitar_sim_body = param2;
            }
            else if(param1 == 532)
            {
               this.fx1_slow_gear_sens = param2;
            }
            else if(param1 == 533)
            {
               this.fx1_slow_gear_rise_time = param2;
            }
            else if(param1 == 534)
            {
               this.fx1_slow_gear_level = param2;
            }
         }
         else if(536 <= param1 && param1 <= 579)
         {
            if(param1 == 536)
            {
               this.fx1_defretter_tone = param2;
            }
            else if(param1 == 537)
            {
               this.fx1_defretter_sens = param2;
            }
            else if(param1 == 538)
            {
               this.fx1_defretter_attack = param2;
            }
            else if(param1 == 539)
            {
               this.fx1_defretter_depth = param2;
            }
            else if(param1 == 540)
            {
               this.fx1_defretter_reso = param2;
            }
            else if(param1 == 541)
            {
               this.fx1_defretter_effect_level = param2;
            }
            else if(param1 == 542)
            {
               this.fx1_defretter_direct_mix = param2;
            }
            else if(param1 == 544)
            {
               this.fx1_wave_synth_wave = param2;
            }
            else if(param1 == 545)
            {
               this.fx1_wave_synth_cutoff = param2;
            }
            else if(param1 == 546)
            {
               this.fx1_wave_synth_reso = param2;
            }
            else if(param1 == 547)
            {
               this.fx1_wave_synth_filter_sens = param2;
            }
            else if(param1 == 548)
            {
               this.fx1_wave_synth_filter_decay = param2;
            }
            else if(param1 == 549)
            {
               this.fx1_wave_synth_filter_depth = param2;
            }
            else if(param1 == 550)
            {
               this.fx1_wave_synth_synth_level = param2;
            }
            else if(param1 == 551)
            {
               this.fx1_wave_synth_direct_mix = param2;
            }
            else if(param1 == 553)
            {
               this.fx1_sitar_sim_tone = param2;
            }
            else if(param1 == 554)
            {
               this.fx1_sitar_sim_sens = param2;
            }
            else if(param1 == 555)
            {
               this.fx1_sitar_sim_depth = param2;
            }
            else if(param1 == 556)
            {
               this.fx1_sitar_sim_reso = param2;
            }
            else if(param1 == 557)
            {
               this.fx1_sitar_sim_buzz = param2;
            }
            else if(param1 == 558)
            {
               this.fx1_sitar_sim_effect_level = param2;
            }
            else if(param1 == 559)
            {
               this.fx1_sitar_sim_direct_mix = param2;
            }
            else if(param1 == 561)
            {
               this.fx1_octave_range = param2;
            }
            else if(param1 == 562)
            {
               this.fx1_octave_level = param2;
            }
            else if(param1 == 563)
            {
               this.fx1_octave_direct_mix = param2;
            }
            else if(param1 == 565)
            {
               this.fx1_pitch_shifter_voice = param2;
            }
            else if(param1 == 566)
            {
               this.fx1_pitch_shifter_ps1mode = param2;
            }
            else if(param1 == 567)
            {
               this.fx1_pitch_shifter_ps1pitch = param2;
            }
            else if(param1 == 568)
            {
               this.fx1_pitch_shifter_ps1fine = param2;
            }
            else if(param1 == 569)
            {
               this.fx1_pitch_shifter_ps1pre_dly_h = param2;
            }
            else if(param1 == 570)
            {
               this.fx1_pitch_shifter_ps1pre_dly_l = param2;
            }
            else if(param1 == 571)
            {
               this.fx1_pitch_shifter_ps1level = param2;
            }
            else if(param1 == 572)
            {
               this.fx1_pitch_shifter_ps2mode = param2;
            }
            else if(param1 == 573)
            {
               this.fx1_pitch_shifter_ps2pitch = param2;
            }
            else if(param1 == 574)
            {
               this.fx1_pitch_shifter_ps2fine = param2;
            }
            else if(param1 == 575)
            {
               this.fx1_pitch_shifter_ps2pre_dly_h = param2;
            }
            else if(param1 == 576)
            {
               this.fx1_pitch_shifter_ps2pre_dly_l = param2;
            }
            else if(param1 == 577)
            {
               this.fx1_pitch_shifter_ps2level = param2;
            }
            else if(param1 == 578)
            {
               this.fx1_pitch_shifter_ps1f_back = param2;
            }
            else if(param1 == 579)
            {
               this.fx1_pitch_shifter_direct_mix = param2;
            }
         }
         else if(581 <= param1 && param1 <= 627)
         {
            if(param1 == 581)
            {
               this.fx1_harmonist_voice = param2;
            }
            else if(param1 == 582)
            {
               this.fx1_harmonist_hr1harm = param2;
            }
            else if(param1 == 583)
            {
               this.fx1_harmonist_hr1pre_dly_h = param2;
            }
            else if(param1 == 584)
            {
               this.fx1_harmonist_hr1pre_dly_l = param2;
            }
            else if(param1 == 585)
            {
               this.fx1_harmonist_hr1level = param2;
            }
            else if(param1 == 586)
            {
               this.fx1_harmonist_hr2harm = param2;
            }
            else if(param1 == 587)
            {
               this.fx1_harmonist_hr2pre_dly_h = param2;
            }
            else if(param1 == 588)
            {
               this.fx1_harmonist_hr2pre_dly_l = param2;
            }
            else if(param1 == 589)
            {
               this.fx1_harmonist_hr2level = param2;
            }
            else if(param1 == 590)
            {
               this.fx1_harmonist_hr1f_back = param2;
            }
            else if(param1 == 591)
            {
               this.fx1_harmonist_direct_mix = param2;
            }
            else if(param1 == 592)
            {
               this.fx1_harmonist_hr1c = param2;
            }
            else if(param1 == 593)
            {
               this.fx1_harmonist_hr1db = param2;
            }
            else if(param1 == 594)
            {
               this.fx1_harmonist_hr1d = param2;
            }
            else if(param1 == 595)
            {
               this.fx1_harmonist_hr1eb = param2;
            }
            else if(param1 == 596)
            {
               this.fx1_harmonist_hr1e = param2;
            }
            else if(param1 == 597)
            {
               this.fx1_harmonist_hr1f = param2;
            }
            else if(param1 == 598)
            {
               this.fx1_harmonist_hr1f_s = param2;
            }
            else if(param1 == 599)
            {
               this.fx1_harmonist_hr1g = param2;
            }
            else if(param1 == 600)
            {
               this.fx1_harmonist_hr1ab = param2;
            }
            else if(param1 == 601)
            {
               this.fx1_harmonist_hr1a = param2;
            }
            else if(param1 == 602)
            {
               this.fx1_harmonist_hr1bb = param2;
            }
            else if(param1 == 603)
            {
               this.fx1_harmonist_hr1b = param2;
            }
            else if(param1 == 604)
            {
               this.fx1_harmonist_hr2c = param2;
            }
            else if(param1 == 605)
            {
               this.fx1_harmonist_hr2db = param2;
            }
            else if(param1 == 606)
            {
               this.fx1_harmonist_hr2d = param2;
            }
            else if(param1 == 607)
            {
               this.fx1_harmonist_hr2eb = param2;
            }
            else if(param1 == 608)
            {
               this.fx1_harmonist_hr2e = param2;
            }
            else if(param1 == 609)
            {
               this.fx1_harmonist_hr2f = param2;
            }
            else if(param1 == 610)
            {
               this.fx1_harmonist_hr2f_s = param2;
            }
            else if(param1 == 611)
            {
               this.fx1_harmonist_hr2g = param2;
            }
            else if(param1 == 612)
            {
               this.fx1_harmonist_hr2ab = param2;
            }
            else if(param1 == 613)
            {
               this.fx1_harmonist_hr2a = param2;
            }
            else if(param1 == 614)
            {
               this.fx1_harmonist_hr2bb = param2;
            }
            else if(param1 == 615)
            {
               this.fx1_harmonist_hr2b = param2;
            }
            else if(param1 == 617)
            {
               this.fx1_sound_hold_hold = param2;
            }
            else if(param1 == 618)
            {
               this.fx1_sound_hold_rise_time = param2;
            }
            else if(param1 == 619)
            {
               this.fx1_sound_hold_effect_level = param2;
            }
            else if(param1 == 621)
            {
               this.fx1_ac_processor_type = param2;
            }
            else if(param1 == 622)
            {
               this.fx1_ac_processor_bass = param2;
            }
            else if(param1 == 623)
            {
               this.fx1_ac_processor_middle = param2;
            }
            else if(param1 == 624)
            {
               this.fx1_ac_processor_middle_freq = param2;
            }
            else if(param1 == 625)
            {
               this.fx1_ac_processor_treble = param2;
            }
            else if(param1 == 626)
            {
               this.fx1_ac_processor_presence = param2;
            }
            else if(param1 == 627)
            {
               this.fx1_ac_processor_level = param2;
            }
         }
         else if(629 <= param1 && param1 <= 803)
         {
            if(param1 == 629)
            {
               this.fx1_phaser_type = param2;
            }
            else if(param1 == 630)
            {
               this.fx1_phaser_rate = param2;
            }
            else if(param1 == 631)
            {
               this.fx1_phaser_depth = param2;
            }
            else if(param1 == 632)
            {
               this.fx1_phaser_manual = param2;
            }
            else if(param1 == 633)
            {
               this.fx1_phaser_reso = param2;
            }
            else if(param1 == 634)
            {
               this.fx1_phaser_step_rate = param2;
            }
            else if(param1 == 635)
            {
               this.fx1_phaser_effect_level = param2;
            }
            else if(param1 == 636)
            {
               this.fx1_phaser_direct_mix = param2;
            }
            else if(param1 == 638)
            {
               this.fx1_flanger_rate = param2;
            }
            else if(param1 == 639)
            {
               this.fx1_flanger_depth = param2;
            }
            else if(param1 == 768)
            {
               this.fx1_flanger_manual = param2;
            }
            else if(param1 == 769)
            {
               this.fx1_flanger_reso = param2;
            }
            else if(param1 == 770)
            {
               this.fx1_flanger_separation = param2;
            }
            else if(param1 == 771)
            {
               this.fx1_flanger_low_cut = param2;
            }
            else if(param1 == 772)
            {
               this.fx1_flanger_effect_level = param2;
            }
            else if(param1 == 773)
            {
               this.fx1_flanger_direct_mix = param2;
            }
            else if(param1 == 775)
            {
               this.fx1_tremolo_wave_shape = param2;
            }
            else if(param1 == 776)
            {
               this.fx1_tremolo_rate = param2;
            }
            else if(param1 == 777)
            {
               this.fx1_tremolo_depth = param2;
            }
            else if(param1 == 778)
            {
               this.fx1_tremolo_level = param2;
            }
            else if(param1 == 780)
            {
               this.fx1_rotary_speed_select = param2;
            }
            else if(param1 == 781)
            {
               this.fx1_rotary_rate_slow = param2;
            }
            else if(param1 == 782)
            {
               this.fx1_rotary_rate_fast = param2;
            }
            else if(param1 == 783)
            {
               this.fx1_rotary_rise_time = param2;
            }
            else if(param1 == 784)
            {
               this.fx1_rotary_fall_time = param2;
            }
            else if(param1 == 785)
            {
               this.fx1_rotary_depth = param2;
            }
            else if(param1 == 786)
            {
               this.fx1_rotary_level = param2;
            }
            else if(param1 == 788)
            {
               this.fx1_uni_v_rate = param2;
            }
            else if(param1 == 789)
            {
               this.fx1_uni_v_depth = param2;
            }
            else if(param1 == 790)
            {
               this.fx1_uni_v_level = param2;
            }
            else if(param1 == 792)
            {
               this.fx1_pan_type = param2;
            }
            else if(param1 == 793)
            {
               this.fx1_pan_pos = param2;
            }
            else if(param1 == 794)
            {
               this.fx1_pan_wave_shape = param2;
            }
            else if(param1 == 795)
            {
               this.fx1_pan_rate = param2;
            }
            else if(param1 == 796)
            {
               this.fx1_pan_depth = param2;
            }
            else if(param1 == 797)
            {
               this.fx1_pan_level = param2;
            }
            else if(param1 == 799)
            {
               this.fx1_slicer_pattern = param2;
            }
            else if(param1 == 800)
            {
               this.fx1_slicer_rate = param2;
            }
            else if(param1 == 801)
            {
               this.fx1_slicer_trigger_sens = param2;
            }
            else if(param1 == 802)
            {
               this.fx1_slicer_effect_level = param2;
            }
            else if(param1 == 803)
            {
               this.fx1_slicer_direct_mix = param2;
            }
         }
         else if(805 <= param1 && param1 <= 842)
         {
            if(param1 == 805)
            {
               this.fx1_vibrato_rate = param2;
            }
            else if(param1 == 806)
            {
               this.fx1_vibrato_depth = param2;
            }
            else if(param1 == 807)
            {
               this.fx1_vibrato_trigger = param2;
            }
            else if(param1 == 808)
            {
               this.fx1_vibrato_rise_time = param2;
            }
            else if(param1 == 809)
            {
               this.fx1_vibrato_level = param2;
            }
            else if(param1 == 811)
            {
               this.fx1_ring_mod_mode = param2;
            }
            else if(param1 == 812)
            {
               this.fx1_ring_mod_freq = param2;
            }
            else if(param1 == 813)
            {
               this.fx1_ring_mod_effect_level = param2;
            }
            else if(param1 == 814)
            {
               this.fx1_ring_mod_direct_mix = param2;
            }
            else if(param1 == 816)
            {
               this.fx1_humanizer_mode = param2;
            }
            else if(param1 == 817)
            {
               this.fx1_humanizer_vowel1 = param2;
            }
            else if(param1 == 818)
            {
               this.fx1_humanizer_vowel2 = param2;
            }
            else if(param1 == 819)
            {
               this.fx1_humanizer_sens = param2;
            }
            else if(param1 == 820)
            {
               this.fx1_humanizer_rate = param2;
            }
            else if(param1 == 821)
            {
               this.fx1_humanizer_depth = param2;
            }
            else if(param1 == 822)
            {
               this.fx1_humanizer_manual = param2;
            }
            else if(param1 == 823)
            {
               this.fx1_humanizer_level = param2;
            }
            else if(param1 == 825)
            {
               this.fx1_2x2_chorus_xover_freq = param2;
            }
            else if(param1 == 826)
            {
               this.fx1_2x2_chorus_low_rate = param2;
            }
            else if(param1 == 827)
            {
               this.fx1_2x2_chorus_low_depth = param2;
            }
            else if(param1 == 828)
            {
               this.fx1_2x2_chorus_low_pre_delay = param2;
            }
            else if(param1 == 829)
            {
               this.fx1_2x2_chorus_low_level = param2;
            }
            else if(param1 == 830)
            {
               this.fx1_2x2_chorus_high_rate = param2;
            }
            else if(param1 == 831)
            {
               this.fx1_2x2_chorus_high_depth = param2;
            }
            else if(param1 == 832)
            {
               this.fx1_2x2_chorus_high_pre_delay = param2;
            }
            else if(param1 == 833)
            {
               this.fx1_2x2_chorus_high_level = param2;
            }
            else if(param1 == 834)
            {
               this.fx1_2x2_chorus_direct_level = param2;
            }
            else if(param1 == 835)
            {
               this.fx1_sub_delay_type = param2;
            }
            else if(param1 == 836)
            {
               this.fx1_sub_delay_time_h = param2;
            }
            else if(param1 == 837)
            {
               this.fx1_sub_delay_time_l = param2;
            }
            else if(param1 == 838)
            {
               this.fx1_sub_delay_f_back = param2;
            }
            else if(param1 == 839)
            {
               this.fx1_sub_delay_high_cut = param2;
            }
            else if(param1 == 840)
            {
               this.fx1_sub_delay_effect_level = param2;
            }
            else if(param1 == 841)
            {
               this.fx1_sub_delay_direct_mix = param2;
            }
            else if(param1 == 842)
            {
               this.fx1_sub_delay_tap_time = param2;
            }
         }
         else if(844 <= param1 && param1 <= 890)
         {
            if(param1 == 844)
            {
               this.fx2_on_off = param2;
            }
            else if(param1 == 845)
            {
               this.fx2_fx_type = param2;
            }
            else if(param1 == 846)
            {
               this.fx2_sub_od_ds_type = param2;
            }
            else if(param1 == 847)
            {
               this.fx2_sub_od_ds_drive = param2;
            }
            else if(param1 == 848)
            {
               this.fx2_sub_od_ds_bottom = param2;
            }
            else if(param1 == 849)
            {
               this.fx2_sub_od_ds_tone = param2;
            }
            else if(param1 == 850)
            {
               this.fx2_sub_od_ds_solo_sw = param2;
            }
            else if(param1 == 851)
            {
               this.fx2_sub_od_ds_solo_level = param2;
            }
            else if(param1 == 852)
            {
               this.fx2_sub_od_ds_effect_level = param2;
            }
            else if(param1 == 853)
            {
               this.fx2_sub_od_ds_direct_mix = param2;
            }
            else if(param1 == 856)
            {
               this.fx2_t_wah_mode = param2;
            }
            else if(param1 == 857)
            {
               this.fx2_t_wah_polar = param2;
            }
            else if(param1 == 858)
            {
               this.fx2_t_wah_sens = param2;
            }
            else if(param1 == 859)
            {
               this.fx2_t_wah_freq = param2;
            }
            else if(param1 == 860)
            {
               this.fx2_t_wah_peak = param2;
            }
            else if(param1 == 861)
            {
               this.fx2_t_wah_direct_mix = param2;
            }
            else if(param1 == 862)
            {
               this.fx2_t_wah_effect_level = param2;
            }
            else if(param1 == 864)
            {
               this.fx2_auto_wah_mode = param2;
            }
            else if(param1 == 865)
            {
               this.fx2_auto_wah_freq = param2;
            }
            else if(param1 == 866)
            {
               this.fx2_auto_wah_peak = param2;
            }
            else if(param1 == 867)
            {
               this.fx2_auto_wah_rate = param2;
            }
            else if(param1 == 868)
            {
               this.fx2_auto_wah_depth = param2;
            }
            else if(param1 == 869)
            {
               this.fx2_auto_wah_direct_mix = param2;
            }
            else if(param1 == 870)
            {
               this.fx2_auto_wah_effect_level = param2;
            }
            else if(param1 == 872)
            {
               this.fx2_sub_wah_type = param2;
            }
            else if(param1 == 873)
            {
               this.fx2_sub_wah_pedal_pos = param2;
            }
            else if(param1 == 874)
            {
               this.fx2_sub_wah_pedal_min = param2;
            }
            else if(param1 == 875)
            {
               this.fx2_sub_wah_pedal_max = param2;
            }
            else if(param1 == 876)
            {
               this.fx2_sub_wah_effect_level = param2;
            }
            else if(param1 == 877)
            {
               this.fx2_sub_wah_direct_mix = param2;
            }
            else if(param1 == 879)
            {
               this.fx2_adv_comp_type = param2;
            }
            else if(param1 == 880)
            {
               this.fx2_adv_comp_sustain = param2;
            }
            else if(param1 == 881)
            {
               this.fx2_adv_comp_attack = param2;
            }
            else if(param1 == 882)
            {
               this.fx2_adv_comp_tone = param2;
            }
            else if(param1 == 883)
            {
               this.fx2_adv_comp_level = param2;
            }
            else if(param1 == 885)
            {
               this.fx2_limiter_type = param2;
            }
            else if(param1 == 886)
            {
               this.fx2_limiter_attack = param2;
            }
            else if(param1 == 887)
            {
               this.fx2_limiter_thresh = param2;
            }
            else if(param1 == 888)
            {
               this.fx2_limiter_ratio = param2;
            }
            else if(param1 == 889)
            {
               this.fx2_limiter_release = param2;
            }
            else if(param1 == 890)
            {
               this.fx2_limiter_level = param2;
            }
         }
         else if(892 <= param1 && param1 <= 1058)
         {
            if(param1 == 892)
            {
               this.fx2_graphic_eq_31hz = param2;
            }
            else if(param1 == 893)
            {
               this.fx2_graphic_eq_62hz = param2;
            }
            else if(param1 == 894)
            {
               this.fx2_graphic_eq_125hz = param2;
            }
            else if(param1 == 895)
            {
               this.fx2_graphic_eq_250hz = param2;
            }
            else if(param1 == 1024)
            {
               this.fx2_graphic_eq_500hz = param2;
            }
            else if(param1 == 1025)
            {
               this.fx2_graphic_eq_1khz = param2;
            }
            else if(param1 == 1026)
            {
               this.fx2_graphic_eq_2khz = param2;
            }
            else if(param1 == 1027)
            {
               this.fx2_graphic_eq_4khz = param2;
            }
            else if(param1 == 1028)
            {
               this.fx2_graphic_eq_8khz = param2;
            }
            else if(param1 == 1029)
            {
               this.fx2_graphic_eq_16khz = param2;
            }
            else if(param1 == 1030)
            {
               this.fx2_graphic_eq_level = param2;
            }
            else if(param1 == 1032)
            {
               this.fx2_parametric_eq_low_cut = param2;
            }
            else if(param1 == 1033)
            {
               this.fx2_parametric_eq_low_gain = param2;
            }
            else if(param1 == 1034)
            {
               this.fx2_parametric_eq_low_mid_freq = param2;
            }
            else if(param1 == 1035)
            {
               this.fx2_parametric_eq_low_mid_q = param2;
            }
            else if(param1 == 1036)
            {
               this.fx2_parametric_eq_low_mid_gain = param2;
            }
            else if(param1 == 1037)
            {
               this.fx2_parametric_eq_high_mid_freq = param2;
            }
            else if(param1 == 1038)
            {
               this.fx2_parametric_eq_high_mid_q = param2;
            }
            else if(param1 == 1039)
            {
               this.fx2_parametric_eq_high_mid_gain = param2;
            }
            else if(param1 == 1040)
            {
               this.fx2_parametric_eq_high_gain = param2;
            }
            else if(param1 == 1041)
            {
               this.fx2_parametric_eq_high_cut = param2;
            }
            else if(param1 == 1042)
            {
               this.fx2_parametric_eq_level = param2;
            }
            else if(param1 == 1044)
            {
               this.fx2_tone_modify_type = param2;
            }
            else if(param1 == 1045)
            {
               this.fx2_tone_modify_reso = param2;
            }
            else if(param1 == 1046)
            {
               this.fx2_tone_modify_low = param2;
            }
            else if(param1 == 1047)
            {
               this.fx2_tone_modify_high = param2;
            }
            else if(param1 == 1048)
            {
               this.fx2_tone_modify_level = param2;
            }
            else if(param1 == 1050)
            {
               this.fx2_guitar_sim_type = param2;
            }
            else if(param1 == 1051)
            {
               this.fx2_guitar_sim_low = param2;
            }
            else if(param1 == 1052)
            {
               this.fx2_guitar_sim_high = param2;
            }
            else if(param1 == 1053)
            {
               this.fx2_guitar_sim_level = param2;
            }
            else if(param1 == 1054)
            {
               this.fx2_guitar_sim_body = param2;
            }
            else if(param1 == 1056)
            {
               this.fx2_slow_gear_sens = param2;
            }
            else if(param1 == 1057)
            {
               this.fx2_slow_gear_rise_time = param2;
            }
            else if(param1 == 1058)
            {
               this.fx2_slow_gear_level = param2;
            }
         }
         else if(1060 <= param1 && param1 <= 1103)
         {
            if(param1 == 1060)
            {
               this.fx2_defretter_tone = param2;
            }
            else if(param1 == 1061)
            {
               this.fx2_defretter_sens = param2;
            }
            else if(param1 == 1062)
            {
               this.fx2_defretter_attack = param2;
            }
            else if(param1 == 1063)
            {
               this.fx2_defretter_depth = param2;
            }
            else if(param1 == 1064)
            {
               this.fx2_defretter_reso = param2;
            }
            else if(param1 == 1065)
            {
               this.fx2_defretter_effect_level = param2;
            }
            else if(param1 == 1066)
            {
               this.fx2_defretter_direct_mix = param2;
            }
            else if(param1 == 1068)
            {
               this.fx2_wave_synth_wave = param2;
            }
            else if(param1 == 1069)
            {
               this.fx2_wave_synth_cutoff = param2;
            }
            else if(param1 == 1070)
            {
               this.fx2_wave_synth_reso = param2;
            }
            else if(param1 == 1071)
            {
               this.fx2_wave_synth_filter_sens = param2;
            }
            else if(param1 == 1072)
            {
               this.fx2_wave_synth_filter_decay = param2;
            }
            else if(param1 == 1073)
            {
               this.fx2_wave_synth_filter_depth = param2;
            }
            else if(param1 == 1074)
            {
               this.fx2_wave_synth_synth_level = param2;
            }
            else if(param1 == 1075)
            {
               this.fx2_wave_synth_direct_mix = param2;
            }
            else if(param1 == 1077)
            {
               this.fx2_sitar_sim_tone = param2;
            }
            else if(param1 == 1078)
            {
               this.fx2_sitar_sim_sens = param2;
            }
            else if(param1 == 1079)
            {
               this.fx2_sitar_sim_depth = param2;
            }
            else if(param1 == 1080)
            {
               this.fx2_sitar_sim_reso = param2;
            }
            else if(param1 == 1081)
            {
               this.fx2_sitar_sim_buzz = param2;
            }
            else if(param1 == 1082)
            {
               this.fx2_sitar_sim_effect_level = param2;
            }
            else if(param1 == 1083)
            {
               this.fx2_sitar_sim_direct_mix = param2;
            }
            else if(param1 == 1085)
            {
               this.fx2_octave_range = param2;
            }
            else if(param1 == 1086)
            {
               this.fx2_octave_level = param2;
            }
            else if(param1 == 1087)
            {
               this.fx2_octave_direct_mix = param2;
            }
            else if(param1 == 1089)
            {
               this.fx2_pitch_shifter_voice = param2;
            }
            else if(param1 == 1090)
            {
               this.fx2_pitch_shifter_ps1mode = param2;
            }
            else if(param1 == 1091)
            {
               this.fx2_pitch_shifter_ps1pitch = param2;
            }
            else if(param1 == 1092)
            {
               this.fx2_pitch_shifter_ps1fine = param2;
            }
            else if(param1 == 1093)
            {
               this.fx2_pitch_shifter_ps1pre_dly_h = param2;
            }
            else if(param1 == 1094)
            {
               this.fx2_pitch_shifter_ps1pre_dly_l = param2;
            }
            else if(param1 == 1095)
            {
               this.fx2_pitch_shifter_ps1level = param2;
            }
            else if(param1 == 1096)
            {
               this.fx2_pitch_shifter_ps2mode = param2;
            }
            else if(param1 == 1097)
            {
               this.fx2_pitch_shifter_ps2pitch = param2;
            }
            else if(param1 == 1098)
            {
               this.fx2_pitch_shifter_ps2fine = param2;
            }
            else if(param1 == 1099)
            {
               this.fx2_pitch_shifter_ps2pre_dly_h = param2;
            }
            else if(param1 == 1100)
            {
               this.fx2_pitch_shifter_ps2pre_dly_l = param2;
            }
            else if(param1 == 1101)
            {
               this.fx2_pitch_shifter_ps2level = param2;
            }
            else if(param1 == 1102)
            {
               this.fx2_pitch_shifter_ps1f_back = param2;
            }
            else if(param1 == 1103)
            {
               this.fx2_pitch_shifter_direct_mix = param2;
            }
         }
         else if(1105 <= param1 && param1 <= 1151)
         {
            if(param1 == 1105)
            {
               this.fx2_harmonist_voice = param2;
            }
            else if(param1 == 1106)
            {
               this.fx2_harmonist_hr1harm = param2;
            }
            else if(param1 == 1107)
            {
               this.fx2_harmonist_hr1pre_dly_h = param2;
            }
            else if(param1 == 1108)
            {
               this.fx2_harmonist_hr1pre_dly_l = param2;
            }
            else if(param1 == 1109)
            {
               this.fx2_harmonist_hr1level = param2;
            }
            else if(param1 == 1110)
            {
               this.fx2_harmonist_hr2harm = param2;
            }
            else if(param1 == 1111)
            {
               this.fx2_harmonist_hr2pre_dly_h = param2;
            }
            else if(param1 == 1112)
            {
               this.fx2_harmonist_hr2pre_dly_l = param2;
            }
            else if(param1 == 1113)
            {
               this.fx2_harmonist_hr2level = param2;
            }
            else if(param1 == 1114)
            {
               this.fx2_harmonist_hr1f_back = param2;
            }
            else if(param1 == 1115)
            {
               this.fx2_harmonist_direct_mix = param2;
            }
            else if(param1 == 1116)
            {
               this.fx2_harmonist_hr1c = param2;
            }
            else if(param1 == 1117)
            {
               this.fx2_harmonist_hr1db = param2;
            }
            else if(param1 == 1118)
            {
               this.fx2_harmonist_hr1d = param2;
            }
            else if(param1 == 1119)
            {
               this.fx2_harmonist_hr1eb = param2;
            }
            else if(param1 == 1120)
            {
               this.fx2_harmonist_hr1e = param2;
            }
            else if(param1 == 1121)
            {
               this.fx2_harmonist_hr1f = param2;
            }
            else if(param1 == 1122)
            {
               this.fx2_harmonist_hr1f_s = param2;
            }
            else if(param1 == 1123)
            {
               this.fx2_harmonist_hr1g = param2;
            }
            else if(param1 == 1124)
            {
               this.fx2_harmonist_hr1ab = param2;
            }
            else if(param1 == 1125)
            {
               this.fx2_harmonist_hr1a = param2;
            }
            else if(param1 == 1126)
            {
               this.fx2_harmonist_hr1bb = param2;
            }
            else if(param1 == 1127)
            {
               this.fx2_harmonist_hr1b = param2;
            }
            else if(param1 == 1128)
            {
               this.fx2_harmonist_hr2c = param2;
            }
            else if(param1 == 1129)
            {
               this.fx2_harmonist_hr2db = param2;
            }
            else if(param1 == 1130)
            {
               this.fx2_harmonist_hr2d = param2;
            }
            else if(param1 == 1131)
            {
               this.fx2_harmonist_hr2eb = param2;
            }
            else if(param1 == 1132)
            {
               this.fx2_harmonist_hr2e = param2;
            }
            else if(param1 == 1133)
            {
               this.fx2_harmonist_hr2f = param2;
            }
            else if(param1 == 1134)
            {
               this.fx2_harmonist_hr2f_s = param2;
            }
            else if(param1 == 1135)
            {
               this.fx2_harmonist_hr2g = param2;
            }
            else if(param1 == 1136)
            {
               this.fx2_harmonist_hr2ab = param2;
            }
            else if(param1 == 1137)
            {
               this.fx2_harmonist_hr2a = param2;
            }
            else if(param1 == 1138)
            {
               this.fx2_harmonist_hr2bb = param2;
            }
            else if(param1 == 1139)
            {
               this.fx2_harmonist_hr2b = param2;
            }
            else if(param1 == 1141)
            {
               this.fx2_sound_hold_hold = param2;
            }
            else if(param1 == 1142)
            {
               this.fx2_sound_hold_rise_time = param2;
            }
            else if(param1 == 1143)
            {
               this.fx2_sound_hold_effect_level = param2;
            }
            else if(param1 == 1145)
            {
               this.fx2_ac_processor_type = param2;
            }
            else if(param1 == 1146)
            {
               this.fx2_ac_processor_bass = param2;
            }
            else if(param1 == 1147)
            {
               this.fx2_ac_processor_middle = param2;
            }
            else if(param1 == 1148)
            {
               this.fx2_ac_processor_middle_freq = param2;
            }
            else if(param1 == 1149)
            {
               this.fx2_ac_processor_treble = param2;
            }
            else if(param1 == 1150)
            {
               this.fx2_ac_processor_presence = param2;
            }
            else if(param1 == 1151)
            {
               this.fx2_ac_processor_level = param2;
            }
         }
         else if(1281 <= param1 && param1 <= 1327)
         {
            if(param1 == 1281)
            {
               this.fx2_phaser_type = param2;
            }
            else if(param1 == 1282)
            {
               this.fx2_phaser_rate = param2;
            }
            else if(param1 == 1283)
            {
               this.fx2_phaser_depth = param2;
            }
            else if(param1 == 1284)
            {
               this.fx2_phaser_manual = param2;
            }
            else if(param1 == 1285)
            {
               this.fx2_phaser_reso = param2;
            }
            else if(param1 == 1286)
            {
               this.fx2_phaser_step_rate = param2;
            }
            else if(param1 == 1287)
            {
               this.fx2_phaser_effect_level = param2;
            }
            else if(param1 == 1288)
            {
               this.fx2_phaser_direct_mix = param2;
            }
            else if(param1 == 1290)
            {
               this.fx2_flanger_rate = param2;
            }
            else if(param1 == 1291)
            {
               this.fx2_flanger_depth = param2;
            }
            else if(param1 == 1292)
            {
               this.fx2_flanger_manual = param2;
            }
            else if(param1 == 1293)
            {
               this.fx2_flanger_reso = param2;
            }
            else if(param1 == 1294)
            {
               this.fx2_flanger_separation = param2;
            }
            else if(param1 == 1295)
            {
               this.fx2_flanger_low_cut = param2;
            }
            else if(param1 == 1296)
            {
               this.fx2_flanger_effect_level = param2;
            }
            else if(param1 == 1297)
            {
               this.fx2_flanger_direct_mix = param2;
            }
            else if(param1 == 1299)
            {
               this.fx2_tremolo_wave_shape = param2;
            }
            else if(param1 == 1300)
            {
               this.fx2_tremolo_rate = param2;
            }
            else if(param1 == 1301)
            {
               this.fx2_tremolo_depth = param2;
            }
            else if(param1 == 1302)
            {
               this.fx2_tremolo_level = param2;
            }
            else if(param1 == 1304)
            {
               this.fx2_rotary_speed_select = param2;
            }
            else if(param1 == 1305)
            {
               this.fx2_rotary_rate_slow = param2;
            }
            else if(param1 == 1306)
            {
               this.fx2_rotary_rate_fast = param2;
            }
            else if(param1 == 1307)
            {
               this.fx2_rotary_rise_time = param2;
            }
            else if(param1 == 1308)
            {
               this.fx2_rotary_fall_time = param2;
            }
            else if(param1 == 1309)
            {
               this.fx2_rotary_depth = param2;
            }
            else if(param1 == 1310)
            {
               this.fx2_rotary_level = param2;
            }
            else if(param1 == 1312)
            {
               this.fx2_uni_v_rate = param2;
            }
            else if(param1 == 1313)
            {
               this.fx2_uni_v_depth = param2;
            }
            else if(param1 == 1314)
            {
               this.fx2_uni_v_level = param2;
            }
            else if(param1 == 1316)
            {
               this.fx2_pan_type = param2;
            }
            else if(param1 == 1317)
            {
               this.fx2_pan_pos = param2;
            }
            else if(param1 == 1318)
            {
               this.fx2_pan_wave_shape = param2;
            }
            else if(param1 == 1319)
            {
               this.fx2_pan_rate = param2;
            }
            else if(param1 == 1320)
            {
               this.fx2_pan_depth = param2;
            }
            else if(param1 == 1321)
            {
               this.fx2_pan_level = param2;
            }
            else if(param1 == 1323)
            {
               this.fx2_slicer_pattern = param2;
            }
            else if(param1 == 1324)
            {
               this.fx2_slicer_rate = param2;
            }
            else if(param1 == 1325)
            {
               this.fx2_slicer_trigger_sens = param2;
            }
            else if(param1 == 1326)
            {
               this.fx2_slicer_effect_level = param2;
            }
            else if(param1 == 1327)
            {
               this.fx2_slicer_direct_mix = param2;
            }
         }
         else if(1329 <= param1 && param1 <= 1366)
         {
            if(param1 == 1329)
            {
               this.fx2_vibrato_rate = param2;
            }
            else if(param1 == 1330)
            {
               this.fx2_vibrato_depth = param2;
            }
            else if(param1 == 1331)
            {
               this.fx2_vibrato_trigger = param2;
            }
            else if(param1 == 1332)
            {
               this.fx2_vibrato_rise_time = param2;
            }
            else if(param1 == 1333)
            {
               this.fx2_vibrato_level = param2;
            }
            else if(param1 == 1335)
            {
               this.fx2_ring_mod_mode = param2;
            }
            else if(param1 == 1336)
            {
               this.fx2_ring_mod_freq = param2;
            }
            else if(param1 == 1337)
            {
               this.fx2_ring_mod_effect_level = param2;
            }
            else if(param1 == 1338)
            {
               this.fx2_ring_mod_direct_mix = param2;
            }
            else if(param1 == 1340)
            {
               this.fx2_humanizer_mode = param2;
            }
            else if(param1 == 1341)
            {
               this.fx2_humanizer_vowel1 = param2;
            }
            else if(param1 == 1342)
            {
               this.fx2_humanizer_vowel2 = param2;
            }
            else if(param1 == 1343)
            {
               this.fx2_humanizer_sens = param2;
            }
            else if(param1 == 1344)
            {
               this.fx2_humanizer_rate = param2;
            }
            else if(param1 == 1345)
            {
               this.fx2_humanizer_depth = param2;
            }
            else if(param1 == 1346)
            {
               this.fx2_humanizer_manual = param2;
            }
            else if(param1 == 1347)
            {
               this.fx2_humanizer_level = param2;
            }
            else if(param1 == 1349)
            {
               this.fx2_2x2_chorus_xover_freq = param2;
            }
            else if(param1 == 1350)
            {
               this.fx2_2x2_chorus_low_rate = param2;
            }
            else if(param1 == 1351)
            {
               this.fx2_2x2_chorus_low_depth = param2;
            }
            else if(param1 == 1352)
            {
               this.fx2_2x2_chorus_low_pre_delay = param2;
            }
            else if(param1 == 1353)
            {
               this.fx2_2x2_chorus_low_level = param2;
            }
            else if(param1 == 1354)
            {
               this.fx2_2x2_chorus_high_rate = param2;
            }
            else if(param1 == 1355)
            {
               this.fx2_2x2_chorus_high_depth = param2;
            }
            else if(param1 == 1356)
            {
               this.fx2_2x2_chorus_high_pre_delay = param2;
            }
            else if(param1 == 1357)
            {
               this.fx2_2x2_chorus_high_level = param2;
            }
            else if(param1 == 1358)
            {
               this.fx2_2x2_chorus_direct_level = param2;
            }
            else if(param1 == 1359)
            {
               this.fx2_sub_delay_type = param2;
            }
            else if(param1 == 1360)
            {
               this.fx2_sub_delay_time_h = param2;
            }
            else if(param1 == 1361)
            {
               this.fx2_sub_delay_time_l = param2;
            }
            else if(param1 == 1362)
            {
               this.fx2_sub_delay_f_back = param2;
            }
            else if(param1 == 1363)
            {
               this.fx2_sub_delay_high_cut = param2;
            }
            else if(param1 == 1364)
            {
               this.fx2_sub_delay_effect_level = param2;
            }
            else if(param1 == 1365)
            {
               this.fx2_sub_delay_direct_mix = param2;
            }
            else if(param1 == 1366)
            {
               this.fx2_sub_delay_tap_time = param2;
            }
         }
         else if(1376 <= param1 && param1 <= 1544)
         {
            if(param1 == 1376)
            {
               this.delay_on_off = param2;
            }
            else if(param1 == 1377)
            {
               this.delay_type = param2;
            }
            else if(param1 == 1378)
            {
               this.delay_delay_time_h = param2;
            }
            else if(param1 == 1379)
            {
               this.delay_delay_time_l = param2;
            }
            else if(param1 == 1380)
            {
               this.delay_f_back = param2;
            }
            else if(param1 == 1381)
            {
               this.delay_high_cut = param2;
            }
            else if(param1 == 1382)
            {
               this.delay_effect_level = param2;
            }
            else if(param1 == 1383)
            {
               this.delay_direct_mix = param2;
            }
            else if(param1 == 1384)
            {
               this.delay_tap_time = param2;
            }
            else if(param1 == 1385)
            {
               this.delay_d1_time_h = param2;
            }
            else if(param1 == 1386)
            {
               this.delay_d1_time_l = param2;
            }
            else if(param1 == 1387)
            {
               this.delay_d1_f_back = param2;
            }
            else if(param1 == 1388)
            {
               this.delay_d1_hi_cut = param2;
            }
            else if(param1 == 1389)
            {
               this.delay_d1_level = param2;
            }
            else if(param1 == 1390)
            {
               this.delay_d2_time_h = param2;
            }
            else if(param1 == 1391)
            {
               this.delay_d2_time_l = param2;
            }
            else if(param1 == 1392)
            {
               this.delay_d2_f_back = param2;
            }
            else if(param1 == 1393)
            {
               this.delay_d2_hi_cut = param2;
            }
            else if(param1 == 1394)
            {
               this.delay_d2_level = param2;
            }
            else if(param1 == 1395)
            {
               this.delay_mod_rate = param2;
            }
            else if(param1 == 1396)
            {
               this.delay_mod_depth = param2;
            }
            else if(param1 == 1536)
            {
               this.chorus_on_off = param2;
            }
            else if(param1 == 1537)
            {
               this.chorus_mode = param2;
            }
            else if(param1 == 1538)
            {
               this.chorus_rate = param2;
            }
            else if(param1 == 1539)
            {
               this.chorus_depth = param2;
            }
            else if(param1 == 1540)
            {
               this.chorus_pre_delay = param2;
            }
            else if(param1 == 1541)
            {
               this.chorus_low_cut = param2;
            }
            else if(param1 == 1542)
            {
               this.chorus_high_cut = param2;
            }
            else if(param1 == 1543)
            {
               this.chorus_effect_level = param2;
            }
            else if(param1 == 1544)
            {
               this.chorus_direct_level = param2;
            }
         }
         else if(1552 <= param1 && param1 <= 1609)
         {
            if(param1 == 1552)
            {
               this.reverb_on_off = param2;
            }
            else if(param1 == 1553)
            {
               this.reverb_type = param2;
            }
            else if(param1 == 1554)
            {
               this.reverb_time = param2;
            }
            else if(param1 == 1555)
            {
               this.reverb_pre_delay_h = param2;
            }
            else if(param1 == 1556)
            {
               this.reverb_pre_delay_l = param2;
            }
            else if(param1 == 1557)
            {
               this.reverb_low_cut = param2;
            }
            else if(param1 == 1558)
            {
               this.reverb_high_cut = param2;
            }
            else if(param1 == 1559)
            {
               this.reverb_density = param2;
            }
            else if(param1 == 1560)
            {
               this.reverb_effect_level = param2;
            }
            else if(param1 == 1561)
            {
               this.reverb_direct_mix = param2;
            }
            else if(param1 == 1562)
            {
               this.reverb_spring_sens = param2;
            }
            else if(param1 == 1568)
            {
               this.pedal_fx_on_off = param2;
            }
            else if(param1 == 1570)
            {
               this.pedal_fx_pedal_bend_pitch = param2;
            }
            else if(param1 == 1571)
            {
               this.pedal_fx_pedal_bend_position = param2;
            }
            else if(param1 == 1572)
            {
               this.pedal_fx_pedal_bend_effect_level = param2;
            }
            else if(param1 == 1573)
            {
               this.pedal_fx_pedal_bend_direct_mix = param2;
            }
            else if(param1 == 1574)
            {
               this.pedal_fx_wah_type = param2;
            }
            else if(param1 == 1575)
            {
               this.pedal_fx_wah_position = param2;
            }
            else if(param1 == 1576)
            {
               this.pedal_fx_wah_pedal_min = param2;
            }
            else if(param1 == 1577)
            {
               this.pedal_fx_wah_pedal_max = param2;
            }
            else if(param1 == 1578)
            {
               this.pedal_fx_wah_effect_level = param2;
            }
            else if(param1 == 1579)
            {
               this.pedal_fx_wah_direct_mix = param2;
            }
            else if(param1 == 1584)
            {
               this.foot_volume_volume_curve = param2;
            }
            else if(param1 == 1585)
            {
               this.foot_volume_volume_min = param2;
            }
            else if(param1 == 1586)
            {
               this.foot_volume_volume_max = param2;
            }
            else if(param1 == 1587)
            {
               this.foot_volume_level = param2;
            }
            else if(param1 == 1600)
            {
               this.divider_mode = param2;
            }
            else if(param1 == 1601)
            {
               this.divider_ch_select = param2;
            }
            else if(param1 == 1602)
            {
               this.divider_ch_a_dynamic = param2;
            }
            else if(param1 == 1603)
            {
               this.divider_ch_a_dynamic_sens = param2;
            }
            else if(param1 == 1604)
            {
               this.divider_ch_a_filter = param2;
            }
            else if(param1 == 1605)
            {
               this.divider_ch_a_cutoff_freq = param2;
            }
            else if(param1 == 1606)
            {
               this.divider_ch_b_dynamic = param2;
            }
            else if(param1 == 1607)
            {
               this.divider_ch_b_dynamic_sens = param2;
            }
            else if(param1 == 1608)
            {
               this.divider_ch_b_filter = param2;
            }
            else if(param1 == 1609)
            {
               this.divider_ch_b_cutoff_freq = param2;
            }
         }
         else if(1616 <= param1 && param1 <= 1643)
         {
            if(param1 == 1616)
            {
               this.mixer_mode = param2;
            }
            else if(param1 == 1617)
            {
               this.mixer_ch_a_b_balance = param2;
            }
            else if(param1 == 1618)
            {
               this.mixer_spread = param2;
            }
            else if(param1 == 1621)
            {
               this.send_return_on_off = param2;
            }
            else if(param1 == 1622)
            {
               this.send_return_mode = param2;
            }
            else if(param1 == 1623)
            {
               this.send_return_send_level = param2;
            }
            else if(param1 == 1624)
            {
               this.send_return_return_level = param2;
            }
            else if(param1 == 1625)
            {
               this.send_return_adjust = param2;
            }
            else if(param1 == 1632)
            {
               this.amp_control = param2;
            }
            else if(param1 == 1635)
            {
               this.ns1_on_off = param2;
            }
            else if(param1 == 1636)
            {
               this.ns1_threshold = param2;
            }
            else if(param1 == 1637)
            {
               this.ns1_release = param2;
            }
            else if(param1 == 1638)
            {
               this.ns1_detect = param2;
            }
            else if(param1 == 1640)
            {
               this.ns2_on_off = param2;
            }
            else if(param1 == 1641)
            {
               this.ns2_threshold = param2;
            }
            else if(param1 == 1642)
            {
               this.ns2_release = param2;
            }
            else if(param1 == 1643)
            {
               this.ns2_detect = param2;
            }
         }
         else if(1648 <= param1 && param1 <= 1818)
         {
            if(param1 == 1648)
            {
               this.accel_fx_type = param2;
            }
            else if(param1 == 1649)
            {
               this.accel_fx_s_bend_pitch = param2;
            }
            else if(param1 == 1650)
            {
               this.accel_fx_s_bend_rise_time = param2;
            }
            else if(param1 == 1651)
            {
               this.accel_fx_s_bend_fall_time = param2;
            }
            else if(param1 == 1652)
            {
               this.accel_fx_laser_beam_rate = param2;
            }
            else if(param1 == 1653)
            {
               this.accel_fx_laser_beam_depth = param2;
            }
            else if(param1 == 1654)
            {
               this.accel_fx_laser_beam_rise_time = param2;
            }
            else if(param1 == 1655)
            {
               this.accel_fx_laser_beam_fall_time = param2;
            }
            else if(param1 == 1656)
            {
               this.accel_fx_ring_mod_freq = param2;
            }
            else if(param1 == 1657)
            {
               this.accel_fx_ring_mod_rise_time = param2;
            }
            else if(param1 == 1658)
            {
               this.accel_fx_ring_mod_fall_time = param2;
            }
            else if(param1 == 1659)
            {
               this.accel_fx_ring_mod_ring_level = param2;
            }
            else if(param1 == 1660)
            {
               this.accel_fx_ring_mod_octave_level = param2;
            }
            else if(param1 == 1661)
            {
               this.accel_fx_ring_mod_direct_mix = param2;
            }
            else if(param1 == 1662)
            {
               this.accel_fx_twist_level = param2;
            }
            else if(param1 == 1663)
            {
               this.accel_fx_twist_rise_time = param2;
            }
            else if(param1 == 1792)
            {
               this.accel_fx_twist_fall_time = param2;
            }
            else if(param1 == 1793)
            {
               this.accel_fx_warp_level = param2;
            }
            else if(param1 == 1794)
            {
               this.accel_fx_warp_rise_time = param2;
            }
            else if(param1 == 1795)
            {
               this.accel_fx_warp_fall_time = param2;
            }
            else if(param1 == 1796)
            {
               this.accel_fx_feedbacker_mode = param2;
            }
            else if(param1 == 1797)
            {
               this.accel_fx_feedbacker_depth = param2;
            }
            else if(param1 == 1798)
            {
               this.accel_fx_feedbacker_rise_time = param2;
            }
            else if(param1 == 1799)
            {
               this.accel_fx_feedbacker_octave_rise_time = param2;
            }
            else if(param1 == 1800)
            {
               this.accel_fx_feedbacker_f_back_level = param2;
            }
            else if(param1 == 1801)
            {
               this.accel_fx_feedbacker_octave_f_back_level = param2;
            }
            else if(param1 == 1802)
            {
               this.accel_fx_feedbacker_vib_rate = param2;
            }
            else if(param1 == 1803)
            {
               this.accel_fx_feedbacker_vib_depth = param2;
            }
            else if(param1 == 1807)
            {
               this.patch_category = param2;
            }
            else if(param1 == 1808)
            {
               this.patch_level = param2;
            }
            else if(param1 == 1809)
            {
               this.master_eq_low_gain = param2;
            }
            else if(param1 == 1810)
            {
               this.master_eq_mid_freq = param2;
            }
            else if(param1 == 1811)
            {
               this.master_eq_mid_q = param2;
            }
            else if(param1 == 1812)
            {
               this.master_eq_mid_gain = param2;
            }
            else if(param1 == 1813)
            {
               this.master_eq_high_gain = param2;
            }
            else if(param1 == 1814)
            {
               this.master_bpm_h = param2;
            }
            else if(param1 == 1815)
            {
               this.master_bpm_l = param2;
            }
            else if(param1 == 1816)
            {
               this.master_key = param2;
            }
            else if(param1 == 1817)
            {
               this.master_beat = param2;
            }
            else if(param1 == 1818)
            {
               this.pitch_detection = param2;
            }
         }
         else if(1824 <= param1 && param1 <= 1863)
         {
            if(param1 == 1824)
            {
               this.fx_chain_position1 = param2;
            }
            else if(param1 == 1825)
            {
               this.fx_chain_position2 = param2;
            }
            else if(param1 == 1826)
            {
               this.fx_chain_position3 = param2;
            }
            else if(param1 == 1827)
            {
               this.fx_chain_position4 = param2;
            }
            else if(param1 == 1828)
            {
               this.fx_chain_position5 = param2;
            }
            else if(param1 == 1829)
            {
               this.fx_chain_position6 = param2;
            }
            else if(param1 == 1830)
            {
               this.fx_chain_position7 = param2;
            }
            else if(param1 == 1831)
            {
               this.fx_chain_position8 = param2;
            }
            else if(param1 == 1832)
            {
               this.fx_chain_position9 = param2;
            }
            else if(param1 == 1833)
            {
               this.fx_chain_position10 = param2;
            }
            else if(param1 == 1834)
            {
               this.fx_chain_position11 = param2;
            }
            else if(param1 == 1835)
            {
               this.fx_chain_position12 = param2;
            }
            else if(param1 == 1836)
            {
               this.fx_chain_position13 = param2;
            }
            else if(param1 == 1837)
            {
               this.fx_chain_position14 = param2;
            }
            else if(param1 == 1838)
            {
               this.fx_chain_position15 = param2;
            }
            else if(param1 == 1839)
            {
               this.fx_chain_position16 = param2;
            }
            else if(param1 == 1840)
            {
               this.fx_chain_position17 = param2;
            }
            else if(param1 == 1841)
            {
               this.fx_chain_position18 = param2;
            }
            else if(param1 == 1842)
            {
               this.fx_chain_position19 = param2;
            }
            else if(param1 == 1843)
            {
               this.fx_chain_position20 = param2;
            }
            else if(param1 == 1856)
            {
               this.manual_mode_bank_down = param2;
            }
            else if(param1 == 1857)
            {
               this.manual_mode_bank_up = param2;
            }
            else if(param1 == 1858)
            {
               this.manual_mode_number_pedal1 = param2;
            }
            else if(param1 == 1859)
            {
               this.manual_mode_number_pedal2 = param2;
            }
            else if(param1 == 1860)
            {
               this.manual_mode_number_pedal3 = param2;
            }
            else if(param1 == 1861)
            {
               this.manual_mode_number_pedal4 = param2;
            }
            else if(param1 == 1862)
            {
               this.manual_mode_phrase_loop = param2;
            }
            else if(param1 == 1863)
            {
               this.manual_mode_accel_ctrl = param2;
            }
         }
         else if(1872 <= param1 && param1 <= 2082)
         {
            if(param1 == 1872)
            {
               this.ctl_exp_accel_ctl_func = param2;
            }
            else if(param1 == 1873)
            {
               this.ctl_exp_accel_ctl_min = param2;
            }
            else if(param1 == 1874)
            {
               this.ctl_exp_accel_ctl_max = param2;
            }
            else if(param1 == 1875)
            {
               this.ctl_exp_accel_ctl_src_mode = param2;
            }
            else if(param1 == 1888)
            {
               this.ctl_exp_exp_sw_func = param2;
            }
            else if(param1 == 1889)
            {
               this.ctl_exp_exp_sw_min = param2;
            }
            else if(param1 == 1890)
            {
               this.ctl_exp_exp_sw_max = param2;
            }
            else if(param1 == 1891)
            {
               this.ctl_exp_exp_sw_src_mode = param2;
            }
            else if(param1 == 1904)
            {
               this.ctl_exp_sub_ctl1_func = param2;
            }
            else if(param1 == 1905)
            {
               this.ctl_exp_sub_ctl1_min = param2;
            }
            else if(param1 == 1906)
            {
               this.ctl_exp_sub_ctl1_max = param2;
            }
            else if(param1 == 1907)
            {
               this.ctl_exp_sub_ctl1_src_mode = param2;
            }
            else if(param1 == 2048)
            {
               this.ctl_exp_sub_ctl2_func = param2;
            }
            else if(param1 == 2049)
            {
               this.ctl_exp_sub_ctl2_min = param2;
            }
            else if(param1 == 2050)
            {
               this.ctl_exp_sub_ctl2_max = param2;
            }
            else if(param1 == 2051)
            {
               this.ctl_exp_sub_ctl2_src_mode = param2;
            }
            else if(param1 == 2064)
            {
               this.ctl_exp_exp_func = param2;
            }
            else if(param1 == 2065)
            {
               this.ctl_exp_exp_patch_level_min = param2;
            }
            else if(param1 == 2066)
            {
               this.ctl_exp_exp_patch_level_max = param2;
            }
            else if(param1 == 2080)
            {
               this.ctl_exp_sub_exp_func = param2;
            }
            else if(param1 == 2081)
            {
               this.ctl_exp_sub_exp_patch_level_min = param2;
            }
            else if(param1 == 2082)
            {
               this.ctl_exp_sub_exp_patch_level_max = param2;
            }
         }
         else if(2096 <= param1 && param1 <= 2143)
         {
            if(param1 == 2096)
            {
               this.assign1_on_off = param2;
            }
            else if(param1 == 2097)
            {
               this.assign1_target_h = param2;
            }
            else if(param1 == 2098)
            {
               this.assign1_target_l = param2;
            }
            else if(param1 == 2099)
            {
               this.assign1_target_min_h = param2;
            }
            else if(param1 == 2100)
            {
               this.assign1_target_min_l = param2;
            }
            else if(param1 == 2101)
            {
               this.assign1_target_max_h = param2;
            }
            else if(param1 == 2102)
            {
               this.assign1_target_max_l = param2;
            }
            else if(param1 == 2103)
            {
               this.assign1_source = param2;
            }
            else if(param1 == 2104)
            {
               this.assign1_source_mode = param2;
            }
            else if(param1 == 2105)
            {
               this.assign1_act_range_lo = param2;
            }
            else if(param1 == 2106)
            {
               this.assign1_act_range_hi = param2;
            }
            else if(param1 == 2107)
            {
               this.assign1_int_pdl_trigger = param2;
            }
            else if(param1 == 2108)
            {
               this.assign1_int_pdl_time = param2;
            }
            else if(param1 == 2109)
            {
               this.assign1_int_pdl_curve = param2;
            }
            else if(param1 == 2110)
            {
               this.assign1_wave_rate = param2;
            }
            else if(param1 == 2111)
            {
               this.assign1_waveform = param2;
            }
            else if(param1 == 2128)
            {
               this.assign2_on_off = param2;
            }
            else if(param1 == 2129)
            {
               this.assign2_target_h = param2;
            }
            else if(param1 == 2130)
            {
               this.assign2_target_l = param2;
            }
            else if(param1 == 2131)
            {
               this.assign2_target_min_h = param2;
            }
            else if(param1 == 2132)
            {
               this.assign2_target_min_l = param2;
            }
            else if(param1 == 2133)
            {
               this.assign2_target_max_h = param2;
            }
            else if(param1 == 2134)
            {
               this.assign2_target_max_l = param2;
            }
            else if(param1 == 2135)
            {
               this.assign2_source = param2;
            }
            else if(param1 == 2136)
            {
               this.assign2_source_mode = param2;
            }
            else if(param1 == 2137)
            {
               this.assign2_act_range_lo = param2;
            }
            else if(param1 == 2138)
            {
               this.assign2_act_range_hi = param2;
            }
            else if(param1 == 2139)
            {
               this.assign2_int_pdl_trigger = param2;
            }
            else if(param1 == 2140)
            {
               this.assign2_int_pdl_time = param2;
            }
            else if(param1 == 2141)
            {
               this.assign2_int_pdl_curve = param2;
            }
            else if(param1 == 2142)
            {
               this.assign2_wave_rate = param2;
            }
            else if(param1 == 2143)
            {
               this.assign2_waveform = param2;
            }
         }
         else if(2160 <= param1 && param1 <= 2335)
         {
            if(param1 == 2160)
            {
               this.assign3_on_off = param2;
            }
            else if(param1 == 2161)
            {
               this.assign3_target_h = param2;
            }
            else if(param1 == 2162)
            {
               this.assign3_target_l = param2;
            }
            else if(param1 == 2163)
            {
               this.assign3_target_min_h = param2;
            }
            else if(param1 == 2164)
            {
               this.assign3_target_min_l = param2;
            }
            else if(param1 == 2165)
            {
               this.assign3_target_max_h = param2;
            }
            else if(param1 == 2166)
            {
               this.assign3_target_max_l = param2;
            }
            else if(param1 == 2167)
            {
               this.assign3_source = param2;
            }
            else if(param1 == 2168)
            {
               this.assign3_source_mode = param2;
            }
            else if(param1 == 2169)
            {
               this.assign3_act_range_lo = param2;
            }
            else if(param1 == 2170)
            {
               this.assign3_act_range_hi = param2;
            }
            else if(param1 == 2171)
            {
               this.assign3_int_pdl_trigger = param2;
            }
            else if(param1 == 2172)
            {
               this.assign3_int_pdl_time = param2;
            }
            else if(param1 == 2173)
            {
               this.assign3_int_pdl_curve = param2;
            }
            else if(param1 == 2174)
            {
               this.assign3_wave_rate = param2;
            }
            else if(param1 == 2175)
            {
               this.assign3_waveform = param2;
            }
            else if(param1 == 2320)
            {
               this.assign4_on_off = param2;
            }
            else if(param1 == 2321)
            {
               this.assign4_target_h = param2;
            }
            else if(param1 == 2322)
            {
               this.assign4_target_l = param2;
            }
            else if(param1 == 2323)
            {
               this.assign4_target_min_h = param2;
            }
            else if(param1 == 2324)
            {
               this.assign4_target_min_l = param2;
            }
            else if(param1 == 2325)
            {
               this.assign4_target_max_h = param2;
            }
            else if(param1 == 2326)
            {
               this.assign4_target_max_l = param2;
            }
            else if(param1 == 2327)
            {
               this.assign4_source = param2;
            }
            else if(param1 == 2328)
            {
               this.assign4_source_mode = param2;
            }
            else if(param1 == 2329)
            {
               this.assign4_act_range_lo = param2;
            }
            else if(param1 == 2330)
            {
               this.assign4_act_range_hi = param2;
            }
            else if(param1 == 2331)
            {
               this.assign4_int_pdl_trigger = param2;
            }
            else if(param1 == 2332)
            {
               this.assign4_int_pdl_time = param2;
            }
            else if(param1 == 2333)
            {
               this.assign4_int_pdl_curve = param2;
            }
            else if(param1 == 2334)
            {
               this.assign4_wave_rate = param2;
            }
            else if(param1 == 2335)
            {
               this.assign4_waveform = param2;
            }
         }
         else if(2352 <= param1 && param1 <= 2399)
         {
            if(param1 == 2352)
            {
               this.assign5_on_off = param2;
            }
            else if(param1 == 2353)
            {
               this.assign5_target_h = param2;
            }
            else if(param1 == 2354)
            {
               this.assign5_target_l = param2;
            }
            else if(param1 == 2355)
            {
               this.assign5_target_min_h = param2;
            }
            else if(param1 == 2356)
            {
               this.assign5_target_min_l = param2;
            }
            else if(param1 == 2357)
            {
               this.assign5_target_max_h = param2;
            }
            else if(param1 == 2358)
            {
               this.assign5_target_max_l = param2;
            }
            else if(param1 == 2359)
            {
               this.assign5_source = param2;
            }
            else if(param1 == 2360)
            {
               this.assign5_source_mode = param2;
            }
            else if(param1 == 2361)
            {
               this.assign5_act_range_lo = param2;
            }
            else if(param1 == 2362)
            {
               this.assign5_act_range_hi = param2;
            }
            else if(param1 == 2363)
            {
               this.assign5_int_pdl_trigger = param2;
            }
            else if(param1 == 2364)
            {
               this.assign5_int_pdl_time = param2;
            }
            else if(param1 == 2365)
            {
               this.assign5_int_pdl_curve = param2;
            }
            else if(param1 == 2366)
            {
               this.assign5_wave_rate = param2;
            }
            else if(param1 == 2367)
            {
               this.assign5_waveform = param2;
            }
            else if(param1 == 2384)
            {
               this.assign6_on_off = param2;
            }
            else if(param1 == 2385)
            {
               this.assign6_target_h = param2;
            }
            else if(param1 == 2386)
            {
               this.assign6_target_l = param2;
            }
            else if(param1 == 2387)
            {
               this.assign6_target_min_h = param2;
            }
            else if(param1 == 2388)
            {
               this.assign6_target_min_l = param2;
            }
            else if(param1 == 2389)
            {
               this.assign6_target_max_h = param2;
            }
            else if(param1 == 2390)
            {
               this.assign6_target_max_l = param2;
            }
            else if(param1 == 2391)
            {
               this.assign6_source = param2;
            }
            else if(param1 == 2392)
            {
               this.assign6_source_mode = param2;
            }
            else if(param1 == 2393)
            {
               this.assign6_act_range_lo = param2;
            }
            else if(param1 == 2394)
            {
               this.assign6_act_range_hi = param2;
            }
            else if(param1 == 2395)
            {
               this.assign6_int_pdl_trigger = param2;
            }
            else if(param1 == 2396)
            {
               this.assign6_int_pdl_time = param2;
            }
            else if(param1 == 2397)
            {
               this.assign6_int_pdl_curve = param2;
            }
            else if(param1 == 2398)
            {
               this.assign6_wave_rate = param2;
            }
            else if(param1 == 2399)
            {
               this.assign6_waveform = param2;
            }
         }
         else if(2416 <= param1 && param1 <= 2591)
         {
            if(param1 == 2416)
            {
               this.assign7_on_off = param2;
            }
            else if(param1 == 2417)
            {
               this.assign7_target_h = param2;
            }
            else if(param1 == 2418)
            {
               this.assign7_target_l = param2;
            }
            else if(param1 == 2419)
            {
               this.assign7_target_min_h = param2;
            }
            else if(param1 == 2420)
            {
               this.assign7_target_min_l = param2;
            }
            else if(param1 == 2421)
            {
               this.assign7_target_max_h = param2;
            }
            else if(param1 == 2422)
            {
               this.assign7_target_max_l = param2;
            }
            else if(param1 == 2423)
            {
               this.assign7_source = param2;
            }
            else if(param1 == 2424)
            {
               this.assign7_source_mode = param2;
            }
            else if(param1 == 2425)
            {
               this.assign7_act_range_lo = param2;
            }
            else if(param1 == 2426)
            {
               this.assign7_act_range_hi = param2;
            }
            else if(param1 == 2427)
            {
               this.assign7_int_pdl_trigger = param2;
            }
            else if(param1 == 2428)
            {
               this.assign7_int_pdl_time = param2;
            }
            else if(param1 == 2429)
            {
               this.assign7_int_pdl_curve = param2;
            }
            else if(param1 == 2430)
            {
               this.assign7_wave_rate = param2;
            }
            else if(param1 == 2431)
            {
               this.assign7_waveform = param2;
            }
            else if(param1 == 2576)
            {
               this.assign8_on_off = param2;
            }
            else if(param1 == 2577)
            {
               this.assign8_target_h = param2;
            }
            else if(param1 == 2578)
            {
               this.assign8_target_l = param2;
            }
            else if(param1 == 2579)
            {
               this.assign8_target_min_h = param2;
            }
            else if(param1 == 2580)
            {
               this.assign8_target_min_l = param2;
            }
            else if(param1 == 2581)
            {
               this.assign8_target_max_h = param2;
            }
            else if(param1 == 2582)
            {
               this.assign8_target_max_l = param2;
            }
            else if(param1 == 2583)
            {
               this.assign8_source = param2;
            }
            else if(param1 == 2584)
            {
               this.assign8_source_mode = param2;
            }
            else if(param1 == 2585)
            {
               this.assign8_act_range_lo = param2;
            }
            else if(param1 == 2586)
            {
               this.assign8_act_range_hi = param2;
            }
            else if(param1 == 2587)
            {
               this.assign8_int_pdl_trigger = param2;
            }
            else if(param1 == 2588)
            {
               this.assign8_int_pdl_time = param2;
            }
            else if(param1 == 2589)
            {
               this.assign8_int_pdl_curve = param2;
            }
            else if(param1 == 2590)
            {
               this.assign8_wave_rate = param2;
            }
            else if(param1 == 2591)
            {
               this.assign8_waveform = param2;
            }
         }
         else if(2608 <= param1 && param1 <= 4155)
         {
            if(param1 == 2608)
            {
               this.assign_common_input_sens = param2;
            }
            else if(param1 == 2624)
            {
               this.comp_name0 = param2;
            }
            else if(param1 == 2625)
            {
               this.comp_name1 = param2;
            }
            else if(param1 == 2626)
            {
               this.comp_name2 = param2;
            }
            else if(param1 == 2627)
            {
               this.comp_name3 = param2;
            }
            else if(param1 == 2628)
            {
               this.comp_name4 = param2;
            }
            else if(param1 == 2629)
            {
               this.comp_name5 = param2;
            }
            else if(param1 == 2630)
            {
               this.comp_name6 = param2;
            }
            else if(param1 == 2631)
            {
               this.comp_name7 = param2;
            }
            else if(param1 == 2632)
            {
               this.comp_name8 = param2;
            }
            else if(param1 == 2633)
            {
               this.comp_name9 = param2;
            }
            else if(param1 == 2634)
            {
               this.comp_name10 = param2;
            }
            else if(param1 == 2635)
            {
               this.comp_name11 = param2;
            }
            else if(param1 == 4112)
            {
               this.fx1_acsim_high = param2;
            }
            else if(param1 == 4113)
            {
               this.fx1_acsim_body = param2;
            }
            else if(param1 == 4114)
            {
               this.fx1_acsim_low = param2;
            }
            else if(param1 == 4116)
            {
               this.fx1_acsim_level = param2;
            }
            else if(param1 == 4118)
            {
               this.fx1_rotary2_balance = param2;
            }
            else if(param1 == 4119)
            {
               this.fx1_rotary2_speed_sel = param2;
            }
            else if(param1 == 4120)
            {
               this.fx1_rotary2_rate_slow = param2;
            }
            else if(param1 == 4121)
            {
               this.fx1_rotary2_rate_fast = param2;
            }
            else if(param1 == 4122)
            {
               this.fx1_rotary2_risetime = param2;
            }
            else if(param1 == 4123)
            {
               this.fx1_rotary2_falltime = param2;
            }
            else if(param1 == 4124)
            {
               this.fx1_rotary2_depth = param2;
            }
            else if(param1 == 4125)
            {
               this.fx1_rotary2_level = param2;
            }
            else if(param1 == 4126)
            {
               this.fx1_rotary2_direct_mix = param2;
            }
            else if(param1 == 4127)
            {
               this.fx2_acsim_high = param2;
            }
            else if(param1 == 4128)
            {
               this.fx2_acsim_body = param2;
            }
            else if(param1 == 4129)
            {
               this.fx2_acsim_low = param2;
            }
            else if(param1 == 4131)
            {
               this.fx2_acsim_level = param2;
            }
            else if(param1 == 4133)
            {
               this.fx2_rotary2_balance = param2;
            }
            else if(param1 == 4134)
            {
               this.fx2_rotary2_speed_sel = param2;
            }
            else if(param1 == 4135)
            {
               this.fx2_rotary2_rate_slow = param2;
            }
            else if(param1 == 4136)
            {
               this.fx2_rotary2_rate_fast = param2;
            }
            else if(param1 == 4137)
            {
               this.fx2_rotary2_risetime = param2;
            }
            else if(param1 == 4138)
            {
               this.fx2_rotary2_falltime = param2;
            }
            else if(param1 == 4139)
            {
               this.fx2_rotary2_depth = param2;
            }
            else if(param1 == 4140)
            {
               this.fx2_rotary2_level = param2;
            }
            else if(param1 == 4141)
            {
               this.fx2_rotary2_direct_mix = param2;
            }
            else if(param1 == 4143)
            {
               this.prm_fx2_teraecho_mode = param2;
            }
            else if(param1 == 4144)
            {
               this.prm_fx2_teraecho_time = param2;
            }
            else if(param1 == 4145)
            {
               this.prm_fx2_teraecho_feedback = param2;
            }
            else if(param1 == 4146)
            {
               this.prm_fx2_teraecho_tone = param2;
            }
            else if(param1 == 4147)
            {
               this.prm_fx2_teraecho_effect_level = param2;
            }
            else if(param1 == 4148)
            {
               this.prm_fx2_teraecho_direct_mix = param2;
            }
            else if(param1 == 4149)
            {
               this.prm_fx2_teraecho_hold = param2;
            }
            else if(param1 == 4151)
            {
               this.prm_fx2_overtone_detune = param2;
            }
            else if(param1 == 4152)
            {
               this.prm_fx2_overtone_tone = param2;
            }
            else if(param1 == 4153)
            {
               this.prm_fx2_overtone_upper_level = param2;
            }
            else if(param1 == 4154)
            {
               this.prm_fx2_overtone_lower_level = param2;
            }
            else if(param1 == 4155)
            {
               this.prm_fx2_overtone_direct_level = param2;
            }
         }
         else if(4157 <= param1 && param1 <= 4199)
         {
            if(param1 == 4157)
            {
               this.fx1_phaser90e_script = param2;
            }
            else if(param1 == 4158)
            {
               this.fx1_phaser90e_speed = param2;
            }
            else if(param1 == 4159)
            {
               this.fx1_flanger117e_manual = param2;
            }
            else if(param1 == 4160)
            {
               this.fx1_flanger117e_width = param2;
            }
            else if(param1 == 4161)
            {
               this.fx1_flanger117e_speed = param2;
            }
            else if(param1 == 4162)
            {
               this.fx1_flanger117e_regen = param2;
            }
            else if(param1 == 4163)
            {
               this.fx2_phaser90e_script = param2;
            }
            else if(param1 == 4164)
            {
               this.fx2_phaser90e_speed = param2;
            }
            else if(param1 == 4165)
            {
               this.fx2_flanger117e_manual = param2;
            }
            else if(param1 == 4166)
            {
               this.fx2_flanger117e_width = param2;
            }
            else if(param1 == 4167)
            {
               this.fx2_flanger117e_speed = param2;
            }
            else if(param1 == 4168)
            {
               this.fx2_flanger117e_regen = param2;
            }
            else if(param1 == 4169)
            {
               this.delay_vtg_lpf = param2;
            }
            else if(param1 == 4170)
            {
               this.delay_vtg_filter = param2;
            }
            else if(param1 == 4171)
            {
               this.delay_vtg_feedback_phase = param2;
            }
            else if(param1 == 4172)
            {
               this.delay_vtg_effect_phase = param2;
            }
            else if(param1 == 4173)
            {
               this.delay_vtg_mod_sw = param2;
            }
            else if(param1 == 4174)
            {
               this.delay2_on_off = param2;
            }
            else if(param1 == 4175)
            {
               this.delay2_type = param2;
            }
            else if(param1 == 4176)
            {
               this.delay2_delay_time_h = param2;
            }
            else if(param1 == 4177)
            {
               this.delay2_delay_time_l = param2;
            }
            else if(param1 == 4178)
            {
               this.delay2_f_back = param2;
            }
            else if(param1 == 4179)
            {
               this.delay2_high_cut = param2;
            }
            else if(param1 == 4180)
            {
               this.delay2_effect_level = param2;
            }
            else if(param1 == 4181)
            {
               this.delay2_direct_mix = param2;
            }
            else if(param1 == 4182)
            {
               this.delay2_tap_time = param2;
            }
            else if(param1 == 4183)
            {
               this.delay2_d1_time_h = param2;
            }
            else if(param1 == 4184)
            {
               this.delay2_d1_time_l = param2;
            }
            else if(param1 == 4185)
            {
               this.delay2_d1_f_back = param2;
            }
            else if(param1 == 4186)
            {
               this.delay2_d1_hi_cut = param2;
            }
            else if(param1 == 4187)
            {
               this.delay2_d1_level = param2;
            }
            else if(param1 == 4188)
            {
               this.delay2_d2_time_h = param2;
            }
            else if(param1 == 4189)
            {
               this.delay2_d2_time_l = param2;
            }
            else if(param1 == 4190)
            {
               this.delay2_d2_f_back = param2;
            }
            else if(param1 == 4191)
            {
               this.delay2_d2_hi_cut = param2;
            }
            else if(param1 == 4192)
            {
               this.delay2_d2_level = param2;
            }
            else if(param1 == 4193)
            {
               this.delay2_mod_rate = param2;
            }
            else if(param1 == 4194)
            {
               this.delay2_mod_depth = param2;
            }
            else if(param1 == 4195)
            {
               this.delay2_vtg_lpf = param2;
            }
            else if(param1 == 4196)
            {
               this.delay2_vtg_filter = param2;
            }
            else if(param1 == 4197)
            {
               this.delay2_vtg_feedback_phase = param2;
            }
            else if(param1 == 4198)
            {
               this.delay2_vtg_effect_phase = param2;
            }
            else if(param1 == 4199)
            {
               this.delay2_vtg_mod_sw = param2;
            }
         }
         else if(4200 <= param1 && param1 <= 4380)
         {
            if(param1 == 4200)
            {
               this.fx1_wah95e_pedal_pos = param2;
            }
            else if(param1 == 4201)
            {
               this.fx1_wah95e_pedal_min = param2;
            }
            else if(param1 == 4202)
            {
               this.fx1_wah95e_pedal_max = param2;
            }
            else if(param1 == 4203)
            {
               this.fx1_wah95e_effect_level = param2;
            }
            else if(param1 == 4204)
            {
               this.fx1_wah95e_direct_mix = param2;
            }
            else if(param1 == 4205)
            {
               this.fx1_dc30_selector = param2;
            }
            else if(param1 == 4206)
            {
               this.fx1_dc30_input_volume = param2;
            }
            else if(param1 == 4207)
            {
               this.fx1_dc30_chorus_intensity = param2;
            }
            else if(param1 == 4208)
            {
               this.fx1_dc30_echo_repeat_rate_h = param2;
            }
            else if(param1 == 4209)
            {
               this.fx1_dc30_echo_repeat_rate_l = param2;
            }
            else if(param1 == 4210)
            {
               this.fx1_dc30_echo_intensity = param2;
            }
            else if(param1 == 4211)
            {
               this.fx1_dc30_echo_volume = param2;
            }
            else if(param1 == 4212)
            {
               this.fx1_dc30_tone = param2;
            }
            else if(param1 == 4213)
            {
               this.fx1_dc30_output = param2;
            }
            else if(param1 == 4214)
            {
               this.fx2_wah95e_pedal_pos = param2;
            }
            else if(param1 == 4215)
            {
               this.fx2_wah95e_pedal_min = param2;
            }
            else if(param1 == 4216)
            {
               this.fx2_wah95e_pedal_max = param2;
            }
            else if(param1 == 4217)
            {
               this.fx2_wah95e_effect_level = param2;
            }
            else if(param1 == 4218)
            {
               this.fx2_wah95e_direct_mix = param2;
            }
            else if(param1 == 4219)
            {
               this.fx2_dc30_selector = param2;
            }
            else if(param1 == 4220)
            {
               this.fx2_dc30_input_volume = param2;
            }
            else if(param1 == 4221)
            {
               this.fx2_dc30_chorus_intensity = param2;
            }
            else if(param1 == 4222)
            {
               this.fx2_dc30_echo_repeat_rate_h = param2;
            }
            else if(param1 == 4223)
            {
               this.fx2_dc30_echo_repeat_rate_l = param2;
            }
            else if(param1 == 4352)
            {
               this.fx2_dc30_echo_intensity = param2;
            }
            else if(param1 == 4353)
            {
               this.fx2_dc30_echo_volume = param2;
            }
            else if(param1 == 4354)
            {
               this.fx2_dc30_tone = param2;
            }
            else if(param1 == 4355)
            {
               this.fx2_dc30_output = param2;
            }
            else if(param1 == 4356)
            {
               this.eq_type = param2;
            }
            else if(param1 == 4357)
            {
               this.eq_geq_31hz = param2;
            }
            else if(param1 == 4358)
            {
               this.eq_geq_62hz = param2;
            }
            else if(param1 == 4359)
            {
               this.eq_geq_125hz = param2;
            }
            else if(param1 == 4360)
            {
               this.eq_geq_250hz = param2;
            }
            else if(param1 == 4361)
            {
               this.eq_geq_500hz = param2;
            }
            else if(param1 == 4362)
            {
               this.eq_geq_1khz = param2;
            }
            else if(param1 == 4363)
            {
               this.eq_geq_2khz = param2;
            }
            else if(param1 == 4364)
            {
               this.eq_geq_4khz = param2;
            }
            else if(param1 == 4365)
            {
               this.eq_geq_8khz = param2;
            }
            else if(param1 == 4366)
            {
               this.eq_geq_16khz = param2;
            }
            else if(param1 == 4367)
            {
               this.eq_geq_level = param2;
            }
            else if(param1 == 4368)
            {
               this.pedal_fx_position = param2;
            }
            else if(param1 == 4369)
            {
               this.pedal_fx_type = param2;
            }
            else if(param1 == 4370)
            {
               this.pedal_fx_evh95_position = param2;
            }
            else if(param1 == 4371)
            {
               this.pedal_fx_evh95_pedal_min = param2;
            }
            else if(param1 == 4372)
            {
               this.pedal_fx_evh95_pedal_max = param2;
            }
            else if(param1 == 4373)
            {
               this.pedal_fx_evh95_effect_level = param2;
            }
            else if(param1 == 4374)
            {
               this.pedal_fx_evh95_direct_mix = param2;
            }
            else if(param1 == 4375)
            {
               this.fx1_heavy_oct_1oct_level = param2;
            }
            else if(param1 == 4376)
            {
               this.fx1_heavy_oct_2oct_level = param2;
            }
            else if(param1 == 4377)
            {
               this.fx1_heavy_oct_direct_mix = param2;
            }
            else if(param1 == 4378)
            {
               this.fx2_heavy_oct_1oct_level = param2;
            }
            else if(param1 == 4379)
            {
               this.fx2_heavy_oct_2oct_level = param2;
            }
            else if(param1 == 4380)
            {
               this.fx2_heavy_oct_direct_mix = param2;
            }
         }
         else if(4608 <= param1 && param1 <= 4641)
         {
            if(param1 == 4608)
            {
               this.chain_ptn = param2;
            }
            else if(param1 == 4609)
            {
               this.fxbox_asgn_fx1a_g = param2;
            }
            else if(param1 == 4610)
            {
               this.fxbox_asgn_fx1a_r = param2;
            }
            else if(param1 == 4611)
            {
               this.fxbox_asgn_fx1a_y = param2;
            }
            else if(param1 == 4612)
            {
               this.fxbox_asgn_fx1b_g = param2;
            }
            else if(param1 == 4613)
            {
               this.fxbox_asgn_fx1b_r = param2;
            }
            else if(param1 == 4614)
            {
               this.fxbox_asgn_fx1b_y = param2;
            }
            else if(param1 == 4615)
            {
               this.fxbox_asgn_fx2a_g = param2;
            }
            else if(param1 == 4616)
            {
               this.fxbox_asgn_fx2a_r = param2;
            }
            else if(param1 == 4617)
            {
               this.fxbox_asgn_fx2a_y = param2;
            }
            else if(param1 == 4618)
            {
               this.fxbox_asgn_fx2b_g = param2;
            }
            else if(param1 == 4619)
            {
               this.fxbox_asgn_fx2b_r = param2;
            }
            else if(param1 == 4620)
            {
               this.fxbox_asgn_fx2b_y = param2;
            }
            else if(param1 == 4621)
            {
               this.fxbox_asgn_fx3_g = param2;
            }
            else if(param1 == 4622)
            {
               this.fxbox_asgn_fx3_r = param2;
            }
            else if(param1 == 4623)
            {
               this.fxbox_asgn_fx3_y = param2;
            }
            else if(param1 == 4624)
            {
               this.fxbox_sel_fx1a = param2;
            }
            else if(param1 == 4625)
            {
               this.fxbox_sel_fx1b = param2;
            }
            else if(param1 == 4626)
            {
               this.fxbox_sel_fx2a = param2;
            }
            else if(param1 == 4627)
            {
               this.fxbox_sel_fx2b = param2;
            }
            else if(param1 == 4628)
            {
               this.fxbox_sel_fx3 = param2;
            }
            else if(param1 == 4629)
            {
               this.fx_active_ab_fx1 = param2;
            }
            else if(param1 == 4630)
            {
               this.fx_active_ab_fx2 = param2;
            }
            else if(param1 == 4631)
            {
               this.send_return_position = param2;
            }
            else if(param1 == 4632)
            {
               this.eq_position = param2;
            }
            else if(param1 == 4633)
            {
               this.fxbox_asgn_fx3b_g = param2;
            }
            else if(param1 == 4634)
            {
               this.fxbox_asgn_fx3b_r = param2;
            }
            else if(param1 == 4635)
            {
               this.fxbox_asgn_fx3b_y = param2;
            }
            else if(param1 == 4636)
            {
               this.fxbox_layer_fx3_g = param2;
            }
            else if(param1 == 4637)
            {
               this.fxbox_layer_fx3_r = param2;
            }
            else if(param1 == 4638)
            {
               this.fxbox_layer_fx3_y = param2;
            }
            else if(param1 == 4639)
            {
               this.pedal_function_exp_pedal = param2;
            }
            else if(param1 == 4640)
            {
               this.pedal_function_gafc_exp1 = param2;
            }
            else if(param1 == 4641)
            {
               this.pedal_function_gafc_exp2 = param2;
            }
         }
         else if(4656 <= param1 && param1 <= 4688)
         {
            if(param1 == 4656)
            {
               this.knob_assign_booster = param2;
            }
            else if(param1 == 4657)
            {
               this.knob_assign_delay = param2;
            }
            else if(param1 == 4658)
            {
               this.knob_assign_reverb = param2;
            }
            else if(param1 == 4659)
            {
               this.knob_assign_chorus = param2;
            }
            else if(param1 == 4660)
            {
               this.knob_assign_flanger = param2;
            }
            else if(param1 == 4661)
            {
               this.knob_assign_phaser = param2;
            }
            else if(param1 == 4662)
            {
               this.knob_assign_uni_v = param2;
            }
            else if(param1 == 4663)
            {
               this.knob_assign_tremolo = param2;
            }
            else if(param1 == 4664)
            {
               this.knob_assign_vibrato = param2;
            }
            else if(param1 == 4665)
            {
               this.knob_assign_rotary = param2;
            }
            else if(param1 == 4666)
            {
               this.knob_assign_ring_mod = param2;
            }
            else if(param1 == 4667)
            {
               this.knob_assign_slow_gear = param2;
            }
            else if(param1 == 4668)
            {
               this.knob_assign_slicer = param2;
            }
            else if(param1 == 4669)
            {
               this.knob_assign_comp = param2;
            }
            else if(param1 == 4670)
            {
               this.knob_assign_limiter = param2;
            }
            else if(param1 == 4671)
            {
               this.knob_assign_t_wah = param2;
            }
            else if(param1 == 4672)
            {
               this.knob_assign_auto_wah = param2;
            }
            else if(param1 == 4673)
            {
               this.knob_assign_pedal_wah = param2;
            }
            else if(param1 == 4674)
            {
               this.knob_assign_geq = param2;
            }
            else if(param1 == 4675)
            {
               this.knob_assign_peq = param2;
            }
            else if(param1 == 4676)
            {
               this.knob_assign_guitar_sim = param2;
            }
            else if(param1 == 4677)
            {
               this.knob_assign_ac_guitar_sim = param2;
            }
            else if(param1 == 4678)
            {
               this.knob_assign_ac_processor = param2;
            }
            else if(param1 == 4679)
            {
               this.knob_assign_wave_synth = param2;
            }
            else if(param1 == 4680)
            {
               this.knob_assign_octave = param2;
            }
            else if(param1 == 4681)
            {
               this.knob_assign_pitch_shifter = param2;
            }
            else if(param1 == 4682)
            {
               this.knob_assign_harmonist = param2;
            }
            else if(param1 == 4683)
            {
               this.knob_assign_humanizer = param2;
            }
            else if(param1 == 4684)
            {
               this.knob_assign_evh_phaser = param2;
            }
            else if(param1 == 4685)
            {
               this.knob_assign_evh_flanger = param2;
            }
            else if(param1 == 4686)
            {
               this.knob_assign_evh_wah = param2;
            }
            else if(param1 == 4687)
            {
               this.knob_assign_dc30 = param2;
            }
            else if(param1 == 4688)
            {
               this.knob_assign_heavy_oct = param2;
            }
         }
         else if(4864 <= param1 && param1 <= 4895)
         {
            if(param1 == 4864)
            {
               this.exp_pedal_assign_booster = param2;
            }
            else if(param1 == 4865)
            {
               this.exp_pedal_assign_delay = param2;
            }
            else if(param1 == 4866)
            {
               this.exp_pedal_assign_reverb = param2;
            }
            else if(param1 == 4867)
            {
               this.exp_pedal_assign_chorus = param2;
            }
            else if(param1 == 4868)
            {
               this.exp_pedal_assign_flanger = param2;
            }
            else if(param1 == 4869)
            {
               this.exp_pedal_assign_phaser = param2;
            }
            else if(param1 == 4870)
            {
               this.exp_pedal_assign_uni_v = param2;
            }
            else if(param1 == 4871)
            {
               this.exp_pedal_assign_tremolo = param2;
            }
            else if(param1 == 4872)
            {
               this.exp_pedal_assign_vibrato = param2;
            }
            else if(param1 == 4873)
            {
               this.exp_pedal_assign_rotary = param2;
            }
            else if(param1 == 4874)
            {
               this.exp_pedal_assign_ring_mod = param2;
            }
            else if(param1 == 4875)
            {
               this.exp_pedal_assign_slow_gear = param2;
            }
            else if(param1 == 4876)
            {
               this.exp_pedal_assign_slicer = param2;
            }
            else if(param1 == 4877)
            {
               this.exp_pedal_assign_comp = param2;
            }
            else if(param1 == 4878)
            {
               this.exp_pedal_assign_limiter = param2;
            }
            else if(param1 == 4879)
            {
               this.exp_pedal_assign_t_wah = param2;
            }
            else if(param1 == 4880)
            {
               this.exp_pedal_assign_auto_wah = param2;
            }
            else if(param1 == 4881)
            {
               this.exp_pedal_assign_pedal_wah = param2;
            }
            else if(param1 == 4882)
            {
               this.exp_pedal_assign_geq = param2;
            }
            else if(param1 == 4883)
            {
               this.exp_pedal_assign_peq = param2;
            }
            else if(param1 == 4884)
            {
               this.exp_pedal_assign_guitar_sim = param2;
            }
            else if(param1 == 4885)
            {
               this.exp_pedal_assign_ac_guitar_sim = param2;
            }
            else if(param1 == 4886)
            {
               this.exp_pedal_assign_ac_processor = param2;
            }
            else if(param1 == 4887)
            {
               this.exp_pedal_assign_wave_synth = param2;
            }
            else if(param1 == 4888)
            {
               this.exp_pedal_assign_octave = param2;
            }
            else if(param1 == 4889)
            {
               this.exp_pedal_assign_pitch_shifter = param2;
            }
            else if(param1 == 4890)
            {
               this.exp_pedal_assign_harmonist = param2;
            }
            else if(param1 == 4891)
            {
               this.exp_pedal_assign_humanizer = param2;
            }
            else if(param1 == 4892)
            {
               this.exp_pedal_assign_evh_phaser = param2;
            }
            else if(param1 == 4893)
            {
               this.exp_pedal_assign_evh_flanger = param2;
            }
            else if(param1 == 4894)
            {
               this.exp_pedal_assign_evh_wah = param2;
            }
            else if(param1 == 4895)
            {
               this.exp_pedal_assign_dc30 = param2;
            }
         }
         else if(4896 <= param1 && param1 <= 4972)
         {
            if(param1 == 4896)
            {
               this.exp_pedal_assign_booster_min = param2;
            }
            else if(param1 == 4897)
            {
               this.exp_pedal_assign_booster_max = param2;
            }
            else if(param1 == 4898)
            {
               this.exp_pedal_assign_delay_min_h = param2;
            }
            else if(param1 == 4899)
            {
               this.exp_pedal_assign_delay_min_l = param2;
            }
            else if(param1 == 4900)
            {
               this.exp_pedal_assign_delay_max_h = param2;
            }
            else if(param1 == 4901)
            {
               this.exp_pedal_assign_delay_max_l = param2;
            }
            else if(param1 == 4902)
            {
               this.exp_pedal_assign_reverb_min_h = param2;
            }
            else if(param1 == 4903)
            {
               this.exp_pedal_assign_reverb_min_l = param2;
            }
            else if(param1 == 4904)
            {
               this.exp_pedal_assign_reverb_max_h = param2;
            }
            else if(param1 == 4905)
            {
               this.exp_pedal_assign_reverb_max_l = param2;
            }
            else if(param1 == 4906)
            {
               this.exp_pedal_assign_chorus_min = param2;
            }
            else if(param1 == 4907)
            {
               this.exp_pedal_assign_chorus_max = param2;
            }
            else if(param1 == 4908)
            {
               this.exp_pedal_assign_flanger_min = param2;
            }
            else if(param1 == 4909)
            {
               this.exp_pedal_assign_flanger_max = param2;
            }
            else if(param1 == 4910)
            {
               this.exp_pedal_assign_phaser_min = param2;
            }
            else if(param1 == 4911)
            {
               this.exp_pedal_assign_phaser_max = param2;
            }
            else if(param1 == 4912)
            {
               this.exp_pedal_assign_uni_v_min = param2;
            }
            else if(param1 == 4913)
            {
               this.exp_pedal_assign_uni_v_max = param2;
            }
            else if(param1 == 4914)
            {
               this.exp_pedal_assign_tremolo_min = param2;
            }
            else if(param1 == 4915)
            {
               this.exp_pedal_assign_tremolo_max = param2;
            }
            else if(param1 == 4916)
            {
               this.exp_pedal_assign_vibrato_min = param2;
            }
            else if(param1 == 4917)
            {
               this.exp_pedal_assign_vibrato_max = param2;
            }
            else if(param1 == 4918)
            {
               this.exp_pedal_assign_rotary_min = param2;
            }
            else if(param1 == 4919)
            {
               this.exp_pedal_assign_rotary_max = param2;
            }
            else if(param1 == 4920)
            {
               this.exp_pedal_assign_ring_mod_min = param2;
            }
            else if(param1 == 4921)
            {
               this.exp_pedal_assign_ring_mod_max = param2;
            }
            else if(param1 == 4922)
            {
               this.exp_pedal_assign_slow_gear_min = param2;
            }
            else if(param1 == 4923)
            {
               this.exp_pedal_assign_slow_gear_max = param2;
            }
            else if(param1 == 4924)
            {
               this.exp_pedal_assign_slicer_min = param2;
            }
            else if(param1 == 4925)
            {
               this.exp_pedal_assign_slicer_max = param2;
            }
            else if(param1 == 4926)
            {
               this.exp_pedal_assign_comp_min = param2;
            }
            else if(param1 == 4927)
            {
               this.exp_pedal_assign_comp_max = param2;
            }
            else if(param1 == 4928)
            {
               this.exp_pedal_assign_limiter_min = param2;
            }
            else if(param1 == 4929)
            {
               this.exp_pedal_assign_limiter_max = param2;
            }
            else if(param1 == 4930)
            {
               this.exp_pedal_assign_t_wah_min = param2;
            }
            else if(param1 == 4931)
            {
               this.exp_pedal_assign_t_wah_max = param2;
            }
            else if(param1 == 4932)
            {
               this.exp_pedal_assign_auto_wah_min = param2;
            }
            else if(param1 == 4933)
            {
               this.exp_pedal_assign_auto_wah_max = param2;
            }
            else if(param1 == 4934)
            {
               this.exp_pedal_assign_pedal_wah_min = param2;
            }
            else if(param1 == 4935)
            {
               this.exp_pedal_assign_pedal_wah_max = param2;
            }
            else if(param1 == 4936)
            {
               this.exp_pedal_assign_geq_min = param2;
            }
            else if(param1 == 4937)
            {
               this.exp_pedal_assign_geq_max = param2;
            }
            else if(param1 == 4938)
            {
               this.exp_pedal_assign_peq_min = param2;
            }
            else if(param1 == 4939)
            {
               this.exp_pedal_assign_peq_max = param2;
            }
            else if(param1 == 4940)
            {
               this.exp_pedal_assign_guitar_sim_min = param2;
            }
            else if(param1 == 4941)
            {
               this.exp_pedal_assign_guitar_sim_max = param2;
            }
            else if(param1 == 4942)
            {
               this.exp_pedal_assign_ac_guitar_sim_min = param2;
            }
            else if(param1 == 4943)
            {
               this.exp_pedal_assign_ac_guitar_sim_max = param2;
            }
            else if(param1 == 4944)
            {
               this.exp_pedal_assign_ac_processor_min = param2;
            }
            else if(param1 == 4945)
            {
               this.exp_pedal_assign_ac_processor_max = param2;
            }
            else if(param1 == 4946)
            {
               this.exp_pedal_assign_wave_synth_min = param2;
            }
            else if(param1 == 4947)
            {
               this.exp_pedal_assign_wave_synth_max = param2;
            }
            else if(param1 == 4948)
            {
               this.exp_pedal_assign_octave_min = param2;
            }
            else if(param1 == 4949)
            {
               this.exp_pedal_assign_octave_max = param2;
            }
            else if(param1 == 4950)
            {
               this.exp_pedal_assign_pitch_shifter_min_h = param2;
            }
            else if(param1 == 4951)
            {
               this.exp_pedal_assign_pitch_shifter_min_l = param2;
            }
            else if(param1 == 4952)
            {
               this.exp_pedal_assign_pitch_shifter_max_h = param2;
            }
            else if(param1 == 4953)
            {
               this.exp_pedal_assign_pitch_shifter_max_l = param2;
            }
            else if(param1 == 4954)
            {
               this.exp_pedal_assign_harmonist_min_h = param2;
            }
            else if(param1 == 4955)
            {
               this.exp_pedal_assign_harmonist_min_l = param2;
            }
            else if(param1 == 4956)
            {
               this.exp_pedal_assign_harmonist_max_h = param2;
            }
            else if(param1 == 4957)
            {
               this.exp_pedal_assign_harmonist_max_l = param2;
            }
            else if(param1 == 4958)
            {
               this.exp_pedal_assign_humanizer_min = param2;
            }
            else if(param1 == 4959)
            {
               this.exp_pedal_assign_humanizer_max = param2;
            }
            else if(param1 == 4960)
            {
               this.exp_pedal_assign_evh_phaser_min = param2;
            }
            else if(param1 == 4961)
            {
               this.exp_pedal_assign_evh_phaser_max = param2;
            }
            else if(param1 == 4962)
            {
               this.exp_pedal_assign_evh_flanger_min = param2;
            }
            else if(param1 == 4963)
            {
               this.exp_pedal_assign_evh_flanger_max = param2;
            }
            else if(param1 == 4964)
            {
               this.exp_pedal_assign_evh_wah_min = param2;
            }
            else if(param1 == 4965)
            {
               this.exp_pedal_assign_evh_wah_max = param2;
            }
            else if(param1 == 4966)
            {
               this.exp_pedal_assign_dc30_min_h = param2;
            }
            else if(param1 == 4967)
            {
               this.exp_pedal_assign_dc30_min_l = param2;
            }
            else if(param1 == 4968)
            {
               this.exp_pedal_assign_dc30_max_h = param2;
            }
            else if(param1 == 4969)
            {
               this.exp_pedal_assign_dc30_max_l = param2;
            }
            else if(param1 == 4970)
            {
               this.exp_pedal_assign_heavy_oct = param2;
            }
            else if(param1 == 4971)
            {
               this.exp_pedal_assign_heavy_oct_min = param2;
            }
            else if(param1 == 4972)
            {
               this.exp_pedal_assign_heavy_oct_max = param2;
            }
         }
         else if(5120 <= param1 && param1 <= 5151)
         {
            if(param1 == 5120)
            {
               this.gafc_exp1_assign_booster = param2;
            }
            else if(param1 == 5121)
            {
               this.gafc_exp1_assign_delay = param2;
            }
            else if(param1 == 5122)
            {
               this.gafc_exp1_assign_reverb = param2;
            }
            else if(param1 == 5123)
            {
               this.gafc_exp1_assign_chorus = param2;
            }
            else if(param1 == 5124)
            {
               this.gafc_exp1_assign_flanger = param2;
            }
            else if(param1 == 5125)
            {
               this.gafc_exp1_assign_phaser = param2;
            }
            else if(param1 == 5126)
            {
               this.gafc_exp1_assign_uni_v = param2;
            }
            else if(param1 == 5127)
            {
               this.gafc_exp1_assign_tremolo = param2;
            }
            else if(param1 == 5128)
            {
               this.gafc_exp1_assign_vibrato = param2;
            }
            else if(param1 == 5129)
            {
               this.gafc_exp1_assign_rotary = param2;
            }
            else if(param1 == 5130)
            {
               this.gafc_exp1_assign_ring_mod = param2;
            }
            else if(param1 == 5131)
            {
               this.gafc_exp1_assign_slow_gear = param2;
            }
            else if(param1 == 5132)
            {
               this.gafc_exp1_assign_slicer = param2;
            }
            else if(param1 == 5133)
            {
               this.gafc_exp1_assign_comp = param2;
            }
            else if(param1 == 5134)
            {
               this.gafc_exp1_assign_limiter = param2;
            }
            else if(param1 == 5135)
            {
               this.gafc_exp1_assign_t_wah = param2;
            }
            else if(param1 == 5136)
            {
               this.gafc_exp1_assign_auto_wah = param2;
            }
            else if(param1 == 5137)
            {
               this.gafc_exp1_assign_pedal_wah = param2;
            }
            else if(param1 == 5138)
            {
               this.gafc_exp1_assign_geq = param2;
            }
            else if(param1 == 5139)
            {
               this.gafc_exp1_assign_peq = param2;
            }
            else if(param1 == 5140)
            {
               this.gafc_exp1_assign_guitar_sim = param2;
            }
            else if(param1 == 5141)
            {
               this.gafc_exp1_assign_ac_guitar_sim = param2;
            }
            else if(param1 == 5142)
            {
               this.gafc_exp1_assign_ac_processor = param2;
            }
            else if(param1 == 5143)
            {
               this.gafc_exp1_assign_wave_synth = param2;
            }
            else if(param1 == 5144)
            {
               this.gafc_exp1_assign_octave = param2;
            }
            else if(param1 == 5145)
            {
               this.gafc_exp1_assign_pitch_shifter = param2;
            }
            else if(param1 == 5146)
            {
               this.gafc_exp1_assign_harmonist = param2;
            }
            else if(param1 == 5147)
            {
               this.gafc_exp1_assign_humanizer = param2;
            }
            else if(param1 == 5148)
            {
               this.gafc_exp1_assign_evh_phaser = param2;
            }
            else if(param1 == 5149)
            {
               this.gafc_exp1_assign_evh_flanger = param2;
            }
            else if(param1 == 5150)
            {
               this.gafc_exp1_assign_evh_wah = param2;
            }
            else if(param1 == 5151)
            {
               this.gafc_exp1_assign_dc30 = param2;
            }
         }
         else if(5152 <= param1 && param1 <= 5228)
         {
            if(param1 == 5152)
            {
               this.gafc_exp1_assign_booster_min = param2;
            }
            else if(param1 == 5153)
            {
               this.gafc_exp1_assign_booster_max = param2;
            }
            else if(param1 == 5154)
            {
               this.gafc_exp1_assign_delay_min_h = param2;
            }
            else if(param1 == 5155)
            {
               this.gafc_exp1_assign_delay_min_l = param2;
            }
            else if(param1 == 5156)
            {
               this.gafc_exp1_assign_delay_max_h = param2;
            }
            else if(param1 == 5157)
            {
               this.gafc_exp1_assign_delay_max_l = param2;
            }
            else if(param1 == 5158)
            {
               this.gafc_exp1_assign_reverb_min_h = param2;
            }
            else if(param1 == 5159)
            {
               this.gafc_exp1_assign_reverb_min_l = param2;
            }
            else if(param1 == 5160)
            {
               this.gafc_exp1_assign_reverb_max_h = param2;
            }
            else if(param1 == 5161)
            {
               this.gafc_exp1_assign_reverb_max_l = param2;
            }
            else if(param1 == 5162)
            {
               this.gafc_exp1_assign_chorus_min = param2;
            }
            else if(param1 == 5163)
            {
               this.gafc_exp1_assign_chorus_max = param2;
            }
            else if(param1 == 5164)
            {
               this.gafc_exp1_assign_flanger_min = param2;
            }
            else if(param1 == 5165)
            {
               this.gafc_exp1_assign_flanger_max = param2;
            }
            else if(param1 == 5166)
            {
               this.gafc_exp1_assign_phaser_min = param2;
            }
            else if(param1 == 5167)
            {
               this.gafc_exp1_assign_phaser_max = param2;
            }
            else if(param1 == 5168)
            {
               this.gafc_exp1_assign_uni_v_min = param2;
            }
            else if(param1 == 5169)
            {
               this.gafc_exp1_assign_uni_v_max = param2;
            }
            else if(param1 == 5170)
            {
               this.gafc_exp1_assign_tremolo_min = param2;
            }
            else if(param1 == 5171)
            {
               this.gafc_exp1_assign_tremolo_max = param2;
            }
            else if(param1 == 5172)
            {
               this.gafc_exp1_assign_vibrato_min = param2;
            }
            else if(param1 == 5173)
            {
               this.gafc_exp1_assign_vibrato_max = param2;
            }
            else if(param1 == 5174)
            {
               this.gafc_exp1_assign_rotary_min = param2;
            }
            else if(param1 == 5175)
            {
               this.gafc_exp1_assign_rotary_max = param2;
            }
            else if(param1 == 5176)
            {
               this.gafc_exp1_assign_ring_mod_min = param2;
            }
            else if(param1 == 5177)
            {
               this.gafc_exp1_assign_ring_mod_max = param2;
            }
            else if(param1 == 5178)
            {
               this.gafc_exp1_assign_slow_gear_min = param2;
            }
            else if(param1 == 5179)
            {
               this.gafc_exp1_assign_slow_gear_max = param2;
            }
            else if(param1 == 5180)
            {
               this.gafc_exp1_assign_slicer_min = param2;
            }
            else if(param1 == 5181)
            {
               this.gafc_exp1_assign_slicer_max = param2;
            }
            else if(param1 == 5182)
            {
               this.gafc_exp1_assign_comp_min = param2;
            }
            else if(param1 == 5183)
            {
               this.gafc_exp1_assign_comp_max = param2;
            }
            else if(param1 == 5184)
            {
               this.gafc_exp1_assign_limiter_min = param2;
            }
            else if(param1 == 5185)
            {
               this.gafc_exp1_assign_limiter_max = param2;
            }
            else if(param1 == 5186)
            {
               this.gafc_exp1_assign_t_wah_min = param2;
            }
            else if(param1 == 5187)
            {
               this.gafc_exp1_assign_t_wah_max = param2;
            }
            else if(param1 == 5188)
            {
               this.gafc_exp1_assign_auto_wah_min = param2;
            }
            else if(param1 == 5189)
            {
               this.gafc_exp1_assign_auto_wah_max = param2;
            }
            else if(param1 == 5190)
            {
               this.gafc_exp1_assign_pedal_wah_min = param2;
            }
            else if(param1 == 5191)
            {
               this.gafc_exp1_assign_pedal_wah_max = param2;
            }
            else if(param1 == 5192)
            {
               this.gafc_exp1_assign_geq_min = param2;
            }
            else if(param1 == 5193)
            {
               this.gafc_exp1_assign_geq_max = param2;
            }
            else if(param1 == 5194)
            {
               this.gafc_exp1_assign_peq_min = param2;
            }
            else if(param1 == 5195)
            {
               this.gafc_exp1_assign_peq_max = param2;
            }
            else if(param1 == 5196)
            {
               this.gafc_exp1_assign_guitar_sim_min = param2;
            }
            else if(param1 == 5197)
            {
               this.gafc_exp1_assign_guitar_sim_max = param2;
            }
            else if(param1 == 5198)
            {
               this.gafc_exp1_assign_ac_guitar_sim_min = param2;
            }
            else if(param1 == 5199)
            {
               this.gafc_exp1_assign_ac_guitar_sim_max = param2;
            }
            else if(param1 == 5200)
            {
               this.gafc_exp1_assign_ac_processor_min = param2;
            }
            else if(param1 == 5201)
            {
               this.gafc_exp1_assign_ac_processor_max = param2;
            }
            else if(param1 == 5202)
            {
               this.gafc_exp1_assign_wave_synth_min = param2;
            }
            else if(param1 == 5203)
            {
               this.gafc_exp1_assign_wave_synth_max = param2;
            }
            else if(param1 == 5204)
            {
               this.gafc_exp1_assign_octave_min = param2;
            }
            else if(param1 == 5205)
            {
               this.gafc_exp1_assign_octave_max = param2;
            }
            else if(param1 == 5206)
            {
               this.gafc_exp1_assign_pitch_shifter_min_h = param2;
            }
            else if(param1 == 5207)
            {
               this.gafc_exp1_assign_pitch_shifter_min_l = param2;
            }
            else if(param1 == 5208)
            {
               this.gafc_exp1_assign_pitch_shifter_max_h = param2;
            }
            else if(param1 == 5209)
            {
               this.gafc_exp1_assign_pitch_shifter_max_l = param2;
            }
            else if(param1 == 5210)
            {
               this.gafc_exp1_assign_harmonist_min_h = param2;
            }
            else if(param1 == 5211)
            {
               this.gafc_exp1_assign_harmonist_min_l = param2;
            }
            else if(param1 == 5212)
            {
               this.gafc_exp1_assign_harmonist_max_h = param2;
            }
            else if(param1 == 5213)
            {
               this.gafc_exp1_assign_harmonist_max_l = param2;
            }
            else if(param1 == 5214)
            {
               this.gafc_exp1_assign_humanizer_min = param2;
            }
            else if(param1 == 5215)
            {
               this.gafc_exp1_assign_humanizer_max = param2;
            }
            else if(param1 == 5216)
            {
               this.gafc_exp1_assign_evh_phaser_min = param2;
            }
            else if(param1 == 5217)
            {
               this.gafc_exp1_assign_evh_phaser_max = param2;
            }
            else if(param1 == 5218)
            {
               this.gafc_exp1_assign_evh_flanger_min = param2;
            }
            else if(param1 == 5219)
            {
               this.gafc_exp1_assign_evh_flanger_max = param2;
            }
            else if(param1 == 5220)
            {
               this.gafc_exp1_assign_evh_wah_min = param2;
            }
            else if(param1 == 5221)
            {
               this.gafc_exp1_assign_evh_wah_max = param2;
            }
            else if(param1 == 5222)
            {
               this.gafc_exp1_assign_dc30_min_h = param2;
            }
            else if(param1 == 5223)
            {
               this.gafc_exp1_assign_dc30_min_l = param2;
            }
            else if(param1 == 5224)
            {
               this.gafc_exp1_assign_dc30_max_h = param2;
            }
            else if(param1 == 5225)
            {
               this.gafc_exp1_assign_dc30_max_l = param2;
            }
            else if(param1 == 5226)
            {
               this.gafc_exp1_assign_heavy_oct = param2;
            }
            else if(param1 == 5227)
            {
               this.gafc_exp1_assign_heavy_oct_min = param2;
            }
            else if(param1 == 5228)
            {
               this.gafc_exp1_assign_heavy_oct_max = param2;
            }
         }
         else if(5376 <= param1 && param1 <= 5407)
         {
            if(param1 == 5376)
            {
               this.gafc_exp2_assign_booster = param2;
            }
            else if(param1 == 5377)
            {
               this.gafc_exp2_assign_delay = param2;
            }
            else if(param1 == 5378)
            {
               this.gafc_exp2_assign_reverb = param2;
            }
            else if(param1 == 5379)
            {
               this.gafc_exp2_assign_chorus = param2;
            }
            else if(param1 == 5380)
            {
               this.gafc_exp2_assign_flanger = param2;
            }
            else if(param1 == 5381)
            {
               this.gafc_exp2_assign_phaser = param2;
            }
            else if(param1 == 5382)
            {
               this.gafc_exp2_assign_uni_v = param2;
            }
            else if(param1 == 5383)
            {
               this.gafc_exp2_assign_tremolo = param2;
            }
            else if(param1 == 5384)
            {
               this.gafc_exp2_assign_vibrato = param2;
            }
            else if(param1 == 5385)
            {
               this.gafc_exp2_assign_rotary = param2;
            }
            else if(param1 == 5386)
            {
               this.gafc_exp2_assign_ring_mod = param2;
            }
            else if(param1 == 5387)
            {
               this.gafc_exp2_assign_slow_gear = param2;
            }
            else if(param1 == 5388)
            {
               this.gafc_exp2_assign_slicer = param2;
            }
            else if(param1 == 5389)
            {
               this.gafc_exp2_assign_comp = param2;
            }
            else if(param1 == 5390)
            {
               this.gafc_exp2_assign_limiter = param2;
            }
            else if(param1 == 5391)
            {
               this.gafc_exp2_assign_t_wah = param2;
            }
            else if(param1 == 5392)
            {
               this.gafc_exp2_assign_auto_wah = param2;
            }
            else if(param1 == 5393)
            {
               this.gafc_exp2_assign_pedal_wah = param2;
            }
            else if(param1 == 5394)
            {
               this.gafc_exp2_assign_geq = param2;
            }
            else if(param1 == 5395)
            {
               this.gafc_exp2_assign_peq = param2;
            }
            else if(param1 == 5396)
            {
               this.gafc_exp2_assign_guitar_sim = param2;
            }
            else if(param1 == 5397)
            {
               this.gafc_exp2_assign_ac_guitar_sim = param2;
            }
            else if(param1 == 5398)
            {
               this.gafc_exp2_assign_ac_processor = param2;
            }
            else if(param1 == 5399)
            {
               this.gafc_exp2_assign_wave_synth = param2;
            }
            else if(param1 == 5400)
            {
               this.gafc_exp2_assign_octave = param2;
            }
            else if(param1 == 5401)
            {
               this.gafc_exp2_assign_pitch_shifter = param2;
            }
            else if(param1 == 5402)
            {
               this.gafc_exp2_assign_harmonist = param2;
            }
            else if(param1 == 5403)
            {
               this.gafc_exp2_assign_humanizer = param2;
            }
            else if(param1 == 5404)
            {
               this.gafc_exp2_assign_evh_phaser = param2;
            }
            else if(param1 == 5405)
            {
               this.gafc_exp2_assign_evh_flanger = param2;
            }
            else if(param1 == 5406)
            {
               this.gafc_exp2_assign_evh_wah = param2;
            }
            else if(param1 == 5407)
            {
               this.gafc_exp2_assign_dc30 = param2;
            }
         }
         else if(5408 <= param1 && param1 <= 5484)
         {
            if(param1 == 5408)
            {
               this.gafc_exp2_assign_booster_min = param2;
            }
            else if(param1 == 5409)
            {
               this.gafc_exp2_assign_booster_max = param2;
            }
            else if(param1 == 5410)
            {
               this.gafc_exp2_assign_delay_min_h = param2;
            }
            else if(param1 == 5411)
            {
               this.gafc_exp2_assign_delay_min_l = param2;
            }
            else if(param1 == 5412)
            {
               this.gafc_exp2_assign_delay_max_h = param2;
            }
            else if(param1 == 5413)
            {
               this.gafc_exp2_assign_delay_max_l = param2;
            }
            else if(param1 == 5414)
            {
               this.gafc_exp2_assign_reverb_min_h = param2;
            }
            else if(param1 == 5415)
            {
               this.gafc_exp2_assign_reverb_min_l = param2;
            }
            else if(param1 == 5416)
            {
               this.gafc_exp2_assign_reverb_max_h = param2;
            }
            else if(param1 == 5417)
            {
               this.gafc_exp2_assign_reverb_max_l = param2;
            }
            else if(param1 == 5418)
            {
               this.gafc_exp2_assign_chorus_min = param2;
            }
            else if(param1 == 5419)
            {
               this.gafc_exp2_assign_chorus_max = param2;
            }
            else if(param1 == 5420)
            {
               this.gafc_exp2_assign_flanger_min = param2;
            }
            else if(param1 == 5421)
            {
               this.gafc_exp2_assign_flanger_max = param2;
            }
            else if(param1 == 5422)
            {
               this.gafc_exp2_assign_phaser_min = param2;
            }
            else if(param1 == 5423)
            {
               this.gafc_exp2_assign_phaser_max = param2;
            }
            else if(param1 == 5424)
            {
               this.gafc_exp2_assign_uni_v_min = param2;
            }
            else if(param1 == 5425)
            {
               this.gafc_exp2_assign_uni_v_max = param2;
            }
            else if(param1 == 5426)
            {
               this.gafc_exp2_assign_tremolo_min = param2;
            }
            else if(param1 == 5427)
            {
               this.gafc_exp2_assign_tremolo_max = param2;
            }
            else if(param1 == 5428)
            {
               this.gafc_exp2_assign_vibrato_min = param2;
            }
            else if(param1 == 5429)
            {
               this.gafc_exp2_assign_vibrato_max = param2;
            }
            else if(param1 == 5430)
            {
               this.gafc_exp2_assign_rotary_min = param2;
            }
            else if(param1 == 5431)
            {
               this.gafc_exp2_assign_rotary_max = param2;
            }
            else if(param1 == 5432)
            {
               this.gafc_exp2_assign_ring_mod_min = param2;
            }
            else if(param1 == 5433)
            {
               this.gafc_exp2_assign_ring_mod_max = param2;
            }
            else if(param1 == 5434)
            {
               this.gafc_exp2_assign_slow_gear_min = param2;
            }
            else if(param1 == 5435)
            {
               this.gafc_exp2_assign_slow_gear_max = param2;
            }
            else if(param1 == 5436)
            {
               this.gafc_exp2_assign_slicer_min = param2;
            }
            else if(param1 == 5437)
            {
               this.gafc_exp2_assign_slicer_max = param2;
            }
            else if(param1 == 5438)
            {
               this.gafc_exp2_assign_comp_min = param2;
            }
            else if(param1 == 5439)
            {
               this.gafc_exp2_assign_comp_max = param2;
            }
            else if(param1 == 5440)
            {
               this.gafc_exp2_assign_limiter_min = param2;
            }
            else if(param1 == 5441)
            {
               this.gafc_exp2_assign_limiter_max = param2;
            }
            else if(param1 == 5442)
            {
               this.gafc_exp2_assign_t_wah_min = param2;
            }
            else if(param1 == 5443)
            {
               this.gafc_exp2_assign_t_wah_max = param2;
            }
            else if(param1 == 5444)
            {
               this.gafc_exp2_assign_auto_wah_min = param2;
            }
            else if(param1 == 5445)
            {
               this.gafc_exp2_assign_auto_wah_max = param2;
            }
            else if(param1 == 5446)
            {
               this.gafc_exp2_assign_pedal_wah_min = param2;
            }
            else if(param1 == 5447)
            {
               this.gafc_exp2_assign_pedal_wah_max = param2;
            }
            else if(param1 == 5448)
            {
               this.gafc_exp2_assign_geq_min = param2;
            }
            else if(param1 == 5449)
            {
               this.gafc_exp2_assign_geq_max = param2;
            }
            else if(param1 == 5450)
            {
               this.gafc_exp2_assign_peq_min = param2;
            }
            else if(param1 == 5451)
            {
               this.gafc_exp2_assign_peq_max = param2;
            }
            else if(param1 == 5452)
            {
               this.gafc_exp2_assign_guitar_sim_min = param2;
            }
            else if(param1 == 5453)
            {
               this.gafc_exp2_assign_guitar_sim_max = param2;
            }
            else if(param1 == 5454)
            {
               this.gafc_exp2_assign_ac_guitar_sim_min = param2;
            }
            else if(param1 == 5455)
            {
               this.gafc_exp2_assign_ac_guitar_sim_max = param2;
            }
            else if(param1 == 5456)
            {
               this.gafc_exp2_assign_ac_processor_min = param2;
            }
            else if(param1 == 5457)
            {
               this.gafc_exp2_assign_ac_processor_max = param2;
            }
            else if(param1 == 5458)
            {
               this.gafc_exp2_assign_wave_synth_min = param2;
            }
            else if(param1 == 5459)
            {
               this.gafc_exp2_assign_wave_synth_max = param2;
            }
            else if(param1 == 5460)
            {
               this.gafc_exp2_assign_octave_min = param2;
            }
            else if(param1 == 5461)
            {
               this.gafc_exp2_assign_octave_max = param2;
            }
            else if(param1 == 5462)
            {
               this.gafc_exp2_assign_pitch_shifter_min_h = param2;
            }
            else if(param1 == 5463)
            {
               this.gafc_exp2_assign_pitch_shifter_min_l = param2;
            }
            else if(param1 == 5464)
            {
               this.gafc_exp2_assign_pitch_shifter_max_h = param2;
            }
            else if(param1 == 5465)
            {
               this.gafc_exp2_assign_pitch_shifter_max_l = param2;
            }
            else if(param1 == 5466)
            {
               this.gafc_exp2_assign_harmonist_min_h = param2;
            }
            else if(param1 == 5467)
            {
               this.gafc_exp2_assign_harmonist_min_l = param2;
            }
            else if(param1 == 5468)
            {
               this.gafc_exp2_assign_harmonist_max_h = param2;
            }
            else if(param1 == 5469)
            {
               this.gafc_exp2_assign_harmonist_max_l = param2;
            }
            else if(param1 == 5470)
            {
               this.gafc_exp2_assign_humanizer_min = param2;
            }
            else if(param1 == 5471)
            {
               this.gafc_exp2_assign_humanizer_max = param2;
            }
            else if(param1 == 5472)
            {
               this.gafc_exp2_assign_evh_phaser_min = param2;
            }
            else if(param1 == 5473)
            {
               this.gafc_exp2_assign_evh_phaser_max = param2;
            }
            else if(param1 == 5474)
            {
               this.gafc_exp2_assign_evh_flanger_min = param2;
            }
            else if(param1 == 5475)
            {
               this.gafc_exp2_assign_evh_flanger_max = param2;
            }
            else if(param1 == 5476)
            {
               this.gafc_exp2_assign_evh_wah_min = param2;
            }
            else if(param1 == 5477)
            {
               this.gafc_exp2_assign_evh_wah_max = param2;
            }
            else if(param1 == 5478)
            {
               this.gafc_exp2_assign_dc30_min_h = param2;
            }
            else if(param1 == 5479)
            {
               this.gafc_exp2_assign_dc30_min_l = param2;
            }
            else if(param1 == 5480)
            {
               this.gafc_exp2_assign_dc30_max_h = param2;
            }
            else if(param1 == 5481)
            {
               this.gafc_exp2_assign_dc30_max_l = param2;
            }
            else if(param1 == 5482)
            {
               this.gafc_exp2_assign_heavy_oct = param2;
            }
            else if(param1 == 5483)
            {
               this.gafc_exp2_assign_heavy_oct_min = param2;
            }
            else if(param1 == 5484)
            {
               this.gafc_exp2_assign_heavy_oct_max = param2;
            }
         }
      }
      
      public function getExData(param1:String, param2:int) : String
      {
         var _loc3_:Array = null;
         var _loc4_:Array = null;
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         _loc3_ = [];
         _loc4_ = param1.split(",");
         _loc5_ = parseInt(_loc4_[2],16) * 256 + parseInt(_loc4_[3],16);
         _loc6_ = 0;
         while(_loc6_ < param2)
         {
            _loc3_.push(this.getParamForEx(_loc5_));
            _loc7_ = _loc5_ % 128;
            if(_loc7_ == 127)
            {
               _loc5_ -= 127;
               _loc5_ = _loc5_ + 256;
            }
            else
            {
               _loc5_++;
            }
            _loc6_++;
         }
         return _loc3_.join(",");
      }
      
      public function getCompExData(param1:String, param2:int) : String
      {
         var _loc3_:Array = null;
         var _loc4_:Array = null;
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc7_:String = null;
         var _loc8_:int = 0;
         _loc3_ = [];
         _loc4_ = param1.split(",");
         _loc5_ = parseInt(_loc4_[2],16) * 256 + parseInt(_loc4_[3],16);
         _loc6_ = 0;
         while(_loc6_ < param2)
         {
            _loc7_ = this.getParamForEx(_loc5_);
            if(_loc7_ != "00")
            {
               _loc3_.push(_loc7_);
            }
            _loc8_ = _loc5_ % 128;
            if(_loc8_ == 127)
            {
               _loc5_ -= 127;
               _loc5_ = _loc5_ + 256;
            }
            else
            {
               _loc5_++;
            }
            _loc6_++;
         }
         return _loc3_.join(",");
      }
      
      private function getParamForEx(param1:int) : String
      {
         var _loc2_:int = 0;
         _loc2_ = 0;
         if(param1 >= 0 && param1 < 304)
         {
            if(param1 == 0)
            {
               _loc2_ = this.patch_name1;
            }
            else if(param1 == 1)
            {
               _loc2_ = this.patch_name2;
            }
            else if(param1 == 2)
            {
               _loc2_ = this.patch_name3;
            }
            else if(param1 == 3)
            {
               _loc2_ = this.patch_name4;
            }
            else if(param1 == 4)
            {
               _loc2_ = this.patch_name5;
            }
            else if(param1 == 5)
            {
               _loc2_ = this.patch_name6;
            }
            else if(param1 == 6)
            {
               _loc2_ = this.patch_name7;
            }
            else if(param1 == 7)
            {
               _loc2_ = this.patch_name8;
            }
            else if(param1 == 8)
            {
               _loc2_ = this.patch_name9;
            }
            else if(param1 == 9)
            {
               _loc2_ = this.patch_name10;
            }
            else if(param1 == 10)
            {
               _loc2_ = this.patch_name11;
            }
            else if(param1 == 11)
            {
               _loc2_ = this.patch_name12;
            }
            else if(param1 == 12)
            {
               _loc2_ = this.patch_name13;
            }
            else if(param1 == 13)
            {
               _loc2_ = this.patch_name14;
            }
            else if(param1 == 14)
            {
               _loc2_ = this.patch_name15;
            }
            else if(param1 == 15)
            {
               _loc2_ = this.patch_name16;
            }
            else if(param1 == 16)
            {
               _loc2_ = this.output_select;
            }
            else if(param1 == 32)
            {
               _loc2_ = this.comp_on_off;
            }
            else if(param1 == 33)
            {
               _loc2_ = this.comp_type;
            }
            else if(param1 == 34)
            {
               _loc2_ = this.comp_sustain;
            }
            else if(param1 == 35)
            {
               _loc2_ = this.comp_attack;
            }
            else if(param1 == 36)
            {
               _loc2_ = this.comp_tone;
            }
            else if(param1 == 37)
            {
               _loc2_ = this.comp_level;
            }
            else if(param1 == 48)
            {
               _loc2_ = this.od_ds_on_off;
            }
            else if(param1 == 49)
            {
               _loc2_ = this.od_ds_type;
            }
            else if(param1 == 50)
            {
               _loc2_ = this.od_ds_drive;
            }
            else if(param1 == 51)
            {
               _loc2_ = this.od_ds_bottom;
            }
            else if(param1 == 52)
            {
               _loc2_ = this.od_ds_tone;
            }
            else if(param1 == 53)
            {
               _loc2_ = this.od_ds_solo_sw;
            }
            else if(param1 == 54)
            {
               _loc2_ = this.od_ds_solo_level;
            }
            else if(param1 == 55)
            {
               _loc2_ = this.od_ds_effect_level;
            }
            else if(param1 == 56)
            {
               _loc2_ = this.od_ds_direct_mix;
            }
            else if(param1 == 57)
            {
               _loc2_ = this.od_ds_custom_type;
            }
            else if(param1 == 58)
            {
               _loc2_ = this.od_ds_custom_bottom;
            }
            else if(param1 == 59)
            {
               _loc2_ = this.od_ds_custom_top;
            }
            else if(param1 == 60)
            {
               _loc2_ = this.od_ds_custom_low;
            }
            else if(param1 == 61)
            {
               _loc2_ = this.od_ds_custom_high;
            }
            else if(param1 == 62)
            {
               _loc2_ = this.od_ds_custom_character;
            }
            else if(param1 >= 80 && param1 <= 287)
            {
               if(this.mediator.sysex.params.system.sys_preference_preamp == 1)
               {
                  _loc2_ = this.getSystem1PreampData(param1);
               }
               else if(this.mediator.sysex.params.system.sys_preference_preamp == 2)
               {
                  _loc2_ = this.getSystem2PreampData(param1);
               }
               else if(this.mediator.sysex.params.system.sys_preference_preamp == 3)
               {
                  _loc2_ = this.getSystem3PreampData(param1);
               }
               else if(this.mediator.sysex.params.system.sys_preference_preamp == 0)
               {
                  _loc2_ = this.getPatchPreampData(param1);
               }
            }
         }
         else if(param1 >= 304 && param1 < 512)
         {
            if(param1 == 304)
            {
               _loc2_ = this.eq_on_off;
            }
            else if(param1 == 305)
            {
               _loc2_ = this.eq_low_cut;
            }
            else if(param1 == 306)
            {
               _loc2_ = this.eq_low_gain;
            }
            else if(param1 == 307)
            {
               _loc2_ = this.eq_low_mid_freq;
            }
            else if(param1 == 308)
            {
               _loc2_ = this.eq_low_mid_q;
            }
            else if(param1 == 309)
            {
               _loc2_ = this.eq_low_mid_gain;
            }
            else if(param1 == 310)
            {
               _loc2_ = this.eq_high_mid_freq;
            }
            else if(param1 == 311)
            {
               _loc2_ = this.eq_high_mid_q;
            }
            else if(param1 == 312)
            {
               _loc2_ = this.eq_high_mid_gain;
            }
            else if(param1 == 313)
            {
               _loc2_ = this.eq_high_gain;
            }
            else if(param1 == 314)
            {
               _loc2_ = this.eq_high_cut;
            }
            else if(param1 == 315)
            {
               _loc2_ = this.eq_level;
            }
            else if(param1 == 320)
            {
               _loc2_ = this.fx1_on_off;
            }
            else if(param1 == 321)
            {
               _loc2_ = this.fx1_fx_type;
            }
            else if(param1 == 322)
            {
               _loc2_ = this.fx1_sub_od_ds_type;
            }
            else if(param1 == 323)
            {
               _loc2_ = this.fx1_sub_od_ds_drive;
            }
            else if(param1 == 324)
            {
               _loc2_ = this.fx1_sub_od_ds_bottom;
            }
            else if(param1 == 325)
            {
               _loc2_ = this.fx1_sub_od_ds_tone;
            }
            else if(param1 == 326)
            {
               _loc2_ = this.fx1_sub_od_ds_solo_sw;
            }
            else if(param1 == 327)
            {
               _loc2_ = this.fx1_sub_od_ds_solo_level;
            }
            else if(param1 == 328)
            {
               _loc2_ = this.fx1_sub_od_ds_effect_level;
            }
            else if(param1 == 329)
            {
               _loc2_ = this.fx1_sub_od_ds_direct_mix;
            }
            else if(param1 == 332)
            {
               _loc2_ = this.fx1_t_wah_mode;
            }
            else if(param1 == 333)
            {
               _loc2_ = this.fx1_t_wah_polar;
            }
            else if(param1 == 334)
            {
               _loc2_ = this.fx1_t_wah_sens;
            }
            else if(param1 == 335)
            {
               _loc2_ = this.fx1_t_wah_freq;
            }
            else if(param1 == 336)
            {
               _loc2_ = this.fx1_t_wah_peak;
            }
            else if(param1 == 337)
            {
               _loc2_ = this.fx1_t_wah_direct_mix;
            }
            else if(param1 == 338)
            {
               _loc2_ = this.fx1_t_wah_effect_level;
            }
            else if(param1 == 340)
            {
               _loc2_ = this.fx1_auto_wah_mode;
            }
            else if(param1 == 341)
            {
               _loc2_ = this.fx1_auto_wah_freq;
            }
            else if(param1 == 342)
            {
               _loc2_ = this.fx1_auto_wah_peak;
            }
            else if(param1 == 343)
            {
               _loc2_ = this.fx1_auto_wah_rate;
            }
            else if(param1 == 344)
            {
               _loc2_ = this.fx1_auto_wah_depth;
            }
            else if(param1 == 345)
            {
               _loc2_ = this.fx1_auto_wah_direct_mix;
            }
            else if(param1 == 346)
            {
               _loc2_ = this.fx1_auto_wah_effect_level;
            }
            else if(param1 == 348)
            {
               _loc2_ = this.fx1_sub_wah_type;
            }
            else if(param1 == 349)
            {
               _loc2_ = this.fx1_sub_wah_pedal_pos;
            }
            else if(param1 == 350)
            {
               _loc2_ = this.fx1_sub_wah_pedal_min;
            }
            else if(param1 == 351)
            {
               _loc2_ = this.fx1_sub_wah_pedal_max;
            }
            else if(param1 == 352)
            {
               _loc2_ = this.fx1_sub_wah_effect_level;
            }
            else if(param1 == 353)
            {
               _loc2_ = this.fx1_sub_wah_direct_mix;
            }
            else if(param1 == 355)
            {
               _loc2_ = this.fx1_adv_comp_type;
            }
            else if(param1 == 356)
            {
               _loc2_ = this.fx1_adv_comp_sustain;
            }
            else if(param1 == 357)
            {
               _loc2_ = this.fx1_adv_comp_attack;
            }
            else if(param1 == 358)
            {
               _loc2_ = this.fx1_adv_comp_tone;
            }
            else if(param1 == 359)
            {
               _loc2_ = this.fx1_adv_comp_level;
            }
            else if(param1 == 361)
            {
               _loc2_ = this.fx1_limiter_type;
            }
            else if(param1 == 362)
            {
               _loc2_ = this.fx1_limiter_attack;
            }
            else if(param1 == 363)
            {
               _loc2_ = this.fx1_limiter_thresh;
            }
            else if(param1 == 364)
            {
               _loc2_ = this.fx1_limiter_ratio;
            }
            else if(param1 == 365)
            {
               _loc2_ = this.fx1_limiter_release;
            }
            else if(param1 == 366)
            {
               _loc2_ = this.fx1_limiter_level;
            }
            else if(param1 == 368)
            {
               _loc2_ = this.fx1_graphic_eq_31hz;
            }
            else if(param1 == 369)
            {
               _loc2_ = this.fx1_graphic_eq_62hz;
            }
            else if(param1 == 370)
            {
               _loc2_ = this.fx1_graphic_eq_125hz;
            }
            else if(param1 == 371)
            {
               _loc2_ = this.fx1_graphic_eq_250hz;
            }
            else if(param1 == 372)
            {
               _loc2_ = this.fx1_graphic_eq_500hz;
            }
            else if(param1 == 373)
            {
               _loc2_ = this.fx1_graphic_eq_1khz;
            }
            else if(param1 == 374)
            {
               _loc2_ = this.fx1_graphic_eq_2khz;
            }
            else if(param1 == 375)
            {
               _loc2_ = this.fx1_graphic_eq_4khz;
            }
            else if(param1 == 376)
            {
               _loc2_ = this.fx1_graphic_eq_8khz;
            }
            else if(param1 == 377)
            {
               _loc2_ = this.fx1_graphic_eq_16khz;
            }
            else if(param1 == 378)
            {
               _loc2_ = this.fx1_graphic_eq_level;
            }
            else if(param1 == 380)
            {
               _loc2_ = this.fx1_parametric_eq_low_cut;
            }
            else if(param1 == 381)
            {
               _loc2_ = this.fx1_parametric_eq_low_gain;
            }
            else if(param1 == 382)
            {
               _loc2_ = this.fx1_parametric_eq_low_mid_freq;
            }
            else if(param1 == 383)
            {
               _loc2_ = this.fx1_parametric_eq_low_mid_q;
            }
         }
         else if(param1 >= 512 && param1 < 768)
         {
            if(param1 == 512)
            {
               _loc2_ = this.fx1_parametric_eq_low_mid_gain;
            }
            else if(param1 == 513)
            {
               _loc2_ = this.fx1_parametric_eq_high_mid_freq;
            }
            else if(param1 == 514)
            {
               _loc2_ = this.fx1_parametric_eq_high_mid_q;
            }
            else if(param1 == 515)
            {
               _loc2_ = this.fx1_parametric_eq_high_mid_gain;
            }
            else if(param1 == 516)
            {
               _loc2_ = this.fx1_parametric_eq_high_gain;
            }
            else if(param1 == 517)
            {
               _loc2_ = this.fx1_parametric_eq_high_cut;
            }
            else if(param1 == 518)
            {
               _loc2_ = this.fx1_parametric_eq_level;
            }
            else if(param1 == 520)
            {
               _loc2_ = this.fx1_tone_modify_type;
            }
            else if(param1 == 521)
            {
               _loc2_ = this.fx1_tone_modify_reso;
            }
            else if(param1 == 522)
            {
               _loc2_ = this.fx1_tone_modify_low;
            }
            else if(param1 == 523)
            {
               _loc2_ = this.fx1_tone_modify_high;
            }
            else if(param1 == 524)
            {
               _loc2_ = this.fx1_tone_modify_level;
            }
            else if(param1 == 526)
            {
               _loc2_ = this.fx1_guitar_sim_type;
            }
            else if(param1 == 527)
            {
               _loc2_ = this.fx1_guitar_sim_low;
            }
            else if(param1 == 528)
            {
               _loc2_ = this.fx1_guitar_sim_high;
            }
            else if(param1 == 529)
            {
               _loc2_ = this.fx1_guitar_sim_level;
            }
            else if(param1 == 530)
            {
               _loc2_ = this.fx1_guitar_sim_body;
            }
            else if(param1 == 532)
            {
               _loc2_ = this.fx1_slow_gear_sens;
            }
            else if(param1 == 533)
            {
               _loc2_ = this.fx1_slow_gear_rise_time;
            }
            else if(param1 == 534)
            {
               _loc2_ = this.fx1_slow_gear_level;
            }
            else if(param1 == 536)
            {
               _loc2_ = this.fx1_defretter_tone;
            }
            else if(param1 == 537)
            {
               _loc2_ = this.fx1_defretter_sens;
            }
            else if(param1 == 538)
            {
               _loc2_ = this.fx1_defretter_attack;
            }
            else if(param1 == 539)
            {
               _loc2_ = this.fx1_defretter_depth;
            }
            else if(param1 == 540)
            {
               _loc2_ = this.fx1_defretter_reso;
            }
            else if(param1 == 541)
            {
               _loc2_ = this.fx1_defretter_effect_level;
            }
            else if(param1 == 542)
            {
               _loc2_ = this.fx1_defretter_direct_mix;
            }
            else if(param1 == 544)
            {
               _loc2_ = this.fx1_wave_synth_wave;
            }
            else if(param1 == 545)
            {
               _loc2_ = this.fx1_wave_synth_cutoff;
            }
            else if(param1 == 546)
            {
               _loc2_ = this.fx1_wave_synth_reso;
            }
            else if(param1 == 547)
            {
               _loc2_ = this.fx1_wave_synth_filter_sens;
            }
            else if(param1 == 548)
            {
               _loc2_ = this.fx1_wave_synth_filter_decay;
            }
            else if(param1 == 549)
            {
               _loc2_ = this.fx1_wave_synth_filter_depth;
            }
            else if(param1 == 550)
            {
               _loc2_ = this.fx1_wave_synth_synth_level;
            }
            else if(param1 == 551)
            {
               _loc2_ = this.fx1_wave_synth_direct_mix;
            }
            else if(param1 == 553)
            {
               _loc2_ = this.fx1_sitar_sim_tone;
            }
            else if(param1 == 554)
            {
               _loc2_ = this.fx1_sitar_sim_sens;
            }
            else if(param1 == 555)
            {
               _loc2_ = this.fx1_sitar_sim_depth;
            }
            else if(param1 == 556)
            {
               _loc2_ = this.fx1_sitar_sim_reso;
            }
            else if(param1 == 557)
            {
               _loc2_ = this.fx1_sitar_sim_buzz;
            }
            else if(param1 == 558)
            {
               _loc2_ = this.fx1_sitar_sim_effect_level;
            }
            else if(param1 == 559)
            {
               _loc2_ = this.fx1_sitar_sim_direct_mix;
            }
            else if(param1 == 561)
            {
               _loc2_ = this.fx1_octave_range;
            }
            else if(param1 == 562)
            {
               _loc2_ = this.fx1_octave_level;
            }
            else if(param1 == 563)
            {
               _loc2_ = this.fx1_octave_direct_mix;
            }
            else if(param1 == 565)
            {
               _loc2_ = this.fx1_pitch_shifter_voice;
            }
            else if(param1 == 566)
            {
               _loc2_ = this.fx1_pitch_shifter_ps1mode;
            }
            else if(param1 == 567)
            {
               _loc2_ = this.fx1_pitch_shifter_ps1pitch;
            }
            else if(param1 == 568)
            {
               _loc2_ = this.fx1_pitch_shifter_ps1fine;
            }
            else if(param1 == 569)
            {
               _loc2_ = this.fx1_pitch_shifter_ps1pre_dly_h;
            }
            else if(param1 == 570)
            {
               _loc2_ = this.fx1_pitch_shifter_ps1pre_dly_l;
            }
            else if(param1 == 571)
            {
               _loc2_ = this.fx1_pitch_shifter_ps1level;
            }
            else if(param1 == 572)
            {
               _loc2_ = this.fx1_pitch_shifter_ps2mode;
            }
            else if(param1 == 573)
            {
               _loc2_ = this.fx1_pitch_shifter_ps2pitch;
            }
            else if(param1 == 574)
            {
               _loc2_ = this.fx1_pitch_shifter_ps2fine;
            }
            else if(param1 == 575)
            {
               _loc2_ = this.fx1_pitch_shifter_ps2pre_dly_h;
            }
            else if(param1 == 576)
            {
               _loc2_ = this.fx1_pitch_shifter_ps2pre_dly_l;
            }
            else if(param1 == 577)
            {
               _loc2_ = this.fx1_pitch_shifter_ps2level;
            }
            else if(param1 == 578)
            {
               _loc2_ = this.fx1_pitch_shifter_ps1f_back;
            }
            else if(param1 == 579)
            {
               _loc2_ = this.fx1_pitch_shifter_direct_mix;
            }
            else if(param1 == 581)
            {
               _loc2_ = this.fx1_harmonist_voice;
            }
            else if(param1 == 582)
            {
               _loc2_ = this.fx1_harmonist_hr1harm;
            }
            else if(param1 == 583)
            {
               _loc2_ = this.fx1_harmonist_hr1pre_dly_h;
            }
            else if(param1 == 584)
            {
               _loc2_ = this.fx1_harmonist_hr1pre_dly_l;
            }
            else if(param1 == 585)
            {
               _loc2_ = this.fx1_harmonist_hr1level;
            }
            else if(param1 == 586)
            {
               _loc2_ = this.fx1_harmonist_hr2harm;
            }
            else if(param1 == 587)
            {
               _loc2_ = this.fx1_harmonist_hr2pre_dly_h;
            }
            else if(param1 == 588)
            {
               _loc2_ = this.fx1_harmonist_hr2pre_dly_l;
            }
            else if(param1 == 589)
            {
               _loc2_ = this.fx1_harmonist_hr2level;
            }
            else if(param1 == 590)
            {
               _loc2_ = this.fx1_harmonist_hr1f_back;
            }
            else if(param1 == 591)
            {
               _loc2_ = this.fx1_harmonist_direct_mix;
            }
            else if(param1 == 592)
            {
               _loc2_ = this.fx1_harmonist_hr1c;
            }
            else if(param1 == 593)
            {
               _loc2_ = this.fx1_harmonist_hr1db;
            }
            else if(param1 == 594)
            {
               _loc2_ = this.fx1_harmonist_hr1d;
            }
            else if(param1 == 595)
            {
               _loc2_ = this.fx1_harmonist_hr1eb;
            }
            else if(param1 == 596)
            {
               _loc2_ = this.fx1_harmonist_hr1e;
            }
            else if(param1 == 597)
            {
               _loc2_ = this.fx1_harmonist_hr1f;
            }
            else if(param1 == 598)
            {
               _loc2_ = this.fx1_harmonist_hr1f_s;
            }
            else if(param1 == 599)
            {
               _loc2_ = this.fx1_harmonist_hr1g;
            }
            else if(param1 == 600)
            {
               _loc2_ = this.fx1_harmonist_hr1ab;
            }
            else if(param1 == 601)
            {
               _loc2_ = this.fx1_harmonist_hr1a;
            }
            else if(param1 == 602)
            {
               _loc2_ = this.fx1_harmonist_hr1bb;
            }
            else if(param1 == 603)
            {
               _loc2_ = this.fx1_harmonist_hr1b;
            }
            else if(param1 == 604)
            {
               _loc2_ = this.fx1_harmonist_hr2c;
            }
            else if(param1 == 605)
            {
               _loc2_ = this.fx1_harmonist_hr2db;
            }
            else if(param1 == 606)
            {
               _loc2_ = this.fx1_harmonist_hr2d;
            }
            else if(param1 == 607)
            {
               _loc2_ = this.fx1_harmonist_hr2eb;
            }
            else if(param1 == 608)
            {
               _loc2_ = this.fx1_harmonist_hr2e;
            }
            else if(param1 == 609)
            {
               _loc2_ = this.fx1_harmonist_hr2f;
            }
            else if(param1 == 610)
            {
               _loc2_ = this.fx1_harmonist_hr2f_s;
            }
            else if(param1 == 611)
            {
               _loc2_ = this.fx1_harmonist_hr2g;
            }
            else if(param1 == 612)
            {
               _loc2_ = this.fx1_harmonist_hr2ab;
            }
            else if(param1 == 613)
            {
               _loc2_ = this.fx1_harmonist_hr2a;
            }
            else if(param1 == 614)
            {
               _loc2_ = this.fx1_harmonist_hr2bb;
            }
            else if(param1 == 615)
            {
               _loc2_ = this.fx1_harmonist_hr2b;
            }
            else if(param1 == 617)
            {
               _loc2_ = this.fx1_sound_hold_hold;
            }
            else if(param1 == 618)
            {
               _loc2_ = this.fx1_sound_hold_rise_time;
            }
            else if(param1 == 619)
            {
               _loc2_ = this.fx1_sound_hold_effect_level;
            }
            else if(param1 == 621)
            {
               _loc2_ = this.fx1_ac_processor_type;
            }
            else if(param1 == 622)
            {
               _loc2_ = this.fx1_ac_processor_bass;
            }
            else if(param1 == 623)
            {
               _loc2_ = this.fx1_ac_processor_middle;
            }
            else if(param1 == 624)
            {
               _loc2_ = this.fx1_ac_processor_middle_freq;
            }
            else if(param1 == 625)
            {
               _loc2_ = this.fx1_ac_processor_treble;
            }
            else if(param1 == 626)
            {
               _loc2_ = this.fx1_ac_processor_presence;
            }
            else if(param1 == 627)
            {
               _loc2_ = this.fx1_ac_processor_level;
            }
            else if(param1 == 629)
            {
               _loc2_ = this.fx1_phaser_type;
            }
            else if(param1 == 630)
            {
               _loc2_ = this.fx1_phaser_rate;
            }
            else if(param1 == 631)
            {
               _loc2_ = this.fx1_phaser_depth;
            }
            else if(param1 == 632)
            {
               _loc2_ = this.fx1_phaser_manual;
            }
            else if(param1 == 633)
            {
               _loc2_ = this.fx1_phaser_reso;
            }
            else if(param1 == 634)
            {
               _loc2_ = this.fx1_phaser_step_rate;
            }
            else if(param1 == 635)
            {
               _loc2_ = this.fx1_phaser_effect_level;
            }
            else if(param1 == 636)
            {
               _loc2_ = this.fx1_phaser_direct_mix;
            }
            else if(param1 == 638)
            {
               _loc2_ = this.fx1_flanger_rate;
            }
            else if(param1 == 639)
            {
               _loc2_ = this.fx1_flanger_depth;
            }
         }
         else if(param1 >= 768 && param1 < 1024)
         {
            if(param1 == 768)
            {
               _loc2_ = this.fx1_flanger_manual;
            }
            else if(param1 == 769)
            {
               _loc2_ = this.fx1_flanger_reso;
            }
            else if(param1 == 770)
            {
               _loc2_ = this.fx1_flanger_separation;
            }
            else if(param1 == 771)
            {
               _loc2_ = this.fx1_flanger_low_cut;
            }
            else if(param1 == 772)
            {
               _loc2_ = this.fx1_flanger_effect_level;
            }
            else if(param1 == 773)
            {
               _loc2_ = this.fx1_flanger_direct_mix;
            }
            else if(param1 == 775)
            {
               _loc2_ = this.fx1_tremolo_wave_shape;
            }
            else if(param1 == 776)
            {
               _loc2_ = this.fx1_tremolo_rate;
            }
            else if(param1 == 777)
            {
               _loc2_ = this.fx1_tremolo_depth;
            }
            else if(param1 == 778)
            {
               _loc2_ = this.fx1_tremolo_level;
            }
            else if(param1 == 780)
            {
               _loc2_ = this.fx1_rotary_speed_select;
            }
            else if(param1 == 781)
            {
               _loc2_ = this.fx1_rotary_rate_slow;
            }
            else if(param1 == 782)
            {
               _loc2_ = this.fx1_rotary_rate_fast;
            }
            else if(param1 == 783)
            {
               _loc2_ = this.fx1_rotary_rise_time;
            }
            else if(param1 == 784)
            {
               _loc2_ = this.fx1_rotary_fall_time;
            }
            else if(param1 == 785)
            {
               _loc2_ = this.fx1_rotary_depth;
            }
            else if(param1 == 786)
            {
               _loc2_ = this.fx1_rotary_level;
            }
            else if(param1 == 788)
            {
               _loc2_ = this.fx1_uni_v_rate;
            }
            else if(param1 == 789)
            {
               _loc2_ = this.fx1_uni_v_depth;
            }
            else if(param1 == 790)
            {
               _loc2_ = this.fx1_uni_v_level;
            }
            else if(param1 == 792)
            {
               _loc2_ = this.fx1_pan_type;
            }
            else if(param1 == 793)
            {
               _loc2_ = this.fx1_pan_pos;
            }
            else if(param1 == 794)
            {
               _loc2_ = this.fx1_pan_wave_shape;
            }
            else if(param1 == 795)
            {
               _loc2_ = this.fx1_pan_rate;
            }
            else if(param1 == 796)
            {
               _loc2_ = this.fx1_pan_depth;
            }
            else if(param1 == 797)
            {
               _loc2_ = this.fx1_pan_level;
            }
            else if(param1 == 799)
            {
               _loc2_ = this.fx1_slicer_pattern;
            }
            else if(param1 == 800)
            {
               _loc2_ = this.fx1_slicer_rate;
            }
            else if(param1 == 801)
            {
               _loc2_ = this.fx1_slicer_trigger_sens;
            }
            else if(param1 == 802)
            {
               _loc2_ = this.fx1_slicer_effect_level;
            }
            else if(param1 == 803)
            {
               _loc2_ = this.fx1_slicer_direct_mix;
            }
            else if(param1 == 805)
            {
               _loc2_ = this.fx1_vibrato_rate;
            }
            else if(param1 == 806)
            {
               _loc2_ = this.fx1_vibrato_depth;
            }
            else if(param1 == 807)
            {
               _loc2_ = this.fx1_vibrato_trigger;
            }
            else if(param1 == 808)
            {
               _loc2_ = this.fx1_vibrato_rise_time;
            }
            else if(param1 == 809)
            {
               _loc2_ = this.fx1_vibrato_level;
            }
            else if(param1 == 811)
            {
               _loc2_ = this.fx1_ring_mod_mode;
            }
            else if(param1 == 812)
            {
               _loc2_ = this.fx1_ring_mod_freq;
            }
            else if(param1 == 813)
            {
               _loc2_ = this.fx1_ring_mod_effect_level;
            }
            else if(param1 == 814)
            {
               _loc2_ = this.fx1_ring_mod_direct_mix;
            }
            else if(param1 == 816)
            {
               _loc2_ = this.fx1_humanizer_mode;
            }
            else if(param1 == 817)
            {
               _loc2_ = this.fx1_humanizer_vowel1;
            }
            else if(param1 == 818)
            {
               _loc2_ = this.fx1_humanizer_vowel2;
            }
            else if(param1 == 819)
            {
               _loc2_ = this.fx1_humanizer_sens;
            }
            else if(param1 == 820)
            {
               _loc2_ = this.fx1_humanizer_rate;
            }
            else if(param1 == 821)
            {
               _loc2_ = this.fx1_humanizer_depth;
            }
            else if(param1 == 822)
            {
               _loc2_ = this.fx1_humanizer_manual;
            }
            else if(param1 == 823)
            {
               _loc2_ = this.fx1_humanizer_level;
            }
            else if(param1 == 825)
            {
               _loc2_ = this.fx1_2x2_chorus_xover_freq;
            }
            else if(param1 == 826)
            {
               _loc2_ = this.fx1_2x2_chorus_low_rate;
            }
            else if(param1 == 827)
            {
               _loc2_ = this.fx1_2x2_chorus_low_depth;
            }
            else if(param1 == 828)
            {
               _loc2_ = this.fx1_2x2_chorus_low_pre_delay;
            }
            else if(param1 == 829)
            {
               _loc2_ = this.fx1_2x2_chorus_low_level;
            }
            else if(param1 == 830)
            {
               _loc2_ = this.fx1_2x2_chorus_high_rate;
            }
            else if(param1 == 831)
            {
               _loc2_ = this.fx1_2x2_chorus_high_depth;
            }
            else if(param1 == 832)
            {
               _loc2_ = this.fx1_2x2_chorus_high_pre_delay;
            }
            else if(param1 == 833)
            {
               _loc2_ = this.fx1_2x2_chorus_high_level;
            }
            else if(param1 == 834)
            {
               _loc2_ = this.fx1_2x2_chorus_direct_level;
            }
            else if(param1 == 835)
            {
               _loc2_ = this.fx1_sub_delay_type;
            }
            else if(param1 == 836)
            {
               _loc2_ = this.fx1_sub_delay_time_h;
            }
            else if(param1 == 837)
            {
               _loc2_ = this.fx1_sub_delay_time_l;
            }
            else if(param1 == 838)
            {
               _loc2_ = this.fx1_sub_delay_f_back;
            }
            else if(param1 == 839)
            {
               _loc2_ = this.fx1_sub_delay_high_cut;
            }
            else if(param1 == 840)
            {
               _loc2_ = this.fx1_sub_delay_effect_level;
            }
            else if(param1 == 841)
            {
               _loc2_ = this.fx1_sub_delay_direct_mix;
            }
            else if(param1 == 842)
            {
               _loc2_ = this.fx1_sub_delay_tap_time;
            }
            else if(param1 == 844)
            {
               _loc2_ = this.fx2_on_off;
            }
            else if(param1 == 845)
            {
               _loc2_ = this.fx2_fx_type;
            }
            else if(param1 == 846)
            {
               _loc2_ = this.fx2_sub_od_ds_type;
            }
            else if(param1 == 847)
            {
               _loc2_ = this.fx2_sub_od_ds_drive;
            }
            else if(param1 == 848)
            {
               _loc2_ = this.fx2_sub_od_ds_bottom;
            }
            else if(param1 == 849)
            {
               _loc2_ = this.fx2_sub_od_ds_tone;
            }
            else if(param1 == 850)
            {
               _loc2_ = this.fx2_sub_od_ds_solo_sw;
            }
            else if(param1 == 851)
            {
               _loc2_ = this.fx2_sub_od_ds_solo_level;
            }
            else if(param1 == 852)
            {
               _loc2_ = this.fx2_sub_od_ds_effect_level;
            }
            else if(param1 == 853)
            {
               _loc2_ = this.fx2_sub_od_ds_direct_mix;
            }
            else if(param1 == 856)
            {
               _loc2_ = this.fx2_t_wah_mode;
            }
            else if(param1 == 857)
            {
               _loc2_ = this.fx2_t_wah_polar;
            }
            else if(param1 == 858)
            {
               _loc2_ = this.fx2_t_wah_sens;
            }
            else if(param1 == 859)
            {
               _loc2_ = this.fx2_t_wah_freq;
            }
            else if(param1 == 860)
            {
               _loc2_ = this.fx2_t_wah_peak;
            }
            else if(param1 == 861)
            {
               _loc2_ = this.fx2_t_wah_direct_mix;
            }
            else if(param1 == 862)
            {
               _loc2_ = this.fx2_t_wah_effect_level;
            }
            else if(param1 == 864)
            {
               _loc2_ = this.fx2_auto_wah_mode;
            }
            else if(param1 == 865)
            {
               _loc2_ = this.fx2_auto_wah_freq;
            }
            else if(param1 == 866)
            {
               _loc2_ = this.fx2_auto_wah_peak;
            }
            else if(param1 == 867)
            {
               _loc2_ = this.fx2_auto_wah_rate;
            }
            else if(param1 == 868)
            {
               _loc2_ = this.fx2_auto_wah_depth;
            }
            else if(param1 == 869)
            {
               _loc2_ = this.fx2_auto_wah_direct_mix;
            }
            else if(param1 == 870)
            {
               _loc2_ = this.fx2_auto_wah_effect_level;
            }
            else if(param1 == 872)
            {
               _loc2_ = this.fx2_sub_wah_type;
            }
            else if(param1 == 873)
            {
               _loc2_ = this.fx2_sub_wah_pedal_pos;
            }
            else if(param1 == 874)
            {
               _loc2_ = this.fx2_sub_wah_pedal_min;
            }
            else if(param1 == 875)
            {
               _loc2_ = this.fx2_sub_wah_pedal_max;
            }
            else if(param1 == 876)
            {
               _loc2_ = this.fx2_sub_wah_effect_level;
            }
            else if(param1 == 877)
            {
               _loc2_ = this.fx2_sub_wah_direct_mix;
            }
            else if(param1 == 879)
            {
               _loc2_ = this.fx2_adv_comp_type;
            }
            else if(param1 == 880)
            {
               _loc2_ = this.fx2_adv_comp_sustain;
            }
            else if(param1 == 881)
            {
               _loc2_ = this.fx2_adv_comp_attack;
            }
            else if(param1 == 882)
            {
               _loc2_ = this.fx2_adv_comp_tone;
            }
            else if(param1 == 883)
            {
               _loc2_ = this.fx2_adv_comp_level;
            }
            else if(param1 == 885)
            {
               _loc2_ = this.fx2_limiter_type;
            }
            else if(param1 == 886)
            {
               _loc2_ = this.fx2_limiter_attack;
            }
            else if(param1 == 887)
            {
               _loc2_ = this.fx2_limiter_thresh;
            }
            else if(param1 == 888)
            {
               _loc2_ = this.fx2_limiter_ratio;
            }
            else if(param1 == 889)
            {
               _loc2_ = this.fx2_limiter_release;
            }
            else if(param1 == 890)
            {
               _loc2_ = this.fx2_limiter_level;
            }
            else if(param1 == 892)
            {
               _loc2_ = this.fx2_graphic_eq_31hz;
            }
            else if(param1 == 893)
            {
               _loc2_ = this.fx2_graphic_eq_62hz;
            }
            else if(param1 == 894)
            {
               _loc2_ = this.fx2_graphic_eq_125hz;
            }
            else if(param1 == 895)
            {
               _loc2_ = this.fx2_graphic_eq_250hz;
            }
         }
         else if(param1 >= 1024 && param1 < 1280)
         {
            if(param1 == 1024)
            {
               _loc2_ = this.fx2_graphic_eq_500hz;
            }
            else if(param1 == 1025)
            {
               _loc2_ = this.fx2_graphic_eq_1khz;
            }
            else if(param1 == 1026)
            {
               _loc2_ = this.fx2_graphic_eq_2khz;
            }
            else if(param1 == 1027)
            {
               _loc2_ = this.fx2_graphic_eq_4khz;
            }
            else if(param1 == 1028)
            {
               _loc2_ = this.fx2_graphic_eq_8khz;
            }
            else if(param1 == 1029)
            {
               _loc2_ = this.fx2_graphic_eq_16khz;
            }
            else if(param1 == 1030)
            {
               _loc2_ = this.fx2_graphic_eq_level;
            }
            else if(param1 == 1032)
            {
               _loc2_ = this.fx2_parametric_eq_low_cut;
            }
            else if(param1 == 1033)
            {
               _loc2_ = this.fx2_parametric_eq_low_gain;
            }
            else if(param1 == 1034)
            {
               _loc2_ = this.fx2_parametric_eq_low_mid_freq;
            }
            else if(param1 == 1035)
            {
               _loc2_ = this.fx2_parametric_eq_low_mid_q;
            }
            else if(param1 == 1036)
            {
               _loc2_ = this.fx2_parametric_eq_low_mid_gain;
            }
            else if(param1 == 1037)
            {
               _loc2_ = this.fx2_parametric_eq_high_mid_freq;
            }
            else if(param1 == 1038)
            {
               _loc2_ = this.fx2_parametric_eq_high_mid_q;
            }
            else if(param1 == 1039)
            {
               _loc2_ = this.fx2_parametric_eq_high_mid_gain;
            }
            else if(param1 == 1040)
            {
               _loc2_ = this.fx2_parametric_eq_high_gain;
            }
            else if(param1 == 1041)
            {
               _loc2_ = this.fx2_parametric_eq_high_cut;
            }
            else if(param1 == 1042)
            {
               _loc2_ = this.fx2_parametric_eq_level;
            }
            else if(param1 == 1044)
            {
               _loc2_ = this.fx2_tone_modify_type;
            }
            else if(param1 == 1045)
            {
               _loc2_ = this.fx2_tone_modify_reso;
            }
            else if(param1 == 1046)
            {
               _loc2_ = this.fx2_tone_modify_low;
            }
            else if(param1 == 1047)
            {
               _loc2_ = this.fx2_tone_modify_high;
            }
            else if(param1 == 1048)
            {
               _loc2_ = this.fx2_tone_modify_level;
            }
            else if(param1 == 1050)
            {
               _loc2_ = this.fx2_guitar_sim_type;
            }
            else if(param1 == 1051)
            {
               _loc2_ = this.fx2_guitar_sim_low;
            }
            else if(param1 == 1052)
            {
               _loc2_ = this.fx2_guitar_sim_high;
            }
            else if(param1 == 1053)
            {
               _loc2_ = this.fx2_guitar_sim_level;
            }
            else if(param1 == 1054)
            {
               _loc2_ = this.fx2_guitar_sim_body;
            }
            else if(param1 == 1056)
            {
               _loc2_ = this.fx2_slow_gear_sens;
            }
            else if(param1 == 1057)
            {
               _loc2_ = this.fx2_slow_gear_rise_time;
            }
            else if(param1 == 1058)
            {
               _loc2_ = this.fx2_slow_gear_level;
            }
            else if(param1 == 1060)
            {
               _loc2_ = this.fx2_defretter_tone;
            }
            else if(param1 == 1061)
            {
               _loc2_ = this.fx2_defretter_sens;
            }
            else if(param1 == 1062)
            {
               _loc2_ = this.fx2_defretter_attack;
            }
            else if(param1 == 1063)
            {
               _loc2_ = this.fx2_defretter_depth;
            }
            else if(param1 == 1064)
            {
               _loc2_ = this.fx2_defretter_reso;
            }
            else if(param1 == 1065)
            {
               _loc2_ = this.fx2_defretter_effect_level;
            }
            else if(param1 == 1066)
            {
               _loc2_ = this.fx2_defretter_direct_mix;
            }
            else if(param1 == 1068)
            {
               _loc2_ = this.fx2_wave_synth_wave;
            }
            else if(param1 == 1069)
            {
               _loc2_ = this.fx2_wave_synth_cutoff;
            }
            else if(param1 == 1070)
            {
               _loc2_ = this.fx2_wave_synth_reso;
            }
            else if(param1 == 1071)
            {
               _loc2_ = this.fx2_wave_synth_filter_sens;
            }
            else if(param1 == 1072)
            {
               _loc2_ = this.fx2_wave_synth_filter_decay;
            }
            else if(param1 == 1073)
            {
               _loc2_ = this.fx2_wave_synth_filter_depth;
            }
            else if(param1 == 1074)
            {
               _loc2_ = this.fx2_wave_synth_synth_level;
            }
            else if(param1 == 1075)
            {
               _loc2_ = this.fx2_wave_synth_direct_mix;
            }
            else if(param1 == 1077)
            {
               _loc2_ = this.fx2_sitar_sim_tone;
            }
            else if(param1 == 1078)
            {
               _loc2_ = this.fx2_sitar_sim_sens;
            }
            else if(param1 == 1079)
            {
               _loc2_ = this.fx2_sitar_sim_depth;
            }
            else if(param1 == 1080)
            {
               _loc2_ = this.fx2_sitar_sim_reso;
            }
            else if(param1 == 1081)
            {
               _loc2_ = this.fx2_sitar_sim_buzz;
            }
            else if(param1 == 1082)
            {
               _loc2_ = this.fx2_sitar_sim_effect_level;
            }
            else if(param1 == 1083)
            {
               _loc2_ = this.fx2_sitar_sim_direct_mix;
            }
            else if(param1 == 1085)
            {
               _loc2_ = this.fx2_octave_range;
            }
            else if(param1 == 1086)
            {
               _loc2_ = this.fx2_octave_level;
            }
            else if(param1 == 1087)
            {
               _loc2_ = this.fx2_octave_direct_mix;
            }
            else if(param1 == 1089)
            {
               _loc2_ = this.fx2_pitch_shifter_voice;
            }
            else if(param1 == 1090)
            {
               _loc2_ = this.fx2_pitch_shifter_ps1mode;
            }
            else if(param1 == 1091)
            {
               _loc2_ = this.fx2_pitch_shifter_ps1pitch;
            }
            else if(param1 == 1092)
            {
               _loc2_ = this.fx2_pitch_shifter_ps1fine;
            }
            else if(param1 == 1093)
            {
               _loc2_ = this.fx2_pitch_shifter_ps1pre_dly_h;
            }
            else if(param1 == 1094)
            {
               _loc2_ = this.fx2_pitch_shifter_ps1pre_dly_l;
            }
            else if(param1 == 1095)
            {
               _loc2_ = this.fx2_pitch_shifter_ps1level;
            }
            else if(param1 == 1096)
            {
               _loc2_ = this.fx2_pitch_shifter_ps2mode;
            }
            else if(param1 == 1097)
            {
               _loc2_ = this.fx2_pitch_shifter_ps2pitch;
            }
            else if(param1 == 1098)
            {
               _loc2_ = this.fx2_pitch_shifter_ps2fine;
            }
            else if(param1 == 1099)
            {
               _loc2_ = this.fx2_pitch_shifter_ps2pre_dly_h;
            }
            else if(param1 == 1100)
            {
               _loc2_ = this.fx2_pitch_shifter_ps2pre_dly_l;
            }
            else if(param1 == 1101)
            {
               _loc2_ = this.fx2_pitch_shifter_ps2level;
            }
            else if(param1 == 1102)
            {
               _loc2_ = this.fx2_pitch_shifter_ps1f_back;
            }
            else if(param1 == 1103)
            {
               _loc2_ = this.fx2_pitch_shifter_direct_mix;
            }
            else if(param1 == 1105)
            {
               _loc2_ = this.fx2_harmonist_voice;
            }
            else if(param1 == 1106)
            {
               _loc2_ = this.fx2_harmonist_hr1harm;
            }
            else if(param1 == 1107)
            {
               _loc2_ = this.fx2_harmonist_hr1pre_dly_h;
            }
            else if(param1 == 1108)
            {
               _loc2_ = this.fx2_harmonist_hr1pre_dly_l;
            }
            else if(param1 == 1109)
            {
               _loc2_ = this.fx2_harmonist_hr1level;
            }
            else if(param1 == 1110)
            {
               _loc2_ = this.fx2_harmonist_hr2harm;
            }
            else if(param1 == 1111)
            {
               _loc2_ = this.fx2_harmonist_hr2pre_dly_h;
            }
            else if(param1 == 1112)
            {
               _loc2_ = this.fx2_harmonist_hr2pre_dly_l;
            }
            else if(param1 == 1113)
            {
               _loc2_ = this.fx2_harmonist_hr2level;
            }
            else if(param1 == 1114)
            {
               _loc2_ = this.fx2_harmonist_hr1f_back;
            }
            else if(param1 == 1115)
            {
               _loc2_ = this.fx2_harmonist_direct_mix;
            }
            else if(param1 == 1116)
            {
               _loc2_ = this.fx2_harmonist_hr1c;
            }
            else if(param1 == 1117)
            {
               _loc2_ = this.fx2_harmonist_hr1db;
            }
            else if(param1 == 1118)
            {
               _loc2_ = this.fx2_harmonist_hr1d;
            }
            else if(param1 == 1119)
            {
               _loc2_ = this.fx2_harmonist_hr1eb;
            }
            else if(param1 == 1120)
            {
               _loc2_ = this.fx2_harmonist_hr1e;
            }
            else if(param1 == 1121)
            {
               _loc2_ = this.fx2_harmonist_hr1f;
            }
            else if(param1 == 1122)
            {
               _loc2_ = this.fx2_harmonist_hr1f_s;
            }
            else if(param1 == 1123)
            {
               _loc2_ = this.fx2_harmonist_hr1g;
            }
            else if(param1 == 1124)
            {
               _loc2_ = this.fx2_harmonist_hr1ab;
            }
            else if(param1 == 1125)
            {
               _loc2_ = this.fx2_harmonist_hr1a;
            }
            else if(param1 == 1126)
            {
               _loc2_ = this.fx2_harmonist_hr1bb;
            }
            else if(param1 == 1127)
            {
               _loc2_ = this.fx2_harmonist_hr1b;
            }
            else if(param1 == 1128)
            {
               _loc2_ = this.fx2_harmonist_hr2c;
            }
            else if(param1 == 1129)
            {
               _loc2_ = this.fx2_harmonist_hr2db;
            }
            else if(param1 == 1130)
            {
               _loc2_ = this.fx2_harmonist_hr2d;
            }
            else if(param1 == 1131)
            {
               _loc2_ = this.fx2_harmonist_hr2eb;
            }
            else if(param1 == 1132)
            {
               _loc2_ = this.fx2_harmonist_hr2e;
            }
            else if(param1 == 1133)
            {
               _loc2_ = this.fx2_harmonist_hr2f;
            }
            else if(param1 == 1134)
            {
               _loc2_ = this.fx2_harmonist_hr2f_s;
            }
            else if(param1 == 1135)
            {
               _loc2_ = this.fx2_harmonist_hr2g;
            }
            else if(param1 == 1136)
            {
               _loc2_ = this.fx2_harmonist_hr2ab;
            }
            else if(param1 == 1137)
            {
               _loc2_ = this.fx2_harmonist_hr2a;
            }
            else if(param1 == 1138)
            {
               _loc2_ = this.fx2_harmonist_hr2bb;
            }
            else if(param1 == 1139)
            {
               _loc2_ = this.fx2_harmonist_hr2b;
            }
            else if(param1 == 1141)
            {
               _loc2_ = this.fx2_sound_hold_hold;
            }
            else if(param1 == 1142)
            {
               _loc2_ = this.fx2_sound_hold_rise_time;
            }
            else if(param1 == 1143)
            {
               _loc2_ = this.fx2_sound_hold_effect_level;
            }
            else if(param1 == 1145)
            {
               _loc2_ = this.fx2_ac_processor_type;
            }
            else if(param1 == 1146)
            {
               _loc2_ = this.fx2_ac_processor_bass;
            }
            else if(param1 == 1147)
            {
               _loc2_ = this.fx2_ac_processor_middle;
            }
            else if(param1 == 1148)
            {
               _loc2_ = this.fx2_ac_processor_middle_freq;
            }
            else if(param1 == 1149)
            {
               _loc2_ = this.fx2_ac_processor_treble;
            }
            else if(param1 == 1150)
            {
               _loc2_ = this.fx2_ac_processor_presence;
            }
            else if(param1 == 1151)
            {
               _loc2_ = this.fx2_ac_processor_level;
            }
         }
         else if(param1 >= 1280 && param1 < 1536)
         {
            if(param1 == 1281)
            {
               _loc2_ = this.fx2_phaser_type;
            }
            else if(param1 == 1282)
            {
               _loc2_ = this.fx2_phaser_rate;
            }
            else if(param1 == 1283)
            {
               _loc2_ = this.fx2_phaser_depth;
            }
            else if(param1 == 1284)
            {
               _loc2_ = this.fx2_phaser_manual;
            }
            else if(param1 == 1285)
            {
               _loc2_ = this.fx2_phaser_reso;
            }
            else if(param1 == 1286)
            {
               _loc2_ = this.fx2_phaser_step_rate;
            }
            else if(param1 == 1287)
            {
               _loc2_ = this.fx2_phaser_effect_level;
            }
            else if(param1 == 1288)
            {
               _loc2_ = this.fx2_phaser_direct_mix;
            }
            else if(param1 == 1290)
            {
               _loc2_ = this.fx2_flanger_rate;
            }
            else if(param1 == 1291)
            {
               _loc2_ = this.fx2_flanger_depth;
            }
            else if(param1 == 1292)
            {
               _loc2_ = this.fx2_flanger_manual;
            }
            else if(param1 == 1293)
            {
               _loc2_ = this.fx2_flanger_reso;
            }
            else if(param1 == 1294)
            {
               _loc2_ = this.fx2_flanger_separation;
            }
            else if(param1 == 1295)
            {
               _loc2_ = this.fx2_flanger_low_cut;
            }
            else if(param1 == 1296)
            {
               _loc2_ = this.fx2_flanger_effect_level;
            }
            else if(param1 == 1297)
            {
               _loc2_ = this.fx2_flanger_direct_mix;
            }
            else if(param1 == 1299)
            {
               _loc2_ = this.fx2_tremolo_wave_shape;
            }
            else if(param1 == 1300)
            {
               _loc2_ = this.fx2_tremolo_rate;
            }
            else if(param1 == 1301)
            {
               _loc2_ = this.fx2_tremolo_depth;
            }
            else if(param1 == 1302)
            {
               _loc2_ = this.fx2_tremolo_level;
            }
            else if(param1 == 1304)
            {
               _loc2_ = this.fx2_rotary_speed_select;
            }
            else if(param1 == 1305)
            {
               _loc2_ = this.fx2_rotary_rate_slow;
            }
            else if(param1 == 1306)
            {
               _loc2_ = this.fx2_rotary_rate_fast;
            }
            else if(param1 == 1307)
            {
               _loc2_ = this.fx2_rotary_rise_time;
            }
            else if(param1 == 1308)
            {
               _loc2_ = this.fx2_rotary_fall_time;
            }
            else if(param1 == 1309)
            {
               _loc2_ = this.fx2_rotary_depth;
            }
            else if(param1 == 1310)
            {
               _loc2_ = this.fx2_rotary_level;
            }
            else if(param1 == 1312)
            {
               _loc2_ = this.fx2_uni_v_rate;
            }
            else if(param1 == 1313)
            {
               _loc2_ = this.fx2_uni_v_depth;
            }
            else if(param1 == 1314)
            {
               _loc2_ = this.fx2_uni_v_level;
            }
            else if(param1 == 1316)
            {
               _loc2_ = this.fx2_pan_type;
            }
            else if(param1 == 1317)
            {
               _loc2_ = this.fx2_pan_pos;
            }
            else if(param1 == 1318)
            {
               _loc2_ = this.fx2_pan_wave_shape;
            }
            else if(param1 == 1319)
            {
               _loc2_ = this.fx2_pan_rate;
            }
            else if(param1 == 1320)
            {
               _loc2_ = this.fx2_pan_depth;
            }
            else if(param1 == 1321)
            {
               _loc2_ = this.fx2_pan_level;
            }
            else if(param1 == 1323)
            {
               _loc2_ = this.fx2_slicer_pattern;
            }
            else if(param1 == 1324)
            {
               _loc2_ = this.fx2_slicer_rate;
            }
            else if(param1 == 1325)
            {
               _loc2_ = this.fx2_slicer_trigger_sens;
            }
            else if(param1 == 1326)
            {
               _loc2_ = this.fx2_slicer_effect_level;
            }
            else if(param1 == 1327)
            {
               _loc2_ = this.fx2_slicer_direct_mix;
            }
            else if(param1 == 1329)
            {
               _loc2_ = this.fx2_vibrato_rate;
            }
            else if(param1 == 1330)
            {
               _loc2_ = this.fx2_vibrato_depth;
            }
            else if(param1 == 1331)
            {
               _loc2_ = this.fx2_vibrato_trigger;
            }
            else if(param1 == 1332)
            {
               _loc2_ = this.fx2_vibrato_rise_time;
            }
            else if(param1 == 1333)
            {
               _loc2_ = this.fx2_vibrato_level;
            }
            else if(param1 == 1335)
            {
               _loc2_ = this.fx2_ring_mod_mode;
            }
            else if(param1 == 1336)
            {
               _loc2_ = this.fx2_ring_mod_freq;
            }
            else if(param1 == 1337)
            {
               _loc2_ = this.fx2_ring_mod_effect_level;
            }
            else if(param1 == 1338)
            {
               _loc2_ = this.fx2_ring_mod_direct_mix;
            }
            else if(param1 == 1340)
            {
               _loc2_ = this.fx2_humanizer_mode;
            }
            else if(param1 == 1341)
            {
               _loc2_ = this.fx2_humanizer_vowel1;
            }
            else if(param1 == 1342)
            {
               _loc2_ = this.fx2_humanizer_vowel2;
            }
            else if(param1 == 1343)
            {
               _loc2_ = this.fx2_humanizer_sens;
            }
            else if(param1 == 1344)
            {
               _loc2_ = this.fx2_humanizer_rate;
            }
            else if(param1 == 1345)
            {
               _loc2_ = this.fx2_humanizer_depth;
            }
            else if(param1 == 1346)
            {
               _loc2_ = this.fx2_humanizer_manual;
            }
            else if(param1 == 1347)
            {
               _loc2_ = this.fx2_humanizer_level;
            }
            else if(param1 == 1349)
            {
               _loc2_ = this.fx2_2x2_chorus_xover_freq;
            }
            else if(param1 == 1350)
            {
               _loc2_ = this.fx2_2x2_chorus_low_rate;
            }
            else if(param1 == 1351)
            {
               _loc2_ = this.fx2_2x2_chorus_low_depth;
            }
            else if(param1 == 1352)
            {
               _loc2_ = this.fx2_2x2_chorus_low_pre_delay;
            }
            else if(param1 == 1353)
            {
               _loc2_ = this.fx2_2x2_chorus_low_level;
            }
            else if(param1 == 1354)
            {
               _loc2_ = this.fx2_2x2_chorus_high_rate;
            }
            else if(param1 == 1355)
            {
               _loc2_ = this.fx2_2x2_chorus_high_depth;
            }
            else if(param1 == 1356)
            {
               _loc2_ = this.fx2_2x2_chorus_high_pre_delay;
            }
            else if(param1 == 1357)
            {
               _loc2_ = this.fx2_2x2_chorus_high_level;
            }
            else if(param1 == 1358)
            {
               _loc2_ = this.fx2_2x2_chorus_direct_level;
            }
            else if(param1 == 1359)
            {
               _loc2_ = this.fx2_sub_delay_type;
            }
            else if(param1 == 1360)
            {
               _loc2_ = this.fx2_sub_delay_time_h;
            }
            else if(param1 == 1361)
            {
               _loc2_ = this.fx2_sub_delay_time_l;
            }
            else if(param1 == 1362)
            {
               _loc2_ = this.fx2_sub_delay_f_back;
            }
            else if(param1 == 1363)
            {
               _loc2_ = this.fx2_sub_delay_high_cut;
            }
            else if(param1 == 1364)
            {
               _loc2_ = this.fx2_sub_delay_effect_level;
            }
            else if(param1 == 1365)
            {
               _loc2_ = this.fx2_sub_delay_direct_mix;
            }
            else if(param1 == 1366)
            {
               _loc2_ = this.fx2_sub_delay_tap_time;
            }
            else if(param1 == 1376)
            {
               _loc2_ = this.delay_on_off;
            }
            else if(param1 == 1377)
            {
               _loc2_ = this.delay_type;
            }
            else if(param1 == 1378)
            {
               _loc2_ = this.delay_delay_time_h;
            }
            else if(param1 == 1379)
            {
               _loc2_ = this.delay_delay_time_l;
            }
            else if(param1 == 1380)
            {
               _loc2_ = this.delay_f_back;
            }
            else if(param1 == 1381)
            {
               _loc2_ = this.delay_high_cut;
            }
            else if(param1 == 1382)
            {
               _loc2_ = this.delay_effect_level;
            }
            else if(param1 == 1383)
            {
               _loc2_ = this.delay_direct_mix;
            }
            else if(param1 == 1384)
            {
               _loc2_ = this.delay_tap_time;
            }
            else if(param1 == 1385)
            {
               _loc2_ = this.delay_d1_time_h;
            }
            else if(param1 == 1386)
            {
               _loc2_ = this.delay_d1_time_l;
            }
            else if(param1 == 1387)
            {
               _loc2_ = this.delay_d1_f_back;
            }
            else if(param1 == 1388)
            {
               _loc2_ = this.delay_d1_hi_cut;
            }
            else if(param1 == 1389)
            {
               _loc2_ = this.delay_d1_level;
            }
            else if(param1 == 1390)
            {
               _loc2_ = this.delay_d2_time_h;
            }
            else if(param1 == 1391)
            {
               _loc2_ = this.delay_d2_time_l;
            }
            else if(param1 == 1392)
            {
               _loc2_ = this.delay_d2_f_back;
            }
            else if(param1 == 1393)
            {
               _loc2_ = this.delay_d2_hi_cut;
            }
            else if(param1 == 1394)
            {
               _loc2_ = this.delay_d2_level;
            }
            else if(param1 == 1395)
            {
               _loc2_ = this.delay_mod_rate;
            }
            else if(param1 == 1396)
            {
               _loc2_ = this.delay_mod_depth;
            }
         }
         else if(param1 >= 1536 && param1 < 1792)
         {
            if(param1 == 1536)
            {
               _loc2_ = this.chorus_on_off;
            }
            else if(param1 == 1537)
            {
               _loc2_ = this.chorus_mode;
            }
            else if(param1 == 1538)
            {
               _loc2_ = this.chorus_rate;
            }
            else if(param1 == 1539)
            {
               _loc2_ = this.chorus_depth;
            }
            else if(param1 == 1540)
            {
               _loc2_ = this.chorus_pre_delay;
            }
            else if(param1 == 1541)
            {
               _loc2_ = this.chorus_low_cut;
            }
            else if(param1 == 1542)
            {
               _loc2_ = this.chorus_high_cut;
            }
            else if(param1 == 1543)
            {
               _loc2_ = this.chorus_effect_level;
            }
            else if(param1 == 1544)
            {
               _loc2_ = this.chorus_direct_level;
            }
            else if(param1 == 1552)
            {
               _loc2_ = this.reverb_on_off;
            }
            else if(param1 == 1553)
            {
               _loc2_ = this.reverb_type;
            }
            else if(param1 == 1554)
            {
               _loc2_ = this.reverb_time;
            }
            else if(param1 == 1555)
            {
               _loc2_ = this.reverb_pre_delay_h;
            }
            else if(param1 == 1556)
            {
               _loc2_ = this.reverb_pre_delay_l;
            }
            else if(param1 == 1557)
            {
               _loc2_ = this.reverb_low_cut;
            }
            else if(param1 == 1558)
            {
               _loc2_ = this.reverb_high_cut;
            }
            else if(param1 == 1559)
            {
               _loc2_ = this.reverb_density;
            }
            else if(param1 == 1560)
            {
               _loc2_ = this.reverb_effect_level;
            }
            else if(param1 == 1561)
            {
               _loc2_ = this.reverb_direct_mix;
            }
            else if(param1 == 1562)
            {
               _loc2_ = this.reverb_spring_sens;
            }
            else if(param1 == 1568)
            {
               _loc2_ = this.pedal_fx_on_off;
            }
            else if(param1 == 1570)
            {
               _loc2_ = this.pedal_fx_pedal_bend_pitch;
            }
            else if(param1 == 1571)
            {
               _loc2_ = this.pedal_fx_pedal_bend_position;
            }
            else if(param1 == 1572)
            {
               _loc2_ = this.pedal_fx_pedal_bend_effect_level;
            }
            else if(param1 == 1573)
            {
               _loc2_ = this.pedal_fx_pedal_bend_direct_mix;
            }
            else if(param1 == 1574)
            {
               _loc2_ = this.pedal_fx_wah_type;
            }
            else if(param1 == 1575)
            {
               _loc2_ = this.pedal_fx_wah_position;
            }
            else if(param1 == 1576)
            {
               _loc2_ = this.pedal_fx_wah_pedal_min;
            }
            else if(param1 == 1577)
            {
               _loc2_ = this.pedal_fx_wah_pedal_max;
            }
            else if(param1 == 1578)
            {
               _loc2_ = this.pedal_fx_wah_effect_level;
            }
            else if(param1 == 1579)
            {
               _loc2_ = this.pedal_fx_wah_direct_mix;
            }
            else if(param1 == 1584)
            {
               _loc2_ = this.foot_volume_volume_curve;
            }
            else if(param1 == 1585)
            {
               _loc2_ = this.foot_volume_volume_min;
            }
            else if(param1 == 1586)
            {
               _loc2_ = this.foot_volume_volume_max;
            }
            else if(param1 == 1587)
            {
               _loc2_ = this.foot_volume_level;
            }
            else if(param1 == 1600)
            {
               _loc2_ = this.divider_mode;
            }
            else if(param1 == 1601)
            {
               _loc2_ = this.divider_ch_select;
            }
            else if(param1 == 1602)
            {
               _loc2_ = this.divider_ch_a_dynamic;
            }
            else if(param1 == 1603)
            {
               _loc2_ = this.divider_ch_a_dynamic_sens;
            }
            else if(param1 == 1604)
            {
               _loc2_ = this.divider_ch_a_filter;
            }
            else if(param1 == 1605)
            {
               _loc2_ = this.divider_ch_a_cutoff_freq;
            }
            else if(param1 == 1606)
            {
               _loc2_ = this.divider_ch_b_dynamic;
            }
            else if(param1 == 1607)
            {
               _loc2_ = this.divider_ch_b_dynamic_sens;
            }
            else if(param1 == 1608)
            {
               _loc2_ = this.divider_ch_b_filter;
            }
            else if(param1 == 1609)
            {
               _loc2_ = this.divider_ch_b_cutoff_freq;
            }
            else if(param1 == 1616)
            {
               _loc2_ = this.mixer_mode;
            }
            else if(param1 == 1617)
            {
               _loc2_ = this.mixer_ch_a_b_balance;
            }
            else if(param1 == 1618)
            {
               _loc2_ = this.mixer_spread;
            }
            else if(param1 == 1621)
            {
               _loc2_ = this.send_return_on_off;
            }
            else if(param1 == 1622)
            {
               _loc2_ = this.send_return_mode;
            }
            else if(param1 == 1623)
            {
               _loc2_ = this.send_return_send_level;
            }
            else if(param1 == 1624)
            {
               _loc2_ = this.send_return_return_level;
            }
            else if(param1 == 1625)
            {
               _loc2_ = this.send_return_adjust;
            }
            else if(param1 == 1632)
            {
               _loc2_ = this.amp_control;
            }
            else if(param1 == 1635)
            {
               _loc2_ = this.ns1_on_off;
            }
            else if(param1 == 1636)
            {
               _loc2_ = this.ns1_threshold;
            }
            else if(param1 == 1637)
            {
               _loc2_ = this.ns1_release;
            }
            else if(param1 == 1638)
            {
               _loc2_ = this.ns1_detect;
            }
            else if(param1 == 1640)
            {
               _loc2_ = this.ns2_on_off;
            }
            else if(param1 == 1641)
            {
               _loc2_ = this.ns2_threshold;
            }
            else if(param1 == 1642)
            {
               _loc2_ = this.ns2_release;
            }
            else if(param1 == 1643)
            {
               _loc2_ = this.ns2_detect;
            }
            else if(param1 == 1648)
            {
               _loc2_ = this.accel_fx_type;
            }
            else if(param1 == 1649)
            {
               _loc2_ = this.accel_fx_s_bend_pitch;
            }
            else if(param1 == 1650)
            {
               _loc2_ = this.accel_fx_s_bend_rise_time;
            }
            else if(param1 == 1651)
            {
               _loc2_ = this.accel_fx_s_bend_fall_time;
            }
            else if(param1 == 1652)
            {
               _loc2_ = this.accel_fx_laser_beam_rate;
            }
            else if(param1 == 1653)
            {
               _loc2_ = this.accel_fx_laser_beam_depth;
            }
            else if(param1 == 1654)
            {
               _loc2_ = this.accel_fx_laser_beam_rise_time;
            }
            else if(param1 == 1655)
            {
               _loc2_ = this.accel_fx_laser_beam_fall_time;
            }
            else if(param1 == 1656)
            {
               _loc2_ = this.accel_fx_ring_mod_freq;
            }
            else if(param1 == 1657)
            {
               _loc2_ = this.accel_fx_ring_mod_rise_time;
            }
            else if(param1 == 1658)
            {
               _loc2_ = this.accel_fx_ring_mod_fall_time;
            }
            else if(param1 == 1659)
            {
               _loc2_ = this.accel_fx_ring_mod_ring_level;
            }
            else if(param1 == 1660)
            {
               _loc2_ = this.accel_fx_ring_mod_octave_level;
            }
            else if(param1 == 1661)
            {
               _loc2_ = this.accel_fx_ring_mod_direct_mix;
            }
            else if(param1 == 1662)
            {
               _loc2_ = this.accel_fx_twist_level;
            }
            else if(param1 == 1663)
            {
               _loc2_ = this.accel_fx_twist_rise_time;
            }
         }
         else if(param1 >= 1792 && param1 < 2048)
         {
            if(param1 == 1792)
            {
               _loc2_ = this.accel_fx_twist_fall_time;
            }
            else if(param1 == 1793)
            {
               _loc2_ = this.accel_fx_warp_level;
            }
            else if(param1 == 1794)
            {
               _loc2_ = this.accel_fx_warp_rise_time;
            }
            else if(param1 == 1795)
            {
               _loc2_ = this.accel_fx_warp_fall_time;
            }
            else if(param1 == 1796)
            {
               _loc2_ = this.accel_fx_feedbacker_mode;
            }
            else if(param1 == 1797)
            {
               _loc2_ = this.accel_fx_feedbacker_depth;
            }
            else if(param1 == 1798)
            {
               _loc2_ = this.accel_fx_feedbacker_rise_time;
            }
            else if(param1 == 1799)
            {
               _loc2_ = this.accel_fx_feedbacker_octave_rise_time;
            }
            else if(param1 == 1800)
            {
               _loc2_ = this.accel_fx_feedbacker_f_back_level;
            }
            else if(param1 == 1801)
            {
               _loc2_ = this.accel_fx_feedbacker_octave_f_back_level;
            }
            else if(param1 == 1802)
            {
               _loc2_ = this.accel_fx_feedbacker_vib_rate;
            }
            else if(param1 == 1803)
            {
               _loc2_ = this.accel_fx_feedbacker_vib_depth;
            }
            else if(param1 == 1807)
            {
               _loc2_ = this.patch_category;
            }
            else if(param1 == 1808)
            {
               _loc2_ = this.patch_level;
            }
            else if(param1 == 1809)
            {
               _loc2_ = this.master_eq_low_gain;
            }
            else if(param1 == 1810)
            {
               _loc2_ = this.master_eq_mid_freq;
            }
            else if(param1 == 1811)
            {
               _loc2_ = this.master_eq_mid_q;
            }
            else if(param1 == 1812)
            {
               _loc2_ = this.master_eq_mid_gain;
            }
            else if(param1 == 1813)
            {
               _loc2_ = this.master_eq_high_gain;
            }
            else if(param1 == 1814)
            {
               _loc2_ = this.master_bpm_h;
            }
            else if(param1 == 1815)
            {
               _loc2_ = this.master_bpm_l;
            }
            else if(param1 == 1816)
            {
               _loc2_ = this.master_key;
            }
            else if(param1 == 1817)
            {
               _loc2_ = this.master_beat;
            }
            else if(param1 == 1818)
            {
               _loc2_ = this.pitch_detection;
            }
            else if(param1 == 1824)
            {
               _loc2_ = this.fx_chain_position1;
            }
            else if(param1 == 1825)
            {
               _loc2_ = this.fx_chain_position2;
            }
            else if(param1 == 1826)
            {
               _loc2_ = this.fx_chain_position3;
            }
            else if(param1 == 1827)
            {
               _loc2_ = this.fx_chain_position4;
            }
            else if(param1 == 1828)
            {
               _loc2_ = this.fx_chain_position5;
            }
            else if(param1 == 1829)
            {
               _loc2_ = this.fx_chain_position6;
            }
            else if(param1 == 1830)
            {
               _loc2_ = this.fx_chain_position7;
            }
            else if(param1 == 1831)
            {
               _loc2_ = this.fx_chain_position8;
            }
            else if(param1 == 1832)
            {
               _loc2_ = this.fx_chain_position9;
            }
            else if(param1 == 1833)
            {
               _loc2_ = this.fx_chain_position10;
            }
            else if(param1 == 1834)
            {
               _loc2_ = this.fx_chain_position11;
            }
            else if(param1 == 1835)
            {
               _loc2_ = this.fx_chain_position12;
            }
            else if(param1 == 1836)
            {
               _loc2_ = this.fx_chain_position13;
            }
            else if(param1 == 1837)
            {
               _loc2_ = this.fx_chain_position14;
            }
            else if(param1 == 1838)
            {
               _loc2_ = this.fx_chain_position15;
            }
            else if(param1 == 1839)
            {
               _loc2_ = this.fx_chain_position16;
            }
            else if(param1 == 1840)
            {
               _loc2_ = this.fx_chain_position17;
            }
            else if(param1 == 1841)
            {
               _loc2_ = this.fx_chain_position18;
            }
            else if(param1 == 1842)
            {
               _loc2_ = this.fx_chain_position19;
            }
            else if(param1 == 1843)
            {
               _loc2_ = this.fx_chain_position20;
            }
            else if(param1 == 1856)
            {
               _loc2_ = this.manual_mode_bank_down;
            }
            else if(param1 == 1857)
            {
               _loc2_ = this.manual_mode_bank_up;
            }
            else if(param1 == 1858)
            {
               _loc2_ = this.manual_mode_number_pedal1;
            }
            else if(param1 == 1859)
            {
               _loc2_ = this.manual_mode_number_pedal2;
            }
            else if(param1 == 1860)
            {
               _loc2_ = this.manual_mode_number_pedal3;
            }
            else if(param1 == 1861)
            {
               _loc2_ = this.manual_mode_number_pedal4;
            }
            else if(param1 == 1862)
            {
               _loc2_ = this.manual_mode_phrase_loop;
            }
            else if(param1 == 1863)
            {
               _loc2_ = this.manual_mode_accel_ctrl;
            }
            else if(param1 == 1872)
            {
               _loc2_ = this.ctl_exp_accel_ctl_func;
            }
            else if(param1 == 1873)
            {
               _loc2_ = this.ctl_exp_accel_ctl_min;
            }
            else if(param1 == 1874)
            {
               _loc2_ = this.ctl_exp_accel_ctl_max;
            }
            else if(param1 == 1875)
            {
               _loc2_ = this.ctl_exp_accel_ctl_src_mode;
            }
            else if(param1 == 1888)
            {
               _loc2_ = this.ctl_exp_exp_sw_func;
            }
            else if(param1 == 1889)
            {
               _loc2_ = this.ctl_exp_exp_sw_min;
            }
            else if(param1 == 1890)
            {
               _loc2_ = this.ctl_exp_exp_sw_max;
            }
            else if(param1 == 1891)
            {
               _loc2_ = this.ctl_exp_exp_sw_src_mode;
            }
            else if(param1 == 1904)
            {
               _loc2_ = this.ctl_exp_sub_ctl1_func;
            }
            else if(param1 == 1905)
            {
               _loc2_ = this.ctl_exp_sub_ctl1_min;
            }
            else if(param1 == 1906)
            {
               _loc2_ = this.ctl_exp_sub_ctl1_max;
            }
            else if(param1 == 1907)
            {
               _loc2_ = this.ctl_exp_sub_ctl1_src_mode;
            }
         }
         else if(param1 >= 2048 && param1 < 2304)
         {
            if(param1 == 2048)
            {
               _loc2_ = this.ctl_exp_sub_ctl2_func;
            }
            else if(param1 == 2049)
            {
               _loc2_ = this.ctl_exp_sub_ctl2_min;
            }
            else if(param1 == 2050)
            {
               _loc2_ = this.ctl_exp_sub_ctl2_max;
            }
            else if(param1 == 2051)
            {
               _loc2_ = this.ctl_exp_sub_ctl2_src_mode;
            }
            else if(param1 == 2064)
            {
               _loc2_ = this.ctl_exp_exp_func;
            }
            else if(param1 == 2065)
            {
               _loc2_ = this.ctl_exp_exp_patch_level_min;
            }
            else if(param1 == 2066)
            {
               _loc2_ = this.ctl_exp_exp_patch_level_max;
            }
            else if(param1 == 2080)
            {
               _loc2_ = this.ctl_exp_sub_exp_func;
            }
            else if(param1 == 2081)
            {
               _loc2_ = this.ctl_exp_sub_exp_patch_level_min;
            }
            else if(param1 == 2082)
            {
               _loc2_ = this.ctl_exp_sub_exp_patch_level_max;
            }
            else if(param1 == 2096)
            {
               _loc2_ = this.assign1_on_off;
            }
            else if(param1 == 2097)
            {
               _loc2_ = this.assign1_target_h;
            }
            else if(param1 == 2098)
            {
               _loc2_ = this.assign1_target_l;
            }
            else if(param1 == 2099)
            {
               _loc2_ = this.assign1_target_min_h;
            }
            else if(param1 == 2100)
            {
               _loc2_ = this.assign1_target_min_l;
            }
            else if(param1 == 2101)
            {
               _loc2_ = this.assign1_target_max_h;
            }
            else if(param1 == 2102)
            {
               _loc2_ = this.assign1_target_max_l;
            }
            else if(param1 == 2103)
            {
               _loc2_ = this.assign1_source;
            }
            else if(param1 == 2104)
            {
               _loc2_ = this.assign1_source_mode;
            }
            else if(param1 == 2105)
            {
               _loc2_ = this.assign1_act_range_lo;
            }
            else if(param1 == 2106)
            {
               _loc2_ = this.assign1_act_range_hi;
            }
            else if(param1 == 2107)
            {
               _loc2_ = this.assign1_int_pdl_trigger;
            }
            else if(param1 == 2108)
            {
               _loc2_ = this.assign1_int_pdl_time;
            }
            else if(param1 == 2109)
            {
               _loc2_ = this.assign1_int_pdl_curve;
            }
            else if(param1 == 2110)
            {
               _loc2_ = this.assign1_wave_rate;
            }
            else if(param1 == 2111)
            {
               _loc2_ = this.assign1_waveform;
            }
            else if(param1 == 2128)
            {
               _loc2_ = this.assign2_on_off;
            }
            else if(param1 == 2129)
            {
               _loc2_ = this.assign2_target_h;
            }
            else if(param1 == 2130)
            {
               _loc2_ = this.assign2_target_l;
            }
            else if(param1 == 2131)
            {
               _loc2_ = this.assign2_target_min_h;
            }
            else if(param1 == 2132)
            {
               _loc2_ = this.assign2_target_min_l;
            }
            else if(param1 == 2133)
            {
               _loc2_ = this.assign2_target_max_h;
            }
            else if(param1 == 2134)
            {
               _loc2_ = this.assign2_target_max_l;
            }
            else if(param1 == 2135)
            {
               _loc2_ = this.assign2_source;
            }
            else if(param1 == 2136)
            {
               _loc2_ = this.assign2_source_mode;
            }
            else if(param1 == 2137)
            {
               _loc2_ = this.assign2_act_range_lo;
            }
            else if(param1 == 2138)
            {
               _loc2_ = this.assign2_act_range_hi;
            }
            else if(param1 == 2139)
            {
               _loc2_ = this.assign2_int_pdl_trigger;
            }
            else if(param1 == 2140)
            {
               _loc2_ = this.assign2_int_pdl_time;
            }
            else if(param1 == 2141)
            {
               _loc2_ = this.assign2_int_pdl_curve;
            }
            else if(param1 == 2142)
            {
               _loc2_ = this.assign2_wave_rate;
            }
            else if(param1 == 2143)
            {
               _loc2_ = this.assign2_waveform;
            }
            else if(param1 == 2160)
            {
               _loc2_ = this.assign3_on_off;
            }
            else if(param1 == 2161)
            {
               _loc2_ = this.assign3_target_h;
            }
            else if(param1 == 2162)
            {
               _loc2_ = this.assign3_target_l;
            }
            else if(param1 == 2163)
            {
               _loc2_ = this.assign3_target_min_h;
            }
            else if(param1 == 2164)
            {
               _loc2_ = this.assign3_target_min_l;
            }
            else if(param1 == 2165)
            {
               _loc2_ = this.assign3_target_max_h;
            }
            else if(param1 == 2166)
            {
               _loc2_ = this.assign3_target_max_l;
            }
            else if(param1 == 2167)
            {
               _loc2_ = this.assign3_source;
            }
            else if(param1 == 2168)
            {
               _loc2_ = this.assign3_source_mode;
            }
            else if(param1 == 2169)
            {
               _loc2_ = this.assign3_act_range_lo;
            }
            else if(param1 == 2170)
            {
               _loc2_ = this.assign3_act_range_hi;
            }
            else if(param1 == 2171)
            {
               _loc2_ = this.assign3_int_pdl_trigger;
            }
            else if(param1 == 2172)
            {
               _loc2_ = this.assign3_int_pdl_time;
            }
            else if(param1 == 2173)
            {
               _loc2_ = this.assign3_int_pdl_curve;
            }
            else if(param1 == 2174)
            {
               _loc2_ = this.assign3_wave_rate;
            }
            else if(param1 == 2175)
            {
               _loc2_ = this.assign3_waveform;
            }
         }
         else if(param1 >= 2320 && param1 < 2560)
         {
            if(param1 == 2320)
            {
               _loc2_ = this.assign4_on_off;
            }
            else if(param1 == 2321)
            {
               _loc2_ = this.assign4_target_h;
            }
            else if(param1 == 2322)
            {
               _loc2_ = this.assign4_target_l;
            }
            else if(param1 == 2323)
            {
               _loc2_ = this.assign4_target_min_h;
            }
            else if(param1 == 2324)
            {
               _loc2_ = this.assign4_target_min_l;
            }
            else if(param1 == 2325)
            {
               _loc2_ = this.assign4_target_max_h;
            }
            else if(param1 == 2326)
            {
               _loc2_ = this.assign4_target_max_l;
            }
            else if(param1 == 2327)
            {
               _loc2_ = this.assign4_source;
            }
            else if(param1 == 2328)
            {
               _loc2_ = this.assign4_source_mode;
            }
            else if(param1 == 2329)
            {
               _loc2_ = this.assign4_act_range_lo;
            }
            else if(param1 == 2330)
            {
               _loc2_ = this.assign4_act_range_hi;
            }
            else if(param1 == 2331)
            {
               _loc2_ = this.assign4_int_pdl_trigger;
            }
            else if(param1 == 2332)
            {
               _loc2_ = this.assign4_int_pdl_time;
            }
            else if(param1 == 2333)
            {
               _loc2_ = this.assign4_int_pdl_curve;
            }
            else if(param1 == 2334)
            {
               _loc2_ = this.assign4_wave_rate;
            }
            else if(param1 == 2335)
            {
               _loc2_ = this.assign4_waveform;
            }
            else if(param1 == 2352)
            {
               _loc2_ = this.assign5_on_off;
            }
            else if(param1 == 2353)
            {
               _loc2_ = this.assign5_target_h;
            }
            else if(param1 == 2354)
            {
               _loc2_ = this.assign5_target_l;
            }
            else if(param1 == 2355)
            {
               _loc2_ = this.assign5_target_min_h;
            }
            else if(param1 == 2356)
            {
               _loc2_ = this.assign5_target_min_l;
            }
            else if(param1 == 2357)
            {
               _loc2_ = this.assign5_target_max_h;
            }
            else if(param1 == 2358)
            {
               _loc2_ = this.assign5_target_max_l;
            }
            else if(param1 == 2359)
            {
               _loc2_ = this.assign5_source;
            }
            else if(param1 == 2360)
            {
               _loc2_ = this.assign5_source_mode;
            }
            else if(param1 == 2361)
            {
               _loc2_ = this.assign5_act_range_lo;
            }
            else if(param1 == 2362)
            {
               _loc2_ = this.assign5_act_range_hi;
            }
            else if(param1 == 2363)
            {
               _loc2_ = this.assign5_int_pdl_trigger;
            }
            else if(param1 == 2364)
            {
               _loc2_ = this.assign5_int_pdl_time;
            }
            else if(param1 == 2365)
            {
               _loc2_ = this.assign5_int_pdl_curve;
            }
            else if(param1 == 2366)
            {
               _loc2_ = this.assign5_wave_rate;
            }
            else if(param1 == 2367)
            {
               _loc2_ = this.assign5_waveform;
            }
            else if(param1 == 2384)
            {
               _loc2_ = this.assign6_on_off;
            }
            else if(param1 == 2385)
            {
               _loc2_ = this.assign6_target_h;
            }
            else if(param1 == 2386)
            {
               _loc2_ = this.assign6_target_l;
            }
            else if(param1 == 2387)
            {
               _loc2_ = this.assign6_target_min_h;
            }
            else if(param1 == 2388)
            {
               _loc2_ = this.assign6_target_min_l;
            }
            else if(param1 == 2389)
            {
               _loc2_ = this.assign6_target_max_h;
            }
            else if(param1 == 2390)
            {
               _loc2_ = this.assign6_target_max_l;
            }
            else if(param1 == 2391)
            {
               _loc2_ = this.assign6_source;
            }
            else if(param1 == 2392)
            {
               _loc2_ = this.assign6_source_mode;
            }
            else if(param1 == 2393)
            {
               _loc2_ = this.assign6_act_range_lo;
            }
            else if(param1 == 2394)
            {
               _loc2_ = this.assign6_act_range_hi;
            }
            else if(param1 == 2395)
            {
               _loc2_ = this.assign6_int_pdl_trigger;
            }
            else if(param1 == 2396)
            {
               _loc2_ = this.assign6_int_pdl_time;
            }
            else if(param1 == 2397)
            {
               _loc2_ = this.assign6_int_pdl_curve;
            }
            else if(param1 == 2398)
            {
               _loc2_ = this.assign6_wave_rate;
            }
            else if(param1 == 2399)
            {
               _loc2_ = this.assign6_waveform;
            }
            else if(param1 == 2416)
            {
               _loc2_ = this.assign7_on_off;
            }
            else if(param1 == 2417)
            {
               _loc2_ = this.assign7_target_h;
            }
            else if(param1 == 2418)
            {
               _loc2_ = this.assign7_target_l;
            }
            else if(param1 == 2419)
            {
               _loc2_ = this.assign7_target_min_h;
            }
            else if(param1 == 2420)
            {
               _loc2_ = this.assign7_target_min_l;
            }
            else if(param1 == 2421)
            {
               _loc2_ = this.assign7_target_max_h;
            }
            else if(param1 == 2422)
            {
               _loc2_ = this.assign7_target_max_l;
            }
            else if(param1 == 2423)
            {
               _loc2_ = this.assign7_source;
            }
            else if(param1 == 2424)
            {
               _loc2_ = this.assign7_source_mode;
            }
            else if(param1 == 2425)
            {
               _loc2_ = this.assign7_act_range_lo;
            }
            else if(param1 == 2426)
            {
               _loc2_ = this.assign7_act_range_hi;
            }
            else if(param1 == 2427)
            {
               _loc2_ = this.assign7_int_pdl_trigger;
            }
            else if(param1 == 2428)
            {
               _loc2_ = this.assign7_int_pdl_time;
            }
            else if(param1 == 2429)
            {
               _loc2_ = this.assign7_int_pdl_curve;
            }
            else if(param1 == 2430)
            {
               _loc2_ = this.assign7_wave_rate;
            }
            else if(param1 == 2431)
            {
               _loc2_ = this.assign7_waveform;
            }
         }
         else if(param1 >= 2576 && param1 < 2635)
         {
            if(param1 == 2576)
            {
               _loc2_ = this.assign8_on_off;
            }
            else if(param1 == 2577)
            {
               _loc2_ = this.assign8_target_h;
            }
            else if(param1 == 2578)
            {
               _loc2_ = this.assign8_target_l;
            }
            else if(param1 == 2579)
            {
               _loc2_ = this.assign8_target_min_h;
            }
            else if(param1 == 2580)
            {
               _loc2_ = this.assign8_target_min_l;
            }
            else if(param1 == 2581)
            {
               _loc2_ = this.assign8_target_max_h;
            }
            else if(param1 == 2582)
            {
               _loc2_ = this.assign8_target_max_l;
            }
            else if(param1 == 2583)
            {
               _loc2_ = this.assign8_source;
            }
            else if(param1 == 2584)
            {
               _loc2_ = this.assign8_source_mode;
            }
            else if(param1 == 2585)
            {
               _loc2_ = this.assign8_act_range_lo;
            }
            else if(param1 == 2586)
            {
               _loc2_ = this.assign8_act_range_hi;
            }
            else if(param1 == 2587)
            {
               _loc2_ = this.assign8_int_pdl_trigger;
            }
            else if(param1 == 2588)
            {
               _loc2_ = this.assign8_int_pdl_time;
            }
            else if(param1 == 2589)
            {
               _loc2_ = this.assign8_int_pdl_curve;
            }
            else if(param1 == 2590)
            {
               _loc2_ = this.assign8_wave_rate;
            }
            else if(param1 == 2591)
            {
               _loc2_ = this.assign8_waveform;
            }
            else if(param1 == 2608)
            {
               _loc2_ = this.assign_common_input_sens;
            }
            else if(param1 == 2624)
            {
               _loc2_ = this.comp_name0;
            }
            else if(param1 == 2625)
            {
               _loc2_ = this.comp_name1;
            }
            else if(param1 == 2626)
            {
               _loc2_ = this.comp_name2;
            }
            else if(param1 == 2627)
            {
               _loc2_ = this.comp_name3;
            }
            else if(param1 == 2628)
            {
               _loc2_ = this.comp_name4;
            }
            else if(param1 == 2629)
            {
               _loc2_ = this.comp_name5;
            }
            else if(param1 == 2630)
            {
               _loc2_ = this.comp_name6;
            }
            else if(param1 == 2631)
            {
               _loc2_ = this.comp_name7;
            }
            else if(param1 == 2632)
            {
               _loc2_ = this.comp_name8;
            }
            else if(param1 == 2633)
            {
               _loc2_ = this.comp_name9;
            }
            else if(param1 == 2634)
            {
               _loc2_ = this.comp_name10;
            }
            else if(param1 == 2635)
            {
               _loc2_ = this.comp_name11;
            }
         }
         else if(param1 >= 4112 && param1 <= 4155)
         {
            if(param1 == 4112)
            {
               _loc2_ = this.fx1_acsim_high;
            }
            else if(param1 == 4113)
            {
               _loc2_ = this.fx1_acsim_body;
            }
            else if(param1 == 4114)
            {
               _loc2_ = this.fx1_acsim_low;
            }
            else if(param1 == 4116)
            {
               _loc2_ = this.fx1_acsim_level;
            }
            else if(param1 == 4118)
            {
               _loc2_ = this.fx1_rotary2_balance;
            }
            else if(param1 == 4119)
            {
               _loc2_ = this.fx1_rotary2_speed_sel;
            }
            else if(param1 == 4120)
            {
               _loc2_ = this.fx1_rotary2_rate_slow;
            }
            else if(param1 == 4121)
            {
               _loc2_ = this.fx1_rotary2_rate_fast;
            }
            else if(param1 == 4122)
            {
               _loc2_ = this.fx1_rotary2_risetime;
            }
            else if(param1 == 4123)
            {
               _loc2_ = this.fx1_rotary2_falltime;
            }
            else if(param1 == 4124)
            {
               _loc2_ = this.fx1_rotary2_depth;
            }
            else if(param1 == 4125)
            {
               _loc2_ = this.fx1_rotary2_level;
            }
            else if(param1 == 4126)
            {
               _loc2_ = this.fx1_rotary2_direct_mix;
            }
            else if(param1 == 4127)
            {
               _loc2_ = this.fx2_acsim_high;
            }
            else if(param1 == 4128)
            {
               _loc2_ = this.fx2_acsim_body;
            }
            else if(param1 == 4129)
            {
               _loc2_ = this.fx2_acsim_low;
            }
            else if(param1 == 4131)
            {
               _loc2_ = this.fx2_acsim_level;
            }
            else if(param1 == 4133)
            {
               _loc2_ = this.fx2_rotary2_balance;
            }
            else if(param1 == 4134)
            {
               _loc2_ = this.fx2_rotary2_speed_sel;
            }
            else if(param1 == 4135)
            {
               _loc2_ = this.fx2_rotary2_rate_slow;
            }
            else if(param1 == 4136)
            {
               _loc2_ = this.fx2_rotary2_rate_fast;
            }
            else if(param1 == 4137)
            {
               _loc2_ = this.fx2_rotary2_risetime;
            }
            else if(param1 == 4138)
            {
               _loc2_ = this.fx2_rotary2_falltime;
            }
            else if(param1 == 4139)
            {
               _loc2_ = this.fx2_rotary2_depth;
            }
            else if(param1 == 4140)
            {
               _loc2_ = this.fx2_rotary2_level;
            }
            else if(param1 == 4141)
            {
               _loc2_ = this.fx2_rotary2_direct_mix;
            }
            else if(param1 == 4143)
            {
               _loc2_ = this.prm_fx2_teraecho_mode;
            }
            else if(param1 == 4144)
            {
               _loc2_ = this.prm_fx2_teraecho_time;
            }
            else if(param1 == 4145)
            {
               _loc2_ = this.prm_fx2_teraecho_feedback;
            }
            else if(param1 == 4146)
            {
               _loc2_ = this.prm_fx2_teraecho_tone;
            }
            else if(param1 == 4147)
            {
               _loc2_ = this.prm_fx2_teraecho_effect_level;
            }
            else if(param1 == 4148)
            {
               _loc2_ = this.prm_fx2_teraecho_direct_mix;
            }
            else if(param1 == 4149)
            {
               _loc2_ = this.prm_fx2_teraecho_hold;
            }
            else if(param1 == 4151)
            {
               _loc2_ = this.prm_fx2_overtone_detune;
            }
            else if(param1 == 4152)
            {
               _loc2_ = this.prm_fx2_overtone_tone;
            }
            else if(param1 == 4153)
            {
               _loc2_ = this.prm_fx2_overtone_upper_level;
            }
            else if(param1 == 4154)
            {
               _loc2_ = this.prm_fx2_overtone_lower_level;
            }
            else if(param1 == 4155)
            {
               _loc2_ = this.prm_fx2_overtone_direct_level;
            }
         }
         else if(param1 >= 4157 && param1 <= 4199)
         {
            if(param1 == 4157)
            {
               _loc2_ = this.fx1_phaser90e_script;
            }
            else if(param1 == 4158)
            {
               _loc2_ = this.fx1_phaser90e_speed;
            }
            else if(param1 == 4159)
            {
               _loc2_ = this.fx1_flanger117e_manual;
            }
            else if(param1 == 4160)
            {
               _loc2_ = this.fx1_flanger117e_width;
            }
            else if(param1 == 4161)
            {
               _loc2_ = this.fx1_flanger117e_speed;
            }
            else if(param1 == 4162)
            {
               _loc2_ = this.fx1_flanger117e_regen;
            }
            else if(param1 == 4163)
            {
               _loc2_ = this.fx2_phaser90e_script;
            }
            else if(param1 == 4164)
            {
               _loc2_ = this.fx2_phaser90e_speed;
            }
            else if(param1 == 4165)
            {
               _loc2_ = this.fx2_flanger117e_manual;
            }
            else if(param1 == 4166)
            {
               _loc2_ = this.fx2_flanger117e_width;
            }
            else if(param1 == 4167)
            {
               _loc2_ = this.fx2_flanger117e_speed;
            }
            else if(param1 == 4168)
            {
               _loc2_ = this.fx2_flanger117e_regen;
            }
            else if(param1 == 4169)
            {
               _loc2_ = this.delay_vtg_lpf;
            }
            else if(param1 == 4170)
            {
               _loc2_ = this.delay_vtg_filter;
            }
            else if(param1 == 4171)
            {
               _loc2_ = this.delay_vtg_feedback_phase;
            }
            else if(param1 == 4172)
            {
               _loc2_ = this.delay_vtg_effect_phase;
            }
            else if(param1 == 4173)
            {
               _loc2_ = this.delay_vtg_mod_sw;
            }
            else if(param1 == 4174)
            {
               _loc2_ = this.delay2_on_off;
            }
            else if(param1 == 4175)
            {
               _loc2_ = this.delay2_type;
            }
            else if(param1 == 4176)
            {
               _loc2_ = this.delay2_delay_time_h;
            }
            else if(param1 == 4177)
            {
               _loc2_ = this.delay2_delay_time_l;
            }
            else if(param1 == 4178)
            {
               _loc2_ = this.delay2_f_back;
            }
            else if(param1 == 4179)
            {
               _loc2_ = this.delay2_high_cut;
            }
            else if(param1 == 4180)
            {
               _loc2_ = this.delay2_effect_level;
            }
            else if(param1 == 4181)
            {
               _loc2_ = this.delay2_direct_mix;
            }
            else if(param1 == 4182)
            {
               _loc2_ = this.delay2_tap_time;
            }
            else if(param1 == 4183)
            {
               _loc2_ = this.delay2_d1_time_h;
            }
            else if(param1 == 4184)
            {
               _loc2_ = this.delay2_d1_time_l;
            }
            else if(param1 == 4185)
            {
               _loc2_ = this.delay2_d1_f_back;
            }
            else if(param1 == 4186)
            {
               _loc2_ = this.delay2_d1_hi_cut;
            }
            else if(param1 == 4187)
            {
               _loc2_ = this.delay2_d1_level;
            }
            else if(param1 == 4188)
            {
               _loc2_ = this.delay2_d2_time_h;
            }
            else if(param1 == 4189)
            {
               _loc2_ = this.delay2_d2_time_l;
            }
            else if(param1 == 4190)
            {
               _loc2_ = this.delay2_d2_f_back;
            }
            else if(param1 == 4191)
            {
               _loc2_ = this.delay2_d2_hi_cut;
            }
            else if(param1 == 4192)
            {
               _loc2_ = this.delay2_d2_level;
            }
            else if(param1 == 4193)
            {
               _loc2_ = this.delay2_mod_rate;
            }
            else if(param1 == 4194)
            {
               _loc2_ = this.delay2_mod_depth;
            }
            else if(param1 == 4195)
            {
               _loc2_ = this.delay2_vtg_lpf;
            }
            else if(param1 == 4196)
            {
               _loc2_ = this.delay2_vtg_filter;
            }
            else if(param1 == 4197)
            {
               _loc2_ = this.delay2_vtg_feedback_phase;
            }
            else if(param1 == 4198)
            {
               _loc2_ = this.delay2_vtg_effect_phase;
            }
            else if(param1 == 4199)
            {
               _loc2_ = this.delay2_vtg_mod_sw;
            }
         }
         else if(param1 >= 4200 && param1 <= 4367)
         {
            if(param1 == 4200)
            {
               _loc2_ = this.fx1_wah95e_pedal_pos;
            }
            else if(param1 == 4201)
            {
               _loc2_ = this.fx1_wah95e_pedal_min;
            }
            else if(param1 == 4202)
            {
               _loc2_ = this.fx1_wah95e_pedal_max;
            }
            else if(param1 == 4203)
            {
               _loc2_ = this.fx1_wah95e_effect_level;
            }
            else if(param1 == 4204)
            {
               _loc2_ = this.fx1_wah95e_direct_mix;
            }
            else if(param1 == 4205)
            {
               _loc2_ = this.fx1_dc30_selector;
            }
            else if(param1 == 4206)
            {
               _loc2_ = this.fx1_dc30_input_volume;
            }
            else if(param1 == 4207)
            {
               _loc2_ = this.fx1_dc30_chorus_intensity;
            }
            else if(param1 == 4208)
            {
               _loc2_ = this.fx1_dc30_echo_repeat_rate_h;
            }
            else if(param1 == 4209)
            {
               _loc2_ = this.fx1_dc30_echo_repeat_rate_l;
            }
            else if(param1 == 4210)
            {
               _loc2_ = this.fx1_dc30_echo_intensity;
            }
            else if(param1 == 4211)
            {
               _loc2_ = this.fx1_dc30_echo_volume;
            }
            else if(param1 == 4212)
            {
               _loc2_ = this.fx1_dc30_tone;
            }
            else if(param1 == 4213)
            {
               _loc2_ = this.fx1_dc30_output;
            }
            else if(param1 == 4214)
            {
               _loc2_ = this.fx2_wah95e_pedal_pos;
            }
            else if(param1 == 4215)
            {
               _loc2_ = this.fx2_wah95e_pedal_min;
            }
            else if(param1 == 4216)
            {
               _loc2_ = this.fx2_wah95e_pedal_max;
            }
            else if(param1 == 4217)
            {
               _loc2_ = this.fx2_wah95e_effect_level;
            }
            else if(param1 == 4218)
            {
               _loc2_ = this.fx2_wah95e_direct_mix;
            }
            else if(param1 == 4219)
            {
               _loc2_ = this.fx2_dc30_selector;
            }
            else if(param1 == 4220)
            {
               _loc2_ = this.fx2_dc30_input_volume;
            }
            else if(param1 == 4221)
            {
               _loc2_ = this.fx2_dc30_chorus_intensity;
            }
            else if(param1 == 4222)
            {
               _loc2_ = this.fx2_dc30_echo_repeat_rate_h;
            }
            else if(param1 == 4223)
            {
               _loc2_ = this.fx2_dc30_echo_repeat_rate_l;
            }
            else if(param1 == 4352)
            {
               _loc2_ = this.fx2_dc30_echo_intensity;
            }
            else if(param1 == 4353)
            {
               _loc2_ = this.fx2_dc30_echo_volume;
            }
            else if(param1 == 4354)
            {
               _loc2_ = this.fx2_dc30_tone;
            }
            else if(param1 == 4355)
            {
               _loc2_ = this.fx2_dc30_output;
            }
            else if(param1 == 4356)
            {
               _loc2_ = this.eq_type;
            }
            else if(param1 == 4357)
            {
               _loc2_ = this.eq_geq_31hz;
            }
            else if(param1 == 4358)
            {
               _loc2_ = this.eq_geq_62hz;
            }
            else if(param1 == 4359)
            {
               _loc2_ = this.eq_geq_125hz;
            }
            else if(param1 == 4360)
            {
               _loc2_ = this.eq_geq_250hz;
            }
            else if(param1 == 4361)
            {
               _loc2_ = this.eq_geq_500hz;
            }
            else if(param1 == 4362)
            {
               _loc2_ = this.eq_geq_1khz;
            }
            else if(param1 == 4363)
            {
               _loc2_ = this.eq_geq_2khz;
            }
            else if(param1 == 4364)
            {
               _loc2_ = this.eq_geq_4khz;
            }
            else if(param1 == 4365)
            {
               _loc2_ = this.eq_geq_8khz;
            }
            else if(param1 == 4366)
            {
               _loc2_ = this.eq_geq_16khz;
            }
            else if(param1 == 4367)
            {
               _loc2_ = this.eq_geq_level;
            }
         }
         else if(4608 <= param1 && param1 <= 4641)
         {
            if(param1 == 4608)
            {
               _loc2_ = this.chain_ptn;
            }
            else if(param1 == 4609)
            {
               _loc2_ = this.fxbox_asgn_fx1a_g;
            }
            else if(param1 == 4610)
            {
               _loc2_ = this.fxbox_asgn_fx1a_r;
            }
            else if(param1 == 4611)
            {
               _loc2_ = this.fxbox_asgn_fx1a_y;
            }
            else if(param1 == 4612)
            {
               _loc2_ = this.fxbox_asgn_fx1b_g;
            }
            else if(param1 == 4613)
            {
               _loc2_ = this.fxbox_asgn_fx1b_r;
            }
            else if(param1 == 4614)
            {
               _loc2_ = this.fxbox_asgn_fx1b_y;
            }
            else if(param1 == 4615)
            {
               _loc2_ = this.fxbox_asgn_fx2a_g;
            }
            else if(param1 == 4616)
            {
               _loc2_ = this.fxbox_asgn_fx2a_r;
            }
            else if(param1 == 4617)
            {
               _loc2_ = this.fxbox_asgn_fx2a_y;
            }
            else if(param1 == 4618)
            {
               _loc2_ = this.fxbox_asgn_fx2b_g;
            }
            else if(param1 == 4619)
            {
               _loc2_ = this.fxbox_asgn_fx2b_r;
            }
            else if(param1 == 4620)
            {
               _loc2_ = this.fxbox_asgn_fx2b_y;
            }
            else if(param1 == 4621)
            {
               _loc2_ = this.fxbox_asgn_fx3_g;
            }
            else if(param1 == 4622)
            {
               _loc2_ = this.fxbox_asgn_fx3_r;
            }
            else if(param1 == 4623)
            {
               _loc2_ = this.fxbox_asgn_fx3_y;
            }
            else if(param1 == 4624)
            {
               _loc2_ = this.fxbox_sel_fx1a;
            }
            else if(param1 == 4625)
            {
               _loc2_ = this.fxbox_sel_fx1b;
            }
            else if(param1 == 4626)
            {
               _loc2_ = this.fxbox_sel_fx2a;
            }
            else if(param1 == 4627)
            {
               _loc2_ = this.fxbox_sel_fx2b;
            }
            else if(param1 == 4628)
            {
               _loc2_ = this.fxbox_sel_fx3;
            }
            else if(param1 == 4629)
            {
               _loc2_ = this.fx_active_ab_fx1;
            }
            else if(param1 == 4630)
            {
               _loc2_ = this.fx_active_ab_fx2;
            }
            else if(param1 == 4631)
            {
               _loc2_ = this.send_return_position;
            }
            else if(param1 == 4632)
            {
               _loc2_ = this.eq_position;
            }
            else if(param1 == 4633)
            {
               _loc2_ = this.fxbox_asgn_fx3b_g;
            }
            else if(param1 == 4634)
            {
               _loc2_ = this.fxbox_asgn_fx3b_r;
            }
            else if(param1 == 4635)
            {
               _loc2_ = this.fxbox_asgn_fx3b_y;
            }
            else if(param1 == 4636)
            {
               _loc2_ = this.fxbox_layer_fx3_g;
            }
            else if(param1 == 4637)
            {
               _loc2_ = this.fxbox_layer_fx3_r;
            }
            else if(param1 == 4638)
            {
               _loc2_ = this.fxbox_layer_fx3_y;
            }
            else if(param1 == 4639)
            {
               _loc2_ = this.pedal_function_exp_pedal;
            }
            else if(param1 == 4640)
            {
               _loc2_ = this.pedal_function_gafc_exp1;
            }
            else if(param1 == 4641)
            {
               _loc2_ = this.pedal_function_gafc_exp2;
            }
         }
         else if(4656 <= param1 && param1 <= 4687)
         {
            if(param1 == 4656)
            {
               _loc2_ = this.knob_assign_booster;
            }
            else if(param1 == 4657)
            {
               _loc2_ = this.knob_assign_delay;
            }
            else if(param1 == 4658)
            {
               _loc2_ = this.knob_assign_reverb;
            }
            else if(param1 == 4659)
            {
               _loc2_ = this.knob_assign_chorus;
            }
            else if(param1 == 4660)
            {
               _loc2_ = this.knob_assign_flanger;
            }
            else if(param1 == 4661)
            {
               _loc2_ = this.knob_assign_phaser;
            }
            else if(param1 == 4662)
            {
               _loc2_ = this.knob_assign_uni_v;
            }
            else if(param1 == 4663)
            {
               _loc2_ = this.knob_assign_tremolo;
            }
            else if(param1 == 4664)
            {
               _loc2_ = this.knob_assign_vibrato;
            }
            else if(param1 == 4665)
            {
               _loc2_ = this.knob_assign_rotary;
            }
            else if(param1 == 4666)
            {
               _loc2_ = this.knob_assign_ring_mod;
            }
            else if(param1 == 4667)
            {
               _loc2_ = this.knob_assign_slow_gear;
            }
            else if(param1 == 4668)
            {
               _loc2_ = this.knob_assign_slicer;
            }
            else if(param1 == 4669)
            {
               _loc2_ = this.knob_assign_comp;
            }
            else if(param1 == 4670)
            {
               _loc2_ = this.knob_assign_limiter;
            }
            else if(param1 == 4671)
            {
               _loc2_ = this.knob_assign_t_wah;
            }
            else if(param1 == 4672)
            {
               _loc2_ = this.knob_assign_auto_wah;
            }
            else if(param1 == 4673)
            {
               _loc2_ = this.knob_assign_pedal_wah;
            }
            else if(param1 == 4674)
            {
               _loc2_ = this.knob_assign_geq;
            }
            else if(param1 == 4675)
            {
               _loc2_ = this.knob_assign_peq;
            }
            else if(param1 == 4676)
            {
               _loc2_ = this.knob_assign_guitar_sim;
            }
            else if(param1 == 4677)
            {
               _loc2_ = this.knob_assign_ac_guitar_sim;
            }
            else if(param1 == 4678)
            {
               _loc2_ = this.knob_assign_ac_processor;
            }
            else if(param1 == 4679)
            {
               _loc2_ = this.knob_assign_wave_synth;
            }
            else if(param1 == 4680)
            {
               _loc2_ = this.knob_assign_octave;
            }
            else if(param1 == 4681)
            {
               _loc2_ = this.knob_assign_pitch_shifter;
            }
            else if(param1 == 4682)
            {
               _loc2_ = this.knob_assign_harmonist;
            }
            else if(param1 == 4683)
            {
               _loc2_ = this.knob_assign_humanizer;
            }
            else if(param1 == 4684)
            {
               _loc2_ = this.knob_assign_evh_phaser;
            }
            else if(param1 == 4685)
            {
               _loc2_ = this.knob_assign_evh_flanger;
            }
            else if(param1 == 4686)
            {
               _loc2_ = this.knob_assign_evh_wah;
            }
            else if(param1 == 4687)
            {
               _loc2_ = this.knob_assign_dc30;
            }
         }
         else if(4864 <= param1 && param1 <= 4895)
         {
            if(param1 == 4864)
            {
               _loc2_ = this.exp_pedal_assign_booster;
            }
            else if(param1 == 4865)
            {
               _loc2_ = this.exp_pedal_assign_delay;
            }
            else if(param1 == 4866)
            {
               _loc2_ = this.exp_pedal_assign_reverb;
            }
            else if(param1 == 4867)
            {
               _loc2_ = this.exp_pedal_assign_chorus;
            }
            else if(param1 == 4868)
            {
               _loc2_ = this.exp_pedal_assign_flanger;
            }
            else if(param1 == 4869)
            {
               _loc2_ = this.exp_pedal_assign_phaser;
            }
            else if(param1 == 4870)
            {
               _loc2_ = this.exp_pedal_assign_uni_v;
            }
            else if(param1 == 4871)
            {
               _loc2_ = this.exp_pedal_assign_tremolo;
            }
            else if(param1 == 4872)
            {
               _loc2_ = this.exp_pedal_assign_vibrato;
            }
            else if(param1 == 4873)
            {
               _loc2_ = this.exp_pedal_assign_rotary;
            }
            else if(param1 == 4874)
            {
               _loc2_ = this.exp_pedal_assign_ring_mod;
            }
            else if(param1 == 4875)
            {
               _loc2_ = this.exp_pedal_assign_slow_gear;
            }
            else if(param1 == 4876)
            {
               _loc2_ = this.exp_pedal_assign_slicer;
            }
            else if(param1 == 4877)
            {
               _loc2_ = this.exp_pedal_assign_comp;
            }
            else if(param1 == 4878)
            {
               _loc2_ = this.exp_pedal_assign_limiter;
            }
            else if(param1 == 4879)
            {
               _loc2_ = this.exp_pedal_assign_t_wah;
            }
            else if(param1 == 4880)
            {
               _loc2_ = this.exp_pedal_assign_auto_wah;
            }
            else if(param1 == 4881)
            {
               _loc2_ = this.exp_pedal_assign_pedal_wah;
            }
            else if(param1 == 4882)
            {
               _loc2_ = this.exp_pedal_assign_geq;
            }
            else if(param1 == 4883)
            {
               _loc2_ = this.exp_pedal_assign_peq;
            }
            else if(param1 == 4884)
            {
               _loc2_ = this.exp_pedal_assign_guitar_sim;
            }
            else if(param1 == 4885)
            {
               _loc2_ = this.exp_pedal_assign_ac_guitar_sim;
            }
            else if(param1 == 4886)
            {
               _loc2_ = this.exp_pedal_assign_ac_processor;
            }
            else if(param1 == 4887)
            {
               _loc2_ = this.exp_pedal_assign_wave_synth;
            }
            else if(param1 == 4888)
            {
               _loc2_ = this.exp_pedal_assign_octave;
            }
            else if(param1 == 4889)
            {
               _loc2_ = this.exp_pedal_assign_pitch_shifter;
            }
            else if(param1 == 4890)
            {
               _loc2_ = this.exp_pedal_assign_harmonist;
            }
            else if(param1 == 4891)
            {
               _loc2_ = this.exp_pedal_assign_humanizer;
            }
            else if(param1 == 4892)
            {
               _loc2_ = this.exp_pedal_assign_evh_phaser;
            }
            else if(param1 == 4893)
            {
               _loc2_ = this.exp_pedal_assign_evh_flanger;
            }
            else if(param1 == 4894)
            {
               _loc2_ = this.exp_pedal_assign_evh_wah;
            }
            else if(param1 == 4895)
            {
               _loc2_ = this.exp_pedal_assign_dc30;
            }
         }
         else if(4896 <= param1 && param1 <= 4969)
         {
            if(param1 == 4896)
            {
               _loc2_ = this.exp_pedal_assign_booster_min;
            }
            else if(param1 == 4897)
            {
               _loc2_ = this.exp_pedal_assign_booster_max;
            }
            else if(param1 == 4898)
            {
               _loc2_ = this.exp_pedal_assign_delay_min_h;
            }
            else if(param1 == 4899)
            {
               _loc2_ = this.exp_pedal_assign_delay_min_l;
            }
            else if(param1 == 4900)
            {
               _loc2_ = this.exp_pedal_assign_delay_max_h;
            }
            else if(param1 == 4901)
            {
               _loc2_ = this.exp_pedal_assign_delay_max_l;
            }
            else if(param1 == 4902)
            {
               _loc2_ = this.exp_pedal_assign_reverb_min_h;
            }
            else if(param1 == 4903)
            {
               _loc2_ = this.exp_pedal_assign_reverb_min_l;
            }
            else if(param1 == 4904)
            {
               _loc2_ = this.exp_pedal_assign_reverb_max_h;
            }
            else if(param1 == 4905)
            {
               _loc2_ = this.exp_pedal_assign_reverb_max_l;
            }
            else if(param1 == 4906)
            {
               _loc2_ = this.exp_pedal_assign_chorus_min;
            }
            else if(param1 == 4907)
            {
               _loc2_ = this.exp_pedal_assign_chorus_max;
            }
            else if(param1 == 4908)
            {
               _loc2_ = this.exp_pedal_assign_flanger_min;
            }
            else if(param1 == 4909)
            {
               _loc2_ = this.exp_pedal_assign_flanger_max;
            }
            else if(param1 == 4910)
            {
               _loc2_ = this.exp_pedal_assign_phaser_min;
            }
            else if(param1 == 4911)
            {
               _loc2_ = this.exp_pedal_assign_phaser_max;
            }
            else if(param1 == 4912)
            {
               _loc2_ = this.exp_pedal_assign_uni_v_min;
            }
            else if(param1 == 4913)
            {
               _loc2_ = this.exp_pedal_assign_uni_v_max;
            }
            else if(param1 == 4914)
            {
               _loc2_ = this.exp_pedal_assign_tremolo_min;
            }
            else if(param1 == 4915)
            {
               _loc2_ = this.exp_pedal_assign_tremolo_max;
            }
            else if(param1 == 4916)
            {
               _loc2_ = this.exp_pedal_assign_vibrato_min;
            }
            else if(param1 == 4917)
            {
               _loc2_ = this.exp_pedal_assign_vibrato_max;
            }
            else if(param1 == 4918)
            {
               _loc2_ = this.exp_pedal_assign_rotary_min;
            }
            else if(param1 == 4919)
            {
               _loc2_ = this.exp_pedal_assign_rotary_max;
            }
            else if(param1 == 4920)
            {
               _loc2_ = this.exp_pedal_assign_ring_mod_min;
            }
            else if(param1 == 4921)
            {
               _loc2_ = this.exp_pedal_assign_ring_mod_max;
            }
            else if(param1 == 4922)
            {
               _loc2_ = this.exp_pedal_assign_slow_gear_min;
            }
            else if(param1 == 4923)
            {
               _loc2_ = this.exp_pedal_assign_slow_gear_max;
            }
            else if(param1 == 4924)
            {
               _loc2_ = this.exp_pedal_assign_slicer_min;
            }
            else if(param1 == 4925)
            {
               _loc2_ = this.exp_pedal_assign_slicer_max;
            }
            else if(param1 == 4926)
            {
               _loc2_ = this.exp_pedal_assign_comp_min;
            }
            else if(param1 == 4927)
            {
               _loc2_ = this.exp_pedal_assign_comp_max;
            }
            else if(param1 == 4928)
            {
               _loc2_ = this.exp_pedal_assign_limiter_min;
            }
            else if(param1 == 4929)
            {
               _loc2_ = this.exp_pedal_assign_limiter_max;
            }
            else if(param1 == 4930)
            {
               _loc2_ = this.exp_pedal_assign_t_wah_min;
            }
            else if(param1 == 4931)
            {
               _loc2_ = this.exp_pedal_assign_t_wah_max;
            }
            else if(param1 == 4932)
            {
               _loc2_ = this.exp_pedal_assign_auto_wah_min;
            }
            else if(param1 == 4933)
            {
               _loc2_ = this.exp_pedal_assign_auto_wah_max;
            }
            else if(param1 == 4934)
            {
               _loc2_ = this.exp_pedal_assign_pedal_wah_min;
            }
            else if(param1 == 4935)
            {
               _loc2_ = this.exp_pedal_assign_pedal_wah_max;
            }
            else if(param1 == 4936)
            {
               _loc2_ = this.exp_pedal_assign_geq_min;
            }
            else if(param1 == 4937)
            {
               _loc2_ = this.exp_pedal_assign_geq_max;
            }
            else if(param1 == 4938)
            {
               _loc2_ = this.exp_pedal_assign_peq_min;
            }
            else if(param1 == 4939)
            {
               _loc2_ = this.exp_pedal_assign_peq_max;
            }
            else if(param1 == 4940)
            {
               _loc2_ = this.exp_pedal_assign_guitar_sim_min;
            }
            else if(param1 == 4941)
            {
               _loc2_ = this.exp_pedal_assign_guitar_sim_max;
            }
            else if(param1 == 4942)
            {
               _loc2_ = this.exp_pedal_assign_ac_guitar_sim_min;
            }
            else if(param1 == 4943)
            {
               _loc2_ = this.exp_pedal_assign_ac_guitar_sim_max;
            }
            else if(param1 == 4944)
            {
               _loc2_ = this.exp_pedal_assign_ac_processor_min;
            }
            else if(param1 == 4945)
            {
               _loc2_ = this.exp_pedal_assign_ac_processor_max;
            }
            else if(param1 == 4946)
            {
               _loc2_ = this.exp_pedal_assign_wave_synth_min;
            }
            else if(param1 == 4947)
            {
               _loc2_ = this.exp_pedal_assign_wave_synth_max;
            }
            else if(param1 == 4948)
            {
               _loc2_ = this.exp_pedal_assign_octave_min;
            }
            else if(param1 == 4949)
            {
               _loc2_ = this.exp_pedal_assign_octave_max;
            }
            else if(param1 == 4950)
            {
               _loc2_ = this.exp_pedal_assign_pitch_shifter_min_h;
            }
            else if(param1 == 4951)
            {
               _loc2_ = this.exp_pedal_assign_pitch_shifter_min_l;
            }
            else if(param1 == 4952)
            {
               _loc2_ = this.exp_pedal_assign_pitch_shifter_max_h;
            }
            else if(param1 == 4953)
            {
               _loc2_ = this.exp_pedal_assign_pitch_shifter_max_l;
            }
            else if(param1 == 4954)
            {
               _loc2_ = this.exp_pedal_assign_harmonist_min_h;
            }
            else if(param1 == 4955)
            {
               _loc2_ = this.exp_pedal_assign_harmonist_min_l;
            }
            else if(param1 == 4956)
            {
               _loc2_ = this.exp_pedal_assign_harmonist_max_h;
            }
            else if(param1 == 4957)
            {
               _loc2_ = this.exp_pedal_assign_harmonist_max_l;
            }
            else if(param1 == 4958)
            {
               _loc2_ = this.exp_pedal_assign_humanizer_min;
            }
            else if(param1 == 4959)
            {
               _loc2_ = this.exp_pedal_assign_humanizer_max;
            }
            else if(param1 == 4960)
            {
               _loc2_ = this.exp_pedal_assign_evh_phaser_min;
            }
            else if(param1 == 4961)
            {
               _loc2_ = this.exp_pedal_assign_evh_phaser_max;
            }
            else if(param1 == 4962)
            {
               _loc2_ = this.exp_pedal_assign_evh_flanger_min;
            }
            else if(param1 == 4963)
            {
               _loc2_ = this.exp_pedal_assign_evh_flanger_max;
            }
            else if(param1 == 4964)
            {
               _loc2_ = this.exp_pedal_assign_evh_wah_min;
            }
            else if(param1 == 4965)
            {
               _loc2_ = this.exp_pedal_assign_evh_wah_max;
            }
            else if(param1 == 4966)
            {
               _loc2_ = this.exp_pedal_assign_dc30_min_h;
            }
            else if(param1 == 4967)
            {
               _loc2_ = this.exp_pedal_assign_dc30_min_l;
            }
            else if(param1 == 4968)
            {
               _loc2_ = this.exp_pedal_assign_dc30_max_h;
            }
            else if(param1 == 4969)
            {
               _loc2_ = this.exp_pedal_assign_dc30_max_l;
            }
         }
         else if(5120 <= param1 && param1 <= 5151)
         {
            if(param1 == 5120)
            {
               _loc2_ = this.gafc_exp1_assign_booster;
            }
            else if(param1 == 5121)
            {
               _loc2_ = this.gafc_exp1_assign_delay;
            }
            else if(param1 == 5122)
            {
               _loc2_ = this.gafc_exp1_assign_reverb;
            }
            else if(param1 == 5123)
            {
               _loc2_ = this.gafc_exp1_assign_chorus;
            }
            else if(param1 == 5124)
            {
               _loc2_ = this.gafc_exp1_assign_flanger;
            }
            else if(param1 == 5125)
            {
               _loc2_ = this.gafc_exp1_assign_phaser;
            }
            else if(param1 == 5126)
            {
               _loc2_ = this.gafc_exp1_assign_uni_v;
            }
            else if(param1 == 5127)
            {
               _loc2_ = this.gafc_exp1_assign_tremolo;
            }
            else if(param1 == 5128)
            {
               _loc2_ = this.gafc_exp1_assign_vibrato;
            }
            else if(param1 == 5129)
            {
               _loc2_ = this.gafc_exp1_assign_rotary;
            }
            else if(param1 == 5130)
            {
               _loc2_ = this.gafc_exp1_assign_ring_mod;
            }
            else if(param1 == 5131)
            {
               _loc2_ = this.gafc_exp1_assign_slow_gear;
            }
            else if(param1 == 5132)
            {
               _loc2_ = this.gafc_exp1_assign_slicer;
            }
            else if(param1 == 5133)
            {
               _loc2_ = this.gafc_exp1_assign_comp;
            }
            else if(param1 == 5134)
            {
               _loc2_ = this.gafc_exp1_assign_limiter;
            }
            else if(param1 == 5135)
            {
               _loc2_ = this.gafc_exp1_assign_t_wah;
            }
            else if(param1 == 5136)
            {
               _loc2_ = this.gafc_exp1_assign_auto_wah;
            }
            else if(param1 == 5137)
            {
               _loc2_ = this.gafc_exp1_assign_pedal_wah;
            }
            else if(param1 == 5138)
            {
               _loc2_ = this.gafc_exp1_assign_geq;
            }
            else if(param1 == 5139)
            {
               _loc2_ = this.gafc_exp1_assign_peq;
            }
            else if(param1 == 5140)
            {
               _loc2_ = this.gafc_exp1_assign_guitar_sim;
            }
            else if(param1 == 5141)
            {
               _loc2_ = this.gafc_exp1_assign_ac_guitar_sim;
            }
            else if(param1 == 5142)
            {
               _loc2_ = this.gafc_exp1_assign_ac_processor;
            }
            else if(param1 == 5143)
            {
               _loc2_ = this.gafc_exp1_assign_wave_synth;
            }
            else if(param1 == 5144)
            {
               _loc2_ = this.gafc_exp1_assign_octave;
            }
            else if(param1 == 5145)
            {
               _loc2_ = this.gafc_exp1_assign_pitch_shifter;
            }
            else if(param1 == 5146)
            {
               _loc2_ = this.gafc_exp1_assign_harmonist;
            }
            else if(param1 == 5147)
            {
               _loc2_ = this.gafc_exp1_assign_humanizer;
            }
            else if(param1 == 5148)
            {
               _loc2_ = this.gafc_exp1_assign_evh_phaser;
            }
            else if(param1 == 5149)
            {
               _loc2_ = this.gafc_exp1_assign_evh_flanger;
            }
            else if(param1 == 5150)
            {
               _loc2_ = this.gafc_exp1_assign_evh_wah;
            }
            else if(param1 == 5151)
            {
               _loc2_ = this.gafc_exp1_assign_dc30;
            }
         }
         else if(5152 <= param1 && param1 <= 5225)
         {
            if(param1 == 5152)
            {
               _loc2_ = this.gafc_exp1_assign_booster_min;
            }
            else if(param1 == 5153)
            {
               _loc2_ = this.gafc_exp1_assign_booster_max;
            }
            else if(param1 == 5154)
            {
               _loc2_ = this.gafc_exp1_assign_delay_min_h;
            }
            else if(param1 == 5155)
            {
               _loc2_ = this.gafc_exp1_assign_delay_min_l;
            }
            else if(param1 == 5156)
            {
               _loc2_ = this.gafc_exp1_assign_delay_max_h;
            }
            else if(param1 == 5157)
            {
               _loc2_ = this.gafc_exp1_assign_delay_max_l;
            }
            else if(param1 == 5158)
            {
               _loc2_ = this.gafc_exp1_assign_reverb_min_h;
            }
            else if(param1 == 5159)
            {
               _loc2_ = this.gafc_exp1_assign_reverb_min_l;
            }
            else if(param1 == 5160)
            {
               _loc2_ = this.gafc_exp1_assign_reverb_max_h;
            }
            else if(param1 == 5161)
            {
               _loc2_ = this.gafc_exp1_assign_reverb_max_l;
            }
            else if(param1 == 5162)
            {
               _loc2_ = this.gafc_exp1_assign_chorus_min;
            }
            else if(param1 == 5163)
            {
               _loc2_ = this.gafc_exp1_assign_chorus_max;
            }
            else if(param1 == 5164)
            {
               _loc2_ = this.gafc_exp1_assign_flanger_min;
            }
            else if(param1 == 5165)
            {
               _loc2_ = this.gafc_exp1_assign_flanger_max;
            }
            else if(param1 == 5166)
            {
               _loc2_ = this.gafc_exp1_assign_phaser_min;
            }
            else if(param1 == 5167)
            {
               _loc2_ = this.gafc_exp1_assign_phaser_max;
            }
            else if(param1 == 5168)
            {
               _loc2_ = this.gafc_exp1_assign_uni_v_min;
            }
            else if(param1 == 5169)
            {
               _loc2_ = this.gafc_exp1_assign_uni_v_max;
            }
            else if(param1 == 5170)
            {
               _loc2_ = this.gafc_exp1_assign_tremolo_min;
            }
            else if(param1 == 5171)
            {
               _loc2_ = this.gafc_exp1_assign_tremolo_max;
            }
            else if(param1 == 5172)
            {
               _loc2_ = this.gafc_exp1_assign_vibrato_min;
            }
            else if(param1 == 5173)
            {
               _loc2_ = this.gafc_exp1_assign_vibrato_max;
            }
            else if(param1 == 5174)
            {
               _loc2_ = this.gafc_exp1_assign_rotary_min;
            }
            else if(param1 == 5175)
            {
               _loc2_ = this.gafc_exp1_assign_rotary_max;
            }
            else if(param1 == 5176)
            {
               _loc2_ = this.gafc_exp1_assign_ring_mod_min;
            }
            else if(param1 == 5177)
            {
               _loc2_ = this.gafc_exp1_assign_ring_mod_max;
            }
            else if(param1 == 5178)
            {
               _loc2_ = this.gafc_exp1_assign_slow_gear_min;
            }
            else if(param1 == 5179)
            {
               _loc2_ = this.gafc_exp1_assign_slow_gear_max;
            }
            else if(param1 == 5180)
            {
               _loc2_ = this.gafc_exp1_assign_slicer_min;
            }
            else if(param1 == 5181)
            {
               _loc2_ = this.gafc_exp1_assign_slicer_max;
            }
            else if(param1 == 5182)
            {
               _loc2_ = this.gafc_exp1_assign_comp_min;
            }
            else if(param1 == 5183)
            {
               _loc2_ = this.gafc_exp1_assign_comp_max;
            }
            else if(param1 == 5184)
            {
               _loc2_ = this.gafc_exp1_assign_limiter_min;
            }
            else if(param1 == 5185)
            {
               _loc2_ = this.gafc_exp1_assign_limiter_max;
            }
            else if(param1 == 5186)
            {
               _loc2_ = this.gafc_exp1_assign_t_wah_min;
            }
            else if(param1 == 5187)
            {
               _loc2_ = this.gafc_exp1_assign_t_wah_max;
            }
            else if(param1 == 5188)
            {
               _loc2_ = this.gafc_exp1_assign_auto_wah_min;
            }
            else if(param1 == 5189)
            {
               _loc2_ = this.gafc_exp1_assign_auto_wah_max;
            }
            else if(param1 == 5190)
            {
               _loc2_ = this.gafc_exp1_assign_pedal_wah_min;
            }
            else if(param1 == 5191)
            {
               _loc2_ = this.gafc_exp1_assign_pedal_wah_max;
            }
            else if(param1 == 5192)
            {
               _loc2_ = this.gafc_exp1_assign_geq_min;
            }
            else if(param1 == 5193)
            {
               _loc2_ = this.gafc_exp1_assign_geq_max;
            }
            else if(param1 == 5194)
            {
               _loc2_ = this.gafc_exp1_assign_peq_min;
            }
            else if(param1 == 5195)
            {
               _loc2_ = this.gafc_exp1_assign_peq_max;
            }
            else if(param1 == 5196)
            {
               _loc2_ = this.gafc_exp1_assign_guitar_sim_min;
            }
            else if(param1 == 5197)
            {
               _loc2_ = this.gafc_exp1_assign_guitar_sim_max;
            }
            else if(param1 == 5198)
            {
               _loc2_ = this.gafc_exp1_assign_ac_guitar_sim_min;
            }
            else if(param1 == 5199)
            {
               _loc2_ = this.gafc_exp1_assign_ac_guitar_sim_max;
            }
            else if(param1 == 5200)
            {
               _loc2_ = this.gafc_exp1_assign_ac_processor_min;
            }
            else if(param1 == 5201)
            {
               _loc2_ = this.gafc_exp1_assign_ac_processor_max;
            }
            else if(param1 == 5202)
            {
               _loc2_ = this.gafc_exp1_assign_wave_synth_min;
            }
            else if(param1 == 5203)
            {
               _loc2_ = this.gafc_exp1_assign_wave_synth_max;
            }
            else if(param1 == 5204)
            {
               _loc2_ = this.gafc_exp1_assign_octave_min;
            }
            else if(param1 == 5205)
            {
               _loc2_ = this.gafc_exp1_assign_octave_max;
            }
            else if(param1 == 5206)
            {
               _loc2_ = this.gafc_exp1_assign_pitch_shifter_min_h;
            }
            else if(param1 == 5207)
            {
               _loc2_ = this.gafc_exp1_assign_pitch_shifter_min_l;
            }
            else if(param1 == 5208)
            {
               _loc2_ = this.gafc_exp1_assign_pitch_shifter_max_h;
            }
            else if(param1 == 5209)
            {
               _loc2_ = this.gafc_exp1_assign_pitch_shifter_max_l;
            }
            else if(param1 == 5210)
            {
               _loc2_ = this.gafc_exp1_assign_harmonist_min_h;
            }
            else if(param1 == 5211)
            {
               _loc2_ = this.gafc_exp1_assign_harmonist_min_l;
            }
            else if(param1 == 5212)
            {
               _loc2_ = this.gafc_exp1_assign_harmonist_max_h;
            }
            else if(param1 == 5213)
            {
               _loc2_ = this.gafc_exp1_assign_harmonist_max_l;
            }
            else if(param1 == 5214)
            {
               _loc2_ = this.gafc_exp1_assign_humanizer_min;
            }
            else if(param1 == 5215)
            {
               _loc2_ = this.gafc_exp1_assign_humanizer_max;
            }
            else if(param1 == 5216)
            {
               _loc2_ = this.gafc_exp1_assign_evh_phaser_min;
            }
            else if(param1 == 5217)
            {
               _loc2_ = this.gafc_exp1_assign_evh_phaser_max;
            }
            else if(param1 == 5218)
            {
               _loc2_ = this.gafc_exp1_assign_evh_flanger_min;
            }
            else if(param1 == 5219)
            {
               _loc2_ = this.gafc_exp1_assign_evh_flanger_max;
            }
            else if(param1 == 5220)
            {
               _loc2_ = this.gafc_exp1_assign_evh_wah_min;
            }
            else if(param1 == 5221)
            {
               _loc2_ = this.gafc_exp1_assign_evh_wah_max;
            }
            else if(param1 == 5222)
            {
               _loc2_ = this.gafc_exp1_assign_dc30_min_h;
            }
            else if(param1 == 5223)
            {
               _loc2_ = this.gafc_exp1_assign_dc30_min_l;
            }
            else if(param1 == 5224)
            {
               _loc2_ = this.gafc_exp1_assign_dc30_max_h;
            }
            else if(param1 == 5225)
            {
               _loc2_ = this.gafc_exp1_assign_dc30_max_l;
            }
         }
         else if(5376 <= param1 && param1 <= 5407)
         {
            if(param1 == 5376)
            {
               _loc2_ = this.gafc_exp2_assign_booster;
            }
            else if(param1 == 5377)
            {
               _loc2_ = this.gafc_exp2_assign_delay;
            }
            else if(param1 == 5378)
            {
               _loc2_ = this.gafc_exp2_assign_reverb;
            }
            else if(param1 == 5379)
            {
               _loc2_ = this.gafc_exp2_assign_chorus;
            }
            else if(param1 == 5380)
            {
               _loc2_ = this.gafc_exp2_assign_flanger;
            }
            else if(param1 == 5381)
            {
               _loc2_ = this.gafc_exp2_assign_phaser;
            }
            else if(param1 == 5382)
            {
               _loc2_ = this.gafc_exp2_assign_uni_v;
            }
            else if(param1 == 5383)
            {
               _loc2_ = this.gafc_exp2_assign_tremolo;
            }
            else if(param1 == 5384)
            {
               _loc2_ = this.gafc_exp2_assign_vibrato;
            }
            else if(param1 == 5385)
            {
               _loc2_ = this.gafc_exp2_assign_rotary;
            }
            else if(param1 == 5386)
            {
               _loc2_ = this.gafc_exp2_assign_ring_mod;
            }
            else if(param1 == 5387)
            {
               _loc2_ = this.gafc_exp2_assign_slow_gear;
            }
            else if(param1 == 5388)
            {
               _loc2_ = this.gafc_exp2_assign_slicer;
            }
            else if(param1 == 5389)
            {
               _loc2_ = this.gafc_exp2_assign_comp;
            }
            else if(param1 == 5390)
            {
               _loc2_ = this.gafc_exp2_assign_limiter;
            }
            else if(param1 == 5391)
            {
               _loc2_ = this.gafc_exp2_assign_t_wah;
            }
            else if(param1 == 5392)
            {
               _loc2_ = this.gafc_exp2_assign_auto_wah;
            }
            else if(param1 == 5393)
            {
               _loc2_ = this.gafc_exp2_assign_pedal_wah;
            }
            else if(param1 == 5394)
            {
               _loc2_ = this.gafc_exp2_assign_geq;
            }
            else if(param1 == 5395)
            {
               _loc2_ = this.gafc_exp2_assign_peq;
            }
            else if(param1 == 5396)
            {
               _loc2_ = this.gafc_exp2_assign_guitar_sim;
            }
            else if(param1 == 5397)
            {
               _loc2_ = this.gafc_exp2_assign_ac_guitar_sim;
            }
            else if(param1 == 5398)
            {
               _loc2_ = this.gafc_exp2_assign_ac_processor;
            }
            else if(param1 == 5399)
            {
               _loc2_ = this.gafc_exp2_assign_wave_synth;
            }
            else if(param1 == 5400)
            {
               _loc2_ = this.gafc_exp2_assign_octave;
            }
            else if(param1 == 5401)
            {
               _loc2_ = this.gafc_exp2_assign_pitch_shifter;
            }
            else if(param1 == 5402)
            {
               _loc2_ = this.gafc_exp2_assign_harmonist;
            }
            else if(param1 == 5403)
            {
               _loc2_ = this.gafc_exp2_assign_humanizer;
            }
            else if(param1 == 5404)
            {
               _loc2_ = this.gafc_exp2_assign_evh_phaser;
            }
            else if(param1 == 5405)
            {
               _loc2_ = this.gafc_exp2_assign_evh_flanger;
            }
            else if(param1 == 5406)
            {
               _loc2_ = this.gafc_exp2_assign_evh_wah;
            }
            else if(param1 == 5407)
            {
               _loc2_ = this.gafc_exp2_assign_dc30;
            }
         }
         else if(5408 <= param1 && param1 <= 5481)
         {
            if(param1 == 5408)
            {
               _loc2_ = this.gafc_exp2_assign_booster_min;
            }
            else if(param1 == 5409)
            {
               _loc2_ = this.gafc_exp2_assign_booster_max;
            }
            else if(param1 == 5410)
            {
               _loc2_ = this.gafc_exp2_assign_delay_min_h;
            }
            else if(param1 == 5411)
            {
               _loc2_ = this.gafc_exp2_assign_delay_min_l;
            }
            else if(param1 == 5412)
            {
               _loc2_ = this.gafc_exp2_assign_delay_max_h;
            }
            else if(param1 == 5413)
            {
               _loc2_ = this.gafc_exp2_assign_delay_max_l;
            }
            else if(param1 == 5414)
            {
               _loc2_ = this.gafc_exp2_assign_reverb_min_h;
            }
            else if(param1 == 5415)
            {
               _loc2_ = this.gafc_exp2_assign_reverb_min_l;
            }
            else if(param1 == 5416)
            {
               _loc2_ = this.gafc_exp2_assign_reverb_max_h;
            }
            else if(param1 == 5417)
            {
               _loc2_ = this.gafc_exp2_assign_reverb_max_l;
            }
            else if(param1 == 5418)
            {
               _loc2_ = this.gafc_exp2_assign_chorus_min;
            }
            else if(param1 == 5419)
            {
               _loc2_ = this.gafc_exp2_assign_chorus_max;
            }
            else if(param1 == 5420)
            {
               _loc2_ = this.gafc_exp2_assign_flanger_min;
            }
            else if(param1 == 5421)
            {
               _loc2_ = this.gafc_exp2_assign_flanger_max;
            }
            else if(param1 == 5422)
            {
               _loc2_ = this.gafc_exp2_assign_phaser_min;
            }
            else if(param1 == 5423)
            {
               _loc2_ = this.gafc_exp2_assign_phaser_max;
            }
            else if(param1 == 5424)
            {
               _loc2_ = this.gafc_exp2_assign_uni_v_min;
            }
            else if(param1 == 5425)
            {
               _loc2_ = this.gafc_exp2_assign_uni_v_max;
            }
            else if(param1 == 5426)
            {
               _loc2_ = this.gafc_exp2_assign_tremolo_min;
            }
            else if(param1 == 5427)
            {
               _loc2_ = this.gafc_exp2_assign_tremolo_max;
            }
            else if(param1 == 5428)
            {
               _loc2_ = this.gafc_exp2_assign_vibrato_min;
            }
            else if(param1 == 5429)
            {
               _loc2_ = this.gafc_exp2_assign_vibrato_max;
            }
            else if(param1 == 5430)
            {
               _loc2_ = this.gafc_exp2_assign_rotary_min;
            }
            else if(param1 == 5431)
            {
               _loc2_ = this.gafc_exp2_assign_rotary_max;
            }
            else if(param1 == 5432)
            {
               _loc2_ = this.gafc_exp2_assign_ring_mod_min;
            }
            else if(param1 == 5433)
            {
               _loc2_ = this.gafc_exp2_assign_ring_mod_max;
            }
            else if(param1 == 5434)
            {
               _loc2_ = this.gafc_exp2_assign_slow_gear_min;
            }
            else if(param1 == 5435)
            {
               _loc2_ = this.gafc_exp2_assign_slow_gear_max;
            }
            else if(param1 == 5436)
            {
               _loc2_ = this.gafc_exp2_assign_slicer_min;
            }
            else if(param1 == 5437)
            {
               _loc2_ = this.gafc_exp2_assign_slicer_max;
            }
            else if(param1 == 5438)
            {
               _loc2_ = this.gafc_exp2_assign_comp_min;
            }
            else if(param1 == 5439)
            {
               _loc2_ = this.gafc_exp2_assign_comp_max;
            }
            else if(param1 == 5440)
            {
               _loc2_ = this.gafc_exp2_assign_limiter_min;
            }
            else if(param1 == 5441)
            {
               _loc2_ = this.gafc_exp2_assign_limiter_max;
            }
            else if(param1 == 5442)
            {
               _loc2_ = this.gafc_exp2_assign_t_wah_min;
            }
            else if(param1 == 5443)
            {
               _loc2_ = this.gafc_exp2_assign_t_wah_max;
            }
            else if(param1 == 5444)
            {
               _loc2_ = this.gafc_exp2_assign_auto_wah_min;
            }
            else if(param1 == 5445)
            {
               _loc2_ = this.gafc_exp2_assign_auto_wah_max;
            }
            else if(param1 == 5446)
            {
               _loc2_ = this.gafc_exp2_assign_pedal_wah_min;
            }
            else if(param1 == 5447)
            {
               _loc2_ = this.gafc_exp2_assign_pedal_wah_max;
            }
            else if(param1 == 5448)
            {
               _loc2_ = this.gafc_exp2_assign_geq_min;
            }
            else if(param1 == 5449)
            {
               _loc2_ = this.gafc_exp2_assign_geq_max;
            }
            else if(param1 == 5450)
            {
               _loc2_ = this.gafc_exp2_assign_peq_min;
            }
            else if(param1 == 5451)
            {
               _loc2_ = this.gafc_exp2_assign_peq_max;
            }
            else if(param1 == 5452)
            {
               _loc2_ = this.gafc_exp2_assign_guitar_sim_min;
            }
            else if(param1 == 5453)
            {
               _loc2_ = this.gafc_exp2_assign_guitar_sim_max;
            }
            else if(param1 == 5454)
            {
               _loc2_ = this.gafc_exp2_assign_ac_guitar_sim_min;
            }
            else if(param1 == 5455)
            {
               _loc2_ = this.gafc_exp2_assign_ac_guitar_sim_max;
            }
            else if(param1 == 5456)
            {
               _loc2_ = this.gafc_exp2_assign_ac_processor_min;
            }
            else if(param1 == 5457)
            {
               _loc2_ = this.gafc_exp2_assign_ac_processor_max;
            }
            else if(param1 == 5458)
            {
               _loc2_ = this.gafc_exp2_assign_wave_synth_min;
            }
            else if(param1 == 5459)
            {
               _loc2_ = this.gafc_exp2_assign_wave_synth_max;
            }
            else if(param1 == 5460)
            {
               _loc2_ = this.gafc_exp2_assign_octave_min;
            }
            else if(param1 == 5461)
            {
               _loc2_ = this.gafc_exp2_assign_octave_max;
            }
            else if(param1 == 5462)
            {
               _loc2_ = this.gafc_exp2_assign_pitch_shifter_min_h;
            }
            else if(param1 == 5463)
            {
               _loc2_ = this.gafc_exp2_assign_pitch_shifter_min_l;
            }
            else if(param1 == 5464)
            {
               _loc2_ = this.gafc_exp2_assign_pitch_shifter_max_h;
            }
            else if(param1 == 5465)
            {
               _loc2_ = this.gafc_exp2_assign_pitch_shifter_max_l;
            }
            else if(param1 == 5466)
            {
               _loc2_ = this.gafc_exp2_assign_harmonist_min_h;
            }
            else if(param1 == 5467)
            {
               _loc2_ = this.gafc_exp2_assign_harmonist_min_l;
            }
            else if(param1 == 5468)
            {
               _loc2_ = this.gafc_exp2_assign_harmonist_max_h;
            }
            else if(param1 == 5469)
            {
               _loc2_ = this.gafc_exp2_assign_harmonist_max_l;
            }
            else if(param1 == 5470)
            {
               _loc2_ = this.gafc_exp2_assign_humanizer_min;
            }
            else if(param1 == 5471)
            {
               _loc2_ = this.gafc_exp2_assign_humanizer_max;
            }
            else if(param1 == 5472)
            {
               _loc2_ = this.gafc_exp2_assign_evh_phaser_min;
            }
            else if(param1 == 5473)
            {
               _loc2_ = this.gafc_exp2_assign_evh_phaser_max;
            }
            else if(param1 == 5474)
            {
               _loc2_ = this.gafc_exp2_assign_evh_flanger_min;
            }
            else if(param1 == 5475)
            {
               _loc2_ = this.gafc_exp2_assign_evh_flanger_max;
            }
            else if(param1 == 5476)
            {
               _loc2_ = this.gafc_exp2_assign_evh_wah_min;
            }
            else if(param1 == 5477)
            {
               _loc2_ = this.gafc_exp2_assign_evh_wah_max;
            }
            else if(param1 == 5478)
            {
               _loc2_ = this.gafc_exp2_assign_dc30_min_h;
            }
            else if(param1 == 5479)
            {
               _loc2_ = this.gafc_exp2_assign_dc30_min_l;
            }
            else if(param1 == 5480)
            {
               _loc2_ = this.gafc_exp2_assign_dc30_max_h;
            }
            else if(param1 == 5481)
            {
               _loc2_ = this.gafc_exp2_assign_dc30_max_l;
            }
         }
         return ToneCentralUtil.convertHexaDecimal(_loc2_.toString(),2);
      }
      
      private function isGT100AssignSource(param1:int) : Boolean
      {
         return param1 == 1 || param1 == 2 || param1 == 3 || param1 == 4 || param1 == 73;
      }
      
      private function isGT100AssignTarget(param1:int, param2:int) : Boolean
      {
         return param1 == 4 && param2 == 62 || param1 == 4 && param2 == 63 || param1 == 4 && param2 == 64 || param1 == 4 && param2 == 65 || param1 == 4 && param2 == 66 || param1 == 4 && param2 == 113 || param1 == 4 && param2 == 114 || param1 == 4 && param2 == 115 || param1 == 4 && param2 == 116 || param1 == 4 && param2 == 117 || param1 == 5 && param2 == 0 || param1 == 5 && param2 == 1;
      }
      
      private function getSystem1PreampData(param1:int) : int
      {
         var _loc2_:int = 0;
         var _loc3_:SystemParams = null;
         _loc2_ = 0;
         _loc3_ = this.mediator.sysex.params.system;
         if(param1 == 80)
         {
            _loc2_ = _loc3_.sys_system1_preamp_a_on_off;
         }
         else if(param1 == 81)
         {
            _loc2_ = _loc3_.sys_system1_preamp_a_type;
         }
         else if(param1 == 82)
         {
            _loc2_ = _loc3_.sys_system1_preamp_a_gain;
         }
         else if(param1 == 83)
         {
            _loc2_ = _loc3_.sys_system1_preamp_a_t_comp;
         }
         else if(param1 == 84)
         {
            _loc2_ = _loc3_.sys_system1_preamp_a_bass;
         }
         else if(param1 == 85)
         {
            _loc2_ = _loc3_.sys_system1_preamp_a_middle;
         }
         else if(param1 == 86)
         {
            _loc2_ = _loc3_.sys_system1_preamp_a_treble;
         }
         else if(param1 == 87)
         {
            _loc2_ = _loc3_.sys_system1_preamp_a_presence;
         }
         else if(param1 == 88)
         {
            _loc2_ = _loc3_.sys_system1_preamp_a_level;
         }
         else if(param1 == 89)
         {
            _loc2_ = _loc3_.sys_system1_preamp_a_bright;
         }
         else if(param1 == 90)
         {
            _loc2_ = _loc3_.sys_system1_preamp_a_gain_sw;
         }
         else if(param1 == 91)
         {
            _loc2_ = _loc3_.sys_system1_preamp_a_solo_sw;
         }
         else if(param1 == 92)
         {
            _loc2_ = _loc3_.sys_system1_preamp_a_solo_level;
         }
         else if(param1 == 93)
         {
            _loc2_ = _loc3_.sys_system1_preamp_a_sp_type;
         }
         else if(param1 == 94)
         {
            _loc2_ = _loc3_.sys_system1_preamp_a_mic_type;
         }
         else if(param1 == 95)
         {
            _loc2_ = _loc3_.sys_system1_preamp_a_mic_dis;
         }
         else if(param1 == 96)
         {
            _loc2_ = _loc3_.sys_system1_preamp_a_mic_pos;
         }
         else if(param1 == 97)
         {
            _loc2_ = _loc3_.sys_system1_preamp_a_mic_level;
         }
         else if(param1 == 98)
         {
            _loc2_ = _loc3_.sys_system1_preamp_a_direct_mix;
         }
         else if(param1 == 99)
         {
            _loc2_ = _loc3_.sys_system1_preamp_a_custom_type;
         }
         else if(param1 == 100)
         {
            _loc2_ = _loc3_.sys_system1_preamp_a_custom_bottom;
         }
         else if(param1 == 101)
         {
            _loc2_ = _loc3_.sys_system1_preamp_a_custom_edge;
         }
         else if(param1 == 104)
         {
            _loc2_ = _loc3_.sys_system1_preamp_a_custom_preamp_low;
         }
         else if(param1 == 105)
         {
            _loc2_ = _loc3_.sys_system1_preamp_a_custom_preamp_high;
         }
         else if(param1 == 106)
         {
            _loc2_ = _loc3_.sys_system1_preamp_a_custom_char;
         }
         else if(param1 == 107)
         {
            _loc2_ = _loc3_.sys_system1_preamp_a_custom_sp_size;
         }
         else if(param1 == 108)
         {
            _loc2_ = _loc3_.sys_system1_preamp_a_custom_sp_color_low;
         }
         else if(param1 == 109)
         {
            _loc2_ = _loc3_.sys_system1_preamp_a_custom_sp_color_high;
         }
         else if(param1 == 110)
         {
            _loc2_ = _loc3_.sys_system1_preamp_a_custom_sp_num;
         }
         else if(param1 == 111)
         {
            _loc2_ = _loc3_.sys_system1_preamp_a_custom_sp_cabinet;
         }
         else if(param1 == 256)
         {
            _loc2_ = _loc3_.sys_system1_preamp_b_on_off;
         }
         else if(param1 == 257)
         {
            _loc2_ = _loc3_.sys_system1_preamp_b_type;
         }
         else if(param1 == 258)
         {
            _loc2_ = _loc3_.sys_system1_preamp_b_gain;
         }
         else if(param1 == 259)
         {
            _loc2_ = _loc3_.sys_system1_preamp_b_t_comp;
         }
         else if(param1 == 260)
         {
            _loc2_ = _loc3_.sys_system1_preamp_b_bass;
         }
         else if(param1 == 261)
         {
            _loc2_ = _loc3_.sys_system1_preamp_b_middle;
         }
         else if(param1 == 262)
         {
            _loc2_ = _loc3_.sys_system1_preamp_b_treble;
         }
         else if(param1 == 263)
         {
            _loc2_ = _loc3_.sys_system1_preamp_b_presence;
         }
         else if(param1 == 264)
         {
            _loc2_ = _loc3_.sys_system1_preamp_b_level;
         }
         else if(param1 == 265)
         {
            _loc2_ = _loc3_.sys_system1_preamp_b_bright;
         }
         else if(param1 == 266)
         {
            _loc2_ = _loc3_.sys_system1_preamp_b_gain_sw;
         }
         else if(param1 == 267)
         {
            _loc2_ = _loc3_.sys_system1_preamp_b_solo_sw;
         }
         else if(param1 == 268)
         {
            _loc2_ = _loc3_.sys_system1_preamp_b_solo_level;
         }
         else if(param1 == 269)
         {
            _loc2_ = _loc3_.sys_system1_preamp_b_sp_type;
         }
         else if(param1 == 270)
         {
            _loc2_ = _loc3_.sys_system1_preamp_b_mic_type;
         }
         else if(param1 == 271)
         {
            _loc2_ = _loc3_.sys_system1_preamp_b_mic_dis;
         }
         else if(param1 == 272)
         {
            _loc2_ = _loc3_.sys_system1_preamp_b_mic_pos;
         }
         else if(param1 == 273)
         {
            _loc2_ = _loc3_.sys_system1_preamp_b_mic_level;
         }
         else if(param1 == 274)
         {
            _loc2_ = _loc3_.sys_system1_preamp_b_direct_mix;
         }
         else if(param1 == 275)
         {
            _loc2_ = _loc3_.sys_system1_preamp_b_custom_type;
         }
         else if(param1 == 276)
         {
            _loc2_ = _loc3_.sys_system1_preamp_b_custom_bottom;
         }
         else if(param1 == 277)
         {
            _loc2_ = _loc3_.sys_system1_preamp_b_custom_edge;
         }
         else if(param1 == 280)
         {
            _loc2_ = _loc3_.sys_system1_preamp_b_custom_preamp_low;
         }
         else if(param1 == 281)
         {
            _loc2_ = _loc3_.sys_system1_preamp_b_custom_preamp_high;
         }
         else if(param1 == 282)
         {
            _loc2_ = _loc3_.sys_system1_preamp_b_custom_char;
         }
         else if(param1 == 283)
         {
            _loc2_ = _loc3_.sys_system1_preamp_b_custom_sp_size;
         }
         else if(param1 == 284)
         {
            _loc2_ = _loc3_.sys_system1_preamp_b_custom_sp_color_low;
         }
         else if(param1 == 285)
         {
            _loc2_ = _loc3_.sys_system1_preamp_b_custom_sp_color_high;
         }
         else if(param1 == 286)
         {
            _loc2_ = _loc3_.sys_system1_preamp_b_custom_sp_num;
         }
         else if(param1 == 287)
         {
            _loc2_ = _loc3_.sys_system1_preamp_b_custom_sp_cabinet;
         }
         return _loc2_;
      }
      
      private function getSystem2PreampData(param1:int) : int
      {
         var _loc2_:int = 0;
         var _loc3_:SystemParams = null;
         _loc2_ = 0;
         _loc3_ = this.mediator.sysex.params.system;
         if(param1 == 80)
         {
            _loc2_ = _loc3_.sys_system2_preamp_a_on_off;
         }
         else if(param1 == 81)
         {
            _loc2_ = _loc3_.sys_system2_preamp_a_type;
         }
         else if(param1 == 82)
         {
            _loc2_ = _loc3_.sys_system2_preamp_a_gain;
         }
         else if(param1 == 83)
         {
            _loc2_ = _loc3_.sys_system2_preamp_a_t_comp;
         }
         else if(param1 == 84)
         {
            _loc2_ = _loc3_.sys_system2_preamp_a_bass;
         }
         else if(param1 == 85)
         {
            _loc2_ = _loc3_.sys_system2_preamp_a_middle;
         }
         else if(param1 == 86)
         {
            _loc2_ = _loc3_.sys_system2_preamp_a_treble;
         }
         else if(param1 == 87)
         {
            _loc2_ = _loc3_.sys_system2_preamp_a_presence;
         }
         else if(param1 == 88)
         {
            _loc2_ = _loc3_.sys_system2_preamp_a_level;
         }
         else if(param1 == 89)
         {
            _loc2_ = _loc3_.sys_system2_preamp_a_bright;
         }
         else if(param1 == 90)
         {
            _loc2_ = _loc3_.sys_system2_preamp_a_gain_sw;
         }
         else if(param1 == 91)
         {
            _loc2_ = _loc3_.sys_system2_preamp_a_solo_sw;
         }
         else if(param1 == 92)
         {
            _loc2_ = _loc3_.sys_system2_preamp_a_solo_level;
         }
         else if(param1 == 93)
         {
            _loc2_ = _loc3_.sys_system2_preamp_a_sp_type;
         }
         else if(param1 == 94)
         {
            _loc2_ = _loc3_.sys_system2_preamp_a_mic_type;
         }
         else if(param1 == 95)
         {
            _loc2_ = _loc3_.sys_system2_preamp_a_mic_dis;
         }
         else if(param1 == 96)
         {
            _loc2_ = _loc3_.sys_system2_preamp_a_mic_pos;
         }
         else if(param1 == 97)
         {
            _loc2_ = _loc3_.sys_system2_preamp_a_mic_level;
         }
         else if(param1 == 98)
         {
            _loc2_ = _loc3_.sys_system2_preamp_a_direct_mix;
         }
         else if(param1 == 99)
         {
            _loc2_ = _loc3_.sys_system2_preamp_a_custom_type;
         }
         else if(param1 == 100)
         {
            _loc2_ = _loc3_.sys_system2_preamp_a_custom_bottom;
         }
         else if(param1 == 101)
         {
            _loc2_ = _loc3_.sys_system2_preamp_a_custom_edge;
         }
         else if(param1 == 104)
         {
            _loc2_ = _loc3_.sys_system2_preamp_a_custom_preamp_low;
         }
         else if(param1 == 105)
         {
            _loc2_ = _loc3_.sys_system2_preamp_a_custom_preamp_high;
         }
         else if(param1 == 106)
         {
            _loc2_ = _loc3_.sys_system2_preamp_a_custom_char;
         }
         else if(param1 == 107)
         {
            _loc2_ = _loc3_.sys_system2_preamp_a_custom_sp_size;
         }
         else if(param1 == 108)
         {
            _loc2_ = _loc3_.sys_system2_preamp_a_custom_sp_color_low;
         }
         else if(param1 == 109)
         {
            _loc2_ = _loc3_.sys_system2_preamp_a_custom_sp_color_high;
         }
         else if(param1 == 110)
         {
            _loc2_ = _loc3_.sys_system2_preamp_a_custom_sp_num;
         }
         else if(param1 == 111)
         {
            _loc2_ = _loc3_.sys_system2_preamp_a_custom_sp_cabinet;
         }
         else if(param1 == 256)
         {
            _loc2_ = _loc3_.sys_system2_preamp_b_on_off;
         }
         else if(param1 == 257)
         {
            _loc2_ = _loc3_.sys_system2_preamp_b_type;
         }
         else if(param1 == 258)
         {
            _loc2_ = _loc3_.sys_system2_preamp_b_gain;
         }
         else if(param1 == 259)
         {
            _loc2_ = _loc3_.sys_system2_preamp_b_t_comp;
         }
         else if(param1 == 260)
         {
            _loc2_ = _loc3_.sys_system2_preamp_b_bass;
         }
         else if(param1 == 261)
         {
            _loc2_ = _loc3_.sys_system2_preamp_b_middle;
         }
         else if(param1 == 262)
         {
            _loc2_ = _loc3_.sys_system2_preamp_b_treble;
         }
         else if(param1 == 263)
         {
            _loc2_ = _loc3_.sys_system2_preamp_b_presence;
         }
         else if(param1 == 264)
         {
            _loc2_ = _loc3_.sys_system2_preamp_b_level;
         }
         else if(param1 == 265)
         {
            _loc2_ = _loc3_.sys_system2_preamp_b_bright;
         }
         else if(param1 == 266)
         {
            _loc2_ = _loc3_.sys_system2_preamp_b_gain_sw;
         }
         else if(param1 == 267)
         {
            _loc2_ = _loc3_.sys_system2_preamp_b_solo_sw;
         }
         else if(param1 == 268)
         {
            _loc2_ = _loc3_.sys_system2_preamp_b_solo_level;
         }
         else if(param1 == 269)
         {
            _loc2_ = _loc3_.sys_system2_preamp_b_sp_type;
         }
         else if(param1 == 270)
         {
            _loc2_ = _loc3_.sys_system2_preamp_b_mic_type;
         }
         else if(param1 == 271)
         {
            _loc2_ = _loc3_.sys_system2_preamp_b_mic_dis;
         }
         else if(param1 == 272)
         {
            _loc2_ = _loc3_.sys_system2_preamp_b_mic_pos;
         }
         else if(param1 == 273)
         {
            _loc2_ = _loc3_.sys_system2_preamp_b_mic_level;
         }
         else if(param1 == 274)
         {
            _loc2_ = _loc3_.sys_system2_preamp_b_direct_mix;
         }
         else if(param1 == 275)
         {
            _loc2_ = _loc3_.sys_system2_preamp_b_custom_type;
         }
         else if(param1 == 276)
         {
            _loc2_ = _loc3_.sys_system2_preamp_b_custom_bottom;
         }
         else if(param1 == 277)
         {
            _loc2_ = _loc3_.sys_system2_preamp_b_custom_edge;
         }
         else if(param1 == 280)
         {
            _loc2_ = _loc3_.sys_system2_preamp_b_custom_preamp_low;
         }
         else if(param1 == 281)
         {
            _loc2_ = _loc3_.sys_system2_preamp_b_custom_preamp_high;
         }
         else if(param1 == 282)
         {
            _loc2_ = _loc3_.sys_system2_preamp_b_custom_char;
         }
         else if(param1 == 283)
         {
            _loc2_ = _loc3_.sys_system2_preamp_b_custom_sp_size;
         }
         else if(param1 == 284)
         {
            _loc2_ = _loc3_.sys_system2_preamp_b_custom_sp_color_low;
         }
         else if(param1 == 285)
         {
            _loc2_ = _loc3_.sys_system2_preamp_b_custom_sp_color_high;
         }
         else if(param1 == 286)
         {
            _loc2_ = _loc3_.sys_system2_preamp_b_custom_sp_num;
         }
         else if(param1 == 287)
         {
            _loc2_ = _loc3_.sys_system2_preamp_b_custom_sp_cabinet;
         }
         return _loc2_;
      }
      
      private function getSystem3PreampData(param1:int) : int
      {
         var _loc2_:int = 0;
         var _loc3_:SystemParams = null;
         _loc2_ = 0;
         _loc3_ = this.mediator.sysex.params.system;
         if(param1 == 80)
         {
            _loc2_ = _loc3_.sys_system3_preamp_a_on_off;
         }
         else if(param1 == 81)
         {
            _loc2_ = _loc3_.sys_system3_preamp_a_type;
         }
         else if(param1 == 82)
         {
            _loc2_ = _loc3_.sys_system3_preamp_a_gain;
         }
         else if(param1 == 83)
         {
            _loc2_ = _loc3_.sys_system3_preamp_a_t_comp;
         }
         else if(param1 == 84)
         {
            _loc2_ = _loc3_.sys_system3_preamp_a_bass;
         }
         else if(param1 == 85)
         {
            _loc2_ = _loc3_.sys_system3_preamp_a_middle;
         }
         else if(param1 == 86)
         {
            _loc2_ = _loc3_.sys_system3_preamp_a_treble;
         }
         else if(param1 == 87)
         {
            _loc2_ = _loc3_.sys_system3_preamp_a_presence;
         }
         else if(param1 == 88)
         {
            _loc2_ = _loc3_.sys_system3_preamp_a_level;
         }
         else if(param1 == 89)
         {
            _loc2_ = _loc3_.sys_system3_preamp_a_bright;
         }
         else if(param1 == 90)
         {
            _loc2_ = _loc3_.sys_system3_preamp_a_gain_sw;
         }
         else if(param1 == 91)
         {
            _loc2_ = _loc3_.sys_system3_preamp_a_solo_sw;
         }
         else if(param1 == 92)
         {
            _loc2_ = _loc3_.sys_system3_preamp_a_solo_level;
         }
         else if(param1 == 93)
         {
            _loc2_ = _loc3_.sys_system3_preamp_a_sp_type;
         }
         else if(param1 == 94)
         {
            _loc2_ = _loc3_.sys_system3_preamp_a_mic_type;
         }
         else if(param1 == 95)
         {
            _loc2_ = _loc3_.sys_system3_preamp_a_mic_dis;
         }
         else if(param1 == 96)
         {
            _loc2_ = _loc3_.sys_system3_preamp_a_mic_pos;
         }
         else if(param1 == 97)
         {
            _loc2_ = _loc3_.sys_system3_preamp_a_mic_level;
         }
         else if(param1 == 98)
         {
            _loc2_ = _loc3_.sys_system3_preamp_a_direct_mix;
         }
         else if(param1 == 99)
         {
            _loc2_ = _loc3_.sys_system3_preamp_a_custom_type;
         }
         else if(param1 == 100)
         {
            _loc2_ = _loc3_.sys_system3_preamp_a_custom_bottom;
         }
         else if(param1 == 101)
         {
            _loc2_ = _loc3_.sys_system3_preamp_a_custom_edge;
         }
         else if(param1 == 104)
         {
            _loc2_ = _loc3_.sys_system3_preamp_a_custom_preamp_low;
         }
         else if(param1 == 105)
         {
            _loc2_ = _loc3_.sys_system3_preamp_a_custom_preamp_high;
         }
         else if(param1 == 106)
         {
            _loc2_ = _loc3_.sys_system3_preamp_a_custom_char;
         }
         else if(param1 == 107)
         {
            _loc2_ = _loc3_.sys_system3_preamp_a_custom_sp_size;
         }
         else if(param1 == 108)
         {
            _loc2_ = _loc3_.sys_system3_preamp_a_custom_sp_color_low;
         }
         else if(param1 == 109)
         {
            _loc2_ = _loc3_.sys_system3_preamp_a_custom_sp_color_high;
         }
         else if(param1 == 110)
         {
            _loc2_ = _loc3_.sys_system3_preamp_a_custom_sp_num;
         }
         else if(param1 == 111)
         {
            _loc2_ = _loc3_.sys_system3_preamp_a_custom_sp_cabinet;
         }
         else if(param1 == 256)
         {
            _loc2_ = _loc3_.sys_system3_preamp_b_on_off;
         }
         else if(param1 == 257)
         {
            _loc2_ = _loc3_.sys_system3_preamp_b_type;
         }
         else if(param1 == 258)
         {
            _loc2_ = _loc3_.sys_system3_preamp_b_gain;
         }
         else if(param1 == 259)
         {
            _loc2_ = _loc3_.sys_system3_preamp_b_t_comp;
         }
         else if(param1 == 260)
         {
            _loc2_ = _loc3_.sys_system3_preamp_b_bass;
         }
         else if(param1 == 261)
         {
            _loc2_ = _loc3_.sys_system3_preamp_b_middle;
         }
         else if(param1 == 262)
         {
            _loc2_ = _loc3_.sys_system3_preamp_b_treble;
         }
         else if(param1 == 263)
         {
            _loc2_ = _loc3_.sys_system3_preamp_b_presence;
         }
         else if(param1 == 264)
         {
            _loc2_ = _loc3_.sys_system3_preamp_b_level;
         }
         else if(param1 == 265)
         {
            _loc2_ = _loc3_.sys_system3_preamp_b_bright;
         }
         else if(param1 == 266)
         {
            _loc2_ = _loc3_.sys_system3_preamp_b_gain_sw;
         }
         else if(param1 == 267)
         {
            _loc2_ = _loc3_.sys_system3_preamp_b_solo_sw;
         }
         else if(param1 == 268)
         {
            _loc2_ = _loc3_.sys_system3_preamp_b_solo_level;
         }
         else if(param1 == 269)
         {
            _loc2_ = _loc3_.sys_system3_preamp_b_sp_type;
         }
         else if(param1 == 270)
         {
            _loc2_ = _loc3_.sys_system3_preamp_b_mic_type;
         }
         else if(param1 == 271)
         {
            _loc2_ = _loc3_.sys_system3_preamp_b_mic_dis;
         }
         else if(param1 == 272)
         {
            _loc2_ = _loc3_.sys_system3_preamp_b_mic_pos;
         }
         else if(param1 == 273)
         {
            _loc2_ = _loc3_.sys_system3_preamp_b_mic_level;
         }
         else if(param1 == 274)
         {
            _loc2_ = _loc3_.sys_system3_preamp_b_direct_mix;
         }
         else if(param1 == 275)
         {
            _loc2_ = _loc3_.sys_system3_preamp_b_custom_type;
         }
         else if(param1 == 276)
         {
            _loc2_ = _loc3_.sys_system3_preamp_b_custom_bottom;
         }
         else if(param1 == 277)
         {
            _loc2_ = _loc3_.sys_system3_preamp_b_custom_edge;
         }
         else if(param1 == 280)
         {
            _loc2_ = _loc3_.sys_system3_preamp_b_custom_preamp_low;
         }
         else if(param1 == 281)
         {
            _loc2_ = _loc3_.sys_system3_preamp_b_custom_preamp_high;
         }
         else if(param1 == 282)
         {
            _loc2_ = _loc3_.sys_system3_preamp_b_custom_char;
         }
         else if(param1 == 283)
         {
            _loc2_ = _loc3_.sys_system3_preamp_b_custom_sp_size;
         }
         else if(param1 == 284)
         {
            _loc2_ = _loc3_.sys_system3_preamp_b_custom_sp_color_low;
         }
         else if(param1 == 285)
         {
            _loc2_ = _loc3_.sys_system3_preamp_b_custom_sp_color_high;
         }
         else if(param1 == 286)
         {
            _loc2_ = _loc3_.sys_system3_preamp_b_custom_sp_num;
         }
         else if(param1 == 287)
         {
            _loc2_ = _loc3_.sys_system3_preamp_b_custom_sp_cabinet;
         }
         return _loc2_;
      }
      
      private function getPatchPreampData(param1:int) : int
      {
         var _loc2_:int = 0;
         _loc2_ = 0;
         if(param1 == 80)
         {
            _loc2_ = this.preamp_a_on_off;
         }
         else if(param1 == 81)
         {
            _loc2_ = this.preamp_a_type;
         }
         else if(param1 == 82)
         {
            _loc2_ = this.preamp_a_gain;
         }
         else if(param1 == 83)
         {
            _loc2_ = this.preamp_a_t_comp;
         }
         else if(param1 == 84)
         {
            _loc2_ = this.preamp_a_bass;
         }
         else if(param1 == 85)
         {
            _loc2_ = this.preamp_a_middle;
         }
         else if(param1 == 86)
         {
            _loc2_ = this.preamp_a_treble;
         }
         else if(param1 == 87)
         {
            _loc2_ = this.preamp_a_presence;
         }
         else if(param1 == 88)
         {
            _loc2_ = this.preamp_a_level;
         }
         else if(param1 == 89)
         {
            _loc2_ = this.preamp_a_bright;
         }
         else if(param1 == 90)
         {
            _loc2_ = this.preamp_a_gain_sw;
         }
         else if(param1 == 91)
         {
            _loc2_ = this.preamp_a_solo_sw;
         }
         else if(param1 == 92)
         {
            _loc2_ = this.preamp_a_solo_level;
         }
         else if(param1 == 93)
         {
            _loc2_ = this.preamp_a_sp_type;
         }
         else if(param1 == 94)
         {
            _loc2_ = this.preamp_a_mic_type;
         }
         else if(param1 == 95)
         {
            _loc2_ = this.preamp_a_mic_dis;
         }
         else if(param1 == 96)
         {
            _loc2_ = this.preamp_a_mic_pos;
         }
         else if(param1 == 97)
         {
            _loc2_ = this.preamp_a_mic_level;
         }
         else if(param1 == 98)
         {
            _loc2_ = this.preamp_a_direct_mix;
         }
         else if(param1 == 99)
         {
            _loc2_ = this.preamp_a_custom_type;
         }
         else if(param1 == 100)
         {
            _loc2_ = this.preamp_a_custom_bottom;
         }
         else if(param1 == 101)
         {
            _loc2_ = this.preamp_a_custom_edge;
         }
         else if(param1 == 104)
         {
            _loc2_ = this.preamp_a_custom_preamp_low;
         }
         else if(param1 == 105)
         {
            _loc2_ = this.preamp_a_custom_preamp_high;
         }
         else if(param1 == 106)
         {
            _loc2_ = this.preamp_a_custom_char;
         }
         else if(param1 == 107)
         {
            _loc2_ = this.preamp_a_custom_sp_size;
         }
         else if(param1 == 108)
         {
            _loc2_ = this.preamp_a_custom_sp_color_low;
         }
         else if(param1 == 109)
         {
            _loc2_ = this.preamp_a_custom_sp_color_high;
         }
         else if(param1 == 110)
         {
            _loc2_ = this.preamp_a_custom_sp_num;
         }
         else if(param1 == 111)
         {
            _loc2_ = this.preamp_a_custom_sp_cabinet;
         }
         else if(param1 == 256)
         {
            _loc2_ = this.preamp_b_on_off;
         }
         else if(param1 == 257)
         {
            _loc2_ = this.preamp_b_type;
         }
         else if(param1 == 258)
         {
            _loc2_ = this.preamp_b_gain;
         }
         else if(param1 == 259)
         {
            _loc2_ = this.preamp_b_t_comp;
         }
         else if(param1 == 260)
         {
            _loc2_ = this.preamp_b_bass;
         }
         else if(param1 == 261)
         {
            _loc2_ = this.preamp_b_middle;
         }
         else if(param1 == 262)
         {
            _loc2_ = this.preamp_b_treble;
         }
         else if(param1 == 263)
         {
            _loc2_ = this.preamp_b_presence;
         }
         else if(param1 == 264)
         {
            _loc2_ = this.preamp_b_level;
         }
         else if(param1 == 265)
         {
            _loc2_ = this.preamp_b_bright;
         }
         else if(param1 == 266)
         {
            _loc2_ = this.preamp_b_gain_sw;
         }
         else if(param1 == 267)
         {
            _loc2_ = this.preamp_b_solo_sw;
         }
         else if(param1 == 268)
         {
            _loc2_ = this.preamp_b_solo_level;
         }
         else if(param1 == 269)
         {
            _loc2_ = this.preamp_b_sp_type;
         }
         else if(param1 == 270)
         {
            _loc2_ = this.preamp_b_mic_type;
         }
         else if(param1 == 271)
         {
            _loc2_ = this.preamp_b_mic_dis;
         }
         else if(param1 == 272)
         {
            _loc2_ = this.preamp_b_mic_pos;
         }
         else if(param1 == 273)
         {
            _loc2_ = this.preamp_b_mic_level;
         }
         else if(param1 == 274)
         {
            _loc2_ = this.preamp_b_direct_mix;
         }
         else if(param1 == 275)
         {
            _loc2_ = this.preamp_b_custom_type;
         }
         else if(param1 == 276)
         {
            _loc2_ = this.preamp_b_custom_bottom;
         }
         else if(param1 == 277)
         {
            _loc2_ = this.preamp_b_custom_edge;
         }
         else if(param1 == 280)
         {
            _loc2_ = this.preamp_b_custom_preamp_low;
         }
         else if(param1 == 281)
         {
            _loc2_ = this.preamp_b_custom_preamp_high;
         }
         else if(param1 == 282)
         {
            _loc2_ = this.preamp_b_custom_char;
         }
         else if(param1 == 283)
         {
            _loc2_ = this.preamp_b_custom_sp_size;
         }
         else if(param1 == 284)
         {
            _loc2_ = this.preamp_b_custom_sp_color_low;
         }
         else if(param1 == 285)
         {
            _loc2_ = this.preamp_b_custom_sp_color_high;
         }
         else if(param1 == 286)
         {
            _loc2_ = this.preamp_b_custom_sp_num;
         }
         else if(param1 == 287)
         {
            _loc2_ = this.preamp_b_custom_sp_cabinet;
         }
         return _loc2_;
      }
      
      public function clone() : TemporaryParams
      {
         return restore(ObjectUtil.copy(this));
      }
   }
}

