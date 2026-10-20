package tonecentral.mediator
{
   import flash.events.EventDispatcher;
   import tonecentral.common.define.CTLDefinitionGT;
   import tonecentral.common.define.ParameterDefinitionGT;
   import tonecentral.common.util.ToneCentralUtil;
   import tonecentral.events.ToneCentralEvents;
   
   public class AddressMap extends EventDispatcher
   {
      
      private static var instance:AddressMap;
      
      private var _request:String = "11";
      
      private var _dataset:String = "12";
      
      private var _addressObj:Object;
      
      private var _maker_id:String;
      
      private var _device_id:String;
      
      private var _model_id:String;
      
      private var _request_device_id:String;
      
      private var _request_id:String;
      
      private var _current_patch_no:Object;
      
      public var sys_lcd_contrast_left:Object = {};
      
      public var sys_lcd_contrast_right:Object = {};
      
      public var sys_play_option_bank_change_mode:Object = {};
      
      public var sys_play_option_exp_pedal_hold:Object = {};
      
      public var sys_play_option_knob_lock:Object = {};
      
      public var sys_play_option_num_pedal_sw:Object = {};
      
      public var sys_play_option_bank_extent_min_l:Object = {};
      
      public var sys_play_option_bank_extent_min_h:Object = {};
      
      public var sys_play_option_bank_extent_max_l:Object = {};
      
      public var sys_play_option_bank_extent_max_h:Object = {};
      
      public var sys_play_option_pedal_indicat:Object = {};
      
      public var sys_tuner_pitch:Object = {};
      
      public var sys_tuner_output:Object = {};
      
      public var sys_metronome_on_off:Object = {};
      
      public var sys_metronome_tempo_l:Object = {};
      
      public var sys_metronome_tempo_h:Object = {};
      
      public var sys_metronome_beat:Object = {};
      
      public var sys_metronome_level:Object = {};
      
      public var sys_preference_output_select:Object = {};
      
      public var sys_preference_preamp:Object = {};
      
      public var sys_preference_accel_ctl:Object = {};
      
      public var sys_preference_exp:Object = {};
      
      public var sys_preference_exp_sw:Object = {};
      
      public var sys_preference_sub_ctl1:Object = {};
      
      public var sys_preference_sub_ctl2:Object = {};
      
      public var sys_preference_sub_exp:Object = {};
      
      public var sys_usb_secondary_input_level:Object = {};
      
      public var sys_usb_primary_output_level:Object = {};
      
      public var sys_usb_primary_mix_level:Object = {};
      
      public var sys_usb_direct_monitor:Object = {};
      
      public var sys_usb_secondary_output_level:Object = {};
      
      public var sys_usb_loop_back:Object = {};
      
      public var sys_auto_off:Object = {};
      
      public var sys_output_select:Object = {};
      
      public var sys_input_select:Object = {};
      
      public var sys_input_level:Object = {};
      
      public var sys_global_eq_low_gain:Object = {};
      
      public var sys_global_eq_mid_gain:Object = {};
      
      public var sys_global_eq_mid_freq:Object = {};
      
      public var sys_global_eq_mid_q:Object = {};
      
      public var sys_global_eq_high_gain:Object = {};
      
      public var sys_total_ns_thresh:Object = {};
      
      public var sys_total_reverb_level:Object = {};
      
      public var sys_total_main_out_level:Object = {};
      
      public var sys_mic_level:Object = {};
      
      public var sys_mic_gain:Object = {};
      
      public var sys_mic_phantom_sw:Object = {};
      
      public var sys_phrase_loop_mode:Object = {};
      
      public var sys_phrase_loop_pedal_func:Object = {};
      
      public var sys_phrase_loop_rec_mode:Object = {};
      
      public var sys_phrase_loop_play_level:Object = {};
      
      public var sys_system1_preamp_a_on_off:Object = {};
      
      public var sys_system1_preamp_a_type:Object = {};
      
      public var sys_system1_preamp_a_gain:Object = {};
      
      public var sys_system1_preamp_a_t_comp:Object = {};
      
      public var sys_system1_preamp_a_bass:Object = {};
      
      public var sys_system1_preamp_a_middle:Object = {};
      
      public var sys_system1_preamp_a_treble:Object = {};
      
      public var sys_system1_preamp_a_presence:Object = {};
      
      public var sys_system1_preamp_a_level:Object = {};
      
      public var sys_system1_preamp_a_bright:Object = {};
      
      public var sys_system1_preamp_a_gain_sw:Object = {};
      
      public var sys_system1_preamp_a_solo_sw:Object = {};
      
      public var sys_system1_preamp_a_solo_level:Object = {};
      
      public var sys_system1_preamp_a_sp_type:Object = {};
      
      public var sys_system1_preamp_a_mic_type:Object = {};
      
      public var sys_system1_preamp_a_mic_dis:Object = {};
      
      public var sys_system1_preamp_a_mic_pos:Object = {};
      
      public var sys_system1_preamp_a_mic_level:Object = {};
      
      public var sys_system1_preamp_a_direct_mix:Object = {};
      
      public var sys_system1_preamp_a_custom_type:Object = {};
      
      public var sys_system1_preamp_a_custom_bottom:Object = {};
      
      public var sys_system1_preamp_a_custom_edge:Object = {};
      
      public var sys_system1_preamp_a_custom_preamp_low:Object = {};
      
      public var sys_system1_preamp_a_custom_preamp_high:Object = {};
      
      public var sys_system1_preamp_a_custom_char:Object = {};
      
      public var sys_system1_preamp_a_custom_sp_size:Object = {};
      
      public var sys_system1_preamp_a_custom_sp_color_low:Object = {};
      
      public var sys_system1_preamp_a_custom_sp_color_high:Object = {};
      
      public var sys_system1_preamp_a_custom_sp_num:Object = {};
      
      public var sys_system1_preamp_a_custom_sp_cabinet:Object = {};
      
      public var sys_system1_preamp_b_on_off:Object = {};
      
      public var sys_system1_preamp_b_type:Object = {};
      
      public var sys_system1_preamp_b_gain:Object = {};
      
      public var sys_system1_preamp_b_t_comp:Object = {};
      
      public var sys_system1_preamp_b_bass:Object = {};
      
      public var sys_system1_preamp_b_middle:Object = {};
      
      public var sys_system1_preamp_b_treble:Object = {};
      
      public var sys_system1_preamp_b_presence:Object = {};
      
      public var sys_system1_preamp_b_level:Object = {};
      
      public var sys_system1_preamp_b_bright:Object = {};
      
      public var sys_system1_preamp_b_gain_sw:Object = {};
      
      public var sys_system1_preamp_b_solo_sw:Object = {};
      
      public var sys_system1_preamp_b_solo_level:Object = {};
      
      public var sys_system1_preamp_b_sp_type:Object = {};
      
      public var sys_system1_preamp_b_mic_type:Object = {};
      
      public var sys_system1_preamp_b_mic_dis:Object = {};
      
      public var sys_system1_preamp_b_mic_pos:Object = {};
      
      public var sys_system1_preamp_b_mic_level:Object = {};
      
      public var sys_system1_preamp_b_direct_mix:Object = {};
      
      public var sys_system1_preamp_b_custom_type:Object = {};
      
      public var sys_system1_preamp_b_custom_bottom:Object = {};
      
      public var sys_system1_preamp_b_custom_edge:Object = {};
      
      public var sys_system1_preamp_b_custom_preamp_low:Object = {};
      
      public var sys_system1_preamp_b_custom_preamp_high:Object = {};
      
      public var sys_system1_preamp_b_custom_char:Object = {};
      
      public var sys_system1_preamp_b_custom_sp_size:Object = {};
      
      public var sys_system1_preamp_b_custom_sp_color_low:Object = {};
      
      public var sys_system1_preamp_b_custom_sp_color_high:Object = {};
      
      public var sys_system1_preamp_b_custom_sp_num:Object = {};
      
      public var sys_system1_preamp_b_custom_sp_cabinet:Object = {};
      
      public var sys_system2_preamp_a_on_off:Object = {};
      
      public var sys_system2_preamp_a_type:Object = {};
      
      public var sys_system2_preamp_a_gain:Object = {};
      
      public var sys_system2_preamp_a_t_comp:Object = {};
      
      public var sys_system2_preamp_a_bass:Object = {};
      
      public var sys_system2_preamp_a_middle:Object = {};
      
      public var sys_system2_preamp_a_treble:Object = {};
      
      public var sys_system2_preamp_a_presence:Object = {};
      
      public var sys_system2_preamp_a_level:Object = {};
      
      public var sys_system2_preamp_a_bright:Object = {};
      
      public var sys_system2_preamp_a_gain_sw:Object = {};
      
      public var sys_system2_preamp_a_solo_sw:Object = {};
      
      public var sys_system2_preamp_a_solo_level:Object = {};
      
      public var sys_system2_preamp_a_sp_type:Object = {};
      
      public var sys_system2_preamp_a_mic_type:Object = {};
      
      public var sys_system2_preamp_a_mic_dis:Object = {};
      
      public var sys_system2_preamp_a_mic_pos:Object = {};
      
      public var sys_system2_preamp_a_mic_level:Object = {};
      
      public var sys_system2_preamp_a_direct_mix:Object = {};
      
      public var sys_system2_preamp_a_custom_type:Object = {};
      
      public var sys_system2_preamp_a_custom_bottom:Object = {};
      
      public var sys_system2_preamp_a_custom_edge:Object = {};
      
      public var sys_system2_preamp_a_custom_preamp_low:Object = {};
      
      public var sys_system2_preamp_a_custom_preamp_high:Object = {};
      
      public var sys_system2_preamp_a_custom_char:Object = {};
      
      public var sys_system2_preamp_a_custom_sp_size:Object = {};
      
      public var sys_system2_preamp_a_custom_sp_color_low:Object = {};
      
      public var sys_system2_preamp_a_custom_sp_color_high:Object = {};
      
      public var sys_system2_preamp_a_custom_sp_num:Object = {};
      
      public var sys_system2_preamp_a_custom_sp_cabinet:Object = {};
      
      public var sys_system2_preamp_b_on_off:Object = {};
      
      public var sys_system2_preamp_b_type:Object = {};
      
      public var sys_system2_preamp_b_gain:Object = {};
      
      public var sys_system2_preamp_b_t_comp:Object = {};
      
      public var sys_system2_preamp_b_bass:Object = {};
      
      public var sys_system2_preamp_b_middle:Object = {};
      
      public var sys_system2_preamp_b_treble:Object = {};
      
      public var sys_system2_preamp_b_presence:Object = {};
      
      public var sys_system2_preamp_b_level:Object = {};
      
      public var sys_system2_preamp_b_bright:Object = {};
      
      public var sys_system2_preamp_b_gain_sw:Object = {};
      
      public var sys_system2_preamp_b_solo_sw:Object = {};
      
      public var sys_system2_preamp_b_solo_level:Object = {};
      
      public var sys_system2_preamp_b_sp_type:Object = {};
      
      public var sys_system2_preamp_b_mic_type:Object = {};
      
      public var sys_system2_preamp_b_mic_dis:Object = {};
      
      public var sys_system2_preamp_b_mic_pos:Object = {};
      
      public var sys_system2_preamp_b_mic_level:Object = {};
      
      public var sys_system2_preamp_b_direct_mix:Object = {};
      
      public var sys_system2_preamp_b_custom_type:Object = {};
      
      public var sys_system2_preamp_b_custom_bottom:Object = {};
      
      public var sys_system2_preamp_b_custom_edge:Object = {};
      
      public var sys_system2_preamp_b_custom_preamp_low:Object = {};
      
      public var sys_system2_preamp_b_custom_preamp_high:Object = {};
      
      public var sys_system2_preamp_b_custom_char:Object = {};
      
      public var sys_system2_preamp_b_custom_sp_size:Object = {};
      
      public var sys_system2_preamp_b_custom_sp_color_low:Object = {};
      
      public var sys_system2_preamp_b_custom_sp_color_high:Object = {};
      
      public var sys_system2_preamp_b_custom_sp_num:Object = {};
      
      public var sys_system2_preamp_b_custom_sp_cabinet:Object = {};
      
      public var sys_system3_preamp_a_on_off:Object = {};
      
      public var sys_system3_preamp_a_type:Object = {};
      
      public var sys_system3_preamp_a_gain:Object = {};
      
      public var sys_system3_preamp_a_t_comp:Object = {};
      
      public var sys_system3_preamp_a_bass:Object = {};
      
      public var sys_system3_preamp_a_middle:Object = {};
      
      public var sys_system3_preamp_a_treble:Object = {};
      
      public var sys_system3_preamp_a_presence:Object = {};
      
      public var sys_system3_preamp_a_level:Object = {};
      
      public var sys_system3_preamp_a_bright:Object = {};
      
      public var sys_system3_preamp_a_gain_sw:Object = {};
      
      public var sys_system3_preamp_a_solo_sw:Object = {};
      
      public var sys_system3_preamp_a_solo_level:Object = {};
      
      public var sys_system3_preamp_a_sp_type:Object = {};
      
      public var sys_system3_preamp_a_mic_type:Object = {};
      
      public var sys_system3_preamp_a_mic_dis:Object = {};
      
      public var sys_system3_preamp_a_mic_pos:Object = {};
      
      public var sys_system3_preamp_a_mic_level:Object = {};
      
      public var sys_system3_preamp_a_direct_mix:Object = {};
      
      public var sys_system3_preamp_a_custom_type:Object = {};
      
      public var sys_system3_preamp_a_custom_bottom:Object = {};
      
      public var sys_system3_preamp_a_custom_edge:Object = {};
      
      public var sys_system3_preamp_a_custom_preamp_low:Object = {};
      
      public var sys_system3_preamp_a_custom_preamp_high:Object = {};
      
      public var sys_system3_preamp_a_custom_char:Object = {};
      
      public var sys_system3_preamp_a_custom_sp_size:Object = {};
      
      public var sys_system3_preamp_a_custom_sp_color_low:Object = {};
      
      public var sys_system3_preamp_a_custom_sp_color_high:Object = {};
      
      public var sys_system3_preamp_a_custom_sp_num:Object = {};
      
      public var sys_system3_preamp_a_custom_sp_cabinet:Object = {};
      
      public var sys_system3_preamp_b_on_off:Object = {};
      
      public var sys_system3_preamp_b_type:Object = {};
      
      public var sys_system3_preamp_b_gain:Object = {};
      
      public var sys_system3_preamp_b_t_comp:Object = {};
      
      public var sys_system3_preamp_b_bass:Object = {};
      
      public var sys_system3_preamp_b_middle:Object = {};
      
      public var sys_system3_preamp_b_treble:Object = {};
      
      public var sys_system3_preamp_b_presence:Object = {};
      
      public var sys_system3_preamp_b_level:Object = {};
      
      public var sys_system3_preamp_b_bright:Object = {};
      
      public var sys_system3_preamp_b_gain_sw:Object = {};
      
      public var sys_system3_preamp_b_solo_sw:Object = {};
      
      public var sys_system3_preamp_b_solo_level:Object = {};
      
      public var sys_system3_preamp_b_sp_type:Object = {};
      
      public var sys_system3_preamp_b_mic_type:Object = {};
      
      public var sys_system3_preamp_b_mic_dis:Object = {};
      
      public var sys_system3_preamp_b_mic_pos:Object = {};
      
      public var sys_system3_preamp_b_mic_level:Object = {};
      
      public var sys_system3_preamp_b_direct_mix:Object = {};
      
      public var sys_system3_preamp_b_custom_type:Object = {};
      
      public var sys_system3_preamp_b_custom_bottom:Object = {};
      
      public var sys_system3_preamp_b_custom_edge:Object = {};
      
      public var sys_system3_preamp_b_custom_preamp_low:Object = {};
      
      public var sys_system3_preamp_b_custom_preamp_high:Object = {};
      
      public var sys_system3_preamp_b_custom_char:Object = {};
      
      public var sys_system3_preamp_b_custom_sp_size:Object = {};
      
      public var sys_system3_preamp_b_custom_sp_color_low:Object = {};
      
      public var sys_system3_preamp_b_custom_sp_color_high:Object = {};
      
      public var sys_system3_preamp_b_custom_sp_num:Object = {};
      
      public var sys_system3_preamp_b_custom_sp_cabinet:Object = {};
      
      public var sys_knob_setting_knob1_l:Object = {};
      
      public var sys_knob_setting_knob1_h:Object = {};
      
      public var sys_knob_setting_knob2_l:Object = {};
      
      public var sys_knob_setting_knob2_h:Object = {};
      
      public var sys_knob_setting_knob3_l:Object = {};
      
      public var sys_knob_setting_knob3_h:Object = {};
      
      public var sys_knob_setting_knob4_l:Object = {};
      
      public var sys_knob_setting_knob4_h:Object = {};
      
      public var sys_knob_setting_knob5_l:Object = {};
      
      public var sys_knob_setting_knob5_h:Object = {};
      
      public var sys_knob_setting_knob6_l:Object = {};
      
      public var sys_knob_setting_knob6_h:Object = {};
      
      public var sys_knob_setting_knob7_l:Object = {};
      
      public var sys_knob_setting_knob7_h:Object = {};
      
      public var sys_knob_setting_knob8_l:Object = {};
      
      public var sys_knob_setting_knob8_h:Object = {};
      
      public var sys_accel_ctl_func:Object = {};
      
      public var sys_accel_ctl_min:Object = {};
      
      public var sys_accel_ctl_max:Object = {};
      
      public var sys_accel_ctl_source_mode:Object = {};
      
      public var sys_exp_sw_func:Object = {};
      
      public var sys_exp_sw_min:Object = {};
      
      public var sys_exp_sw_max:Object = {};
      
      public var sys_exp_sw_source_mode:Object = {};
      
      public var sys_sub_ctl1_func:Object = {};
      
      public var sys_sub_ctl1_min:Object = {};
      
      public var sys_sub_ctl1_max:Object = {};
      
      public var sys_sub_ctl1_source_mode:Object = {};
      
      public var sys_sub_ctl2_func:Object = {};
      
      public var sys_sub_ctl2_min:Object = {};
      
      public var sys_sub_ctl2_max:Object = {};
      
      public var sys_sub_ctl2_source_mode:Object = {};
      
      public var sys_exp_func:Object = {};
      
      public var sys_exp_patch_level_min:Object = {};
      
      public var sys_exp_patch_level_max:Object = {};
      
      public var sys_sub_exp_func:Object = {};
      
      public var sys_sub_exp_patch_level_min:Object = {};
      
      public var sys_sub_exp_patch_level_max:Object = {};
      
      public var sys_gtr_to_midi_sw:Object = {};
      
      public var sys_gtr_to_midi_monopoly:Object = {};
      
      public var sys_gtr_to_midi_bendrange:Object = {};
      
      public var sys_gtr_to_midi_bendthin:Object = {};
      
      public var sys_gtr_to_midi_playfeel:Object = {};
      
      public var sys_gtr_to_midi_chromatic:Object = {};
      
      public var sys_favarite_1_patch_no_l:Object = {};
      
      public var sys_favarite_1_patch_no_h:Object = {};
      
      public var sys_favarite_2_patch_no_l:Object = {};
      
      public var sys_favarite_2_patch_no_h:Object = {};
      
      public var sys_favarite_3_patch_no_l:Object = {};
      
      public var sys_favarite_3_patch_no_h:Object = {};
      
      public var sys_favarite_4_patch_no_l:Object = {};
      
      public var sys_favarite_4_patch_no_h:Object = {};
      
      public var sys_play_option_patch_ext_min_l:Object = {};
      
      public var sys_play_option_patch_ext_min_h:Object = {};
      
      public var sys_play_option_patch_ext_max_l:Object = {};
      
      public var sys_play_option_patch_ext_max_h:Object = {};
      
      public var sys_play_option_num12_dedal_func:Object = {};
      
      public var sys_polyphonic_tuner_select:Object = {};
      
      public var sys_polyphonic_tuner_type:Object = {};
      
      public var sys_polyphonic_tuner_offset:Object = {};
      
      public var sys_send_return_on_off:Object = {};
      
      public var sys_send_return_mode:Object = {};
      
      public var sys_send_return_send_level:Object = {};
      
      public var sys_send_return_return_level:Object = {};
      
      public var sys_led_state_fx1:Object = {};
      
      public var sys_led_state_fx2:Object = {};
      
      public var sys_led_state_fx3:Object = {};
      
      public var sys_fxsel_state_fx:Object = {};
      
      public var sys_fxsel_state_fx2:Object = {};
      
      public var sys_fxsel_state_fx3:Object = {};
      
      public var sys_knob_pos_type:Object = {};
      
      public var sys_knob_pos_gain:Object = {};
      
      public var sys_knob_pos_volume:Object = {};
      
      public var sys_knob_pos_bass:Object = {};
      
      public var sys_knob_pos_middle:Object = {};
      
      public var sys_knob_pos_treble:Object = {};
      
      public var sys_knob_pos_presnce:Object = {};
      
      public var sys_knob_pos_fx1:Object = {};
      
      public var sys_knob_pos_fx2:Object = {};
      
      public var sys_knob_pos_fx3:Object = {};
      
      public var lineout_cabinet_setting_lineout_airfeel:Object = {};
      
      public var lineout_cabinet_setting_cabinet_resonance:Object = {};
      
      public var global_eq_setting_sw:Object = {};
      
      public var global_eq_setting_low_cut:Object = {};
      
      public var global_eq_setting_low_gain:Object = {};
      
      public var global_eq_setting_lowmid_freq:Object = {};
      
      public var global_eq_setting_lowmid_q:Object = {};
      
      public var global_eq_setting_lowmid_gain:Object = {};
      
      public var global_eq_setting_highmid_freq:Object = {};
      
      public var global_eq_setting_highmid_q:Object = {};
      
      public var global_eq_setting_highmid_gain:Object = {};
      
      public var global_eq_setting_high_gain:Object = {};
      
      public var global_eq_setting_high_cut:Object = {};
      
      public var global_eq_setting_level:Object = {};
      
      public var global_eq_setting_position:Object = {};
      
      public var global_eq_setting_type:Object = {};
      
      public var global_eq_setting_geq_31hz:Object = {};
      
      public var global_eq_setting_geq_62hz:Object = {};
      
      public var global_eq_setting_geq_125hz:Object = {};
      
      public var global_eq_setting_geq_250hz:Object = {};
      
      public var global_eq_setting_geq_500hz:Object = {};
      
      public var global_eq_setting_geq_1khz:Object = {};
      
      public var global_eq_setting_geq_2khz:Object = {};
      
      public var global_eq_setting_geq_4khz:Object = {};
      
      public var global_eq_setting_geq_8khz:Object = {};
      
      public var global_eq_setting_geq_16khz:Object = {};
      
      public var global_eq_setting_geq_level:Object = {};
      
      public var midi_setting_rx_channel:Object = {};
      
      public var midi_setting_omni_mode:Object = {};
      
      public var midi_setting_tx_channel:Object = {};
      
      public var midi_setting_sync_clock:Object = {};
      
      public var midi_setting_midi_in_select:Object = {};
      
      public var midi_setting_pc_out:Object = {};
      
      public var midi_setting_ph_loop_out:Object = {};
      
      public var midi_setting_acc_ctl_out:Object = {};
      
      public var midi_setting_exp_out:Object = {};
      
      public var midi_setting_exp_sw_out:Object = {};
      
      public var midi_setting_sub_ctl1_out:Object = {};
      
      public var midi_setting_sub_ctl2_out:Object = {};
      
      public var midi_setting_sub_exp_out:Object = {};
      
      public var midi_setting_map_select:Object = {};
      
      public var midi_setting_midi_out_select:Object = {};
      
      public var midi_program_chg_map_bank0_pc_1_l:Object = {};
      
      public var midi_program_chg_map_bank0_pc_2_l:Object = {};
      
      public var midi_program_chg_map_bank0_pc_3_l:Object = {};
      
      public var midi_program_chg_map_bank0_pc_4_l:Object = {};
      
      public var midi_program_chg_map_bank0_pc_5_l:Object = {};
      
      public var midi_program_chg_map_bank0_pc_6_l:Object = {};
      
      public var midi_program_chg_map_bank0_pc_7_l:Object = {};
      
      public var midi_program_chg_map_bank0_pc_8_l:Object = {};
      
      public var midi_program_chg_map_bank0_pc_9_l:Object = {};
      
      public var midi_program_chg_map_bank0_pc_10_l:Object = {};
      
      public var midi_program_chg_map_bank0_pc_11_l:Object = {};
      
      public var midi_program_chg_map_bank0_pc_12_l:Object = {};
      
      public var midi_program_chg_map_bank0_pc_13_l:Object = {};
      
      public var midi_program_chg_map_bank0_pc_14_l:Object = {};
      
      public var midi_program_chg_map_bank0_pc_15_l:Object = {};
      
      public var midi_program_chg_map_bank0_pc_16_l:Object = {};
      
      public var midi_program_chg_map_bank0_pc_17_l:Object = {};
      
      public var midi_program_chg_map_bank0_pc_18_l:Object = {};
      
      public var midi_program_chg_map_bank0_pc_19_l:Object = {};
      
      public var midi_program_chg_map_bank0_pc_20_l:Object = {};
      
      public var midi_program_chg_map_bank0_pc_21_l:Object = {};
      
      public var midi_program_chg_map_bank0_pc_22_l:Object = {};
      
      public var midi_program_chg_map_bank0_pc_23_l:Object = {};
      
      public var midi_program_chg_map_bank0_pc_24_l:Object = {};
      
      public var midi_program_chg_map_bank0_pc_25_l:Object = {};
      
      public var midi_program_chg_map_bank0_pc_26_l:Object = {};
      
      public var midi_program_chg_map_bank0_pc_27_l:Object = {};
      
      public var midi_program_chg_map_bank0_pc_28_l:Object = {};
      
      public var midi_program_chg_map_bank0_pc_29_l:Object = {};
      
      public var midi_program_chg_map_bank0_pc_30_l:Object = {};
      
      public var midi_program_chg_map_bank0_pc_31_l:Object = {};
      
      public var midi_program_chg_map_bank0_pc_32_l:Object = {};
      
      public var midi_program_chg_map_bank0_pc_33_l:Object = {};
      
      public var midi_program_chg_map_bank0_pc_34_l:Object = {};
      
      public var midi_program_chg_map_bank0_pc_35_l:Object = {};
      
      public var midi_program_chg_map_bank0_pc_36_l:Object = {};
      
      public var midi_program_chg_map_bank0_pc_37_l:Object = {};
      
      public var midi_program_chg_map_bank0_pc_38_l:Object = {};
      
      public var midi_program_chg_map_bank0_pc_39_l:Object = {};
      
      public var midi_program_chg_map_bank0_pc_40_l:Object = {};
      
      public var midi_program_chg_map_bank0_pc_41_l:Object = {};
      
      public var midi_program_chg_map_bank0_pc_42_l:Object = {};
      
      public var midi_program_chg_map_bank0_pc_43_l:Object = {};
      
      public var midi_program_chg_map_bank0_pc_44_l:Object = {};
      
      public var midi_program_chg_map_bank0_pc_45_l:Object = {};
      
      public var midi_program_chg_map_bank0_pc_46_l:Object = {};
      
      public var midi_program_chg_map_bank0_pc_47_l:Object = {};
      
      public var midi_program_chg_map_bank0_pc_48_l:Object = {};
      
      public var midi_program_chg_map_bank0_pc_49_l:Object = {};
      
      public var midi_program_chg_map_bank0_pc_50_l:Object = {};
      
      public var midi_program_chg_map_bank0_pc_51_l:Object = {};
      
      public var midi_program_chg_map_bank0_pc_52_l:Object = {};
      
      public var midi_program_chg_map_bank0_pc_53_l:Object = {};
      
      public var midi_program_chg_map_bank0_pc_54_l:Object = {};
      
      public var midi_program_chg_map_bank0_pc_55_l:Object = {};
      
      public var midi_program_chg_map_bank0_pc_56_l:Object = {};
      
      public var midi_program_chg_map_bank0_pc_57_l:Object = {};
      
      public var midi_program_chg_map_bank0_pc_58_l:Object = {};
      
      public var midi_program_chg_map_bank0_pc_59_l:Object = {};
      
      public var midi_program_chg_map_bank0_pc_60_l:Object = {};
      
      public var midi_program_chg_map_bank0_pc_61_l:Object = {};
      
      public var midi_program_chg_map_bank0_pc_62_l:Object = {};
      
      public var midi_program_chg_map_bank0_pc_63_l:Object = {};
      
      public var midi_program_chg_map_bank0_pc_64_l:Object = {};
      
      public var midi_program_chg_map_bank0_pc_65_l:Object = {};
      
      public var midi_program_chg_map_bank0_pc_66_l:Object = {};
      
      public var midi_program_chg_map_bank0_pc_67_l:Object = {};
      
      public var midi_program_chg_map_bank0_pc_68_l:Object = {};
      
      public var midi_program_chg_map_bank0_pc_69_l:Object = {};
      
      public var midi_program_chg_map_bank0_pc_70_l:Object = {};
      
      public var midi_program_chg_map_bank0_pc_71_l:Object = {};
      
      public var midi_program_chg_map_bank0_pc_72_l:Object = {};
      
      public var midi_program_chg_map_bank0_pc_73_l:Object = {};
      
      public var midi_program_chg_map_bank0_pc_74_l:Object = {};
      
      public var midi_program_chg_map_bank0_pc_75_l:Object = {};
      
      public var midi_program_chg_map_bank0_pc_76_l:Object = {};
      
      public var midi_program_chg_map_bank0_pc_77_l:Object = {};
      
      public var midi_program_chg_map_bank0_pc_78_l:Object = {};
      
      public var midi_program_chg_map_bank0_pc_79_l:Object = {};
      
      public var midi_program_chg_map_bank0_pc_80_l:Object = {};
      
      public var midi_program_chg_map_bank0_pc_81_l:Object = {};
      
      public var midi_program_chg_map_bank0_pc_82_l:Object = {};
      
      public var midi_program_chg_map_bank0_pc_83_l:Object = {};
      
      public var midi_program_chg_map_bank0_pc_84_l:Object = {};
      
      public var midi_program_chg_map_bank0_pc_85_l:Object = {};
      
      public var midi_program_chg_map_bank0_pc_86_l:Object = {};
      
      public var midi_program_chg_map_bank0_pc_87_l:Object = {};
      
      public var midi_program_chg_map_bank0_pc_88_l:Object = {};
      
      public var midi_program_chg_map_bank0_pc_89_l:Object = {};
      
      public var midi_program_chg_map_bank0_pc_90_l:Object = {};
      
      public var midi_program_chg_map_bank0_pc_91_l:Object = {};
      
      public var midi_program_chg_map_bank0_pc_92_l:Object = {};
      
      public var midi_program_chg_map_bank0_pc_93_l:Object = {};
      
      public var midi_program_chg_map_bank0_pc_94_l:Object = {};
      
      public var midi_program_chg_map_bank0_pc_95_l:Object = {};
      
      public var midi_program_chg_map_bank0_pc_96_l:Object = {};
      
      public var midi_program_chg_map_bank0_pc_97_l:Object = {};
      
      public var midi_program_chg_map_bank0_pc_98_l:Object = {};
      
      public var midi_program_chg_map_bank0_pc_99_l:Object = {};
      
      public var midi_program_chg_map_bank0_pc_100_l:Object = {};
      
      public var midi_program_chg_map_bank0_pc_101_l:Object = {};
      
      public var midi_program_chg_map_bank0_pc_102_l:Object = {};
      
      public var midi_program_chg_map_bank0_pc_103_l:Object = {};
      
      public var midi_program_chg_map_bank0_pc_104_l:Object = {};
      
      public var midi_program_chg_map_bank0_pc_105_l:Object = {};
      
      public var midi_program_chg_map_bank0_pc_106_l:Object = {};
      
      public var midi_program_chg_map_bank0_pc_107_l:Object = {};
      
      public var midi_program_chg_map_bank0_pc_108_l:Object = {};
      
      public var midi_program_chg_map_bank0_pc_109_l:Object = {};
      
      public var midi_program_chg_map_bank0_pc_110_l:Object = {};
      
      public var midi_program_chg_map_bank0_pc_111_l:Object = {};
      
      public var midi_program_chg_map_bank0_pc_112_l:Object = {};
      
      public var midi_program_chg_map_bank0_pc_113_l:Object = {};
      
      public var midi_program_chg_map_bank0_pc_114_l:Object = {};
      
      public var midi_program_chg_map_bank0_pc_115_l:Object = {};
      
      public var midi_program_chg_map_bank0_pc_116_l:Object = {};
      
      public var midi_program_chg_map_bank0_pc_117_l:Object = {};
      
      public var midi_program_chg_map_bank0_pc_118_l:Object = {};
      
      public var midi_program_chg_map_bank0_pc_119_l:Object = {};
      
      public var midi_program_chg_map_bank0_pc_120_l:Object = {};
      
      public var midi_program_chg_map_bank0_pc_121_l:Object = {};
      
      public var midi_program_chg_map_bank0_pc_122_l:Object = {};
      
      public var midi_program_chg_map_bank0_pc_123_l:Object = {};
      
      public var midi_program_chg_map_bank0_pc_124_l:Object = {};
      
      public var midi_program_chg_map_bank0_pc_125_l:Object = {};
      
      public var midi_program_chg_map_bank0_pc_126_l:Object = {};
      
      public var midi_program_chg_map_bank0_pc_127_l:Object = {};
      
      public var midi_program_chg_map_bank0_pc_128_l:Object = {};
      
      public var midi_program_chg_map_bank1_pc_1_l:Object = {};
      
      public var midi_program_chg_map_bank1_pc_2_l:Object = {};
      
      public var midi_program_chg_map_bank1_pc_3_l:Object = {};
      
      public var midi_program_chg_map_bank1_pc_4_l:Object = {};
      
      public var midi_program_chg_map_bank1_pc_5_l:Object = {};
      
      public var midi_program_chg_map_bank1_pc_6_l:Object = {};
      
      public var midi_program_chg_map_bank1_pc_7_l:Object = {};
      
      public var midi_program_chg_map_bank1_pc_8_l:Object = {};
      
      public var midi_program_chg_map_bank1_pc_9_l:Object = {};
      
      public var midi_program_chg_map_bank1_pc_10_l:Object = {};
      
      public var midi_program_chg_map_bank1_pc_11_l:Object = {};
      
      public var midi_program_chg_map_bank1_pc_12_l:Object = {};
      
      public var midi_program_chg_map_bank1_pc_13_l:Object = {};
      
      public var midi_program_chg_map_bank1_pc_14_l:Object = {};
      
      public var midi_program_chg_map_bank1_pc_15_l:Object = {};
      
      public var midi_program_chg_map_bank1_pc_16_l:Object = {};
      
      public var midi_program_chg_map_bank1_pc_17_l:Object = {};
      
      public var midi_program_chg_map_bank1_pc_18_l:Object = {};
      
      public var midi_program_chg_map_bank1_pc_19_l:Object = {};
      
      public var midi_program_chg_map_bank1_pc_20_l:Object = {};
      
      public var midi_program_chg_map_bank1_pc_21_l:Object = {};
      
      public var midi_program_chg_map_bank1_pc_22_l:Object = {};
      
      public var midi_program_chg_map_bank1_pc_23_l:Object = {};
      
      public var midi_program_chg_map_bank1_pc_24_l:Object = {};
      
      public var midi_program_chg_map_bank1_pc_25_l:Object = {};
      
      public var midi_program_chg_map_bank1_pc_26_l:Object = {};
      
      public var midi_program_chg_map_bank1_pc_27_l:Object = {};
      
      public var midi_program_chg_map_bank1_pc_28_l:Object = {};
      
      public var midi_program_chg_map_bank1_pc_29_l:Object = {};
      
      public var midi_program_chg_map_bank1_pc_30_l:Object = {};
      
      public var midi_program_chg_map_bank1_pc_31_l:Object = {};
      
      public var midi_program_chg_map_bank1_pc_32_l:Object = {};
      
      public var midi_program_chg_map_bank1_pc_33_l:Object = {};
      
      public var midi_program_chg_map_bank1_pc_34_l:Object = {};
      
      public var midi_program_chg_map_bank1_pc_35_l:Object = {};
      
      public var midi_program_chg_map_bank1_pc_36_l:Object = {};
      
      public var midi_program_chg_map_bank1_pc_37_l:Object = {};
      
      public var midi_program_chg_map_bank1_pc_38_l:Object = {};
      
      public var midi_program_chg_map_bank1_pc_39_l:Object = {};
      
      public var midi_program_chg_map_bank1_pc_40_l:Object = {};
      
      public var midi_program_chg_map_bank1_pc_41_l:Object = {};
      
      public var midi_program_chg_map_bank1_pc_42_l:Object = {};
      
      public var midi_program_chg_map_bank1_pc_43_l:Object = {};
      
      public var midi_program_chg_map_bank1_pc_44_l:Object = {};
      
      public var midi_program_chg_map_bank1_pc_45_l:Object = {};
      
      public var midi_program_chg_map_bank1_pc_46_l:Object = {};
      
      public var midi_program_chg_map_bank1_pc_47_l:Object = {};
      
      public var midi_program_chg_map_bank1_pc_48_l:Object = {};
      
      public var midi_program_chg_map_bank1_pc_49_l:Object = {};
      
      public var midi_program_chg_map_bank1_pc_50_l:Object = {};
      
      public var midi_program_chg_map_bank1_pc_51_l:Object = {};
      
      public var midi_program_chg_map_bank1_pc_52_l:Object = {};
      
      public var midi_program_chg_map_bank1_pc_53_l:Object = {};
      
      public var midi_program_chg_map_bank1_pc_54_l:Object = {};
      
      public var midi_program_chg_map_bank1_pc_55_l:Object = {};
      
      public var midi_program_chg_map_bank1_pc_56_l:Object = {};
      
      public var midi_program_chg_map_bank1_pc_57_l:Object = {};
      
      public var midi_program_chg_map_bank1_pc_58_l:Object = {};
      
      public var midi_program_chg_map_bank1_pc_59_l:Object = {};
      
      public var midi_program_chg_map_bank1_pc_60_l:Object = {};
      
      public var midi_program_chg_map_bank1_pc_61_l:Object = {};
      
      public var midi_program_chg_map_bank1_pc_62_l:Object = {};
      
      public var midi_program_chg_map_bank1_pc_63_l:Object = {};
      
      public var midi_program_chg_map_bank1_pc_64_l:Object = {};
      
      public var midi_program_chg_map_bank1_pc_65_l:Object = {};
      
      public var midi_program_chg_map_bank1_pc_66_l:Object = {};
      
      public var midi_program_chg_map_bank1_pc_67_l:Object = {};
      
      public var midi_program_chg_map_bank1_pc_68_l:Object = {};
      
      public var midi_program_chg_map_bank1_pc_69_l:Object = {};
      
      public var midi_program_chg_map_bank1_pc_70_l:Object = {};
      
      public var midi_program_chg_map_bank1_pc_71_l:Object = {};
      
      public var midi_program_chg_map_bank1_pc_72_l:Object = {};
      
      public var midi_program_chg_map_bank1_pc_73_l:Object = {};
      
      public var midi_program_chg_map_bank1_pc_74_l:Object = {};
      
      public var midi_program_chg_map_bank1_pc_75_l:Object = {};
      
      public var midi_program_chg_map_bank1_pc_76_l:Object = {};
      
      public var midi_program_chg_map_bank1_pc_77_l:Object = {};
      
      public var midi_program_chg_map_bank1_pc_78_l:Object = {};
      
      public var midi_program_chg_map_bank1_pc_79_l:Object = {};
      
      public var midi_program_chg_map_bank1_pc_80_l:Object = {};
      
      public var midi_program_chg_map_bank1_pc_81_l:Object = {};
      
      public var midi_program_chg_map_bank1_pc_82_l:Object = {};
      
      public var midi_program_chg_map_bank1_pc_83_l:Object = {};
      
      public var midi_program_chg_map_bank1_pc_84_l:Object = {};
      
      public var midi_program_chg_map_bank1_pc_85_l:Object = {};
      
      public var midi_program_chg_map_bank1_pc_86_l:Object = {};
      
      public var midi_program_chg_map_bank1_pc_87_l:Object = {};
      
      public var midi_program_chg_map_bank1_pc_88_l:Object = {};
      
      public var midi_program_chg_map_bank1_pc_89_l:Object = {};
      
      public var midi_program_chg_map_bank1_pc_90_l:Object = {};
      
      public var midi_program_chg_map_bank1_pc_91_l:Object = {};
      
      public var midi_program_chg_map_bank1_pc_92_l:Object = {};
      
      public var midi_program_chg_map_bank1_pc_93_l:Object = {};
      
      public var midi_program_chg_map_bank1_pc_94_l:Object = {};
      
      public var midi_program_chg_map_bank1_pc_95_l:Object = {};
      
      public var midi_program_chg_map_bank1_pc_96_l:Object = {};
      
      public var midi_program_chg_map_bank1_pc_97_l:Object = {};
      
      public var midi_program_chg_map_bank1_pc_98_l:Object = {};
      
      public var midi_program_chg_map_bank1_pc_99_l:Object = {};
      
      public var midi_program_chg_map_bank1_pc_100_l:Object = {};
      
      public var midi_program_chg_map_bank1_pc_101_l:Object = {};
      
      public var midi_program_chg_map_bank1_pc_102_l:Object = {};
      
      public var midi_program_chg_map_bank1_pc_103_l:Object = {};
      
      public var midi_program_chg_map_bank1_pc_104_l:Object = {};
      
      public var midi_program_chg_map_bank1_pc_105_l:Object = {};
      
      public var midi_program_chg_map_bank1_pc_106_l:Object = {};
      
      public var midi_program_chg_map_bank1_pc_107_l:Object = {};
      
      public var midi_program_chg_map_bank1_pc_108_l:Object = {};
      
      public var midi_program_chg_map_bank1_pc_109_l:Object = {};
      
      public var midi_program_chg_map_bank1_pc_110_l:Object = {};
      
      public var midi_program_chg_map_bank1_pc_111_l:Object = {};
      
      public var midi_program_chg_map_bank1_pc_112_l:Object = {};
      
      public var midi_program_chg_map_bank1_pc_113_l:Object = {};
      
      public var midi_program_chg_map_bank1_pc_114_l:Object = {};
      
      public var midi_program_chg_map_bank1_pc_115_l:Object = {};
      
      public var midi_program_chg_map_bank1_pc_116_l:Object = {};
      
      public var midi_program_chg_map_bank1_pc_117_l:Object = {};
      
      public var midi_program_chg_map_bank1_pc_118_l:Object = {};
      
      public var midi_program_chg_map_bank1_pc_119_l:Object = {};
      
      public var midi_program_chg_map_bank1_pc_120_l:Object = {};
      
      public var midi_program_chg_map_bank1_pc_121_l:Object = {};
      
      public var midi_program_chg_map_bank1_pc_122_l:Object = {};
      
      public var midi_program_chg_map_bank1_pc_123_l:Object = {};
      
      public var midi_program_chg_map_bank1_pc_124_l:Object = {};
      
      public var midi_program_chg_map_bank1_pc_125_l:Object = {};
      
      public var midi_program_chg_map_bank1_pc_126_l:Object = {};
      
      public var midi_program_chg_map_bank1_pc_127_l:Object = {};
      
      public var midi_program_chg_map_bank1_pc_128_l:Object = {};
      
      public var midi_program_chg_map_bank2_pc_1_l:Object = {};
      
      public var midi_program_chg_map_bank2_pc_2_l:Object = {};
      
      public var midi_program_chg_map_bank2_pc_3_l:Object = {};
      
      public var midi_program_chg_map_bank2_pc_4_l:Object = {};
      
      public var midi_program_chg_map_bank2_pc_5_l:Object = {};
      
      public var midi_program_chg_map_bank2_pc_6_l:Object = {};
      
      public var midi_program_chg_map_bank2_pc_7_l:Object = {};
      
      public var midi_program_chg_map_bank2_pc_8_l:Object = {};
      
      public var midi_program_chg_map_bank2_pc_9_l:Object = {};
      
      public var midi_program_chg_map_bank2_pc_10_l:Object = {};
      
      public var midi_program_chg_map_bank2_pc_11_l:Object = {};
      
      public var midi_program_chg_map_bank2_pc_12_l:Object = {};
      
      public var midi_program_chg_map_bank2_pc_13_l:Object = {};
      
      public var midi_program_chg_map_bank2_pc_14_l:Object = {};
      
      public var midi_program_chg_map_bank2_pc_15_l:Object = {};
      
      public var midi_program_chg_map_bank2_pc_16_l:Object = {};
      
      public var midi_program_chg_map_bank2_pc_17_l:Object = {};
      
      public var midi_program_chg_map_bank2_pc_18_l:Object = {};
      
      public var midi_program_chg_map_bank2_pc_19_l:Object = {};
      
      public var midi_program_chg_map_bank2_pc_20_l:Object = {};
      
      public var midi_program_chg_map_bank2_pc_21_l:Object = {};
      
      public var midi_program_chg_map_bank2_pc_22_l:Object = {};
      
      public var midi_program_chg_map_bank2_pc_23_l:Object = {};
      
      public var midi_program_chg_map_bank2_pc_24_l:Object = {};
      
      public var midi_program_chg_map_bank2_pc_25_l:Object = {};
      
      public var midi_program_chg_map_bank2_pc_26_l:Object = {};
      
      public var midi_program_chg_map_bank2_pc_27_l:Object = {};
      
      public var midi_program_chg_map_bank2_pc_28_l:Object = {};
      
      public var midi_program_chg_map_bank2_pc_29_l:Object = {};
      
      public var midi_program_chg_map_bank2_pc_30_l:Object = {};
      
      public var midi_program_chg_map_bank2_pc_31_l:Object = {};
      
      public var midi_program_chg_map_bank2_pc_32_l:Object = {};
      
      public var midi_program_chg_map_bank2_pc_33_l:Object = {};
      
      public var midi_program_chg_map_bank2_pc_34_l:Object = {};
      
      public var midi_program_chg_map_bank2_pc_35_l:Object = {};
      
      public var midi_program_chg_map_bank2_pc_36_l:Object = {};
      
      public var midi_program_chg_map_bank2_pc_37_l:Object = {};
      
      public var midi_program_chg_map_bank2_pc_38_l:Object = {};
      
      public var midi_program_chg_map_bank2_pc_39_l:Object = {};
      
      public var midi_program_chg_map_bank2_pc_40_l:Object = {};
      
      public var midi_program_chg_map_bank2_pc_41_l:Object = {};
      
      public var midi_program_chg_map_bank2_pc_42_l:Object = {};
      
      public var midi_program_chg_map_bank2_pc_43_l:Object = {};
      
      public var midi_program_chg_map_bank2_pc_44_l:Object = {};
      
      public var midi_program_chg_map_bank2_pc_45_l:Object = {};
      
      public var midi_program_chg_map_bank2_pc_46_l:Object = {};
      
      public var midi_program_chg_map_bank2_pc_47_l:Object = {};
      
      public var midi_program_chg_map_bank2_pc_48_l:Object = {};
      
      public var midi_program_chg_map_bank2_pc_49_l:Object = {};
      
      public var midi_program_chg_map_bank2_pc_50_l:Object = {};
      
      public var midi_program_chg_map_bank2_pc_51_l:Object = {};
      
      public var midi_program_chg_map_bank2_pc_52_l:Object = {};
      
      public var midi_program_chg_map_bank2_pc_53_l:Object = {};
      
      public var midi_program_chg_map_bank2_pc_54_l:Object = {};
      
      public var midi_program_chg_map_bank2_pc_55_l:Object = {};
      
      public var midi_program_chg_map_bank2_pc_56_l:Object = {};
      
      public var midi_program_chg_map_bank2_pc_57_l:Object = {};
      
      public var midi_program_chg_map_bank2_pc_58_l:Object = {};
      
      public var midi_program_chg_map_bank2_pc_59_l:Object = {};
      
      public var midi_program_chg_map_bank2_pc_60_l:Object = {};
      
      public var midi_program_chg_map_bank2_pc_61_l:Object = {};
      
      public var midi_program_chg_map_bank2_pc_62_l:Object = {};
      
      public var midi_program_chg_map_bank2_pc_63_l:Object = {};
      
      public var midi_program_chg_map_bank2_pc_64_l:Object = {};
      
      public var midi_program_chg_map_bank2_pc_65_l:Object = {};
      
      public var midi_program_chg_map_bank2_pc_66_l:Object = {};
      
      public var midi_program_chg_map_bank2_pc_67_l:Object = {};
      
      public var midi_program_chg_map_bank2_pc_68_l:Object = {};
      
      public var midi_program_chg_map_bank2_pc_69_l:Object = {};
      
      public var midi_program_chg_map_bank2_pc_70_l:Object = {};
      
      public var midi_program_chg_map_bank2_pc_71_l:Object = {};
      
      public var midi_program_chg_map_bank2_pc_72_l:Object = {};
      
      public var midi_program_chg_map_bank2_pc_73_l:Object = {};
      
      public var midi_program_chg_map_bank2_pc_74_l:Object = {};
      
      public var midi_program_chg_map_bank2_pc_75_l:Object = {};
      
      public var midi_program_chg_map_bank2_pc_76_l:Object = {};
      
      public var midi_program_chg_map_bank2_pc_77_l:Object = {};
      
      public var midi_program_chg_map_bank2_pc_78_l:Object = {};
      
      public var midi_program_chg_map_bank2_pc_79_l:Object = {};
      
      public var midi_program_chg_map_bank2_pc_80_l:Object = {};
      
      public var midi_program_chg_map_bank2_pc_81_l:Object = {};
      
      public var midi_program_chg_map_bank2_pc_82_l:Object = {};
      
      public var midi_program_chg_map_bank2_pc_83_l:Object = {};
      
      public var midi_program_chg_map_bank2_pc_84_l:Object = {};
      
      public var midi_program_chg_map_bank2_pc_85_l:Object = {};
      
      public var midi_program_chg_map_bank2_pc_86_l:Object = {};
      
      public var midi_program_chg_map_bank2_pc_87_l:Object = {};
      
      public var midi_program_chg_map_bank2_pc_88_l:Object = {};
      
      public var midi_program_chg_map_bank2_pc_89_l:Object = {};
      
      public var midi_program_chg_map_bank2_pc_90_l:Object = {};
      
      public var midi_program_chg_map_bank2_pc_91_l:Object = {};
      
      public var midi_program_chg_map_bank2_pc_92_l:Object = {};
      
      public var midi_program_chg_map_bank2_pc_93_l:Object = {};
      
      public var midi_program_chg_map_bank2_pc_94_l:Object = {};
      
      public var midi_program_chg_map_bank2_pc_95_l:Object = {};
      
      public var midi_program_chg_map_bank2_pc_96_l:Object = {};
      
      public var midi_program_chg_map_bank2_pc_97_l:Object = {};
      
      public var midi_program_chg_map_bank2_pc_98_l:Object = {};
      
      public var midi_program_chg_map_bank2_pc_99_l:Object = {};
      
      public var midi_program_chg_map_bank2_pc_100_l:Object = {};
      
      public var midi_program_chg_map_bank2_pc_101_l:Object = {};
      
      public var midi_program_chg_map_bank2_pc_102_l:Object = {};
      
      public var midi_program_chg_map_bank2_pc_103_l:Object = {};
      
      public var midi_program_chg_map_bank2_pc_104_l:Object = {};
      
      public var midi_program_chg_map_bank2_pc_105_l:Object = {};
      
      public var midi_program_chg_map_bank2_pc_106_l:Object = {};
      
      public var midi_program_chg_map_bank2_pc_107_l:Object = {};
      
      public var midi_program_chg_map_bank2_pc_108_l:Object = {};
      
      public var midi_program_chg_map_bank2_pc_109_l:Object = {};
      
      public var midi_program_chg_map_bank2_pc_110_l:Object = {};
      
      public var midi_program_chg_map_bank2_pc_111_l:Object = {};
      
      public var midi_program_chg_map_bank2_pc_112_l:Object = {};
      
      public var midi_program_chg_map_bank2_pc_113_l:Object = {};
      
      public var midi_program_chg_map_bank2_pc_114_l:Object = {};
      
      public var midi_program_chg_map_bank2_pc_115_l:Object = {};
      
      public var midi_program_chg_map_bank2_pc_116_l:Object = {};
      
      public var midi_program_chg_map_bank2_pc_117_l:Object = {};
      
      public var midi_program_chg_map_bank2_pc_118_l:Object = {};
      
      public var midi_program_chg_map_bank2_pc_119_l:Object = {};
      
      public var midi_program_chg_map_bank2_pc_120_l:Object = {};
      
      public var midi_program_chg_map_bank2_pc_121_l:Object = {};
      
      public var midi_program_chg_map_bank2_pc_122_l:Object = {};
      
      public var midi_program_chg_map_bank2_pc_123_l:Object = {};
      
      public var midi_program_chg_map_bank2_pc_124_l:Object = {};
      
      public var midi_program_chg_map_bank2_pc_125_l:Object = {};
      
      public var midi_program_chg_map_bank2_pc_126_l:Object = {};
      
      public var midi_program_chg_map_bank2_pc_127_l:Object = {};
      
      public var midi_program_chg_map_bank2_pc_128_l:Object = {};
      
      public var midi_program_chg_map_bank3_pc_1_l:Object = {};
      
      public var midi_program_chg_map_bank3_pc_2_l:Object = {};
      
      public var midi_program_chg_map_bank3_pc_3_l:Object = {};
      
      public var midi_program_chg_map_bank3_pc_4_l:Object = {};
      
      public var midi_program_chg_map_bank3_pc_5_l:Object = {};
      
      public var midi_program_chg_map_bank3_pc_6_l:Object = {};
      
      public var midi_program_chg_map_bank3_pc_7_l:Object = {};
      
      public var midi_program_chg_map_bank3_pc_8_l:Object = {};
      
      public var midi_program_chg_map_bank3_pc_9_l:Object = {};
      
      public var midi_program_chg_map_bank3_pc_10_l:Object = {};
      
      public var midi_program_chg_map_bank3_pc_11_l:Object = {};
      
      public var midi_program_chg_map_bank3_pc_12_l:Object = {};
      
      public var midi_program_chg_map_bank3_pc_13_l:Object = {};
      
      public var midi_program_chg_map_bank3_pc_14_l:Object = {};
      
      public var midi_program_chg_map_bank3_pc_15_l:Object = {};
      
      public var midi_program_chg_map_bank3_pc_16_l:Object = {};
      
      public var midi_program_chg_map_bank3_pc_17_l:Object = {};
      
      public var midi_program_chg_map_bank3_pc_18_l:Object = {};
      
      public var midi_program_chg_map_bank3_pc_19_l:Object = {};
      
      public var midi_program_chg_map_bank3_pc_20_l:Object = {};
      
      public var midi_program_chg_map_bank3_pc_21_l:Object = {};
      
      public var midi_program_chg_map_bank3_pc_22_l:Object = {};
      
      public var midi_program_chg_map_bank3_pc_23_l:Object = {};
      
      public var midi_program_chg_map_bank3_pc_24_l:Object = {};
      
      public var midi_program_chg_map_bank3_pc_25_l:Object = {};
      
      public var midi_program_chg_map_bank3_pc_26_l:Object = {};
      
      public var midi_program_chg_map_bank3_pc_27_l:Object = {};
      
      public var midi_program_chg_map_bank3_pc_28_l:Object = {};
      
      public var midi_program_chg_map_bank3_pc_29_l:Object = {};
      
      public var midi_program_chg_map_bank3_pc_30_l:Object = {};
      
      public var midi_program_chg_map_bank3_pc_31_l:Object = {};
      
      public var midi_program_chg_map_bank3_pc_32_l:Object = {};
      
      public var midi_program_chg_map_bank3_pc_33_l:Object = {};
      
      public var midi_program_chg_map_bank3_pc_34_l:Object = {};
      
      public var midi_program_chg_map_bank3_pc_35_l:Object = {};
      
      public var midi_program_chg_map_bank3_pc_36_l:Object = {};
      
      public var midi_program_chg_map_bank3_pc_37_l:Object = {};
      
      public var midi_program_chg_map_bank3_pc_38_l:Object = {};
      
      public var midi_program_chg_map_bank3_pc_39_l:Object = {};
      
      public var midi_program_chg_map_bank3_pc_40_l:Object = {};
      
      public var midi_program_chg_map_bank3_pc_41_l:Object = {};
      
      public var midi_program_chg_map_bank3_pc_42_l:Object = {};
      
      public var midi_program_chg_map_bank3_pc_43_l:Object = {};
      
      public var midi_program_chg_map_bank3_pc_44_l:Object = {};
      
      public var midi_program_chg_map_bank3_pc_45_l:Object = {};
      
      public var midi_program_chg_map_bank3_pc_46_l:Object = {};
      
      public var midi_program_chg_map_bank3_pc_47_l:Object = {};
      
      public var midi_program_chg_map_bank3_pc_48_l:Object = {};
      
      public var midi_program_chg_map_bank3_pc_49_l:Object = {};
      
      public var midi_program_chg_map_bank3_pc_50_l:Object = {};
      
      public var midi_program_chg_map_bank3_pc_51_l:Object = {};
      
      public var midi_program_chg_map_bank3_pc_52_l:Object = {};
      
      public var midi_program_chg_map_bank3_pc_53_l:Object = {};
      
      public var midi_program_chg_map_bank3_pc_54_l:Object = {};
      
      public var midi_program_chg_map_bank3_pc_55_l:Object = {};
      
      public var midi_program_chg_map_bank3_pc_56_l:Object = {};
      
      public var midi_program_chg_map_bank3_pc_57_l:Object = {};
      
      public var midi_program_chg_map_bank3_pc_58_l:Object = {};
      
      public var midi_program_chg_map_bank3_pc_59_l:Object = {};
      
      public var midi_program_chg_map_bank3_pc_60_l:Object = {};
      
      public var midi_program_chg_map_bank3_pc_61_l:Object = {};
      
      public var midi_program_chg_map_bank3_pc_62_l:Object = {};
      
      public var midi_program_chg_map_bank3_pc_63_l:Object = {};
      
      public var midi_program_chg_map_bank3_pc_64_l:Object = {};
      
      public var midi_program_chg_map_bank3_pc_65_l:Object = {};
      
      public var midi_program_chg_map_bank3_pc_66_l:Object = {};
      
      public var midi_program_chg_map_bank3_pc_67_l:Object = {};
      
      public var midi_program_chg_map_bank3_pc_68_l:Object = {};
      
      public var midi_program_chg_map_bank3_pc_69_l:Object = {};
      
      public var midi_program_chg_map_bank3_pc_70_l:Object = {};
      
      public var midi_program_chg_map_bank3_pc_71_l:Object = {};
      
      public var midi_program_chg_map_bank3_pc_72_l:Object = {};
      
      public var midi_program_chg_map_bank3_pc_73_l:Object = {};
      
      public var midi_program_chg_map_bank3_pc_74_l:Object = {};
      
      public var midi_program_chg_map_bank3_pc_75_l:Object = {};
      
      public var midi_program_chg_map_bank3_pc_76_l:Object = {};
      
      public var midi_program_chg_map_bank3_pc_77_l:Object = {};
      
      public var midi_program_chg_map_bank3_pc_78_l:Object = {};
      
      public var midi_program_chg_map_bank3_pc_79_l:Object = {};
      
      public var midi_program_chg_map_bank3_pc_80_l:Object = {};
      
      public var midi_program_chg_map_bank3_pc_81_l:Object = {};
      
      public var midi_program_chg_map_bank3_pc_82_l:Object = {};
      
      public var midi_program_chg_map_bank3_pc_83_l:Object = {};
      
      public var midi_program_chg_map_bank3_pc_84_l:Object = {};
      
      public var midi_program_chg_map_bank3_pc_85_l:Object = {};
      
      public var midi_program_chg_map_bank3_pc_86_l:Object = {};
      
      public var midi_program_chg_map_bank3_pc_87_l:Object = {};
      
      public var midi_program_chg_map_bank3_pc_88_l:Object = {};
      
      public var midi_program_chg_map_bank3_pc_89_l:Object = {};
      
      public var midi_program_chg_map_bank3_pc_90_l:Object = {};
      
      public var midi_program_chg_map_bank3_pc_91_l:Object = {};
      
      public var midi_program_chg_map_bank3_pc_92_l:Object = {};
      
      public var midi_program_chg_map_bank3_pc_93_l:Object = {};
      
      public var midi_program_chg_map_bank3_pc_94_l:Object = {};
      
      public var midi_program_chg_map_bank3_pc_95_l:Object = {};
      
      public var midi_program_chg_map_bank3_pc_96_l:Object = {};
      
      public var midi_program_chg_map_bank3_pc_97_l:Object = {};
      
      public var midi_program_chg_map_bank3_pc_98_l:Object = {};
      
      public var midi_program_chg_map_bank3_pc_99_l:Object = {};
      
      public var midi_program_chg_map_bank3_pc_100_l:Object = {};
      
      public var midi_program_chg_map_bank3_pc_101_l:Object = {};
      
      public var midi_program_chg_map_bank3_pc_102_l:Object = {};
      
      public var midi_program_chg_map_bank3_pc_103_l:Object = {};
      
      public var midi_program_chg_map_bank3_pc_104_l:Object = {};
      
      public var midi_program_chg_map_bank3_pc_105_l:Object = {};
      
      public var midi_program_chg_map_bank3_pc_106_l:Object = {};
      
      public var midi_program_chg_map_bank3_pc_107_l:Object = {};
      
      public var midi_program_chg_map_bank3_pc_108_l:Object = {};
      
      public var midi_program_chg_map_bank3_pc_109_l:Object = {};
      
      public var midi_program_chg_map_bank3_pc_110_l:Object = {};
      
      public var midi_program_chg_map_bank3_pc_111_l:Object = {};
      
      public var midi_program_chg_map_bank3_pc_112_l:Object = {};
      
      public var midi_program_chg_map_bank3_pc_113_l:Object = {};
      
      public var midi_program_chg_map_bank3_pc_114_l:Object = {};
      
      public var midi_program_chg_map_bank3_pc_115_l:Object = {};
      
      public var midi_program_chg_map_bank3_pc_116_l:Object = {};
      
      public var midi_program_chg_map_bank3_pc_117_l:Object = {};
      
      public var midi_program_chg_map_bank3_pc_118_l:Object = {};
      
      public var midi_program_chg_map_bank3_pc_119_l:Object = {};
      
      public var midi_program_chg_map_bank3_pc_120_l:Object = {};
      
      public var midi_program_chg_map_bank3_pc_121_l:Object = {};
      
      public var midi_program_chg_map_bank3_pc_122_l:Object = {};
      
      public var midi_program_chg_map_bank3_pc_123_l:Object = {};
      
      public var midi_program_chg_map_bank3_pc_124_l:Object = {};
      
      public var midi_program_chg_map_bank3_pc_125_l:Object = {};
      
      public var midi_program_chg_map_bank3_pc_126_l:Object = {};
      
      public var midi_program_chg_map_bank3_pc_127_l:Object = {};
      
      public var midi_program_chg_map_bank3_pc_128_l:Object = {};
      
      public var midi_program_chg_map_bank0_pc_1_h:Object = {};
      
      public var midi_program_chg_map_bank0_pc_2_h:Object = {};
      
      public var midi_program_chg_map_bank0_pc_3_h:Object = {};
      
      public var midi_program_chg_map_bank0_pc_4_h:Object = {};
      
      public var midi_program_chg_map_bank0_pc_5_h:Object = {};
      
      public var midi_program_chg_map_bank0_pc_6_h:Object = {};
      
      public var midi_program_chg_map_bank0_pc_7_h:Object = {};
      
      public var midi_program_chg_map_bank0_pc_8_h:Object = {};
      
      public var midi_program_chg_map_bank0_pc_9_h:Object = {};
      
      public var midi_program_chg_map_bank0_pc_10_h:Object = {};
      
      public var midi_program_chg_map_bank0_pc_11_h:Object = {};
      
      public var midi_program_chg_map_bank0_pc_12_h:Object = {};
      
      public var midi_program_chg_map_bank0_pc_13_h:Object = {};
      
      public var midi_program_chg_map_bank0_pc_14_h:Object = {};
      
      public var midi_program_chg_map_bank0_pc_15_h:Object = {};
      
      public var midi_program_chg_map_bank0_pc_16_h:Object = {};
      
      public var midi_program_chg_map_bank0_pc_17_h:Object = {};
      
      public var midi_program_chg_map_bank0_pc_18_h:Object = {};
      
      public var midi_program_chg_map_bank0_pc_19_h:Object = {};
      
      public var midi_program_chg_map_bank0_pc_20_h:Object = {};
      
      public var midi_program_chg_map_bank0_pc_21_h:Object = {};
      
      public var midi_program_chg_map_bank0_pc_22_h:Object = {};
      
      public var midi_program_chg_map_bank0_pc_23_h:Object = {};
      
      public var midi_program_chg_map_bank0_pc_24_h:Object = {};
      
      public var midi_program_chg_map_bank0_pc_25_h:Object = {};
      
      public var midi_program_chg_map_bank0_pc_26_h:Object = {};
      
      public var midi_program_chg_map_bank0_pc_27_h:Object = {};
      
      public var midi_program_chg_map_bank0_pc_28_h:Object = {};
      
      public var midi_program_chg_map_bank0_pc_29_h:Object = {};
      
      public var midi_program_chg_map_bank0_pc_30_h:Object = {};
      
      public var midi_program_chg_map_bank0_pc_31_h:Object = {};
      
      public var midi_program_chg_map_bank0_pc_32_h:Object = {};
      
      public var midi_program_chg_map_bank0_pc_33_h:Object = {};
      
      public var midi_program_chg_map_bank0_pc_34_h:Object = {};
      
      public var midi_program_chg_map_bank0_pc_35_h:Object = {};
      
      public var midi_program_chg_map_bank0_pc_36_h:Object = {};
      
      public var midi_program_chg_map_bank0_pc_37_h:Object = {};
      
      public var midi_program_chg_map_bank0_pc_38_h:Object = {};
      
      public var midi_program_chg_map_bank0_pc_39_h:Object = {};
      
      public var midi_program_chg_map_bank0_pc_40_h:Object = {};
      
      public var midi_program_chg_map_bank0_pc_41_h:Object = {};
      
      public var midi_program_chg_map_bank0_pc_42_h:Object = {};
      
      public var midi_program_chg_map_bank0_pc_43_h:Object = {};
      
      public var midi_program_chg_map_bank0_pc_44_h:Object = {};
      
      public var midi_program_chg_map_bank0_pc_45_h:Object = {};
      
      public var midi_program_chg_map_bank0_pc_46_h:Object = {};
      
      public var midi_program_chg_map_bank0_pc_47_h:Object = {};
      
      public var midi_program_chg_map_bank0_pc_48_h:Object = {};
      
      public var midi_program_chg_map_bank0_pc_49_h:Object = {};
      
      public var midi_program_chg_map_bank0_pc_50_h:Object = {};
      
      public var midi_program_chg_map_bank0_pc_51_h:Object = {};
      
      public var midi_program_chg_map_bank0_pc_52_h:Object = {};
      
      public var midi_program_chg_map_bank0_pc_53_h:Object = {};
      
      public var midi_program_chg_map_bank0_pc_54_h:Object = {};
      
      public var midi_program_chg_map_bank0_pc_55_h:Object = {};
      
      public var midi_program_chg_map_bank0_pc_56_h:Object = {};
      
      public var midi_program_chg_map_bank0_pc_57_h:Object = {};
      
      public var midi_program_chg_map_bank0_pc_58_h:Object = {};
      
      public var midi_program_chg_map_bank0_pc_59_h:Object = {};
      
      public var midi_program_chg_map_bank0_pc_60_h:Object = {};
      
      public var midi_program_chg_map_bank0_pc_61_h:Object = {};
      
      public var midi_program_chg_map_bank0_pc_62_h:Object = {};
      
      public var midi_program_chg_map_bank0_pc_63_h:Object = {};
      
      public var midi_program_chg_map_bank0_pc_64_h:Object = {};
      
      public var midi_program_chg_map_bank0_pc_65_h:Object = {};
      
      public var midi_program_chg_map_bank0_pc_66_h:Object = {};
      
      public var midi_program_chg_map_bank0_pc_67_h:Object = {};
      
      public var midi_program_chg_map_bank0_pc_68_h:Object = {};
      
      public var midi_program_chg_map_bank0_pc_69_h:Object = {};
      
      public var midi_program_chg_map_bank0_pc_70_h:Object = {};
      
      public var midi_program_chg_map_bank0_pc_71_h:Object = {};
      
      public var midi_program_chg_map_bank0_pc_72_h:Object = {};
      
      public var midi_program_chg_map_bank0_pc_73_h:Object = {};
      
      public var midi_program_chg_map_bank0_pc_74_h:Object = {};
      
      public var midi_program_chg_map_bank0_pc_75_h:Object = {};
      
      public var midi_program_chg_map_bank0_pc_76_h:Object = {};
      
      public var midi_program_chg_map_bank0_pc_77_h:Object = {};
      
      public var midi_program_chg_map_bank0_pc_78_h:Object = {};
      
      public var midi_program_chg_map_bank0_pc_79_h:Object = {};
      
      public var midi_program_chg_map_bank0_pc_80_h:Object = {};
      
      public var midi_program_chg_map_bank0_pc_81_h:Object = {};
      
      public var midi_program_chg_map_bank0_pc_82_h:Object = {};
      
      public var midi_program_chg_map_bank0_pc_83_h:Object = {};
      
      public var midi_program_chg_map_bank0_pc_84_h:Object = {};
      
      public var midi_program_chg_map_bank0_pc_85_h:Object = {};
      
      public var midi_program_chg_map_bank0_pc_86_h:Object = {};
      
      public var midi_program_chg_map_bank0_pc_87_h:Object = {};
      
      public var midi_program_chg_map_bank0_pc_88_h:Object = {};
      
      public var midi_program_chg_map_bank0_pc_89_h:Object = {};
      
      public var midi_program_chg_map_bank0_pc_90_h:Object = {};
      
      public var midi_program_chg_map_bank0_pc_91_h:Object = {};
      
      public var midi_program_chg_map_bank0_pc_92_h:Object = {};
      
      public var midi_program_chg_map_bank0_pc_93_h:Object = {};
      
      public var midi_program_chg_map_bank0_pc_94_h:Object = {};
      
      public var midi_program_chg_map_bank0_pc_95_h:Object = {};
      
      public var midi_program_chg_map_bank0_pc_96_h:Object = {};
      
      public var midi_program_chg_map_bank0_pc_97_h:Object = {};
      
      public var midi_program_chg_map_bank0_pc_98_h:Object = {};
      
      public var midi_program_chg_map_bank0_pc_99_h:Object = {};
      
      public var midi_program_chg_map_bank0_pc_100_h:Object = {};
      
      public var midi_program_chg_map_bank0_pc_101_h:Object = {};
      
      public var midi_program_chg_map_bank0_pc_102_h:Object = {};
      
      public var midi_program_chg_map_bank0_pc_103_h:Object = {};
      
      public var midi_program_chg_map_bank0_pc_104_h:Object = {};
      
      public var midi_program_chg_map_bank0_pc_105_h:Object = {};
      
      public var midi_program_chg_map_bank0_pc_106_h:Object = {};
      
      public var midi_program_chg_map_bank0_pc_107_h:Object = {};
      
      public var midi_program_chg_map_bank0_pc_108_h:Object = {};
      
      public var midi_program_chg_map_bank0_pc_109_h:Object = {};
      
      public var midi_program_chg_map_bank0_pc_110_h:Object = {};
      
      public var midi_program_chg_map_bank0_pc_111_h:Object = {};
      
      public var midi_program_chg_map_bank0_pc_112_h:Object = {};
      
      public var midi_program_chg_map_bank0_pc_113_h:Object = {};
      
      public var midi_program_chg_map_bank0_pc_114_h:Object = {};
      
      public var midi_program_chg_map_bank0_pc_115_h:Object = {};
      
      public var midi_program_chg_map_bank0_pc_116_h:Object = {};
      
      public var midi_program_chg_map_bank0_pc_117_h:Object = {};
      
      public var midi_program_chg_map_bank0_pc_118_h:Object = {};
      
      public var midi_program_chg_map_bank0_pc_119_h:Object = {};
      
      public var midi_program_chg_map_bank0_pc_120_h:Object = {};
      
      public var midi_program_chg_map_bank0_pc_121_h:Object = {};
      
      public var midi_program_chg_map_bank0_pc_122_h:Object = {};
      
      public var midi_program_chg_map_bank0_pc_123_h:Object = {};
      
      public var midi_program_chg_map_bank0_pc_124_h:Object = {};
      
      public var midi_program_chg_map_bank0_pc_125_h:Object = {};
      
      public var midi_program_chg_map_bank0_pc_126_h:Object = {};
      
      public var midi_program_chg_map_bank0_pc_127_h:Object = {};
      
      public var midi_program_chg_map_bank0_pc_128_h:Object = {};
      
      public var midi_program_chg_map_bank1_pc_1_h:Object = {};
      
      public var midi_program_chg_map_bank1_pc_2_h:Object = {};
      
      public var midi_program_chg_map_bank1_pc_3_h:Object = {};
      
      public var midi_program_chg_map_bank1_pc_4_h:Object = {};
      
      public var midi_program_chg_map_bank1_pc_5_h:Object = {};
      
      public var midi_program_chg_map_bank1_pc_6_h:Object = {};
      
      public var midi_program_chg_map_bank1_pc_7_h:Object = {};
      
      public var midi_program_chg_map_bank1_pc_8_h:Object = {};
      
      public var midi_program_chg_map_bank1_pc_9_h:Object = {};
      
      public var midi_program_chg_map_bank1_pc_10_h:Object = {};
      
      public var midi_program_chg_map_bank1_pc_11_h:Object = {};
      
      public var midi_program_chg_map_bank1_pc_12_h:Object = {};
      
      public var midi_program_chg_map_bank1_pc_13_h:Object = {};
      
      public var midi_program_chg_map_bank1_pc_14_h:Object = {};
      
      public var midi_program_chg_map_bank1_pc_15_h:Object = {};
      
      public var midi_program_chg_map_bank1_pc_16_h:Object = {};
      
      public var midi_program_chg_map_bank1_pc_17_h:Object = {};
      
      public var midi_program_chg_map_bank1_pc_18_h:Object = {};
      
      public var midi_program_chg_map_bank1_pc_19_h:Object = {};
      
      public var midi_program_chg_map_bank1_pc_20_h:Object = {};
      
      public var midi_program_chg_map_bank1_pc_21_h:Object = {};
      
      public var midi_program_chg_map_bank1_pc_22_h:Object = {};
      
      public var midi_program_chg_map_bank1_pc_23_h:Object = {};
      
      public var midi_program_chg_map_bank1_pc_24_h:Object = {};
      
      public var midi_program_chg_map_bank1_pc_25_h:Object = {};
      
      public var midi_program_chg_map_bank1_pc_26_h:Object = {};
      
      public var midi_program_chg_map_bank1_pc_27_h:Object = {};
      
      public var midi_program_chg_map_bank1_pc_28_h:Object = {};
      
      public var midi_program_chg_map_bank1_pc_29_h:Object = {};
      
      public var midi_program_chg_map_bank1_pc_30_h:Object = {};
      
      public var midi_program_chg_map_bank1_pc_31_h:Object = {};
      
      public var midi_program_chg_map_bank1_pc_32_h:Object = {};
      
      public var midi_program_chg_map_bank1_pc_33_h:Object = {};
      
      public var midi_program_chg_map_bank1_pc_34_h:Object = {};
      
      public var midi_program_chg_map_bank1_pc_35_h:Object = {};
      
      public var midi_program_chg_map_bank1_pc_36_h:Object = {};
      
      public var midi_program_chg_map_bank1_pc_37_h:Object = {};
      
      public var midi_program_chg_map_bank1_pc_38_h:Object = {};
      
      public var midi_program_chg_map_bank1_pc_39_h:Object = {};
      
      public var midi_program_chg_map_bank1_pc_40_h:Object = {};
      
      public var midi_program_chg_map_bank1_pc_41_h:Object = {};
      
      public var midi_program_chg_map_bank1_pc_42_h:Object = {};
      
      public var midi_program_chg_map_bank1_pc_43_h:Object = {};
      
      public var midi_program_chg_map_bank1_pc_44_h:Object = {};
      
      public var midi_program_chg_map_bank1_pc_45_h:Object = {};
      
      public var midi_program_chg_map_bank1_pc_46_h:Object = {};
      
      public var midi_program_chg_map_bank1_pc_47_h:Object = {};
      
      public var midi_program_chg_map_bank1_pc_48_h:Object = {};
      
      public var midi_program_chg_map_bank1_pc_49_h:Object = {};
      
      public var midi_program_chg_map_bank1_pc_50_h:Object = {};
      
      public var midi_program_chg_map_bank1_pc_51_h:Object = {};
      
      public var midi_program_chg_map_bank1_pc_52_h:Object = {};
      
      public var midi_program_chg_map_bank1_pc_53_h:Object = {};
      
      public var midi_program_chg_map_bank1_pc_54_h:Object = {};
      
      public var midi_program_chg_map_bank1_pc_55_h:Object = {};
      
      public var midi_program_chg_map_bank1_pc_56_h:Object = {};
      
      public var midi_program_chg_map_bank1_pc_57_h:Object = {};
      
      public var midi_program_chg_map_bank1_pc_58_h:Object = {};
      
      public var midi_program_chg_map_bank1_pc_59_h:Object = {};
      
      public var midi_program_chg_map_bank1_pc_60_h:Object = {};
      
      public var midi_program_chg_map_bank1_pc_61_h:Object = {};
      
      public var midi_program_chg_map_bank1_pc_62_h:Object = {};
      
      public var midi_program_chg_map_bank1_pc_63_h:Object = {};
      
      public var midi_program_chg_map_bank1_pc_64_h:Object = {};
      
      public var midi_program_chg_map_bank1_pc_65_h:Object = {};
      
      public var midi_program_chg_map_bank1_pc_66_h:Object = {};
      
      public var midi_program_chg_map_bank1_pc_67_h:Object = {};
      
      public var midi_program_chg_map_bank1_pc_68_h:Object = {};
      
      public var midi_program_chg_map_bank1_pc_69_h:Object = {};
      
      public var midi_program_chg_map_bank1_pc_70_h:Object = {};
      
      public var midi_program_chg_map_bank1_pc_71_h:Object = {};
      
      public var midi_program_chg_map_bank1_pc_72_h:Object = {};
      
      public var midi_program_chg_map_bank1_pc_73_h:Object = {};
      
      public var midi_program_chg_map_bank1_pc_74_h:Object = {};
      
      public var midi_program_chg_map_bank1_pc_75_h:Object = {};
      
      public var midi_program_chg_map_bank1_pc_76_h:Object = {};
      
      public var midi_program_chg_map_bank1_pc_77_h:Object = {};
      
      public var midi_program_chg_map_bank1_pc_78_h:Object = {};
      
      public var midi_program_chg_map_bank1_pc_79_h:Object = {};
      
      public var midi_program_chg_map_bank1_pc_80_h:Object = {};
      
      public var midi_program_chg_map_bank1_pc_81_h:Object = {};
      
      public var midi_program_chg_map_bank1_pc_82_h:Object = {};
      
      public var midi_program_chg_map_bank1_pc_83_h:Object = {};
      
      public var midi_program_chg_map_bank1_pc_84_h:Object = {};
      
      public var midi_program_chg_map_bank1_pc_85_h:Object = {};
      
      public var midi_program_chg_map_bank1_pc_86_h:Object = {};
      
      public var midi_program_chg_map_bank1_pc_87_h:Object = {};
      
      public var midi_program_chg_map_bank1_pc_88_h:Object = {};
      
      public var midi_program_chg_map_bank1_pc_89_h:Object = {};
      
      public var midi_program_chg_map_bank1_pc_90_h:Object = {};
      
      public var midi_program_chg_map_bank1_pc_91_h:Object = {};
      
      public var midi_program_chg_map_bank1_pc_92_h:Object = {};
      
      public var midi_program_chg_map_bank1_pc_93_h:Object = {};
      
      public var midi_program_chg_map_bank1_pc_94_h:Object = {};
      
      public var midi_program_chg_map_bank1_pc_95_h:Object = {};
      
      public var midi_program_chg_map_bank1_pc_96_h:Object = {};
      
      public var midi_program_chg_map_bank1_pc_97_h:Object = {};
      
      public var midi_program_chg_map_bank1_pc_98_h:Object = {};
      
      public var midi_program_chg_map_bank1_pc_99_h:Object = {};
      
      public var midi_program_chg_map_bank1_pc_100_h:Object = {};
      
      public var midi_program_chg_map_bank1_pc_101_h:Object = {};
      
      public var midi_program_chg_map_bank1_pc_102_h:Object = {};
      
      public var midi_program_chg_map_bank1_pc_103_h:Object = {};
      
      public var midi_program_chg_map_bank1_pc_104_h:Object = {};
      
      public var midi_program_chg_map_bank1_pc_105_h:Object = {};
      
      public var midi_program_chg_map_bank1_pc_106_h:Object = {};
      
      public var midi_program_chg_map_bank1_pc_107_h:Object = {};
      
      public var midi_program_chg_map_bank1_pc_108_h:Object = {};
      
      public var midi_program_chg_map_bank1_pc_109_h:Object = {};
      
      public var midi_program_chg_map_bank1_pc_110_h:Object = {};
      
      public var midi_program_chg_map_bank1_pc_111_h:Object = {};
      
      public var midi_program_chg_map_bank1_pc_112_h:Object = {};
      
      public var midi_program_chg_map_bank1_pc_113_h:Object = {};
      
      public var midi_program_chg_map_bank1_pc_114_h:Object = {};
      
      public var midi_program_chg_map_bank1_pc_115_h:Object = {};
      
      public var midi_program_chg_map_bank1_pc_116_h:Object = {};
      
      public var midi_program_chg_map_bank1_pc_117_h:Object = {};
      
      public var midi_program_chg_map_bank1_pc_118_h:Object = {};
      
      public var midi_program_chg_map_bank1_pc_119_h:Object = {};
      
      public var midi_program_chg_map_bank1_pc_120_h:Object = {};
      
      public var midi_program_chg_map_bank1_pc_121_h:Object = {};
      
      public var midi_program_chg_map_bank1_pc_122_h:Object = {};
      
      public var midi_program_chg_map_bank1_pc_123_h:Object = {};
      
      public var midi_program_chg_map_bank1_pc_124_h:Object = {};
      
      public var midi_program_chg_map_bank1_pc_125_h:Object = {};
      
      public var midi_program_chg_map_bank1_pc_126_h:Object = {};
      
      public var midi_program_chg_map_bank1_pc_127_h:Object = {};
      
      public var midi_program_chg_map_bank1_pc_128_h:Object = {};
      
      public var midi_program_chg_map_bank2_pc_1_h:Object = {};
      
      public var midi_program_chg_map_bank2_pc_2_h:Object = {};
      
      public var midi_program_chg_map_bank2_pc_3_h:Object = {};
      
      public var midi_program_chg_map_bank2_pc_4_h:Object = {};
      
      public var midi_program_chg_map_bank2_pc_5_h:Object = {};
      
      public var midi_program_chg_map_bank2_pc_6_h:Object = {};
      
      public var midi_program_chg_map_bank2_pc_7_h:Object = {};
      
      public var midi_program_chg_map_bank2_pc_8_h:Object = {};
      
      public var midi_program_chg_map_bank2_pc_9_h:Object = {};
      
      public var midi_program_chg_map_bank2_pc_10_h:Object = {};
      
      public var midi_program_chg_map_bank2_pc_11_h:Object = {};
      
      public var midi_program_chg_map_bank2_pc_12_h:Object = {};
      
      public var midi_program_chg_map_bank2_pc_13_h:Object = {};
      
      public var midi_program_chg_map_bank2_pc_14_h:Object = {};
      
      public var midi_program_chg_map_bank2_pc_15_h:Object = {};
      
      public var midi_program_chg_map_bank2_pc_16_h:Object = {};
      
      public var midi_program_chg_map_bank2_pc_17_h:Object = {};
      
      public var midi_program_chg_map_bank2_pc_18_h:Object = {};
      
      public var midi_program_chg_map_bank2_pc_19_h:Object = {};
      
      public var midi_program_chg_map_bank2_pc_20_h:Object = {};
      
      public var midi_program_chg_map_bank2_pc_21_h:Object = {};
      
      public var midi_program_chg_map_bank2_pc_22_h:Object = {};
      
      public var midi_program_chg_map_bank2_pc_23_h:Object = {};
      
      public var midi_program_chg_map_bank2_pc_24_h:Object = {};
      
      public var midi_program_chg_map_bank2_pc_25_h:Object = {};
      
      public var midi_program_chg_map_bank2_pc_26_h:Object = {};
      
      public var midi_program_chg_map_bank2_pc_27_h:Object = {};
      
      public var midi_program_chg_map_bank2_pc_28_h:Object = {};
      
      public var midi_program_chg_map_bank2_pc_29_h:Object = {};
      
      public var midi_program_chg_map_bank2_pc_30_h:Object = {};
      
      public var midi_program_chg_map_bank2_pc_31_h:Object = {};
      
      public var midi_program_chg_map_bank2_pc_32_h:Object = {};
      
      public var midi_program_chg_map_bank2_pc_33_h:Object = {};
      
      public var midi_program_chg_map_bank2_pc_34_h:Object = {};
      
      public var midi_program_chg_map_bank2_pc_35_h:Object = {};
      
      public var midi_program_chg_map_bank2_pc_36_h:Object = {};
      
      public var midi_program_chg_map_bank2_pc_37_h:Object = {};
      
      public var midi_program_chg_map_bank2_pc_38_h:Object = {};
      
      public var midi_program_chg_map_bank2_pc_39_h:Object = {};
      
      public var midi_program_chg_map_bank2_pc_40_h:Object = {};
      
      public var midi_program_chg_map_bank2_pc_41_h:Object = {};
      
      public var midi_program_chg_map_bank2_pc_42_h:Object = {};
      
      public var midi_program_chg_map_bank2_pc_43_h:Object = {};
      
      public var midi_program_chg_map_bank2_pc_44_h:Object = {};
      
      public var midi_program_chg_map_bank2_pc_45_h:Object = {};
      
      public var midi_program_chg_map_bank2_pc_46_h:Object = {};
      
      public var midi_program_chg_map_bank2_pc_47_h:Object = {};
      
      public var midi_program_chg_map_bank2_pc_48_h:Object = {};
      
      public var midi_program_chg_map_bank2_pc_49_h:Object = {};
      
      public var midi_program_chg_map_bank2_pc_50_h:Object = {};
      
      public var midi_program_chg_map_bank2_pc_51_h:Object = {};
      
      public var midi_program_chg_map_bank2_pc_52_h:Object = {};
      
      public var midi_program_chg_map_bank2_pc_53_h:Object = {};
      
      public var midi_program_chg_map_bank2_pc_54_h:Object = {};
      
      public var midi_program_chg_map_bank2_pc_55_h:Object = {};
      
      public var midi_program_chg_map_bank2_pc_56_h:Object = {};
      
      public var midi_program_chg_map_bank2_pc_57_h:Object = {};
      
      public var midi_program_chg_map_bank2_pc_58_h:Object = {};
      
      public var midi_program_chg_map_bank2_pc_59_h:Object = {};
      
      public var midi_program_chg_map_bank2_pc_60_h:Object = {};
      
      public var midi_program_chg_map_bank2_pc_61_h:Object = {};
      
      public var midi_program_chg_map_bank2_pc_62_h:Object = {};
      
      public var midi_program_chg_map_bank2_pc_63_h:Object = {};
      
      public var midi_program_chg_map_bank2_pc_64_h:Object = {};
      
      public var midi_program_chg_map_bank2_pc_65_h:Object = {};
      
      public var midi_program_chg_map_bank2_pc_66_h:Object = {};
      
      public var midi_program_chg_map_bank2_pc_67_h:Object = {};
      
      public var midi_program_chg_map_bank2_pc_68_h:Object = {};
      
      public var midi_program_chg_map_bank2_pc_69_h:Object = {};
      
      public var midi_program_chg_map_bank2_pc_70_h:Object = {};
      
      public var midi_program_chg_map_bank2_pc_71_h:Object = {};
      
      public var midi_program_chg_map_bank2_pc_72_h:Object = {};
      
      public var midi_program_chg_map_bank2_pc_73_h:Object = {};
      
      public var midi_program_chg_map_bank2_pc_74_h:Object = {};
      
      public var midi_program_chg_map_bank2_pc_75_h:Object = {};
      
      public var midi_program_chg_map_bank2_pc_76_h:Object = {};
      
      public var midi_program_chg_map_bank2_pc_77_h:Object = {};
      
      public var midi_program_chg_map_bank2_pc_78_h:Object = {};
      
      public var midi_program_chg_map_bank2_pc_79_h:Object = {};
      
      public var midi_program_chg_map_bank2_pc_80_h:Object = {};
      
      public var midi_program_chg_map_bank2_pc_81_h:Object = {};
      
      public var midi_program_chg_map_bank2_pc_82_h:Object = {};
      
      public var midi_program_chg_map_bank2_pc_83_h:Object = {};
      
      public var midi_program_chg_map_bank2_pc_84_h:Object = {};
      
      public var midi_program_chg_map_bank2_pc_85_h:Object = {};
      
      public var midi_program_chg_map_bank2_pc_86_h:Object = {};
      
      public var midi_program_chg_map_bank2_pc_87_h:Object = {};
      
      public var midi_program_chg_map_bank2_pc_88_h:Object = {};
      
      public var midi_program_chg_map_bank2_pc_89_h:Object = {};
      
      public var midi_program_chg_map_bank2_pc_90_h:Object = {};
      
      public var midi_program_chg_map_bank2_pc_91_h:Object = {};
      
      public var midi_program_chg_map_bank2_pc_92_h:Object = {};
      
      public var midi_program_chg_map_bank2_pc_93_h:Object = {};
      
      public var midi_program_chg_map_bank2_pc_94_h:Object = {};
      
      public var midi_program_chg_map_bank2_pc_95_h:Object = {};
      
      public var midi_program_chg_map_bank2_pc_96_h:Object = {};
      
      public var midi_program_chg_map_bank2_pc_97_h:Object = {};
      
      public var midi_program_chg_map_bank2_pc_98_h:Object = {};
      
      public var midi_program_chg_map_bank2_pc_99_h:Object = {};
      
      public var midi_program_chg_map_bank2_pc_100_h:Object = {};
      
      public var midi_program_chg_map_bank2_pc_101_h:Object = {};
      
      public var midi_program_chg_map_bank2_pc_102_h:Object = {};
      
      public var midi_program_chg_map_bank2_pc_103_h:Object = {};
      
      public var midi_program_chg_map_bank2_pc_104_h:Object = {};
      
      public var midi_program_chg_map_bank2_pc_105_h:Object = {};
      
      public var midi_program_chg_map_bank2_pc_106_h:Object = {};
      
      public var midi_program_chg_map_bank2_pc_107_h:Object = {};
      
      public var midi_program_chg_map_bank2_pc_108_h:Object = {};
      
      public var midi_program_chg_map_bank2_pc_109_h:Object = {};
      
      public var midi_program_chg_map_bank2_pc_110_h:Object = {};
      
      public var midi_program_chg_map_bank2_pc_111_h:Object = {};
      
      public var midi_program_chg_map_bank2_pc_112_h:Object = {};
      
      public var midi_program_chg_map_bank2_pc_113_h:Object = {};
      
      public var midi_program_chg_map_bank2_pc_114_h:Object = {};
      
      public var midi_program_chg_map_bank2_pc_115_h:Object = {};
      
      public var midi_program_chg_map_bank2_pc_116_h:Object = {};
      
      public var midi_program_chg_map_bank2_pc_117_h:Object = {};
      
      public var midi_program_chg_map_bank2_pc_118_h:Object = {};
      
      public var midi_program_chg_map_bank2_pc_119_h:Object = {};
      
      public var midi_program_chg_map_bank2_pc_120_h:Object = {};
      
      public var midi_program_chg_map_bank2_pc_121_h:Object = {};
      
      public var midi_program_chg_map_bank2_pc_122_h:Object = {};
      
      public var midi_program_chg_map_bank2_pc_123_h:Object = {};
      
      public var midi_program_chg_map_bank2_pc_124_h:Object = {};
      
      public var midi_program_chg_map_bank2_pc_125_h:Object = {};
      
      public var midi_program_chg_map_bank2_pc_126_h:Object = {};
      
      public var midi_program_chg_map_bank2_pc_127_h:Object = {};
      
      public var midi_program_chg_map_bank2_pc_128_h:Object = {};
      
      public var midi_program_chg_map_bank3_pc_1_h:Object = {};
      
      public var midi_program_chg_map_bank3_pc_2_h:Object = {};
      
      public var midi_program_chg_map_bank3_pc_3_h:Object = {};
      
      public var midi_program_chg_map_bank3_pc_4_h:Object = {};
      
      public var midi_program_chg_map_bank3_pc_5_h:Object = {};
      
      public var midi_program_chg_map_bank3_pc_6_h:Object = {};
      
      public var midi_program_chg_map_bank3_pc_7_h:Object = {};
      
      public var midi_program_chg_map_bank3_pc_8_h:Object = {};
      
      public var midi_program_chg_map_bank3_pc_9_h:Object = {};
      
      public var midi_program_chg_map_bank3_pc_10_h:Object = {};
      
      public var midi_program_chg_map_bank3_pc_11_h:Object = {};
      
      public var midi_program_chg_map_bank3_pc_12_h:Object = {};
      
      public var midi_program_chg_map_bank3_pc_13_h:Object = {};
      
      public var midi_program_chg_map_bank3_pc_14_h:Object = {};
      
      public var midi_program_chg_map_bank3_pc_15_h:Object = {};
      
      public var midi_program_chg_map_bank3_pc_16_h:Object = {};
      
      public var midi_program_chg_map_bank3_pc_17_h:Object = {};
      
      public var midi_program_chg_map_bank3_pc_18_h:Object = {};
      
      public var midi_program_chg_map_bank3_pc_19_h:Object = {};
      
      public var midi_program_chg_map_bank3_pc_20_h:Object = {};
      
      public var midi_program_chg_map_bank3_pc_21_h:Object = {};
      
      public var midi_program_chg_map_bank3_pc_22_h:Object = {};
      
      public var midi_program_chg_map_bank3_pc_23_h:Object = {};
      
      public var midi_program_chg_map_bank3_pc_24_h:Object = {};
      
      public var midi_program_chg_map_bank3_pc_25_h:Object = {};
      
      public var midi_program_chg_map_bank3_pc_26_h:Object = {};
      
      public var midi_program_chg_map_bank3_pc_27_h:Object = {};
      
      public var midi_program_chg_map_bank3_pc_28_h:Object = {};
      
      public var midi_program_chg_map_bank3_pc_29_h:Object = {};
      
      public var midi_program_chg_map_bank3_pc_30_h:Object = {};
      
      public var midi_program_chg_map_bank3_pc_31_h:Object = {};
      
      public var midi_program_chg_map_bank3_pc_32_h:Object = {};
      
      public var midi_program_chg_map_bank3_pc_33_h:Object = {};
      
      public var midi_program_chg_map_bank3_pc_34_h:Object = {};
      
      public var midi_program_chg_map_bank3_pc_35_h:Object = {};
      
      public var midi_program_chg_map_bank3_pc_36_h:Object = {};
      
      public var midi_program_chg_map_bank3_pc_37_h:Object = {};
      
      public var midi_program_chg_map_bank3_pc_38_h:Object = {};
      
      public var midi_program_chg_map_bank3_pc_39_h:Object = {};
      
      public var midi_program_chg_map_bank3_pc_40_h:Object = {};
      
      public var midi_program_chg_map_bank3_pc_41_h:Object = {};
      
      public var midi_program_chg_map_bank3_pc_42_h:Object = {};
      
      public var midi_program_chg_map_bank3_pc_43_h:Object = {};
      
      public var midi_program_chg_map_bank3_pc_44_h:Object = {};
      
      public var midi_program_chg_map_bank3_pc_45_h:Object = {};
      
      public var midi_program_chg_map_bank3_pc_46_h:Object = {};
      
      public var midi_program_chg_map_bank3_pc_47_h:Object = {};
      
      public var midi_program_chg_map_bank3_pc_48_h:Object = {};
      
      public var midi_program_chg_map_bank3_pc_49_h:Object = {};
      
      public var midi_program_chg_map_bank3_pc_50_h:Object = {};
      
      public var midi_program_chg_map_bank3_pc_51_h:Object = {};
      
      public var midi_program_chg_map_bank3_pc_52_h:Object = {};
      
      public var midi_program_chg_map_bank3_pc_53_h:Object = {};
      
      public var midi_program_chg_map_bank3_pc_54_h:Object = {};
      
      public var midi_program_chg_map_bank3_pc_55_h:Object = {};
      
      public var midi_program_chg_map_bank3_pc_56_h:Object = {};
      
      public var midi_program_chg_map_bank3_pc_57_h:Object = {};
      
      public var midi_program_chg_map_bank3_pc_58_h:Object = {};
      
      public var midi_program_chg_map_bank3_pc_59_h:Object = {};
      
      public var midi_program_chg_map_bank3_pc_60_h:Object = {};
      
      public var midi_program_chg_map_bank3_pc_61_h:Object = {};
      
      public var midi_program_chg_map_bank3_pc_62_h:Object = {};
      
      public var midi_program_chg_map_bank3_pc_63_h:Object = {};
      
      public var midi_program_chg_map_bank3_pc_64_h:Object = {};
      
      public var midi_program_chg_map_bank3_pc_65_h:Object = {};
      
      public var midi_program_chg_map_bank3_pc_66_h:Object = {};
      
      public var midi_program_chg_map_bank3_pc_67_h:Object = {};
      
      public var midi_program_chg_map_bank3_pc_68_h:Object = {};
      
      public var midi_program_chg_map_bank3_pc_69_h:Object = {};
      
      public var midi_program_chg_map_bank3_pc_70_h:Object = {};
      
      public var midi_program_chg_map_bank3_pc_71_h:Object = {};
      
      public var midi_program_chg_map_bank3_pc_72_h:Object = {};
      
      public var midi_program_chg_map_bank3_pc_73_h:Object = {};
      
      public var midi_program_chg_map_bank3_pc_74_h:Object = {};
      
      public var midi_program_chg_map_bank3_pc_75_h:Object = {};
      
      public var midi_program_chg_map_bank3_pc_76_h:Object = {};
      
      public var midi_program_chg_map_bank3_pc_77_h:Object = {};
      
      public var midi_program_chg_map_bank3_pc_78_h:Object = {};
      
      public var midi_program_chg_map_bank3_pc_79_h:Object = {};
      
      public var midi_program_chg_map_bank3_pc_80_h:Object = {};
      
      public var midi_program_chg_map_bank3_pc_81_h:Object = {};
      
      public var midi_program_chg_map_bank3_pc_82_h:Object = {};
      
      public var midi_program_chg_map_bank3_pc_83_h:Object = {};
      
      public var midi_program_chg_map_bank3_pc_84_h:Object = {};
      
      public var midi_program_chg_map_bank3_pc_85_h:Object = {};
      
      public var midi_program_chg_map_bank3_pc_86_h:Object = {};
      
      public var midi_program_chg_map_bank3_pc_87_h:Object = {};
      
      public var midi_program_chg_map_bank3_pc_88_h:Object = {};
      
      public var midi_program_chg_map_bank3_pc_89_h:Object = {};
      
      public var midi_program_chg_map_bank3_pc_90_h:Object = {};
      
      public var midi_program_chg_map_bank3_pc_91_h:Object = {};
      
      public var midi_program_chg_map_bank3_pc_92_h:Object = {};
      
      public var midi_program_chg_map_bank3_pc_93_h:Object = {};
      
      public var midi_program_chg_map_bank3_pc_94_h:Object = {};
      
      public var midi_program_chg_map_bank3_pc_95_h:Object = {};
      
      public var midi_program_chg_map_bank3_pc_96_h:Object = {};
      
      public var midi_program_chg_map_bank3_pc_97_h:Object = {};
      
      public var midi_program_chg_map_bank3_pc_98_h:Object = {};
      
      public var midi_program_chg_map_bank3_pc_99_h:Object = {};
      
      public var midi_program_chg_map_bank3_pc_100_h:Object = {};
      
      public var midi_program_chg_map_bank3_pc_101_h:Object = {};
      
      public var midi_program_chg_map_bank3_pc_102_h:Object = {};
      
      public var midi_program_chg_map_bank3_pc_103_h:Object = {};
      
      public var midi_program_chg_map_bank3_pc_104_h:Object = {};
      
      public var midi_program_chg_map_bank3_pc_105_h:Object = {};
      
      public var midi_program_chg_map_bank3_pc_106_h:Object = {};
      
      public var midi_program_chg_map_bank3_pc_107_h:Object = {};
      
      public var midi_program_chg_map_bank3_pc_108_h:Object = {};
      
      public var midi_program_chg_map_bank3_pc_109_h:Object = {};
      
      public var midi_program_chg_map_bank3_pc_110_h:Object = {};
      
      public var midi_program_chg_map_bank3_pc_111_h:Object = {};
      
      public var midi_program_chg_map_bank3_pc_112_h:Object = {};
      
      public var midi_program_chg_map_bank3_pc_113_h:Object = {};
      
      public var midi_program_chg_map_bank3_pc_114_h:Object = {};
      
      public var midi_program_chg_map_bank3_pc_115_h:Object = {};
      
      public var midi_program_chg_map_bank3_pc_116_h:Object = {};
      
      public var midi_program_chg_map_bank3_pc_117_h:Object = {};
      
      public var midi_program_chg_map_bank3_pc_118_h:Object = {};
      
      public var midi_program_chg_map_bank3_pc_119_h:Object = {};
      
      public var midi_program_chg_map_bank3_pc_120_h:Object = {};
      
      public var midi_program_chg_map_bank3_pc_121_h:Object = {};
      
      public var midi_program_chg_map_bank3_pc_122_h:Object = {};
      
      public var midi_program_chg_map_bank3_pc_123_h:Object = {};
      
      public var midi_program_chg_map_bank3_pc_124_h:Object = {};
      
      public var midi_program_chg_map_bank3_pc_125_h:Object = {};
      
      public var midi_program_chg_map_bank3_pc_126_h:Object = {};
      
      public var midi_program_chg_map_bank3_pc_127_h:Object = {};
      
      public var midi_program_chg_map_bank3_pc_128_h:Object = {};
      
      public var midi_rx_cc_booster_mod_sw:Object = {};
      
      public var midi_rx_cc_delay_fx_sw:Object = {};
      
      public var midi_rx_cc_reverb_sw:Object = {};
      
      public var midi_rx_cc_send_return_sw:Object = {};
      
      public var midi_rx_cc_exp_pedal:Object = {};
      
      public var midi_rx_cc_ga_fc_exp1:Object = {};
      
      public var midi_rx_cc_ga_fc_exp2:Object = {};
      
      public var midi_rx_pc_panel:Object = {};
      
      public var midi_rx_pc_a_1:Object = {};
      
      public var midi_rx_pc_a_2:Object = {};
      
      public var midi_rx_pc_a_3:Object = {};
      
      public var midi_rx_pc_a_4:Object = {};
      
      public var midi_rx_pc_b_1:Object = {};
      
      public var midi_rx_pc_b_2:Object = {};
      
      public var midi_rx_pc_b_3:Object = {};
      
      public var midi_rx_pc_b_4:Object = {};
      
      public var temp_patch_name1:Object = {};
      
      public var temp_patch_name2:Object = {};
      
      public var temp_patch_name3:Object = {};
      
      public var temp_patch_name4:Object = {};
      
      public var temp_patch_name5:Object = {};
      
      public var temp_patch_name6:Object = {};
      
      public var temp_patch_name7:Object = {};
      
      public var temp_patch_name8:Object = {};
      
      public var temp_patch_name9:Object = {};
      
      public var temp_patch_name10:Object = {};
      
      public var temp_patch_name11:Object = {};
      
      public var temp_patch_name12:Object = {};
      
      public var temp_patch_name13:Object = {};
      
      public var temp_patch_name14:Object = {};
      
      public var temp_patch_name15:Object = {};
      
      public var temp_patch_name16:Object = {};
      
      public var temp_output_select:Object = {};
      
      public var temp_comp_on_off:Object = {};
      
      public var temp_comp_type:Object = {};
      
      public var temp_comp_sustain:Object = {};
      
      public var temp_comp_attack:Object = {};
      
      public var temp_comp_tone:Object = {};
      
      public var temp_comp_level:Object = {};
      
      public var temp_od_ds_on_off:Object = {};
      
      public var temp_od_ds_type:Object = {};
      
      public var temp_od_ds_drive:Object = {};
      
      public var temp_od_ds_bottom:Object = {};
      
      public var temp_od_ds_tone:Object = {};
      
      public var temp_od_ds_solo_sw:Object = {};
      
      public var temp_od_ds_solo_level:Object = {};
      
      public var temp_od_ds_effect_level:Object = {};
      
      public var temp_od_ds_direct_mix:Object = {};
      
      public var temp_od_ds_custom_type:Object = {};
      
      public var temp_od_ds_custom_bottom:Object = {};
      
      public var temp_od_ds_custom_top:Object = {};
      
      public var temp_od_ds_custom_low:Object = {};
      
      public var temp_od_ds_custom_high:Object = {};
      
      public var temp_od_ds_custom_character:Object = {};
      
      public var temp_preamp_a_on_off:Object = {};
      
      public var temp_preamp_a_type:Object = {};
      
      public var temp_preamp_a_gain:Object = {};
      
      public var temp_preamp_a_t_comp:Object = {};
      
      public var temp_preamp_a_bass:Object = {};
      
      public var temp_preamp_a_middle:Object = {};
      
      public var temp_preamp_a_treble:Object = {};
      
      public var temp_preamp_a_presence:Object = {};
      
      public var temp_preamp_a_level:Object = {};
      
      public var temp_preamp_a_bright:Object = {};
      
      public var temp_preamp_a_gain_sw:Object = {};
      
      public var temp_preamp_a_solo_sw:Object = {};
      
      public var temp_preamp_a_solo_level:Object = {};
      
      public var temp_preamp_a_sp_type:Object = {};
      
      public var temp_preamp_a_mic_type:Object = {};
      
      public var temp_preamp_a_mic_dis:Object = {};
      
      public var temp_preamp_a_mic_pos:Object = {};
      
      public var temp_preamp_a_mic_level:Object = {};
      
      public var temp_preamp_a_direct_mix:Object = {};
      
      public var temp_preamp_a_custom_type:Object = {};
      
      public var temp_preamp_a_custom_bottom:Object = {};
      
      public var temp_preamp_a_custom_edge:Object = {};
      
      public var temp_preamp_a_custom_preamp_low:Object = {};
      
      public var temp_preamp_a_custom_preamp_high:Object = {};
      
      public var temp_preamp_a_custom_char:Object = {};
      
      public var temp_preamp_a_custom_sp_size:Object = {};
      
      public var temp_preamp_a_custom_sp_color_low:Object = {};
      
      public var temp_preamp_a_custom_sp_color_high:Object = {};
      
      public var temp_preamp_a_custom_sp_num:Object = {};
      
      public var temp_preamp_a_custom_sp_cabinet:Object = {};
      
      public var temp_preamp_b_on_off:Object = {};
      
      public var temp_preamp_b_type:Object = {};
      
      public var temp_preamp_b_gain:Object = {};
      
      public var temp_preamp_b_t_comp:Object = {};
      
      public var temp_preamp_b_bass:Object = {};
      
      public var temp_preamp_b_middle:Object = {};
      
      public var temp_preamp_b_treble:Object = {};
      
      public var temp_preamp_b_presence:Object = {};
      
      public var temp_preamp_b_level:Object = {};
      
      public var temp_preamp_b_bright:Object = {};
      
      public var temp_preamp_b_gain_sw:Object = {};
      
      public var temp_preamp_b_solo_sw:Object = {};
      
      public var temp_preamp_b_solo_level:Object = {};
      
      public var temp_preamp_b_sp_type:Object = {};
      
      public var temp_preamp_b_mic_type:Object = {};
      
      public var temp_preamp_b_mic_dis:Object = {};
      
      public var temp_preamp_b_mic_pos:Object = {};
      
      public var temp_preamp_b_mic_level:Object = {};
      
      public var temp_preamp_b_direct_mix:Object = {};
      
      public var temp_preamp_b_custom_type:Object = {};
      
      public var temp_preamp_b_custom_bottom:Object = {};
      
      public var temp_preamp_b_custom_edge:Object = {};
      
      public var temp_preamp_b_custom_preamp_low:Object = {};
      
      public var temp_preamp_b_custom_preamp_high:Object = {};
      
      public var temp_preamp_b_custom_char:Object = {};
      
      public var temp_preamp_b_custom_sp_size:Object = {};
      
      public var temp_preamp_b_custom_sp_color_low:Object = {};
      
      public var temp_preamp_b_custom_sp_color_high:Object = {};
      
      public var temp_preamp_b_custom_sp_num:Object = {};
      
      public var temp_preamp_b_custom_sp_cabinet:Object = {};
      
      public var temp_eq_on_off:Object = {};
      
      public var temp_eq_low_cut:Object = {};
      
      public var temp_eq_low_gain:Object = {};
      
      public var temp_eq_low_mid_freq:Object = {};
      
      public var temp_eq_low_mid_q:Object = {};
      
      public var temp_eq_low_mid_gain:Object = {};
      
      public var temp_eq_high_mid_freq:Object = {};
      
      public var temp_eq_high_mid_q:Object = {};
      
      public var temp_eq_high_mid_gain:Object = {};
      
      public var temp_eq_high_gain:Object = {};
      
      public var temp_eq_high_cut:Object = {};
      
      public var temp_eq_level:Object = {};
      
      public var temp_fx1_on_off:Object = {};
      
      public var temp_fx1_fx_type:Object = {};
      
      public var temp_fx1_sub_od_ds_type:Object = {};
      
      public var temp_fx1_sub_od_ds_drive:Object = {};
      
      public var temp_fx1_sub_od_ds_bottom:Object = {};
      
      public var temp_fx1_sub_od_ds_tone:Object = {};
      
      public var temp_fx1_sub_od_ds_solo_sw:Object = {};
      
      public var temp_fx1_sub_od_ds_solo_level:Object = {};
      
      public var temp_fx1_sub_od_ds_effect_level:Object = {};
      
      public var temp_fx1_sub_od_ds_direct_mix:Object = {};
      
      public var temp_fx1_t_wah_mode:Object = {};
      
      public var temp_fx1_t_wah_polar:Object = {};
      
      public var temp_fx1_t_wah_sens:Object = {};
      
      public var temp_fx1_t_wah_freq:Object = {};
      
      public var temp_fx1_t_wah_peak:Object = {};
      
      public var temp_fx1_t_wah_direct_mix:Object = {};
      
      public var temp_fx1_t_wah_effect_level:Object = {};
      
      public var temp_fx1_auto_wah_mode:Object = {};
      
      public var temp_fx1_auto_wah_freq:Object = {};
      
      public var temp_fx1_auto_wah_peak:Object = {};
      
      public var temp_fx1_auto_wah_rate:Object = {};
      
      public var temp_fx1_auto_wah_depth:Object = {};
      
      public var temp_fx1_auto_wah_direct_mix:Object = {};
      
      public var temp_fx1_auto_wah_effect_level:Object = {};
      
      public var temp_fx1_sub_wah_type:Object = {};
      
      public var temp_fx1_sub_wah_pedal_pos:Object = {};
      
      public var temp_fx1_sub_wah_pedal_min:Object = {};
      
      public var temp_fx1_sub_wah_pedal_max:Object = {};
      
      public var temp_fx1_sub_wah_effect_level:Object = {};
      
      public var temp_fx1_sub_wah_direct_mix:Object = {};
      
      public var temp_fx1_adv_comp_type:Object = {};
      
      public var temp_fx1_adv_comp_sustain:Object = {};
      
      public var temp_fx1_adv_comp_attack:Object = {};
      
      public var temp_fx1_adv_comp_tone:Object = {};
      
      public var temp_fx1_adv_comp_level:Object = {};
      
      public var temp_fx1_limiter_type:Object = {};
      
      public var temp_fx1_limiter_attack:Object = {};
      
      public var temp_fx1_limiter_thresh:Object = {};
      
      public var temp_fx1_limiter_ratio:Object = {};
      
      public var temp_fx1_limiter_release:Object = {};
      
      public var temp_fx1_limiter_level:Object = {};
      
      public var temp_fx1_graphic_eq_31hz:Object = {};
      
      public var temp_fx1_graphic_eq_62hz:Object = {};
      
      public var temp_fx1_graphic_eq_125hz:Object = {};
      
      public var temp_fx1_graphic_eq_250hz:Object = {};
      
      public var temp_fx1_graphic_eq_500hz:Object = {};
      
      public var temp_fx1_graphic_eq_1khz:Object = {};
      
      public var temp_fx1_graphic_eq_2khz:Object = {};
      
      public var temp_fx1_graphic_eq_4khz:Object = {};
      
      public var temp_fx1_graphic_eq_8khz:Object = {};
      
      public var temp_fx1_graphic_eq_16khz:Object = {};
      
      public var temp_fx1_graphic_eq_level:Object = {};
      
      public var temp_fx1_parametric_eq_low_cut:Object = {};
      
      public var temp_fx1_parametric_eq_low_gain:Object = {};
      
      public var temp_fx1_parametric_eq_low_mid_freq:Object = {};
      
      public var temp_fx1_parametric_eq_low_mid_q:Object = {};
      
      public var temp_fx1_parametric_eq_low_mid_gain:Object = {};
      
      public var temp_fx1_parametric_eq_high_mid_freq:Object = {};
      
      public var temp_fx1_parametric_eq_high_mid_q:Object = {};
      
      public var temp_fx1_parametric_eq_high_mid_gain:Object = {};
      
      public var temp_fx1_parametric_eq_high_gain:Object = {};
      
      public var temp_fx1_parametric_eq_high_cut:Object = {};
      
      public var temp_fx1_parametric_eq_level:Object = {};
      
      public var temp_fx1_tone_modify_type:Object = {};
      
      public var temp_fx1_tone_modify_reso:Object = {};
      
      public var temp_fx1_tone_modify_low:Object = {};
      
      public var temp_fx1_tone_modify_high:Object = {};
      
      public var temp_fx1_tone_modify_level:Object = {};
      
      public var temp_fx1_guitar_sim_type:Object = {};
      
      public var temp_fx1_guitar_sim_low:Object = {};
      
      public var temp_fx1_guitar_sim_high:Object = {};
      
      public var temp_fx1_guitar_sim_level:Object = {};
      
      public var temp_fx1_guitar_sim_body:Object = {};
      
      public var temp_fx1_slow_gear_sens:Object = {};
      
      public var temp_fx1_slow_gear_rise_time:Object = {};
      
      public var temp_fx1_slow_gear_level:Object = {};
      
      public var temp_fx1_defretter_tone:Object = {};
      
      public var temp_fx1_defretter_sens:Object = {};
      
      public var temp_fx1_defretter_attack:Object = {};
      
      public var temp_fx1_defretter_depth:Object = {};
      
      public var temp_fx1_defretter_reso:Object = {};
      
      public var temp_fx1_defretter_effect_level:Object = {};
      
      public var temp_fx1_defretter_direct_mix:Object = {};
      
      public var temp_fx1_wave_synth_wave:Object = {};
      
      public var temp_fx1_wave_synth_cutoff:Object = {};
      
      public var temp_fx1_wave_synth_reso:Object = {};
      
      public var temp_fx1_wave_synth_filter_sens:Object = {};
      
      public var temp_fx1_wave_synth_filter_decay:Object = {};
      
      public var temp_fx1_wave_synth_filter_depth:Object = {};
      
      public var temp_fx1_wave_synth_synth_level:Object = {};
      
      public var temp_fx1_wave_synth_direct_mix:Object = {};
      
      public var temp_fx1_sitar_sim_tone:Object = {};
      
      public var temp_fx1_sitar_sim_sens:Object = {};
      
      public var temp_fx1_sitar_sim_depth:Object = {};
      
      public var temp_fx1_sitar_sim_reso:Object = {};
      
      public var temp_fx1_sitar_sim_buzz:Object = {};
      
      public var temp_fx1_sitar_sim_effect_level:Object = {};
      
      public var temp_fx1_sitar_sim_direct_mix:Object = {};
      
      public var temp_fx1_octave_range:Object = {};
      
      public var temp_fx1_octave_level:Object = {};
      
      public var temp_fx1_octave_direct_mix:Object = {};
      
      public var temp_fx1_pitch_shifter_voice:Object = {};
      
      public var temp_fx1_pitch_shifter_ps1mode:Object = {};
      
      public var temp_fx1_pitch_shifter_ps1pitch:Object = {};
      
      public var temp_fx1_pitch_shifter_ps1fine:Object = {};
      
      public var temp_fx1_pitch_shifter_ps1pre_dly_l:Object = {};
      
      public var temp_fx1_pitch_shifter_ps1pre_dly_h:Object = {};
      
      public var temp_fx1_pitch_shifter_ps1level:Object = {};
      
      public var temp_fx1_pitch_shifter_ps2mode:Object = {};
      
      public var temp_fx1_pitch_shifter_ps2pitch:Object = {};
      
      public var temp_fx1_pitch_shifter_ps2fine:Object = {};
      
      public var temp_fx1_pitch_shifter_ps2pre_dly_l:Object = {};
      
      public var temp_fx1_pitch_shifter_ps2pre_dly_h:Object = {};
      
      public var temp_fx1_pitch_shifter_ps2level:Object = {};
      
      public var temp_fx1_pitch_shifter_ps1f_back:Object = {};
      
      public var temp_fx1_pitch_shifter_direct_mix:Object = {};
      
      public var temp_fx1_harmonist_voice:Object = {};
      
      public var temp_fx1_harmonist_hr1harm:Object = {};
      
      public var temp_fx1_harmonist_hr1pre_dly_l:Object = {};
      
      public var temp_fx1_harmonist_hr1pre_dly_h:Object = {};
      
      public var temp_fx1_harmonist_hr1level:Object = {};
      
      public var temp_fx1_harmonist_hr2harm:Object = {};
      
      public var temp_fx1_harmonist_hr2pre_dly_l:Object = {};
      
      public var temp_fx1_harmonist_hr2pre_dly_h:Object = {};
      
      public var temp_fx1_harmonist_hr2level:Object = {};
      
      public var temp_fx1_harmonist_hr1f_back:Object = {};
      
      public var temp_fx1_harmonist_direct_mix:Object = {};
      
      public var temp_fx1_harmonist_hr1c:Object = {};
      
      public var temp_fx1_harmonist_hr1db:Object = {};
      
      public var temp_fx1_harmonist_hr1d:Object = {};
      
      public var temp_fx1_harmonist_hr1eb:Object = {};
      
      public var temp_fx1_harmonist_hr1e:Object = {};
      
      public var temp_fx1_harmonist_hr1f:Object = {};
      
      public var temp_fx1_harmonist_hr1f_s:Object = {};
      
      public var temp_fx1_harmonist_hr1g:Object = {};
      
      public var temp_fx1_harmonist_hr1ab:Object = {};
      
      public var temp_fx1_harmonist_hr1a:Object = {};
      
      public var temp_fx1_harmonist_hr1bb:Object = {};
      
      public var temp_fx1_harmonist_hr1b:Object = {};
      
      public var temp_fx1_harmonist_hr2c:Object = {};
      
      public var temp_fx1_harmonist_hr2db:Object = {};
      
      public var temp_fx1_harmonist_hr2d:Object = {};
      
      public var temp_fx1_harmonist_hr2eb:Object = {};
      
      public var temp_fx1_harmonist_hr2e:Object = {};
      
      public var temp_fx1_harmonist_hr2f:Object = {};
      
      public var temp_fx1_harmonist_hr2f_s:Object = {};
      
      public var temp_fx1_harmonist_hr2g:Object = {};
      
      public var temp_fx1_harmonist_hr2ab:Object = {};
      
      public var temp_fx1_harmonist_hr2a:Object = {};
      
      public var temp_fx1_harmonist_hr2bb:Object = {};
      
      public var temp_fx1_harmonist_hr2b:Object = {};
      
      public var temp_fx1_sound_hold_hold:Object = {};
      
      public var temp_fx1_sound_hold_rise_time:Object = {};
      
      public var temp_fx1_sound_hold_effect_level:Object = {};
      
      public var temp_fx1_ac_processor_type:Object = {};
      
      public var temp_fx1_ac_processor_bass:Object = {};
      
      public var temp_fx1_ac_processor_middle:Object = {};
      
      public var temp_fx1_ac_processor_middle_freq:Object = {};
      
      public var temp_fx1_ac_processor_treble:Object = {};
      
      public var temp_fx1_ac_processor_presence:Object = {};
      
      public var temp_fx1_ac_processor_level:Object = {};
      
      public var temp_fx1_phaser_type:Object = {};
      
      public var temp_fx1_phaser_rate:Object = {};
      
      public var temp_fx1_phaser_depth:Object = {};
      
      public var temp_fx1_phaser_manual:Object = {};
      
      public var temp_fx1_phaser_reso:Object = {};
      
      public var temp_fx1_phaser_step_rate:Object = {};
      
      public var temp_fx1_phaser_effect_level:Object = {};
      
      public var temp_fx1_phaser_direct_mix:Object = {};
      
      public var temp_fx1_flanger_rate:Object = {};
      
      public var temp_fx1_flanger_depth:Object = {};
      
      public var temp_fx1_flanger_manual:Object = {};
      
      public var temp_fx1_flanger_reso:Object = {};
      
      public var temp_fx1_flanger_separation:Object = {};
      
      public var temp_fx1_flanger_low_cut:Object = {};
      
      public var temp_fx1_flanger_effect_level:Object = {};
      
      public var temp_fx1_flanger_direct_mix:Object = {};
      
      public var temp_fx1_tremolo_wave_shape:Object = {};
      
      public var temp_fx1_tremolo_rate:Object = {};
      
      public var temp_fx1_tremolo_depth:Object = {};
      
      public var temp_fx1_tremolo_level:Object = {};
      
      public var temp_fx1_rotary_speed_select:Object = {};
      
      public var temp_fx1_rotary_rate_slow:Object = {};
      
      public var temp_fx1_rotary_rate_fast:Object = {};
      
      public var temp_fx1_rotary_rise_time:Object = {};
      
      public var temp_fx1_rotary_fall_time:Object = {};
      
      public var temp_fx1_rotary_depth:Object = {};
      
      public var temp_fx1_rotary_level:Object = {};
      
      public var temp_fx1_uni_v_rate:Object = {};
      
      public var temp_fx1_uni_v_depth:Object = {};
      
      public var temp_fx1_uni_v_level:Object = {};
      
      public var temp_fx1_pan_type:Object = {};
      
      public var temp_fx1_pan_pos:Object = {};
      
      public var temp_fx1_pan_wave_shape:Object = {};
      
      public var temp_fx1_pan_rate:Object = {};
      
      public var temp_fx1_pan_depth:Object = {};
      
      public var temp_fx1_pan_level:Object = {};
      
      public var temp_fx1_slicer_pattern:Object = {};
      
      public var temp_fx1_slicer_rate:Object = {};
      
      public var temp_fx1_slicer_trigger_sens:Object = {};
      
      public var temp_fx1_slicer_effect_level:Object = {};
      
      public var temp_fx1_slicer_direct_mix:Object = {};
      
      public var temp_fx1_vibrato_rate:Object = {};
      
      public var temp_fx1_vibrato_depth:Object = {};
      
      public var temp_fx1_vibrato_trigger:Object = {};
      
      public var temp_fx1_vibrato_rise_time:Object = {};
      
      public var temp_fx1_vibrato_level:Object = {};
      
      public var temp_fx1_ring_mod_mode:Object = {};
      
      public var temp_fx1_ring_mod_freq:Object = {};
      
      public var temp_fx1_ring_mod_effect_level:Object = {};
      
      public var temp_fx1_ring_mod_direct_mix:Object = {};
      
      public var temp_fx1_humanizer_mode:Object = {};
      
      public var temp_fx1_humanizer_vowel1:Object = {};
      
      public var temp_fx1_humanizer_vowel2:Object = {};
      
      public var temp_fx1_humanizer_sens:Object = {};
      
      public var temp_fx1_humanizer_rate:Object = {};
      
      public var temp_fx1_humanizer_depth:Object = {};
      
      public var temp_fx1_humanizer_manual:Object = {};
      
      public var temp_fx1_humanizer_level:Object = {};
      
      public var temp_fx1_2x2_chorus_xover_freq:Object = {};
      
      public var temp_fx1_2x2_chorus_low_rate:Object = {};
      
      public var temp_fx1_2x2_chorus_low_depth:Object = {};
      
      public var temp_fx1_2x2_chorus_low_pre_delay:Object = {};
      
      public var temp_fx1_2x2_chorus_low_level:Object = {};
      
      public var temp_fx1_2x2_chorus_high_rate:Object = {};
      
      public var temp_fx1_2x2_chorus_high_depth:Object = {};
      
      public var temp_fx1_2x2_chorus_high_pre_delay:Object = {};
      
      public var temp_fx1_2x2_chorus_high_level:Object = {};
      
      public var temp_fx1_2x2_chorus_direct_level:Object = {};
      
      public var temp_fx1_sub_delay_type:Object = {};
      
      public var temp_fx1_sub_delay_time_l:Object = {};
      
      public var temp_fx1_sub_delay_time_h:Object = {};
      
      public var temp_fx1_sub_delay_f_back:Object = {};
      
      public var temp_fx1_sub_delay_high_cut:Object = {};
      
      public var temp_fx1_sub_delay_effect_level:Object = {};
      
      public var temp_fx1_sub_delay_direct_mix:Object = {};
      
      public var temp_fx1_sub_delay_tap_time:Object = {};
      
      public var temp_fx2_on_off:Object = {};
      
      public var temp_fx2_fx_type:Object = {};
      
      public var temp_fx2_sub_od_ds_type:Object = {};
      
      public var temp_fx2_sub_od_ds_drive:Object = {};
      
      public var temp_fx2_sub_od_ds_bottom:Object = {};
      
      public var temp_fx2_sub_od_ds_tone:Object = {};
      
      public var temp_fx2_sub_od_ds_solo_sw:Object = {};
      
      public var temp_fx2_sub_od_ds_solo_level:Object = {};
      
      public var temp_fx2_sub_od_ds_effect_level:Object = {};
      
      public var temp_fx2_sub_od_ds_direct_mix:Object = {};
      
      public var temp_fx2_t_wah_mode:Object = {};
      
      public var temp_fx2_t_wah_polar:Object = {};
      
      public var temp_fx2_t_wah_sens:Object = {};
      
      public var temp_fx2_t_wah_freq:Object = {};
      
      public var temp_fx2_t_wah_peak:Object = {};
      
      public var temp_fx2_t_wah_direct_mix:Object = {};
      
      public var temp_fx2_t_wah_effect_level:Object = {};
      
      public var temp_fx2_auto_wah_mode:Object = {};
      
      public var temp_fx2_auto_wah_freq:Object = {};
      
      public var temp_fx2_auto_wah_peak:Object = {};
      
      public var temp_fx2_auto_wah_rate:Object = {};
      
      public var temp_fx2_auto_wah_depth:Object = {};
      
      public var temp_fx2_auto_wah_direct_mix:Object = {};
      
      public var temp_fx2_auto_wah_effect_level:Object = {};
      
      public var temp_fx2_sub_wah_type:Object = {};
      
      public var temp_fx2_sub_wah_pedal_pos:Object = {};
      
      public var temp_fx2_sub_wah_pedal_min:Object = {};
      
      public var temp_fx2_sub_wah_pedal_max:Object = {};
      
      public var temp_fx2_sub_wah_effect_level:Object = {};
      
      public var temp_fx2_sub_wah_direct_mix:Object = {};
      
      public var temp_fx2_adv_comp_type:Object = {};
      
      public var temp_fx2_adv_comp_sustain:Object = {};
      
      public var temp_fx2_adv_comp_attack:Object = {};
      
      public var temp_fx2_adv_comp_tone:Object = {};
      
      public var temp_fx2_adv_comp_level:Object = {};
      
      public var temp_fx2_limiter_type:Object = {};
      
      public var temp_fx2_limiter_attack:Object = {};
      
      public var temp_fx2_limiter_thresh:Object = {};
      
      public var temp_fx2_limiter_ratio:Object = {};
      
      public var temp_fx2_limiter_release:Object = {};
      
      public var temp_fx2_limiter_level:Object = {};
      
      public var temp_fx2_graphic_eq_31hz:Object = {};
      
      public var temp_fx2_graphic_eq_62hz:Object = {};
      
      public var temp_fx2_graphic_eq_125hz:Object = {};
      
      public var temp_fx2_graphic_eq_250hz:Object = {};
      
      public var temp_fx2_graphic_eq_500hz:Object = {};
      
      public var temp_fx2_graphic_eq_1khz:Object = {};
      
      public var temp_fx2_graphic_eq_2khz:Object = {};
      
      public var temp_fx2_graphic_eq_4khz:Object = {};
      
      public var temp_fx2_graphic_eq_8khz:Object = {};
      
      public var temp_fx2_graphic_eq_16khz:Object = {};
      
      public var temp_fx2_graphic_eq_level:Object = {};
      
      public var temp_fx2_parametric_eq_low_cut:Object = {};
      
      public var temp_fx2_parametric_eq_low_gain:Object = {};
      
      public var temp_fx2_parametric_eq_low_mid_freq:Object = {};
      
      public var temp_fx2_parametric_eq_low_mid_q:Object = {};
      
      public var temp_fx2_parametric_eq_low_mid_gain:Object = {};
      
      public var temp_fx2_parametric_eq_high_mid_freq:Object = {};
      
      public var temp_fx2_parametric_eq_high_mid_q:Object = {};
      
      public var temp_fx2_parametric_eq_high_mid_gain:Object = {};
      
      public var temp_fx2_parametric_eq_high_gain:Object = {};
      
      public var temp_fx2_parametric_eq_high_cut:Object = {};
      
      public var temp_fx2_parametric_eq_level:Object = {};
      
      public var temp_fx2_tone_modify_type:Object = {};
      
      public var temp_fx2_tone_modify_reso:Object = {};
      
      public var temp_fx2_tone_modify_low:Object = {};
      
      public var temp_fx2_tone_modify_high:Object = {};
      
      public var temp_fx2_tone_modify_level:Object = {};
      
      public var temp_fx2_guitar_sim_type:Object = {};
      
      public var temp_fx2_guitar_sim_low:Object = {};
      
      public var temp_fx2_guitar_sim_high:Object = {};
      
      public var temp_fx2_guitar_sim_level:Object = {};
      
      public var temp_fx2_guitar_sim_body:Object = {};
      
      public var temp_fx2_slow_gear_sens:Object = {};
      
      public var temp_fx2_slow_gear_rise_time:Object = {};
      
      public var temp_fx2_slow_gear_level:Object = {};
      
      public var temp_fx2_defretter_tone:Object = {};
      
      public var temp_fx2_defretter_sens:Object = {};
      
      public var temp_fx2_defretter_attack:Object = {};
      
      public var temp_fx2_defretter_depth:Object = {};
      
      public var temp_fx2_defretter_reso:Object = {};
      
      public var temp_fx2_defretter_effect_level:Object = {};
      
      public var temp_fx2_defretter_direct_mix:Object = {};
      
      public var temp_fx2_wave_synth_wave:Object = {};
      
      public var temp_fx2_wave_synth_cutoff:Object = {};
      
      public var temp_fx2_wave_synth_reso:Object = {};
      
      public var temp_fx2_wave_synth_filter_sens:Object = {};
      
      public var temp_fx2_wave_synth_filter_decay:Object = {};
      
      public var temp_fx2_wave_synth_filter_depth:Object = {};
      
      public var temp_fx2_wave_synth_synth_level:Object = {};
      
      public var temp_fx2_wave_synth_direct_mix:Object = {};
      
      public var temp_fx2_sitar_sim_tone:Object = {};
      
      public var temp_fx2_sitar_sim_sens:Object = {};
      
      public var temp_fx2_sitar_sim_depth:Object = {};
      
      public var temp_fx2_sitar_sim_reso:Object = {};
      
      public var temp_fx2_sitar_sim_buzz:Object = {};
      
      public var temp_fx2_sitar_sim_effect_level:Object = {};
      
      public var temp_fx2_sitar_sim_direct_mix:Object = {};
      
      public var temp_fx2_octave_range:Object = {};
      
      public var temp_fx2_octave_level:Object = {};
      
      public var temp_fx2_octave_direct_mix:Object = {};
      
      public var temp_fx2_pitch_shifter_voice:Object = {};
      
      public var temp_fx2_pitch_shifter_ps1mode:Object = {};
      
      public var temp_fx2_pitch_shifter_ps1pitch:Object = {};
      
      public var temp_fx2_pitch_shifter_ps1fine:Object = {};
      
      public var temp_fx2_pitch_shifter_ps1pre_dly_l:Object = {};
      
      public var temp_fx2_pitch_shifter_ps1pre_dly_h:Object = {};
      
      public var temp_fx2_pitch_shifter_ps1level:Object = {};
      
      public var temp_fx2_pitch_shifter_ps2mode:Object = {};
      
      public var temp_fx2_pitch_shifter_ps2pitch:Object = {};
      
      public var temp_fx2_pitch_shifter_ps2fine:Object = {};
      
      public var temp_fx2_pitch_shifter_ps2pre_dly_l:Object = {};
      
      public var temp_fx2_pitch_shifter_ps2pre_dly_h:Object = {};
      
      public var temp_fx2_pitch_shifter_ps2level:Object = {};
      
      public var temp_fx2_pitch_shifter_ps1f_back:Object = {};
      
      public var temp_fx2_pitch_shifter_direct_mix:Object = {};
      
      public var temp_fx2_harmonist_voice:Object = {};
      
      public var temp_fx2_harmonist_hr1harm:Object = {};
      
      public var temp_fx2_harmonist_hr1pre_dly_l:Object = {};
      
      public var temp_fx2_harmonist_hr1pre_dly_h:Object = {};
      
      public var temp_fx2_harmonist_hr1level:Object = {};
      
      public var temp_fx2_harmonist_hr2harm:Object = {};
      
      public var temp_fx2_harmonist_hr2pre_dly_l:Object = {};
      
      public var temp_fx2_harmonist_hr2pre_dly_h:Object = {};
      
      public var temp_fx2_harmonist_hr2level:Object = {};
      
      public var temp_fx2_harmonist_hr1f_back:Object = {};
      
      public var temp_fx2_harmonist_direct_mix:Object = {};
      
      public var temp_fx2_harmonist_hr1c:Object = {};
      
      public var temp_fx2_harmonist_hr1db:Object = {};
      
      public var temp_fx2_harmonist_hr1d:Object = {};
      
      public var temp_fx2_harmonist_hr1eb:Object = {};
      
      public var temp_fx2_harmonist_hr1e:Object = {};
      
      public var temp_fx2_harmonist_hr1f:Object = {};
      
      public var temp_fx2_harmonist_hr1f_s:Object = {};
      
      public var temp_fx2_harmonist_hr1g:Object = {};
      
      public var temp_fx2_harmonist_hr1ab:Object = {};
      
      public var temp_fx2_harmonist_hr1a:Object = {};
      
      public var temp_fx2_harmonist_hr1bb:Object = {};
      
      public var temp_fx2_harmonist_hr1b:Object = {};
      
      public var temp_fx2_harmonist_hr2c:Object = {};
      
      public var temp_fx2_harmonist_hr2db:Object = {};
      
      public var temp_fx2_harmonist_hr2d:Object = {};
      
      public var temp_fx2_harmonist_hr2eb:Object = {};
      
      public var temp_fx2_harmonist_hr2e:Object = {};
      
      public var temp_fx2_harmonist_hr2f:Object = {};
      
      public var temp_fx2_harmonist_hr2f_s:Object = {};
      
      public var temp_fx2_harmonist_hr2g:Object = {};
      
      public var temp_fx2_harmonist_hr2ab:Object = {};
      
      public var temp_fx2_harmonist_hr2a:Object = {};
      
      public var temp_fx2_harmonist_hr2bb:Object = {};
      
      public var temp_fx2_harmonist_hr2b:Object = {};
      
      public var temp_fx2_sound_hold_hold:Object = {};
      
      public var temp_fx2_sound_hold_rise_time:Object = {};
      
      public var temp_fx2_sound_hold_effect_level:Object = {};
      
      public var temp_fx2_ac_processor_type:Object = {};
      
      public var temp_fx2_ac_processor_bass:Object = {};
      
      public var temp_fx2_ac_processor_middle:Object = {};
      
      public var temp_fx2_ac_processor_middle_freq:Object = {};
      
      public var temp_fx2_ac_processor_treble:Object = {};
      
      public var temp_fx2_ac_processor_presence:Object = {};
      
      public var temp_fx2_ac_processor_level:Object = {};
      
      public var temp_fx2_phaser_type:Object = {};
      
      public var temp_fx2_phaser_rate:Object = {};
      
      public var temp_fx2_phaser_depth:Object = {};
      
      public var temp_fx2_phaser_manual:Object = {};
      
      public var temp_fx2_phaser_reso:Object = {};
      
      public var temp_fx2_phaser_step_rate:Object = {};
      
      public var temp_fx2_phaser_effect_level:Object = {};
      
      public var temp_fx2_phaser_direct_mix:Object = {};
      
      public var temp_fx2_flanger_rate:Object = {};
      
      public var temp_fx2_flanger_depth:Object = {};
      
      public var temp_fx2_flanger_manual:Object = {};
      
      public var temp_fx2_flanger_reso:Object = {};
      
      public var temp_fx2_flanger_separation:Object = {};
      
      public var temp_fx2_flanger_low_cut:Object = {};
      
      public var temp_fx2_flanger_effect_level:Object = {};
      
      public var temp_fx2_flanger_direct_mix:Object = {};
      
      public var temp_fx2_tremolo_wave_shape:Object = {};
      
      public var temp_fx2_tremolo_rate:Object = {};
      
      public var temp_fx2_tremolo_depth:Object = {};
      
      public var temp_fx2_tremolo_level:Object = {};
      
      public var temp_fx2_rotary_speed_select:Object = {};
      
      public var temp_fx2_rotary_rate_slow:Object = {};
      
      public var temp_fx2_rotary_rate_fast:Object = {};
      
      public var temp_fx2_rotary_rise_time:Object = {};
      
      public var temp_fx2_rotary_fall_time:Object = {};
      
      public var temp_fx2_rotary_depth:Object = {};
      
      public var temp_fx2_rotary_level:Object = {};
      
      public var temp_fx2_uni_v_rate:Object = {};
      
      public var temp_fx2_uni_v_depth:Object = {};
      
      public var temp_fx2_uni_v_level:Object = {};
      
      public var temp_fx2_pan_type:Object = {};
      
      public var temp_fx2_pan_pos:Object = {};
      
      public var temp_fx2_pan_wave_shape:Object = {};
      
      public var temp_fx2_pan_rate:Object = {};
      
      public var temp_fx2_pan_depth:Object = {};
      
      public var temp_fx2_pan_level:Object = {};
      
      public var temp_fx2_slicer_pattern:Object = {};
      
      public var temp_fx2_slicer_rate:Object = {};
      
      public var temp_fx2_slicer_trigger_sens:Object = {};
      
      public var temp_fx2_slicer_effect_level:Object = {};
      
      public var temp_fx2_slicer_direct_mix:Object = {};
      
      public var temp_fx2_vibrato_rate:Object = {};
      
      public var temp_fx2_vibrato_depth:Object = {};
      
      public var temp_fx2_vibrato_trigger:Object = {};
      
      public var temp_fx2_vibrato_rise_time:Object = {};
      
      public var temp_fx2_vibrato_level:Object = {};
      
      public var temp_fx2_ring_mod_mode:Object = {};
      
      public var temp_fx2_ring_mod_freq:Object = {};
      
      public var temp_fx2_ring_mod_effect_level:Object = {};
      
      public var temp_fx2_ring_mod_direct_mix:Object = {};
      
      public var temp_fx2_humanizer_mode:Object = {};
      
      public var temp_fx2_humanizer_vowel1:Object = {};
      
      public var temp_fx2_humanizer_vowel2:Object = {};
      
      public var temp_fx2_humanizer_sens:Object = {};
      
      public var temp_fx2_humanizer_rate:Object = {};
      
      public var temp_fx2_humanizer_depth:Object = {};
      
      public var temp_fx2_humanizer_manual:Object = {};
      
      public var temp_fx2_humanizer_level:Object = {};
      
      public var temp_fx2_2x2_chorus_xover_freq:Object = {};
      
      public var temp_fx2_2x2_chorus_low_rate:Object = {};
      
      public var temp_fx2_2x2_chorus_low_depth:Object = {};
      
      public var temp_fx2_2x2_chorus_low_pre_delay:Object = {};
      
      public var temp_fx2_2x2_chorus_low_level:Object = {};
      
      public var temp_fx2_2x2_chorus_high_rate:Object = {};
      
      public var temp_fx2_2x2_chorus_high_depth:Object = {};
      
      public var temp_fx2_2x2_chorus_high_pre_delay:Object = {};
      
      public var temp_fx2_2x2_chorus_high_level:Object = {};
      
      public var temp_fx2_2x2_chorus_direct_level:Object = {};
      
      public var temp_fx2_sub_delay_type:Object = {};
      
      public var temp_fx2_sub_delay_time_l:Object = {};
      
      public var temp_fx2_sub_delay_time_h:Object = {};
      
      public var temp_fx2_sub_delay_f_back:Object = {};
      
      public var temp_fx2_sub_delay_high_cut:Object = {};
      
      public var temp_fx2_sub_delay_effect_level:Object = {};
      
      public var temp_fx2_sub_delay_direct_mix:Object = {};
      
      public var temp_fx2_sub_delay_tap_time:Object = {};
      
      public var temp_delay_on_off:Object = {};
      
      public var temp_delay_type:Object = {};
      
      public var temp_delay_delay_time_l:Object = {};
      
      public var temp_delay_delay_time_h:Object = {};
      
      public var temp_delay_f_back:Object = {};
      
      public var temp_delay_high_cut:Object = {};
      
      public var temp_delay_effect_level:Object = {};
      
      public var temp_delay_direct_mix:Object = {};
      
      public var temp_delay_tap_time:Object = {};
      
      public var temp_delay_d1_time_l:Object = {};
      
      public var temp_delay_d1_time_h:Object = {};
      
      public var temp_delay_d1_f_back:Object = {};
      
      public var temp_delay_d1_hi_cut:Object = {};
      
      public var temp_delay_d1_level:Object = {};
      
      public var temp_delay_d2_time_l:Object = {};
      
      public var temp_delay_d2_time_h:Object = {};
      
      public var temp_delay_d2_f_back:Object = {};
      
      public var temp_delay_d2_hi_cut:Object = {};
      
      public var temp_delay_d2_level:Object = {};
      
      public var temp_delay_mod_rate:Object = {};
      
      public var temp_delay_mod_depth:Object = {};
      
      public var temp_chorus_on_off:Object = {};
      
      public var temp_chorus_mode:Object = {};
      
      public var temp_chorus_rate:Object = {};
      
      public var temp_chorus_depth:Object = {};
      
      public var temp_chorus_pre_delay:Object = {};
      
      public var temp_chorus_low_cut:Object = {};
      
      public var temp_chorus_high_cut:Object = {};
      
      public var temp_chorus_effect_level:Object = {};
      
      public var temp_chorus_direct_level:Object = {};
      
      public var temp_reverb_on_off:Object = {};
      
      public var temp_reverb_type:Object = {};
      
      public var temp_reverb_time:Object = {};
      
      public var temp_reverb_pre_delay_l:Object = {};
      
      public var temp_reverb_pre_delay_h:Object = {};
      
      public var temp_reverb_low_cut:Object = {};
      
      public var temp_reverb_high_cut:Object = {};
      
      public var temp_reverb_density:Object = {};
      
      public var temp_reverb_effect_level:Object = {};
      
      public var temp_reverb_direct_mix:Object = {};
      
      public var temp_reverb_spring_sens:Object = {};
      
      public var temp_pedal_fx_on_off:Object = {};
      
      public var temp_pedal_fx_pedal_bend_pitch:Object = {};
      
      public var temp_pedal_fx_pedal_bend_position:Object = {};
      
      public var temp_pedal_fx_pedal_bend_effect_level:Object = {};
      
      public var temp_pedal_fx_pedal_bend_direct_mix:Object = {};
      
      public var temp_pedal_fx_wah_type:Object = {};
      
      public var temp_pedal_fx_wah_position:Object = {};
      
      public var temp_pedal_fx_wah_pedal_min:Object = {};
      
      public var temp_pedal_fx_wah_pedal_max:Object = {};
      
      public var temp_pedal_fx_wah_effect_level:Object = {};
      
      public var temp_pedal_fx_wah_direct_mix:Object = {};
      
      public var temp_foot_volume_volume_curve:Object = {};
      
      public var temp_foot_volume_volume_min:Object = {};
      
      public var temp_foot_volume_volume_max:Object = {};
      
      public var temp_foot_volume_level:Object = {};
      
      public var temp_divider_mode:Object = {};
      
      public var temp_divider_ch_select:Object = {};
      
      public var temp_divider_ch_a_dynamic:Object = {};
      
      public var temp_divider_ch_a_dynamic_sens:Object = {};
      
      public var temp_divider_ch_a_filter:Object = {};
      
      public var temp_divider_ch_a_cutoff_freq:Object = {};
      
      public var temp_divider_ch_b_dynamic:Object = {};
      
      public var temp_divider_ch_b_dynamic_sens:Object = {};
      
      public var temp_divider_ch_b_filter:Object = {};
      
      public var temp_divider_ch_b_cutoff_freq:Object = {};
      
      public var temp_mixer_mode:Object = {};
      
      public var temp_mixer_ch_a_b_balance:Object = {};
      
      public var temp_mixer_spread:Object = {};
      
      public var temp_send_return_on_off:Object = {};
      
      public var temp_send_return_mode:Object = {};
      
      public var temp_send_return_send_level:Object = {};
      
      public var temp_send_return_return_level:Object = {};
      
      public var temp_send_return_adjust:Object = {};
      
      public var temp_amp_control:Object = {};
      
      public var temp_ns1_on_off:Object = {};
      
      public var temp_ns1_threshold:Object = {};
      
      public var temp_ns1_release:Object = {};
      
      public var temp_ns1_detect:Object = {};
      
      public var temp_ns2_on_off:Object = {};
      
      public var temp_ns2_threshold:Object = {};
      
      public var temp_ns2_release:Object = {};
      
      public var temp_ns2_detect:Object = {};
      
      public var temp_accel_fx_type:Object = {};
      
      public var temp_accel_fx_s_bend_pitch:Object = {};
      
      public var temp_accel_fx_s_bend_rise_time:Object = {};
      
      public var temp_accel_fx_s_bend_fall_time:Object = {};
      
      public var temp_accel_fx_laser_beam_rate:Object = {};
      
      public var temp_accel_fx_laser_beam_depth:Object = {};
      
      public var temp_accel_fx_laser_beam_rise_time:Object = {};
      
      public var temp_accel_fx_laser_beam_fall_time:Object = {};
      
      public var temp_accel_fx_ring_mod_freq:Object = {};
      
      public var temp_accel_fx_ring_mod_rise_time:Object = {};
      
      public var temp_accel_fx_ring_mod_fall_time:Object = {};
      
      public var temp_accel_fx_ring_mod_ring_level:Object = {};
      
      public var temp_accel_fx_ring_mod_octave_level:Object = {};
      
      public var temp_accel_fx_ring_mod_direct_mix:Object = {};
      
      public var temp_accel_fx_twist_level:Object = {};
      
      public var temp_accel_fx_twist_rise_time:Object = {};
      
      public var temp_accel_fx_twist_fall_time:Object = {};
      
      public var temp_accel_fx_warp_level:Object = {};
      
      public var temp_accel_fx_warp_rise_time:Object = {};
      
      public var temp_accel_fx_warp_fall_time:Object = {};
      
      public var temp_accel_fx_feedbacker_mode:Object = {};
      
      public var temp_accel_fx_feedbacker_depth:Object = {};
      
      public var temp_accel_fx_feedbacker_rise_time:Object = {};
      
      public var temp_accel_fx_feedbacker_octave_rise_time:Object = {};
      
      public var temp_accel_fx_feedbacker_f_back_level:Object = {};
      
      public var temp_accel_fx_feedbacker_octave_f_back_level:Object = {};
      
      public var temp_accel_fx_feedbacker_vib_rate:Object = {};
      
      public var temp_accel_fx_feedbacker_vib_depth:Object = {};
      
      public var temp_patch_category:Object = {};
      
      public var temp_patch_level:Object = {};
      
      public var temp_master_eq_low_gain:Object = {};
      
      public var temp_master_eq_mid_freq:Object = {};
      
      public var temp_master_eq_mid_q:Object = {};
      
      public var temp_master_eq_mid_gain:Object = {};
      
      public var temp_master_eq_high_gain:Object = {};
      
      public var temp_master_bpm_l:Object = {};
      
      public var temp_master_bpm_h:Object = {};
      
      public var temp_master_key:Object = {};
      
      public var temp_master_beat:Object = {};
      
      public var temp_pitch_detection:Object = {};
      
      public var temp_fx_chain_position1:Object = {};
      
      public var temp_fx_chain_position2:Object = {};
      
      public var temp_fx_chain_position3:Object = {};
      
      public var temp_fx_chain_position4:Object = {};
      
      public var temp_fx_chain_position5:Object = {};
      
      public var temp_fx_chain_position6:Object = {};
      
      public var temp_fx_chain_position7:Object = {};
      
      public var temp_fx_chain_position8:Object = {};
      
      public var temp_fx_chain_position9:Object = {};
      
      public var temp_fx_chain_position10:Object = {};
      
      public var temp_fx_chain_position11:Object = {};
      
      public var temp_fx_chain_position12:Object = {};
      
      public var temp_fx_chain_position13:Object = {};
      
      public var temp_fx_chain_position14:Object = {};
      
      public var temp_fx_chain_position15:Object = {};
      
      public var temp_fx_chain_position16:Object = {};
      
      public var temp_fx_chain_position17:Object = {};
      
      public var temp_fx_chain_position18:Object = {};
      
      public var temp_fx_chain_position19:Object = {};
      
      public var temp_fx_chain_position20:Object = {};
      
      public var temp_manual_mode_bank_down:Object = {};
      
      public var temp_manual_mode_bank_up:Object = {};
      
      public var temp_manual_mode_number_pedal1:Object = {};
      
      public var temp_manual_mode_number_pedal2:Object = {};
      
      public var temp_manual_mode_number_pedal3:Object = {};
      
      public var temp_manual_mode_number_pedal4:Object = {};
      
      public var temp_manual_mode_phrase_loop:Object = {};
      
      public var temp_manual_mode_accel_ctrl:Object = {};
      
      public var temp_ctl_exp_accel_ctl_func:Object = {};
      
      public var temp_ctl_exp_accel_ctl_min:Object = {};
      
      public var temp_ctl_exp_accel_ctl_max:Object = {};
      
      public var temp_ctl_exp_accel_ctl_src_mode:Object = {};
      
      public var temp_ctl_exp_exp_sw_func:Object = {};
      
      public var temp_ctl_exp_exp_sw_min:Object = {};
      
      public var temp_ctl_exp_exp_sw_max:Object = {};
      
      public var temp_ctl_exp_exp_sw_src_mode:Object = {};
      
      public var temp_ctl_exp_sub_ctl1_func:Object = {};
      
      public var temp_ctl_exp_sub_ctl1_min:Object = {};
      
      public var temp_ctl_exp_sub_ctl1_max:Object = {};
      
      public var temp_ctl_exp_sub_ctl1_src_mode:Object = {};
      
      public var temp_ctl_exp_sub_ctl2_func:Object = {};
      
      public var temp_ctl_exp_sub_ctl2_min:Object = {};
      
      public var temp_ctl_exp_sub_ctl2_max:Object = {};
      
      public var temp_ctl_exp_sub_ctl2_src_mode:Object = {};
      
      public var temp_ctl_exp_exp_func:Object = {};
      
      public var temp_ctl_exp_exp_patch_level_min:Object = {};
      
      public var temp_ctl_exp_exp_patch_level_max:Object = {};
      
      public var temp_ctl_exp_sub_exp_func:Object = {};
      
      public var temp_ctl_exp_sub_exp_patch_level_min:Object = {};
      
      public var temp_ctl_exp_sub_exp_patch_level_max:Object = {};
      
      public var temp_assign1_on_off:Object = {};
      
      public var temp_assign1_target_l:Object = {};
      
      public var temp_assign1_target_h:Object = {};
      
      public var temp_assign1_target_min_l:Object = {};
      
      public var temp_assign1_target_min_h:Object = {};
      
      public var temp_assign1_target_max_l:Object = {};
      
      public var temp_assign1_target_max_h:Object = {};
      
      public var temp_assign1_source:Object = {};
      
      public var temp_assign1_source_mode:Object = {};
      
      public var temp_assign1_act_range_lo:Object = {};
      
      public var temp_assign1_act_range_hi:Object = {};
      
      public var temp_assign1_int_pdl_trigger:Object = {};
      
      public var temp_assign1_int_pdl_time:Object = {};
      
      public var temp_assign1_int_pdl_curve:Object = {};
      
      public var temp_assign1_wave_rate:Object = {};
      
      public var temp_assign1_waveform:Object = {};
      
      public var temp_assign2_on_off:Object = {};
      
      public var temp_assign2_target_l:Object = {};
      
      public var temp_assign2_target_h:Object = {};
      
      public var temp_assign2_target_min_l:Object = {};
      
      public var temp_assign2_target_min_h:Object = {};
      
      public var temp_assign2_target_max_l:Object = {};
      
      public var temp_assign2_target_max_h:Object = {};
      
      public var temp_assign2_source:Object = {};
      
      public var temp_assign2_source_mode:Object = {};
      
      public var temp_assign2_act_range_lo:Object = {};
      
      public var temp_assign2_act_range_hi:Object = {};
      
      public var temp_assign2_int_pdl_trigger:Object = {};
      
      public var temp_assign2_int_pdl_time:Object = {};
      
      public var temp_assign2_int_pdl_curve:Object = {};
      
      public var temp_assign2_wave_rate:Object = {};
      
      public var temp_assign2_waveform:Object = {};
      
      public var temp_assign3_on_off:Object = {};
      
      public var temp_assign3_target_l:Object = {};
      
      public var temp_assign3_target_h:Object = {};
      
      public var temp_assign3_target_min_l:Object = {};
      
      public var temp_assign3_target_min_h:Object = {};
      
      public var temp_assign3_target_max_l:Object = {};
      
      public var temp_assign3_target_max_h:Object = {};
      
      public var temp_assign3_source:Object = {};
      
      public var temp_assign3_source_mode:Object = {};
      
      public var temp_assign3_act_range_lo:Object = {};
      
      public var temp_assign3_act_range_hi:Object = {};
      
      public var temp_assign3_int_pdl_trigger:Object = {};
      
      public var temp_assign3_int_pdl_time:Object = {};
      
      public var temp_assign3_int_pdl_curve:Object = {};
      
      public var temp_assign3_wave_rate:Object = {};
      
      public var temp_assign3_waveform:Object = {};
      
      public var temp_assign4_on_off:Object = {};
      
      public var temp_assign4_target_l:Object = {};
      
      public var temp_assign4_target_h:Object = {};
      
      public var temp_assign4_target_min_l:Object = {};
      
      public var temp_assign4_target_min_h:Object = {};
      
      public var temp_assign4_target_max_l:Object = {};
      
      public var temp_assign4_target_max_h:Object = {};
      
      public var temp_assign4_source:Object = {};
      
      public var temp_assign4_source_mode:Object = {};
      
      public var temp_assign4_act_range_lo:Object = {};
      
      public var temp_assign4_act_range_hi:Object = {};
      
      public var temp_assign4_int_pdl_trigger:Object = {};
      
      public var temp_assign4_int_pdl_time:Object = {};
      
      public var temp_assign4_int_pdl_curve:Object = {};
      
      public var temp_assign4_wave_rate:Object = {};
      
      public var temp_assign4_waveform:Object = {};
      
      public var temp_assign5_on_off:Object = {};
      
      public var temp_assign5_target_l:Object = {};
      
      public var temp_assign5_target_h:Object = {};
      
      public var temp_assign5_target_min_l:Object = {};
      
      public var temp_assign5_target_min_h:Object = {};
      
      public var temp_assign5_target_max_l:Object = {};
      
      public var temp_assign5_target_max_h:Object = {};
      
      public var temp_assign5_source:Object = {};
      
      public var temp_assign5_source_mode:Object = {};
      
      public var temp_assign5_act_range_lo:Object = {};
      
      public var temp_assign5_act_range_hi:Object = {};
      
      public var temp_assign5_int_pdl_trigger:Object = {};
      
      public var temp_assign5_int_pdl_time:Object = {};
      
      public var temp_assign5_int_pdl_curve:Object = {};
      
      public var temp_assign5_wave_rate:Object = {};
      
      public var temp_assign5_waveform:Object = {};
      
      public var temp_assign6_on_off:Object = {};
      
      public var temp_assign6_target_l:Object = {};
      
      public var temp_assign6_target_h:Object = {};
      
      public var temp_assign6_target_min_l:Object = {};
      
      public var temp_assign6_target_min_h:Object = {};
      
      public var temp_assign6_target_max_l:Object = {};
      
      public var temp_assign6_target_max_h:Object = {};
      
      public var temp_assign6_source:Object = {};
      
      public var temp_assign6_source_mode:Object = {};
      
      public var temp_assign6_act_range_lo:Object = {};
      
      public var temp_assign6_act_range_hi:Object = {};
      
      public var temp_assign6_int_pdl_trigger:Object = {};
      
      public var temp_assign6_int_pdl_time:Object = {};
      
      public var temp_assign6_int_pdl_curve:Object = {};
      
      public var temp_assign6_wave_rate:Object = {};
      
      public var temp_assign6_waveform:Object = {};
      
      public var temp_assign7_on_off:Object = {};
      
      public var temp_assign7_target_l:Object = {};
      
      public var temp_assign7_target_h:Object = {};
      
      public var temp_assign7_target_min_l:Object = {};
      
      public var temp_assign7_target_min_h:Object = {};
      
      public var temp_assign7_target_max_l:Object = {};
      
      public var temp_assign7_target_max_h:Object = {};
      
      public var temp_assign7_source:Object = {};
      
      public var temp_assign7_source_mode:Object = {};
      
      public var temp_assign7_act_range_lo:Object = {};
      
      public var temp_assign7_act_range_hi:Object = {};
      
      public var temp_assign7_int_pdl_trigger:Object = {};
      
      public var temp_assign7_int_pdl_time:Object = {};
      
      public var temp_assign7_int_pdl_curve:Object = {};
      
      public var temp_assign7_wave_rate:Object = {};
      
      public var temp_assign7_waveform:Object = {};
      
      public var temp_assign8_on_off:Object = {};
      
      public var temp_assign8_target_l:Object = {};
      
      public var temp_assign8_target_h:Object = {};
      
      public var temp_assign8_target_min_l:Object = {};
      
      public var temp_assign8_target_min_h:Object = {};
      
      public var temp_assign8_target_max_l:Object = {};
      
      public var temp_assign8_target_max_h:Object = {};
      
      public var temp_assign8_source:Object = {};
      
      public var temp_assign8_source_mode:Object = {};
      
      public var temp_assign8_act_range_lo:Object = {};
      
      public var temp_assign8_act_range_hi:Object = {};
      
      public var temp_assign8_int_pdl_trigger:Object = {};
      
      public var temp_assign8_int_pdl_time:Object = {};
      
      public var temp_assign8_int_pdl_curve:Object = {};
      
      public var temp_assign8_wave_rate:Object = {};
      
      public var temp_assign8_waveform:Object = {};
      
      public var temp_assign_common_input_sens:Object = {};
      
      public var temp_fx1_acsim_high:Object = {};
      
      public var temp_fx1_acsim_body:Object = {};
      
      public var temp_fx1_acsim_low:Object = {};
      
      public var temp_fx1_acsim_level:Object = {};
      
      public var temp_fx1_rotary2_balance:Object = {};
      
      public var temp_fx1_rotary2_speed_sel:Object = {};
      
      public var temp_fx1_rotary2_rate_slow:Object = {};
      
      public var temp_fx1_rotary2_rate_fast:Object = {};
      
      public var temp_fx1_rotary2_risetime:Object = {};
      
      public var temp_fx1_rotary2_falltime:Object = {};
      
      public var temp_fx1_rotary2_depth:Object = {};
      
      public var temp_fx1_rotary2_level:Object = {};
      
      public var temp_fx1_rotary2_direct_mix:Object = {};
      
      public var temp_fx2_acsim_high:Object = {};
      
      public var temp_fx2_acsim_body:Object = {};
      
      public var temp_fx2_acsim_low:Object = {};
      
      public var temp_fx2_acsim_level:Object = {};
      
      public var temp_fx2_rotary2_balance:Object = {};
      
      public var temp_fx2_rotary2_speed_sel:Object = {};
      
      public var temp_fx2_rotary2_rate_slow:Object = {};
      
      public var temp_fx2_rotary2_rate_fast:Object = {};
      
      public var temp_fx2_rotary2_risetime:Object = {};
      
      public var temp_fx2_rotary2_falltime:Object = {};
      
      public var temp_fx2_rotary2_depth:Object = {};
      
      public var temp_fx2_rotary2_level:Object = {};
      
      public var temp_fx2_rotary2_direct_mix:Object = {};
      
      public var temp_prm_fx2_teraecho_mode:Object = {};
      
      public var temp_prm_fx2_teraecho_time:Object = {};
      
      public var temp_prm_fx2_teraecho_feedback:Object = {};
      
      public var temp_prm_fx2_teraecho_tone:Object = {};
      
      public var temp_prm_fx2_teraecho_effect_level:Object = {};
      
      public var temp_prm_fx2_teraecho_direct_mix:Object = {};
      
      public var temp_prm_fx2_teraecho_hold:Object = {};
      
      public var temp_prm_fx2_overtone_detune:Object = {};
      
      public var temp_prm_fx2_overtone_tone:Object = {};
      
      public var temp_prm_fx2_overtone_upper_level:Object = {};
      
      public var temp_prm_fx2_overtone_lower_level:Object = {};
      
      public var temp_prm_fx2_overtone_direct_level:Object = {};
      
      public var temp_fx1_phaser90e_script:Object = {};
      
      public var temp_fx1_phaser90e_speed:Object = {};
      
      public var temp_fx1_flanger117e_manual:Object = {};
      
      public var temp_fx1_flanger117e_width:Object = {};
      
      public var temp_fx1_flanger117e_speed:Object = {};
      
      public var temp_fx1_flanger117e_regen:Object = {};
      
      public var temp_fx2_phaser90e_script:Object = {};
      
      public var temp_fx2_phaser90e_speed:Object = {};
      
      public var temp_fx2_flanger117e_manual:Object = {};
      
      public var temp_fx2_flanger117e_width:Object = {};
      
      public var temp_fx2_flanger117e_speed:Object = {};
      
      public var temp_fx2_flanger117e_regen:Object = {};
      
      public var temp_delay_vtg_lpf:Object = {};
      
      public var temp_delay_vtg_filter:Object = {};
      
      public var temp_delay_vtg_feedback_phase:Object = {};
      
      public var temp_delay_vtg_effect_phase:Object = {};
      
      public var temp_delay_vtg_mod_sw:Object = {};
      
      public var temp_delay2_on_off:Object = {};
      
      public var temp_delay2_type:Object = {};
      
      public var temp_delay2_delay_time_l:Object = {};
      
      public var temp_delay2_delay_time_h:Object = {};
      
      public var temp_delay2_f_back:Object = {};
      
      public var temp_delay2_high_cut:Object = {};
      
      public var temp_delay2_effect_level:Object = {};
      
      public var temp_delay2_direct_mix:Object = {};
      
      public var temp_delay2_tap_time:Object = {};
      
      public var temp_delay2_d1_time_l:Object = {};
      
      public var temp_delay2_d1_time_h:Object = {};
      
      public var temp_delay2_d1_f_back:Object = {};
      
      public var temp_delay2_d1_hi_cut:Object = {};
      
      public var temp_delay2_d1_level:Object = {};
      
      public var temp_delay2_d2_time_l:Object = {};
      
      public var temp_delay2_d2_time_h:Object = {};
      
      public var temp_delay2_d2_f_back:Object = {};
      
      public var temp_delay2_d2_hi_cut:Object = {};
      
      public var temp_delay2_d2_level:Object = {};
      
      public var temp_delay2_mod_rate:Object = {};
      
      public var temp_delay2_mod_depth:Object = {};
      
      public var temp_delay2_vtg_lpf:Object = {};
      
      public var temp_delay2_vtg_filter:Object = {};
      
      public var temp_delay2_vtg_feedback_phase:Object = {};
      
      public var temp_delay2_vtg_effect_phase:Object = {};
      
      public var temp_delay2_vtg_mod_sw:Object = {};
      
      public var temp_fx1_wah95e_pedal_pos:Object = {};
      
      public var temp_fx1_wah95e_pedal_min:Object = {};
      
      public var temp_fx1_wah95e_pedal_max:Object = {};
      
      public var temp_fx1_wah95e_effect_level:Object = {};
      
      public var temp_fx1_wah95e_direct_mix:Object = {};
      
      public var temp_fx1_dc30_selector:Object = {};
      
      public var temp_fx1_dc30_input_volume:Object = {};
      
      public var temp_fx1_dc30_chorus_intensity:Object = {};
      
      public var temp_fx1_dc30_echo_repeat_rate_l:Object = {};
      
      public var temp_fx1_dc30_echo_repeat_rate_h:Object = {};
      
      public var temp_fx1_dc30_echo_intensity:Object = {};
      
      public var temp_fx1_dc30_echo_volume:Object = {};
      
      public var temp_fx1_dc30_tone:Object = {};
      
      public var temp_fx1_dc30_output:Object = {};
      
      public var temp_fx2_wah95e_pedal_pos:Object = {};
      
      public var temp_fx2_wah95e_pedal_min:Object = {};
      
      public var temp_fx2_wah95e_pedal_max:Object = {};
      
      public var temp_fx2_wah95e_effect_level:Object = {};
      
      public var temp_fx2_wah95e_direct_mix:Object = {};
      
      public var temp_fx2_dc30_selector:Object = {};
      
      public var temp_fx2_dc30_input_volume:Object = {};
      
      public var temp_fx2_dc30_chorus_intensity:Object = {};
      
      public var temp_fx2_dc30_echo_repeat_rate_l:Object = {};
      
      public var temp_fx2_dc30_echo_repeat_rate_h:Object = {};
      
      public var temp_fx2_dc30_echo_intensity:Object = {};
      
      public var temp_fx2_dc30_echo_volume:Object = {};
      
      public var temp_fx2_dc30_tone:Object = {};
      
      public var temp_fx2_dc30_output:Object = {};
      
      public var temp_eq_type:Object = {};
      
      public var temp_eq_geq_31hz:Object = {};
      
      public var temp_eq_geq_62hz:Object = {};
      
      public var temp_eq_geq_125hz:Object = {};
      
      public var temp_eq_geq_250hz:Object = {};
      
      public var temp_eq_geq_500hz:Object = {};
      
      public var temp_eq_geq_1khz:Object = {};
      
      public var temp_eq_geq_2khz:Object = {};
      
      public var temp_eq_geq_4khz:Object = {};
      
      public var temp_eq_geq_8khz:Object = {};
      
      public var temp_eq_geq_16khz:Object = {};
      
      public var temp_eq_geq_level:Object = {};
      
      public var temp_pedal_fx_position:Object = {};
      
      public var temp_pedal_fx_type:Object = {};
      
      public var temp_pedal_fx_evh95_position:Object = {};
      
      public var temp_pedal_fx_evh95_pedal_min:Object = {};
      
      public var temp_pedal_fx_evh95_pedal_max:Object = {};
      
      public var temp_pedal_fx_evh95_effect_level:Object = {};
      
      public var temp_pedal_fx_evh95_direct_mix:Object = {};
      
      public var temp_fx1_heavy_oct_1oct_level:Object = {};
      
      public var temp_fx1_heavy_oct_2oct_level:Object = {};
      
      public var temp_fx1_heavy_oct_direct_mix:Object = {};
      
      public var temp_fx2_heavy_oct_1oct_level:Object = {};
      
      public var temp_fx2_heavy_oct_2oct_level:Object = {};
      
      public var temp_fx2_heavy_oct_direct_mix:Object = {};
      
      public var temp_chain_ptn:Object = {};
      
      public var temp_fxbox_asgn_fx1a_g:Object = {};
      
      public var temp_fxbox_asgn_fx1a_r:Object = {};
      
      public var temp_fxbox_asgn_fx1a_y:Object = {};
      
      public var temp_fxbox_asgn_fx1b_g:Object = {};
      
      public var temp_fxbox_asgn_fx1b_r:Object = {};
      
      public var temp_fxbox_asgn_fx1b_y:Object = {};
      
      public var temp_fxbox_asgn_fx2a_g:Object = {};
      
      public var temp_fxbox_asgn_fx2a_r:Object = {};
      
      public var temp_fxbox_asgn_fx2a_y:Object = {};
      
      public var temp_fxbox_asgn_fx2b_g:Object = {};
      
      public var temp_fxbox_asgn_fx2b_r:Object = {};
      
      public var temp_fxbox_asgn_fx2b_y:Object = {};
      
      public var temp_fxbox_asgn_fx3_g:Object = {};
      
      public var temp_fxbox_asgn_fx3_r:Object = {};
      
      public var temp_fxbox_asgn_fx3_y:Object = {};
      
      public var temp_fxbox_sel_fx1b:Object = {};
      
      public var temp_fxbox_sel_fx2a:Object = {};
      
      public var temp_fxbox_sel_fx3:Object = {};
      
      public var temp_fx_active_ab_fx1:Object = {};
      
      public var temp_fx_active_ab_fx2:Object = {};
      
      public var temp_fxbox_sel_fx1a:Object = {};
      
      public var temp_fxbox_sel_fx2b:Object = {};
      
      public var temp_send_return_position:Object = {};
      
      public var temp_eq_position:Object = {};
      
      public var temp_fxbox_asgn_fx3b_g:Object = {};
      
      public var temp_fxbox_asgn_fx3b_r:Object = {};
      
      public var temp_fxbox_asgn_fx3b_y:Object = {};
      
      public var temp_fxbox_layer_fx3_g:Object = {};
      
      public var temp_fxbox_layer_fx3_r:Object = {};
      
      public var temp_fxbox_layer_fx3_y:Object = {};
      
      public var temp_pedal_function_exp_pedal:Object = {};
      
      public var temp_pedal_function_gafc_exp1:Object = {};
      
      public var temp_pedal_function_gafc_exp2:Object = {};
      
      public var temp_knob_assign_booster:Object = {};
      
      public var temp_knob_assign_delay:Object = {};
      
      public var temp_knob_assign_reverb:Object = {};
      
      public var temp_knob_assign_chorus:Object = {};
      
      public var temp_knob_assign_flanger:Object = {};
      
      public var temp_knob_assign_phaser:Object = {};
      
      public var temp_knob_assign_uni_v:Object = {};
      
      public var temp_knob_assign_tremolo:Object = {};
      
      public var temp_knob_assign_vibrato:Object = {};
      
      public var temp_knob_assign_rotary:Object = {};
      
      public var temp_knob_assign_ring_mod:Object = {};
      
      public var temp_knob_assign_slow_gear:Object = {};
      
      public var temp_knob_assign_slicer:Object = {};
      
      public var temp_knob_assign_comp:Object = {};
      
      public var temp_knob_assign_limiter:Object = {};
      
      public var temp_knob_assign_t_wah:Object = {};
      
      public var temp_knob_assign_auto_wah:Object = {};
      
      public var temp_knob_assign_pedal_wah:Object = {};
      
      public var temp_knob_assign_geq:Object = {};
      
      public var temp_knob_assign_peq:Object = {};
      
      public var temp_knob_assign_guitar_sim:Object = {};
      
      public var temp_knob_assign_ac_guitar_sim:Object = {};
      
      public var temp_knob_assign_ac_processor:Object = {};
      
      public var temp_knob_assign_wave_synth:Object = {};
      
      public var temp_knob_assign_octave:Object = {};
      
      public var temp_knob_assign_pitch_shifter:Object = {};
      
      public var temp_knob_assign_harmonist:Object = {};
      
      public var temp_knob_assign_humanizer:Object = {};
      
      public var temp_knob_assign_evh_phaser:Object = {};
      
      public var temp_knob_assign_evh_flanger:Object = {};
      
      public var temp_knob_assign_evh_wah:Object = {};
      
      public var temp_knob_assign_dc30:Object = {};
      
      public var temp_knob_assign_heavy_oct:Object = {};
      
      public var temp_exp_pedal_assign_booster:Object = {};
      
      public var temp_exp_pedal_assign_delay:Object = {};
      
      public var temp_exp_pedal_assign_reverb:Object = {};
      
      public var temp_exp_pedal_assign_chorus:Object = {};
      
      public var temp_exp_pedal_assign_flanger:Object = {};
      
      public var temp_exp_pedal_assign_phaser:Object = {};
      
      public var temp_exp_pedal_assign_uni_v:Object = {};
      
      public var temp_exp_pedal_assign_tremolo:Object = {};
      
      public var temp_exp_pedal_assign_vibrato:Object = {};
      
      public var temp_exp_pedal_assign_rotary:Object = {};
      
      public var temp_exp_pedal_assign_ring_mod:Object = {};
      
      public var temp_exp_pedal_assign_slow_gear:Object = {};
      
      public var temp_exp_pedal_assign_slicer:Object = {};
      
      public var temp_exp_pedal_assign_comp:Object = {};
      
      public var temp_exp_pedal_assign_limiter:Object = {};
      
      public var temp_exp_pedal_assign_t_wah:Object = {};
      
      public var temp_exp_pedal_assign_auto_wah:Object = {};
      
      public var temp_exp_pedal_assign_pedal_wah:Object = {};
      
      public var temp_exp_pedal_assign_geq:Object = {};
      
      public var temp_exp_pedal_assign_peq:Object = {};
      
      public var temp_exp_pedal_assign_guitar_sim:Object = {};
      
      public var temp_exp_pedal_assign_ac_guitar_sim:Object = {};
      
      public var temp_exp_pedal_assign_ac_processor:Object = {};
      
      public var temp_exp_pedal_assign_wave_synth:Object = {};
      
      public var temp_exp_pedal_assign_octave:Object = {};
      
      public var temp_exp_pedal_assign_pitch_shifter:Object = {};
      
      public var temp_exp_pedal_assign_harmonist:Object = {};
      
      public var temp_exp_pedal_assign_humanizer:Object = {};
      
      public var temp_exp_pedal_assign_evh_phaser:Object = {};
      
      public var temp_exp_pedal_assign_evh_flanger:Object = {};
      
      public var temp_exp_pedal_assign_evh_wah:Object = {};
      
      public var temp_exp_pedal_assign_dc30:Object = {};
      
      public var temp_exp_pedal_assign_heavy_oct:Object = {};
      
      public var temp_exp_pedal_assign_booster_min:Object = {};
      
      public var temp_exp_pedal_assign_booster_max:Object = {};
      
      public var temp_exp_pedal_assign_delay_min_l:Object = {};
      
      public var temp_exp_pedal_assign_delay_min_h:Object = {};
      
      public var temp_exp_pedal_assign_delay_max_l:Object = {};
      
      public var temp_exp_pedal_assign_delay_max_h:Object = {};
      
      public var temp_exp_pedal_assign_reverb_min_l:Object = {};
      
      public var temp_exp_pedal_assign_reverb_min_h:Object = {};
      
      public var temp_exp_pedal_assign_reverb_max_l:Object = {};
      
      public var temp_exp_pedal_assign_reverb_max_h:Object = {};
      
      public var temp_exp_pedal_assign_chorus_min:Object = {};
      
      public var temp_exp_pedal_assign_chorus_max:Object = {};
      
      public var temp_exp_pedal_assign_flanger_min:Object = {};
      
      public var temp_exp_pedal_assign_flanger_max:Object = {};
      
      public var temp_exp_pedal_assign_phaser_min:Object = {};
      
      public var temp_exp_pedal_assign_phaser_max:Object = {};
      
      public var temp_exp_pedal_assign_uni_v_min:Object = {};
      
      public var temp_exp_pedal_assign_uni_v_max:Object = {};
      
      public var temp_exp_pedal_assign_tremolo_min:Object = {};
      
      public var temp_exp_pedal_assign_tremolo_max:Object = {};
      
      public var temp_exp_pedal_assign_vibrato_min:Object = {};
      
      public var temp_exp_pedal_assign_vibrato_max:Object = {};
      
      public var temp_exp_pedal_assign_rotary_min:Object = {};
      
      public var temp_exp_pedal_assign_rotary_max:Object = {};
      
      public var temp_exp_pedal_assign_ring_mod_min:Object = {};
      
      public var temp_exp_pedal_assign_ring_mod_max:Object = {};
      
      public var temp_exp_pedal_assign_slow_gear_min:Object = {};
      
      public var temp_exp_pedal_assign_slow_gear_max:Object = {};
      
      public var temp_exp_pedal_assign_slicer_min:Object = {};
      
      public var temp_exp_pedal_assign_slicer_max:Object = {};
      
      public var temp_exp_pedal_assign_comp_min:Object = {};
      
      public var temp_exp_pedal_assign_comp_max:Object = {};
      
      public var temp_exp_pedal_assign_limiter_min:Object = {};
      
      public var temp_exp_pedal_assign_limiter_max:Object = {};
      
      public var temp_exp_pedal_assign_t_wah_min:Object = {};
      
      public var temp_exp_pedal_assign_t_wah_max:Object = {};
      
      public var temp_exp_pedal_assign_auto_wah_min:Object = {};
      
      public var temp_exp_pedal_assign_auto_wah_max:Object = {};
      
      public var temp_exp_pedal_assign_pedal_wah_min:Object = {};
      
      public var temp_exp_pedal_assign_pedal_wah_max:Object = {};
      
      public var temp_exp_pedal_assign_geq_min:Object = {};
      
      public var temp_exp_pedal_assign_geq_max:Object = {};
      
      public var temp_exp_pedal_assign_peq_min:Object = {};
      
      public var temp_exp_pedal_assign_peq_max:Object = {};
      
      public var temp_exp_pedal_assign_guitar_sim_min:Object = {};
      
      public var temp_exp_pedal_assign_guitar_sim_max:Object = {};
      
      public var temp_exp_pedal_assign_ac_guitar_sim_min:Object = {};
      
      public var temp_exp_pedal_assign_ac_guitar_sim_max:Object = {};
      
      public var temp_exp_pedal_assign_ac_processor_min:Object = {};
      
      public var temp_exp_pedal_assign_ac_processor_max:Object = {};
      
      public var temp_exp_pedal_assign_wave_synth_min:Object = {};
      
      public var temp_exp_pedal_assign_wave_synth_max:Object = {};
      
      public var temp_exp_pedal_assign_octave_min:Object = {};
      
      public var temp_exp_pedal_assign_octave_max:Object = {};
      
      public var temp_exp_pedal_assign_pitch_shifter_min_l:Object = {};
      
      public var temp_exp_pedal_assign_pitch_shifter_min_h:Object = {};
      
      public var temp_exp_pedal_assign_pitch_shifter_max_l:Object = {};
      
      public var temp_exp_pedal_assign_pitch_shifter_max_h:Object = {};
      
      public var temp_exp_pedal_assign_harmonist_min_l:Object = {};
      
      public var temp_exp_pedal_assign_harmonist_min_h:Object = {};
      
      public var temp_exp_pedal_assign_harmonist_max_l:Object = {};
      
      public var temp_exp_pedal_assign_harmonist_max_h:Object = {};
      
      public var temp_exp_pedal_assign_humanizer_min:Object = {};
      
      public var temp_exp_pedal_assign_humanizer_max:Object = {};
      
      public var temp_exp_pedal_assign_evh_phaser_min:Object = {};
      
      public var temp_exp_pedal_assign_evh_phaser_max:Object = {};
      
      public var temp_exp_pedal_assign_evh_flanger_min:Object = {};
      
      public var temp_exp_pedal_assign_evh_flanger_max:Object = {};
      
      public var temp_exp_pedal_assign_evh_wah_min:Object = {};
      
      public var temp_exp_pedal_assign_evh_wah_max:Object = {};
      
      public var temp_exp_pedal_assign_dc30_min_l:Object = {};
      
      public var temp_exp_pedal_assign_dc30_min_h:Object = {};
      
      public var temp_exp_pedal_assign_dc30_max_l:Object = {};
      
      public var temp_exp_pedal_assign_dc30_max_h:Object = {};
      
      public var temp_exp_pedal_assign_heavy_oct_min:Object = {};
      
      public var temp_exp_pedal_assign_heavy_oct_max:Object = {};
      
      public var temp_gafc_exp1_assign_booster:Object = {};
      
      public var temp_gafc_exp1_assign_delay:Object = {};
      
      public var temp_gafc_exp1_assign_reverb:Object = {};
      
      public var temp_gafc_exp1_assign_chorus:Object = {};
      
      public var temp_gafc_exp1_assign_flanger:Object = {};
      
      public var temp_gafc_exp1_assign_phaser:Object = {};
      
      public var temp_gafc_exp1_assign_uni_v:Object = {};
      
      public var temp_gafc_exp1_assign_tremolo:Object = {};
      
      public var temp_gafc_exp1_assign_vibrato:Object = {};
      
      public var temp_gafc_exp1_assign_rotary:Object = {};
      
      public var temp_gafc_exp1_assign_ring_mod:Object = {};
      
      public var temp_gafc_exp1_assign_slow_gear:Object = {};
      
      public var temp_gafc_exp1_assign_slicer:Object = {};
      
      public var temp_gafc_exp1_assign_comp:Object = {};
      
      public var temp_gafc_exp1_assign_limiter:Object = {};
      
      public var temp_gafc_exp1_assign_t_wah:Object = {};
      
      public var temp_gafc_exp1_assign_auto_wah:Object = {};
      
      public var temp_gafc_exp1_assign_pedal_wah:Object = {};
      
      public var temp_gafc_exp1_assign_geq:Object = {};
      
      public var temp_gafc_exp1_assign_peq:Object = {};
      
      public var temp_gafc_exp1_assign_guitar_sim:Object = {};
      
      public var temp_gafc_exp1_assign_ac_guitar_sim:Object = {};
      
      public var temp_gafc_exp1_assign_ac_processor:Object = {};
      
      public var temp_gafc_exp1_assign_wave_synth:Object = {};
      
      public var temp_gafc_exp1_assign_octave:Object = {};
      
      public var temp_gafc_exp1_assign_pitch_shifter:Object = {};
      
      public var temp_gafc_exp1_assign_harmonist:Object = {};
      
      public var temp_gafc_exp1_assign_humanizer:Object = {};
      
      public var temp_gafc_exp1_assign_evh_phaser:Object = {};
      
      public var temp_gafc_exp1_assign_evh_flanger:Object = {};
      
      public var temp_gafc_exp1_assign_evh_wah:Object = {};
      
      public var temp_gafc_exp1_assign_dc30:Object = {};
      
      public var temp_gafc_exp1_assign_heavy_oct:Object = {};
      
      public var temp_gafc_exp1_assign_booster_min:Object = {};
      
      public var temp_gafc_exp1_assign_booster_max:Object = {};
      
      public var temp_gafc_exp1_assign_delay_min_l:Object = {};
      
      public var temp_gafc_exp1_assign_delay_min_h:Object = {};
      
      public var temp_gafc_exp1_assign_delay_max_l:Object = {};
      
      public var temp_gafc_exp1_assign_delay_max_h:Object = {};
      
      public var temp_gafc_exp1_assign_reverb_min_l:Object = {};
      
      public var temp_gafc_exp1_assign_reverb_min_h:Object = {};
      
      public var temp_gafc_exp1_assign_reverb_max_l:Object = {};
      
      public var temp_gafc_exp1_assign_reverb_max_h:Object = {};
      
      public var temp_gafc_exp1_assign_chorus_min:Object = {};
      
      public var temp_gafc_exp1_assign_chorus_max:Object = {};
      
      public var temp_gafc_exp1_assign_flanger_min:Object = {};
      
      public var temp_gafc_exp1_assign_flanger_max:Object = {};
      
      public var temp_gafc_exp1_assign_phaser_min:Object = {};
      
      public var temp_gafc_exp1_assign_phaser_max:Object = {};
      
      public var temp_gafc_exp1_assign_uni_v_min:Object = {};
      
      public var temp_gafc_exp1_assign_uni_v_max:Object = {};
      
      public var temp_gafc_exp1_assign_tremolo_min:Object = {};
      
      public var temp_gafc_exp1_assign_tremolo_max:Object = {};
      
      public var temp_gafc_exp1_assign_vibrato_min:Object = {};
      
      public var temp_gafc_exp1_assign_vibrato_max:Object = {};
      
      public var temp_gafc_exp1_assign_rotary_min:Object = {};
      
      public var temp_gafc_exp1_assign_rotary_max:Object = {};
      
      public var temp_gafc_exp1_assign_ring_mod_min:Object = {};
      
      public var temp_gafc_exp1_assign_ring_mod_max:Object = {};
      
      public var temp_gafc_exp1_assign_slow_gear_min:Object = {};
      
      public var temp_gafc_exp1_assign_slow_gear_max:Object = {};
      
      public var temp_gafc_exp1_assign_slicer_min:Object = {};
      
      public var temp_gafc_exp1_assign_slicer_max:Object = {};
      
      public var temp_gafc_exp1_assign_comp_min:Object = {};
      
      public var temp_gafc_exp1_assign_comp_max:Object = {};
      
      public var temp_gafc_exp1_assign_limiter_min:Object = {};
      
      public var temp_gafc_exp1_assign_limiter_max:Object = {};
      
      public var temp_gafc_exp1_assign_t_wah_min:Object = {};
      
      public var temp_gafc_exp1_assign_t_wah_max:Object = {};
      
      public var temp_gafc_exp1_assign_auto_wah_min:Object = {};
      
      public var temp_gafc_exp1_assign_auto_wah_max:Object = {};
      
      public var temp_gafc_exp1_assign_pedal_wah_min:Object = {};
      
      public var temp_gafc_exp1_assign_pedal_wah_max:Object = {};
      
      public var temp_gafc_exp1_assign_geq_min:Object = {};
      
      public var temp_gafc_exp1_assign_geq_max:Object = {};
      
      public var temp_gafc_exp1_assign_peq_min:Object = {};
      
      public var temp_gafc_exp1_assign_peq_max:Object = {};
      
      public var temp_gafc_exp1_assign_guitar_sim_min:Object = {};
      
      public var temp_gafc_exp1_assign_guitar_sim_max:Object = {};
      
      public var temp_gafc_exp1_assign_ac_guitar_sim_min:Object = {};
      
      public var temp_gafc_exp1_assign_ac_guitar_sim_max:Object = {};
      
      public var temp_gafc_exp1_assign_ac_processor_min:Object = {};
      
      public var temp_gafc_exp1_assign_ac_processor_max:Object = {};
      
      public var temp_gafc_exp1_assign_wave_synth_min:Object = {};
      
      public var temp_gafc_exp1_assign_wave_synth_max:Object = {};
      
      public var temp_gafc_exp1_assign_octave_min:Object = {};
      
      public var temp_gafc_exp1_assign_octave_max:Object = {};
      
      public var temp_gafc_exp1_assign_pitch_shifter_min_l:Object = {};
      
      public var temp_gafc_exp1_assign_pitch_shifter_min_h:Object = {};
      
      public var temp_gafc_exp1_assign_pitch_shifter_max_l:Object = {};
      
      public var temp_gafc_exp1_assign_pitch_shifter_max_h:Object = {};
      
      public var temp_gafc_exp1_assign_harmonist_min_l:Object = {};
      
      public var temp_gafc_exp1_assign_harmonist_min_h:Object = {};
      
      public var temp_gafc_exp1_assign_harmonist_max_l:Object = {};
      
      public var temp_gafc_exp1_assign_harmonist_max_h:Object = {};
      
      public var temp_gafc_exp1_assign_humanizer_min:Object = {};
      
      public var temp_gafc_exp1_assign_humanizer_max:Object = {};
      
      public var temp_gafc_exp1_assign_evh_phaser_min:Object = {};
      
      public var temp_gafc_exp1_assign_evh_phaser_max:Object = {};
      
      public var temp_gafc_exp1_assign_evh_flanger_min:Object = {};
      
      public var temp_gafc_exp1_assign_evh_flanger_max:Object = {};
      
      public var temp_gafc_exp1_assign_evh_wah_min:Object = {};
      
      public var temp_gafc_exp1_assign_evh_wah_max:Object = {};
      
      public var temp_gafc_exp1_assign_dc30_min_l:Object = {};
      
      public var temp_gafc_exp1_assign_dc30_min_h:Object = {};
      
      public var temp_gafc_exp1_assign_dc30_max_l:Object = {};
      
      public var temp_gafc_exp1_assign_dc30_max_h:Object = {};
      
      public var temp_gafc_exp1_assign_heavy_oct_min:Object = {};
      
      public var temp_gafc_exp1_assign_heavy_oct_max:Object = {};
      
      public var temp_gafc_exp2_assign_booster:Object = {};
      
      public var temp_gafc_exp2_assign_delay:Object = {};
      
      public var temp_gafc_exp2_assign_reverb:Object = {};
      
      public var temp_gafc_exp2_assign_chorus:Object = {};
      
      public var temp_gafc_exp2_assign_flanger:Object = {};
      
      public var temp_gafc_exp2_assign_phaser:Object = {};
      
      public var temp_gafc_exp2_assign_uni_v:Object = {};
      
      public var temp_gafc_exp2_assign_tremolo:Object = {};
      
      public var temp_gafc_exp2_assign_vibrato:Object = {};
      
      public var temp_gafc_exp2_assign_rotary:Object = {};
      
      public var temp_gafc_exp2_assign_ring_mod:Object = {};
      
      public var temp_gafc_exp2_assign_slow_gear:Object = {};
      
      public var temp_gafc_exp2_assign_slicer:Object = {};
      
      public var temp_gafc_exp2_assign_comp:Object = {};
      
      public var temp_gafc_exp2_assign_limiter:Object = {};
      
      public var temp_gafc_exp2_assign_t_wah:Object = {};
      
      public var temp_gafc_exp2_assign_auto_wah:Object = {};
      
      public var temp_gafc_exp2_assign_pedal_wah:Object = {};
      
      public var temp_gafc_exp2_assign_geq:Object = {};
      
      public var temp_gafc_exp2_assign_peq:Object = {};
      
      public var temp_gafc_exp2_assign_guitar_sim:Object = {};
      
      public var temp_gafc_exp2_assign_ac_guitar_sim:Object = {};
      
      public var temp_gafc_exp2_assign_ac_processor:Object = {};
      
      public var temp_gafc_exp2_assign_wave_synth:Object = {};
      
      public var temp_gafc_exp2_assign_octave:Object = {};
      
      public var temp_gafc_exp2_assign_pitch_shifter:Object = {};
      
      public var temp_gafc_exp2_assign_harmonist:Object = {};
      
      public var temp_gafc_exp2_assign_humanizer:Object = {};
      
      public var temp_gafc_exp2_assign_evh_phaser:Object = {};
      
      public var temp_gafc_exp2_assign_evh_flanger:Object = {};
      
      public var temp_gafc_exp2_assign_evh_wah:Object = {};
      
      public var temp_gafc_exp2_assign_dc30:Object = {};
      
      public var temp_gafc_exp2_assign_heavy_oct:Object = {};
      
      public var temp_gafc_exp2_assign_booster_min:Object = {};
      
      public var temp_gafc_exp2_assign_booster_max:Object = {};
      
      public var temp_gafc_exp2_assign_delay_min_l:Object = {};
      
      public var temp_gafc_exp2_assign_delay_min_h:Object = {};
      
      public var temp_gafc_exp2_assign_delay_max_l:Object = {};
      
      public var temp_gafc_exp2_assign_delay_max_h:Object = {};
      
      public var temp_gafc_exp2_assign_reverb_min_l:Object = {};
      
      public var temp_gafc_exp2_assign_reverb_min_h:Object = {};
      
      public var temp_gafc_exp2_assign_reverb_max_l:Object = {};
      
      public var temp_gafc_exp2_assign_reverb_max_h:Object = {};
      
      public var temp_gafc_exp2_assign_chorus_min:Object = {};
      
      public var temp_gafc_exp2_assign_chorus_max:Object = {};
      
      public var temp_gafc_exp2_assign_flanger_min:Object = {};
      
      public var temp_gafc_exp2_assign_flanger_max:Object = {};
      
      public var temp_gafc_exp2_assign_phaser_min:Object = {};
      
      public var temp_gafc_exp2_assign_phaser_max:Object = {};
      
      public var temp_gafc_exp2_assign_uni_v_min:Object = {};
      
      public var temp_gafc_exp2_assign_uni_v_max:Object = {};
      
      public var temp_gafc_exp2_assign_tremolo_min:Object = {};
      
      public var temp_gafc_exp2_assign_tremolo_max:Object = {};
      
      public var temp_gafc_exp2_assign_vibrato_min:Object = {};
      
      public var temp_gafc_exp2_assign_vibrato_max:Object = {};
      
      public var temp_gafc_exp2_assign_rotary_min:Object = {};
      
      public var temp_gafc_exp2_assign_rotary_max:Object = {};
      
      public var temp_gafc_exp2_assign_ring_mod_min:Object = {};
      
      public var temp_gafc_exp2_assign_ring_mod_max:Object = {};
      
      public var temp_gafc_exp2_assign_slow_gear_min:Object = {};
      
      public var temp_gafc_exp2_assign_slow_gear_max:Object = {};
      
      public var temp_gafc_exp2_assign_slicer_min:Object = {};
      
      public var temp_gafc_exp2_assign_slicer_max:Object = {};
      
      public var temp_gafc_exp2_assign_comp_min:Object = {};
      
      public var temp_gafc_exp2_assign_comp_max:Object = {};
      
      public var temp_gafc_exp2_assign_limiter_min:Object = {};
      
      public var temp_gafc_exp2_assign_limiter_max:Object = {};
      
      public var temp_gafc_exp2_assign_t_wah_min:Object = {};
      
      public var temp_gafc_exp2_assign_t_wah_max:Object = {};
      
      public var temp_gafc_exp2_assign_auto_wah_min:Object = {};
      
      public var temp_gafc_exp2_assign_auto_wah_max:Object = {};
      
      public var temp_gafc_exp2_assign_pedal_wah_min:Object = {};
      
      public var temp_gafc_exp2_assign_pedal_wah_max:Object = {};
      
      public var temp_gafc_exp2_assign_geq_min:Object = {};
      
      public var temp_gafc_exp2_assign_geq_max:Object = {};
      
      public var temp_gafc_exp2_assign_peq_min:Object = {};
      
      public var temp_gafc_exp2_assign_peq_max:Object = {};
      
      public var temp_gafc_exp2_assign_guitar_sim_min:Object = {};
      
      public var temp_gafc_exp2_assign_guitar_sim_max:Object = {};
      
      public var temp_gafc_exp2_assign_ac_guitar_sim_min:Object = {};
      
      public var temp_gafc_exp2_assign_ac_guitar_sim_max:Object = {};
      
      public var temp_gafc_exp2_assign_ac_processor_min:Object = {};
      
      public var temp_gafc_exp2_assign_ac_processor_max:Object = {};
      
      public var temp_gafc_exp2_assign_wave_synth_min:Object = {};
      
      public var temp_gafc_exp2_assign_wave_synth_max:Object = {};
      
      public var temp_gafc_exp2_assign_octave_min:Object = {};
      
      public var temp_gafc_exp2_assign_octave_max:Object = {};
      
      public var temp_gafc_exp2_assign_pitch_shifter_min_l:Object = {};
      
      public var temp_gafc_exp2_assign_pitch_shifter_min_h:Object = {};
      
      public var temp_gafc_exp2_assign_pitch_shifter_max_l:Object = {};
      
      public var temp_gafc_exp2_assign_pitch_shifter_max_h:Object = {};
      
      public var temp_gafc_exp2_assign_harmonist_min_l:Object = {};
      
      public var temp_gafc_exp2_assign_harmonist_min_h:Object = {};
      
      public var temp_gafc_exp2_assign_harmonist_max_l:Object = {};
      
      public var temp_gafc_exp2_assign_harmonist_max_h:Object = {};
      
      public var temp_gafc_exp2_assign_humanizer_min:Object = {};
      
      public var temp_gafc_exp2_assign_humanizer_max:Object = {};
      
      public var temp_gafc_exp2_assign_evh_phaser_min:Object = {};
      
      public var temp_gafc_exp2_assign_evh_phaser_max:Object = {};
      
      public var temp_gafc_exp2_assign_evh_flanger_min:Object = {};
      
      public var temp_gafc_exp2_assign_evh_flanger_max:Object = {};
      
      public var temp_gafc_exp2_assign_evh_wah_min:Object = {};
      
      public var temp_gafc_exp2_assign_evh_wah_max:Object = {};
      
      public var temp_gafc_exp2_assign_dc30_min_l:Object = {};
      
      public var temp_gafc_exp2_assign_dc30_min_h:Object = {};
      
      public var temp_gafc_exp2_assign_dc30_max_l:Object = {};
      
      public var temp_gafc_exp2_assign_dc30_max_h:Object = {};
      
      public var temp_gafc_exp2_assign_heavy_oct_min:Object = {};
      
      public var temp_gafc_exp2_assign_heavy_oct_max:Object = {};
      
      private var _temporaryPatch:Object;
      
      public var command_editor_comunication_level:Object;
      
      public var command_ab_utility:Object;
      
      public var command_editor_comunication_mode:Object;
      
      public var command_running_mode:Object;
      
      public var command_patch_copy:Object;
      
      public var command_patch_write:Object;
      
      public var command_patch_clear:Object;
      
      public var command_patch_initialize:Object;
      
      public var command_tuner_single_mode_pitch:Object;
      
      public var command_usb_direct_mon:Object;
      
      public var command_usb_in_out_mode:Object;
      
      public var command_tuner_multi_mode_str_1_pitch:Object;
      
      public var command_tuner_multi_mode_str_2_pitch:Object;
      
      public var command_tuner_multi_mode_str_3_pitch:Object;
      
      public var command_tuner_multi_mode_str_4_pitch:Object;
      
      public var command_tuner_multi_mode_str_5_pitch:Object;
      
      public var command_tuner_multi_mode_str_6_pitch:Object;
      
      public var command_patch_map:Object;
      
      public var command_update_patch_map:Object;
      
      public var command_manual_sw:Object;
      
      public var command_quick_setting_wirte:Object;
      
      public var command_sw_fx1:Object;
      
      public var command_sw_fx2:Object;
      
      public var command_sw_fx3:Object;
      
      public var command_sw_tap:Object;
      
      public var command_sw_tap2:Object;
      
      public function AddressMap(param1:Blocker)
      {
         super();
         if(!param1)
         {
            throw new Error("use getInstance.");
         }
      }
      
      public static function getInstance() : AddressMap
      {
         if(!instance)
         {
            instance = new AddressMap(new Blocker());
         }
         return instance;
      }
      
      public function getProgramMapObj(param1:String) : Object
      {
         return this[param1 + "_l"];
      }
      
      public function get sys_knob_setting_knob1() : Object
      {
         return this.sys_knob_setting_knob1_l;
      }
      
      public function get sys_knob_setting_knob2() : Object
      {
         return this.sys_knob_setting_knob2_l;
      }
      
      public function get sys_knob_setting_knob3() : Object
      {
         return this.sys_knob_setting_knob3_l;
      }
      
      public function get sys_knob_setting_knob4() : Object
      {
         return this.sys_knob_setting_knob4_l;
      }
      
      public function get sys_knob_setting_knob5() : Object
      {
         return this.sys_knob_setting_knob5_l;
      }
      
      public function get sys_knob_setting_knob6() : Object
      {
         return this.sys_knob_setting_knob6_l;
      }
      
      public function get sys_knob_setting_knob7() : Object
      {
         return this.sys_knob_setting_knob7_l;
      }
      
      public function get sys_knob_setting_knob8() : Object
      {
         return this.sys_knob_setting_knob8_l;
      }
      
      public function get sys_play_option_patch_ext_min() : Object
      {
         return this.sys_play_option_patch_ext_min_l;
      }
      
      public function get sys_play_option_patch_ext_max() : Object
      {
         return this.sys_play_option_patch_ext_max_l;
      }
      
      public function get sys_play_option_bank_extent_min() : Object
      {
         return this.sys_play_option_bank_extent_min_l;
      }
      
      public function get sys_play_option_bank_extent_max() : Object
      {
         return this.sys_play_option_bank_extent_max_l;
      }
      
      public function get temp_assign1_target() : Object
      {
         return this.temp_assign1_target_l;
      }
      
      public function get temp_assign1_target_min() : Object
      {
         return this.temp_assign1_target_min_l;
      }
      
      public function get temp_assign1_target_max() : Object
      {
         return this.temp_assign1_target_max_l;
      }
      
      public function get temp_assign2_target() : Object
      {
         return this.temp_assign2_target_l;
      }
      
      public function get temp_assign2_target_min() : Object
      {
         return this.temp_assign2_target_min_l;
      }
      
      public function get temp_assign2_target_max() : Object
      {
         return this.temp_assign2_target_max_l;
      }
      
      public function get temp_assign3_target() : Object
      {
         return this.temp_assign3_target_l;
      }
      
      public function get temp_assign3_target_min() : Object
      {
         return this.temp_assign3_target_min_l;
      }
      
      public function get temp_assign3_target_max() : Object
      {
         return this.temp_assign3_target_max_l;
      }
      
      public function get temp_assign4_target() : Object
      {
         return this.temp_assign4_target_l;
      }
      
      public function get temp_assign4_target_min() : Object
      {
         return this.temp_assign4_target_min_l;
      }
      
      public function get temp_assign4_target_max() : Object
      {
         return this.temp_assign4_target_max_l;
      }
      
      public function get temp_assign5_target() : Object
      {
         return this.temp_assign5_target_l;
      }
      
      public function get temp_assign5_target_min() : Object
      {
         return this.temp_assign5_target_min_l;
      }
      
      public function get temp_assign5_target_max() : Object
      {
         return this.temp_assign5_target_max_l;
      }
      
      public function get temp_assign6_target() : Object
      {
         return this.temp_assign6_target_l;
      }
      
      public function get temp_assign6_target_min() : Object
      {
         return this.temp_assign6_target_min_l;
      }
      
      public function get temp_assign6_target_max() : Object
      {
         return this.temp_assign6_target_max_l;
      }
      
      public function get temp_assign7_target() : Object
      {
         return this.temp_assign7_target_l;
      }
      
      public function get temp_assign7_target_min() : Object
      {
         return this.temp_assign7_target_min_l;
      }
      
      public function get temp_assign7_target_max() : Object
      {
         return this.temp_assign7_target_max_l;
      }
      
      public function get temp_assign8_target() : Object
      {
         return this.temp_assign8_target_l;
      }
      
      public function get temp_assign8_target_min() : Object
      {
         return this.temp_assign8_target_min_l;
      }
      
      public function get temp_assign8_target_max() : Object
      {
         return this.temp_assign8_target_max_l;
      }
      
      public function get temp_delay_delay_time() : Object
      {
         return this.temp_delay_delay_time_l;
      }
      
      public function get temp_delay_d1_time() : Object
      {
         return this.temp_delay_d1_time_l;
      }
      
      public function get temp_delay_d2_time() : Object
      {
         return this.temp_delay_d2_time_l;
      }
      
      public function get temp_delay2_delay_time() : Object
      {
         return this.temp_delay2_delay_time_l;
      }
      
      public function get temp_delay2_d1_time() : Object
      {
         return this.temp_delay2_d1_time_l;
      }
      
      public function get temp_delay2_d2_time() : Object
      {
         return this.temp_delay2_d2_time_l;
      }
      
      public function get temp_reverb_pre_delay() : Object
      {
         return this.temp_reverb_pre_delay_l;
      }
      
      public function get temp_master_bpm() : Object
      {
         return this.temp_master_bpm_l;
      }
      
      public function get temp_fx1_pitch_shifter_ps1pre_dly() : Object
      {
         return this.temp_fx1_pitch_shifter_ps1pre_dly_l;
      }
      
      public function get temp_fx2_pitch_shifter_ps1pre_dly() : Object
      {
         return this.temp_fx2_pitch_shifter_ps1pre_dly_l;
      }
      
      public function get temp_fx1_harmonist_hr1pre_dly() : Object
      {
         return this.temp_fx1_harmonist_hr1pre_dly_l;
      }
      
      public function get temp_fx2_harmonist_hr1pre_dly() : Object
      {
         return this.temp_fx2_harmonist_hr1pre_dly_l;
      }
      
      public function get temp_fx1_harmonist_hr2pre_dly() : Object
      {
         return this.temp_fx1_harmonist_hr2pre_dly_l;
      }
      
      public function get temp_fx2_harmonist_hr2pre_dly() : Object
      {
         return this.temp_fx2_harmonist_hr2pre_dly_l;
      }
      
      public function get temp_fx1_sub_delay_time() : Object
      {
         return this.temp_fx1_sub_delay_time_l;
      }
      
      public function get temp_fx2_sub_delay_time() : Object
      {
         return this.temp_fx2_sub_delay_time_l;
      }
      
      public function get temp_fx1_pitch_shifter_ps2pre_dly() : Object
      {
         return this.temp_fx1_pitch_shifter_ps2pre_dly_l;
      }
      
      public function get temp_fx2_pitch_shifter_ps2pre_dly() : Object
      {
         return this.temp_fx2_pitch_shifter_ps2pre_dly_l;
      }
      
      public function get temp_fx1_dc30_echo_repeat_rate() : Object
      {
         return this.temp_fx1_dc30_echo_repeat_rate_l;
      }
      
      public function get temp_fx2_dc30_echo_repeat_rate() : Object
      {
         return this.temp_fx2_dc30_echo_repeat_rate_l;
      }
      
      public function get temp_exp_pedal_assign_delay_min() : Object
      {
         return this.temp_exp_pedal_assign_delay_min_l;
      }
      
      public function get temp_exp_pedal_assign_delay_max() : Object
      {
         return this.temp_exp_pedal_assign_delay_max_l;
      }
      
      public function get temp_exp_pedal_assign_reverb_min() : Object
      {
         return this.temp_exp_pedal_assign_reverb_min_l;
      }
      
      public function get temp_exp_pedal_assign_reverb_max() : Object
      {
         return this.temp_exp_pedal_assign_reverb_max_l;
      }
      
      public function get temp_exp_pedal_assign_pitch_shifter_min() : Object
      {
         return this.temp_exp_pedal_assign_pitch_shifter_min_l;
      }
      
      public function get temp_exp_pedal_assign_pitch_shifter_max() : Object
      {
         return this.temp_exp_pedal_assign_pitch_shifter_max_l;
      }
      
      public function get temp_exp_pedal_assign_harmonist_min() : Object
      {
         return this.temp_exp_pedal_assign_harmonist_min_l;
      }
      
      public function get temp_exp_pedal_assign_harmonist_max() : Object
      {
         return this.temp_exp_pedal_assign_harmonist_max_l;
      }
      
      public function get temp_exp_pedal_assign_dc30_min() : Object
      {
         return this.temp_exp_pedal_assign_dc30_min_l;
      }
      
      public function get temp_exp_pedal_assign_dc30_max() : Object
      {
         return this.temp_exp_pedal_assign_dc30_max_l;
      }
      
      public function get temp_gafc_exp1_assign_delay_min() : Object
      {
         return this.temp_gafc_exp1_assign_delay_min_l;
      }
      
      public function get temp_gafc_exp1_assign_delay_max() : Object
      {
         return this.temp_gafc_exp1_assign_delay_max_l;
      }
      
      public function get temp_gafc_exp1_assign_reverb_min() : Object
      {
         return this.temp_gafc_exp1_assign_reverb_min_l;
      }
      
      public function get temp_gafc_exp1_assign_reverb_max() : Object
      {
         return this.temp_gafc_exp1_assign_reverb_max_l;
      }
      
      public function get temp_gafc_exp1_assign_pitch_shifter_min() : Object
      {
         return this.temp_gafc_exp1_assign_pitch_shifter_min_l;
      }
      
      public function get temp_gafc_exp1_assign_pitch_shifter_max() : Object
      {
         return this.temp_gafc_exp1_assign_pitch_shifter_max_l;
      }
      
      public function get temp_gafc_exp1_assign_harmonist_min() : Object
      {
         return this.temp_gafc_exp1_assign_harmonist_min_l;
      }
      
      public function get temp_gafc_exp1_assign_harmonist_max() : Object
      {
         return this.temp_gafc_exp1_assign_harmonist_max_l;
      }
      
      public function get temp_gafc_exp1_assign_dc30_min() : Object
      {
         return this.temp_gafc_exp1_assign_dc30_min_l;
      }
      
      public function get temp_gafc_exp1_assign_dc30_max() : Object
      {
         return this.temp_gafc_exp1_assign_dc30_max_l;
      }
      
      public function get temp_gafc_exp2_assign_delay_min() : Object
      {
         return this.temp_gafc_exp2_assign_delay_min_l;
      }
      
      public function get temp_gafc_exp2_assign_delay_max() : Object
      {
         return this.temp_gafc_exp2_assign_delay_max_l;
      }
      
      public function get temp_gafc_exp2_assign_reverb_min() : Object
      {
         return this.temp_gafc_exp2_assign_reverb_min_l;
      }
      
      public function get temp_gafc_exp2_assign_reverb_max() : Object
      {
         return this.temp_gafc_exp2_assign_reverb_max_l;
      }
      
      public function get temp_gafc_exp2_assign_pitch_shifter_min() : Object
      {
         return this.temp_gafc_exp2_assign_pitch_shifter_min_l;
      }
      
      public function get temp_gafc_exp2_assign_pitch_shifter_max() : Object
      {
         return this.temp_gafc_exp2_assign_pitch_shifter_max_l;
      }
      
      public function get temp_gafc_exp2_assign_harmonist_min() : Object
      {
         return this.temp_gafc_exp2_assign_harmonist_min_l;
      }
      
      public function get temp_gafc_exp2_assign_harmonist_max() : Object
      {
         return this.temp_gafc_exp2_assign_harmonist_max_l;
      }
      
      public function get temp_gafc_exp2_assign_dc30_min() : Object
      {
         return this.temp_gafc_exp2_assign_dc30_min_l;
      }
      
      public function get temp_gafc_exp2_assign_dc30_max() : Object
      {
         return this.temp_gafc_exp2_assign_dc30_max_l;
      }
      
      private function setAllAddress() : void
      {
         /*
          * Decompilation error
          * Code may be obfuscated
          * Tip: You can try enabling "Deobfuscate code" option in Settings
          * Error type: ExecutionException (java.lang.StackOverflowError)
          */
         throw new flash.errors.IllegalOperationError("Not decompiled due to error");
      }
      
      public function getTargetTemporaryPatchParam(param1:String) : String
      {
         var _loc2_:String = null;
         var _loc3_:Object = null;
         param1 = param1.toUpperCase();
         for each(_loc3_ in this.addressObj.temporary)
         {
            if(_loc3_.address == param1)
            {
               _loc2_ = _loc3_.name;
               break;
            }
         }
         return _loc2_;
      }
      
      public function getEffectTypeAddress(param1:String) : String
      {
         switch(param1)
         {
            case ParameterDefinitionGT.EFECT_NAME[0]:
               return this.temp_comp_type.address;
            case ParameterDefinitionGT.EFECT_NAME[1]:
               return this.temp_od_ds_type.address;
            case ParameterDefinitionGT.EFECT_NAME[2]:
               return this.temp_preamp_a_type.address;
            case ParameterDefinitionGT.EFECT_NAME[3]:
               return this.temp_preamp_b_type.address;
            case ParameterDefinitionGT.EFECT_NAME[4]:
               return this.temp_eq_type.address;
            case ParameterDefinitionGT.EFECT_NAME[5]:
               return this.temp_fx1_fx_type.address;
            case ParameterDefinitionGT.EFECT_NAME[6]:
               return this.temp_fx2_fx_type.address;
            case ParameterDefinitionGT.EFECT_NAME[7]:
               return this.temp_delay_type.address;
            case ParameterDefinitionGT.EFECT_NAME[8]:
               return this.temp_chorus_mode.address;
            case ParameterDefinitionGT.EFECT_NAME[9]:
               return this.temp_reverb_type.address;
            case ParameterDefinitionGT.EFECT_NAME[10]:
               return this.temp_pedal_fx_type.address;
            case ParameterDefinitionGT.EFECT_NAME[17]:
               return this.temp_accel_fx_type.address;
            case ParameterDefinitionGT.EFECT_NAME[19]:
               return this.temp_delay2_type.address;
            default:
               return "";
         }
      }
      
      public function getCTLFuncAddress(param1:String, param2:Boolean) : String
      {
         if(param2)
         {
            switch(param1)
            {
               case CTLDefinitionGT.ACCEL_CTL:
                  return this.sys_accel_ctl_func.address;
               case CTLDefinitionGT.EXP:
                  return this.sys_exp_func.address;
               case CTLDefinitionGT.SUB_CTL1:
                  return this.sys_sub_ctl1_func.address;
               case CTLDefinitionGT.SUB_CTL2:
                  return this.sys_sub_ctl2_func.address;
               case CTLDefinitionGT.SUB_EXP:
                  return this.sys_sub_exp_func.address;
               case CTLDefinitionGT.EXP_SW:
                  return this.sys_exp_sw_func.address;
            }
         }
         else
         {
            switch(param1)
            {
               case CTLDefinitionGT.ACCEL_CTL:
                  return this.temp_ctl_exp_accel_ctl_func.address;
               case CTLDefinitionGT.EXP:
                  return this.temp_ctl_exp_exp_func.address;
               case CTLDefinitionGT.SUB_CTL1:
                  return this.temp_ctl_exp_sub_ctl1_func.address;
               case CTLDefinitionGT.SUB_CTL2:
                  return this.temp_ctl_exp_sub_ctl2_func.address;
               case CTLDefinitionGT.SUB_EXP:
                  return this.temp_ctl_exp_sub_exp_func.address;
               case CTLDefinitionGT.EXP_SW:
                  return this.temp_ctl_exp_exp_sw_func.address;
            }
         }
         return "";
      }
      
      public function getCTLPedalFuncAddress(param1:String) : String
      {
         switch(param1)
         {
            case CTLDefinitionGT.EXP_PEDAL:
               return this.temp_pedal_function_exp_pedal.address;
            case CTLDefinitionGT.GAFC_EXP1:
               return this.temp_pedal_function_gafc_exp1.address;
            case CTLDefinitionGT.GAFC_EXP2:
               return this.temp_pedal_function_gafc_exp2.address;
            default:
               return "";
         }
      }
      
      public function getCTLAssignSwAddress(param1:String) : String
      {
         switch(param1)
         {
            case CTLDefinitionGT.ASSIGN1:
               return this.temp_assign1_on_off.address;
            case CTLDefinitionGT.ASSIGN2:
               return this.temp_assign2_on_off.address;
            case CTLDefinitionGT.ASSIGN3:
               return this.temp_assign3_on_off.address;
            case CTLDefinitionGT.ASSIGN4:
               return this.temp_assign4_on_off.address;
            case CTLDefinitionGT.ASSIGN5:
               return this.temp_assign5_on_off.address;
            case CTLDefinitionGT.ASSIGN6:
               return this.temp_assign6_on_off.address;
            case CTLDefinitionGT.ASSIGN7:
               return this.temp_assign7_on_off.address;
            case CTLDefinitionGT.ASSIGN8:
               return this.temp_assign8_on_off.address;
            default:
               return "";
         }
      }
      
      public function getCTLAssignSourceAddress(param1:String) : String
      {
         switch(param1)
         {
            case CTLDefinitionGT.ASSIGN1:
               return this.temp_assign1_source.address;
            case CTLDefinitionGT.ASSIGN2:
               return this.temp_assign2_source.address;
            case CTLDefinitionGT.ASSIGN3:
               return this.temp_assign3_source.address;
            case CTLDefinitionGT.ASSIGN4:
               return this.temp_assign4_source.address;
            case CTLDefinitionGT.ASSIGN5:
               return this.temp_assign5_source.address;
            case CTLDefinitionGT.ASSIGN6:
               return this.temp_assign6_source.address;
            case CTLDefinitionGT.ASSIGN7:
               return this.temp_assign7_source.address;
            case CTLDefinitionGT.ASSIGN8:
               return this.temp_assign8_source.address;
            default:
               return "";
         }
      }
      
      public function getCTLAssignSourceModeAddress(param1:String) : String
      {
         switch(param1)
         {
            case CTLDefinitionGT.ASSIGN1:
               return this.temp_assign1_source_mode.address;
            case CTLDefinitionGT.ASSIGN2:
               return this.temp_assign2_source_mode.address;
            case CTLDefinitionGT.ASSIGN3:
               return this.temp_assign3_source_mode.address;
            case CTLDefinitionGT.ASSIGN4:
               return this.temp_assign4_source_mode.address;
            case CTLDefinitionGT.ASSIGN5:
               return this.temp_assign5_source_mode.address;
            case CTLDefinitionGT.ASSIGN6:
               return this.temp_assign6_source_mode.address;
            case CTLDefinitionGT.ASSIGN7:
               return this.temp_assign7_source_mode.address;
            case CTLDefinitionGT.ASSIGN8:
               return this.temp_assign8_source_mode.address;
            default:
               return "";
         }
      }
      
      public function getCTLAssignTargetAddress(param1:String) : String
      {
         switch(param1)
         {
            case CTLDefinitionGT.ASSIGN1:
               return this.temp_assign1_target.address;
            case CTLDefinitionGT.ASSIGN2:
               return this.temp_assign2_target.address;
            case CTLDefinitionGT.ASSIGN3:
               return this.temp_assign3_target.address;
            case CTLDefinitionGT.ASSIGN4:
               return this.temp_assign4_target.address;
            case CTLDefinitionGT.ASSIGN5:
               return this.temp_assign5_target.address;
            case CTLDefinitionGT.ASSIGN6:
               return this.temp_assign6_target.address;
            case CTLDefinitionGT.ASSIGN7:
               return this.temp_assign7_target.address;
            case CTLDefinitionGT.ASSIGN8:
               return this.temp_assign8_target.address;
            default:
               return "";
         }
      }
      
      public function getIncrementAddress(param1:String) : String
      {
         var _loc2_:Array = null;
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:String = null;
         _loc2_ = new Array();
         _loc2_ = param1.split(",");
         _loc3_ = parseInt("0x" + _loc2_[2] + _loc2_[3],16);
         _loc4_ = _loc3_ + 1;
         _loc5_ = ToneCentralUtil.zeroPadding(_loc4_.toString(16),4);
         _loc2_[2] = _loc5_.substring(0,2);
         _loc2_[3] = _loc5_.substring(2);
         return _loc2_.join(",");
      }
      
      public function getPatchNum(param1:int) : String
      {
         var _loc2_:String = null;
         var _loc3_:String = null;
         _loc2_ = ToneCentralUtil.convertHexaDecimal(Math.floor(param1 / 128).toString(),2);
         _loc3_ = ToneCentralUtil.convertHexaDecimal((param1 % 128).toString(),2);
         return _loc2_ + "," + _loc3_;
      }
      
      public function get addressObj() : Object
      {
         return this._addressObj;
      }
      
      public function set addressObj(param1:Object) : void
      {
         this._addressObj = param1;
         this.setAllAddress();
         dispatchEvent(new ToneCentralEvents(ToneCentralEvents.ADDRESS_MAP_COMPLETE));
      }
      
      public function get maker_id() : String
      {
         return this._maker_id;
      }
      
      public function get device_id() : String
      {
         return this._device_id;
      }
      
      public function set device_id(param1:String) : void
      {
         this._device_id = param1;
      }
      
      public function get model_id() : String
      {
         return this._model_id;
      }
      
      public function set model_id(param1:String) : void
      {
         this._model_id = param1;
      }
      
      public function get request() : String
      {
         return this._request;
      }
      
      public function get dataset() : String
      {
         return this._dataset;
      }
      
      public function get request_id() : String
      {
         return this._request_id;
      }
      
      public function get current_patch_no() : Object
      {
         return this._current_patch_no;
      }
      
      public function get temporaryPatch() : Object
      {
         return this._temporaryPatch;
      }
      
      public function set temporaryPatch(param1:Object) : void
      {
         this._temporaryPatch = param1;
      }
      
      public function get request_device_id() : String
      {
         return this._request_device_id;
      }
      
      public function getPatchAddress(param1:String) : String
      {
         var _loc2_:String = null;
         var _loc3_:int = 0;
         _loc3_ = ParameterDefinitionGT.PARAM_NO_LIST.indexOf(param1);
         return "10,0" + _loc3_ + ",00,00";
      }
   }
}

class Blocker
{
   
   public function Blocker()
   {
      super();
   }
}
