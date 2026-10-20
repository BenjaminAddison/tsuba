package
{
   import flash.accessibility.*;
   import flash.data.*;
   import flash.debugger.*;
   import flash.desktop.*;
   import flash.display.*;
   import flash.errors.*;
   import flash.events.*;
   import flash.external.*;
   import flash.filesystem.*;
   import flash.geom.*;
   import flash.html.*;
   import flash.html.script.*;
   import flash.media.*;
   import flash.net.*;
   import flash.printing.*;
   import flash.profiler.*;
   import flash.system.*;
   import flash.text.*;
   import flash.ui.*;
   import flash.utils.*;
   import flash.xml.*;
   import mx.binding.*;
   import mx.core.DeferredInstanceFromFunction;
   import mx.core.IFlexModuleFactory;
   import mx.core.mx_internal;
   import mx.events.PropertyChangeEvent;
   import mx.events.ResizeEvent;
   import mx.filters.*;
   import mx.skins.halo.HaloBorder;
   import mx.styles.*;
   import spark.components.WindowedApplication;
   import tonecentral.ToneCentralLogic;
   import tonecentral.skin.VScrollBarSkin;
   import tonecentral.views.info.InfoArea;
   import tonecentral.views.main.ContentsAreaContainer;
   import tonecentral.views.main.Loading;
   import tonecentral.views.main.SideAreaContainer;
   import tonecentral.views.tccontents.AddLivesetMsgArea;
   
   use namespace mx_internal;
   
   public class BOSS_TONE_STUDIO_for_KATANA extends WindowedApplication
   {
      
      private static var _skinParts:Object = {
         "gripper":false,
         "contentGroup":false,
         "statusBar":false,
         "statusText":false,
         "controlBarGroup":false,
         "titleBar":false
      };
      
      private var _200450599addLivesetMsgArea:AddLivesetMsgArea;
      
      private var _848790215contentsArea:ContentsAreaContainer;
      
      private var _177381979infoArea:InfoArea;
      
      private var _336650556loading:Loading;
      
      private var _103149406logic:ToneCentralLogic;
      
      private var _216571524sideArea:SideAreaContainer;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      mx_internal var _BOSS_TONE_STUDIO_for_KATANA_StylesInit_done:Boolean = false;
      
      private var _embed_css__assets_images_player_btn_re1_up_png_1888886275_87732888:Class = _class_embed_css__assets_images_player_btn_re1_up_png_1888886275_87732888;
      
      private var _embed_css__assets_images_btn_v_txtboxup_detail_up_png__588332340_1021063403:Class = _class_embed_css__assets_images_btn_v_txtboxup_detail_up_png__588332340_1021063403;
      
      private var _embed_css__assets_images_btn_tgg_r_selected_png_1453112438_22132359:Class = _class_embed_css__assets_images_btn_tgg_r_selected_png_1453112438_22132359;
      
      private var _embed_css__assets_images_btn_disagree_down_png__680499210_1867993167:Class = _class_embed_css__assets_images_btn_disagree_down_png__680499210_1867993167;
      
      private var _embed_css__assets_images_btn_v_checkbox_up_png__1555590303_1800848582:Class = _class_embed_css__assets_images_btn_v_checkbox_up_png__1555590303_1800848582;
      
      private var _embed_css__assets_images_multituner_btn_tuneboxup_png_1093475133_250034120:Class = _class_embed_css__assets_images_multituner_btn_tuneboxup_png_1093475133_250034120;
      
      private var _embed_css__assets_images_txt_write_over_png_1452457475_533819554:Class = _class_embed_css__assets_images_txt_write_over_png_1452457475_533819554;
      
      private var _embed_css__assets_images_effectchain_img_lampoffl_png__357030288_2008817071:Class = _class_embed_css__assets_images_effectchain_img_lampoffl_png__357030288_2008817071;
      
      private var _embed_css__assets_images_btn_nomalbtn_over_png_1950594785_1642928986:Class = _class_embed_css__assets_images_btn_nomalbtn_over_png_1950594785_1642928986;
      
      private var _embed_css__assets_images_multituner_btn_tuneboxdown_down_png__1976022765_231880808:Class = _class_embed_css__assets_images_multituner_btn_tuneboxdown_down_png__1976022765_231880808;
      
      private var _embed_css__assets_images_player_btn_prevnote_over_png_572118077_1798109384:Class = _class_embed_css__assets_images_player_btn_prevnote_over_png_572118077_1798109384;
      
      private var _embed_css__assets_images_btn_v_checkbox_over_png_464021082_2021398669:Class = _class_embed_css__assets_images_btn_v_checkbox_over_png_464021082_2021398669;
      
      private var _embed_css__assets_images_player_btn_re1_over_png__813772676_1956368123:Class = _class_embed_css__assets_images_player_btn_re1_over_png__813772676_1956368123;
      
      private var _embed_css__assets_images_effectchain_btn_lampoff_sq_png__487862648_2043212969:Class = _class_embed_css__assets_images_effectchain_btn_lampoff_sq_png__487862648_2043212969;
      
      private var _embed_css__assets_images_tonecentral_btn_sebtn_over_png_1701835864_255213676:Class = _class_embed_css__assets_images_tonecentral_btn_sebtn_over_png_1701835864_255213676;
      
      private var _embed_css__assets_images_img_amp_lampon_png__1068568402_827626776:Class = _class_embed_css__assets_images_img_amp_lampon_png__1068568402_827626776;
      
      private var _embed_css__assets_images_btn_nomalbtn_down_png__1446377553_1960472532:Class = _class_embed_css__assets_images_btn_nomalbtn_down_png__1446377553_1960472532;
      
      private var _embed_css__assets_images_txt_chab_up_png_1235865691_2082753424:Class = _class_embed_css__assets_images_txt_chab_up_png_1235865691_2082753424;
      
      private var _embed_css__assets_images_btn_v_mode1_up_png_1346392600_842941561:Class = _class_embed_css__assets_images_btn_v_mode1_up_png_1346392600_842941561;
      
      private var _embed_css__assets_images_btn_write_down_png_767851877_1413476220:Class = _class_embed_css__assets_images_btn_write_down_png_767851877_1413476220;
      
      private var _embed_css__assets_images_btn_tab_down_png__569389969_213316757:Class = _class_embed_css__assets_images_btn_tab_down_png__569389969_213316757;
      
      private var _embed_css__assets_images_scr_v_bt_over_png_1570814257_596505853:Class = _class_embed_css__assets_images_scr_v_bt_over_png_1570814257_596505853;
      
      private var _embed_css__assets_images_btn_manual_over_png__1494245056_830088855:Class = _class_embed_css__assets_images_btn_manual_over_png__1494245056_830088855;
      
      private var _embed_css__assets_images_player_btn_re5_down_png__701831738_1493198783:Class = _class_embed_css__assets_images_player_btn_re5_down_png__701831738_1493198783;
      
      private var _embed_css__assets_images_btn_radio_on_down_png_1219204049_1383777430:Class = _class_embed_css__assets_images_btn_radio_on_down_png_1219204049_1383777430;
      
      private var _embed_css__assets_images_effectchain_btn_chainwindow_down_png__2042922126_706652592:Class = _class_embed_css__assets_images_effectchain_btn_chainwindow_down_png__2042922126_706652592;
      
      private var _embed_css__assets_images_effectchain_btn_lampon_sq_png__1276743174_1587106643:Class = _class_embed_css__assets_images_effectchain_btn_lampon_sq_png__1276743174_1587106643;
      
      private var _embed_css__assets_images_effectchain_btn_chainwindow_up_png__1939021269_1587420213:Class = _class_embed_css__assets_images_effectchain_btn_chainwindow_up_png__1939021269_1587420213;
      
      private var _embed_css__assets_images_btn_v_mode2_down_png__1757670082_228499651:Class = _class_embed_css__assets_images_btn_v_mode2_down_png__1757670082_228499651;
      
      private var _embed_css__assets_images_tonecentral_btn_tonecentraldown_over_png_803368349_777362260:Class = _class_embed_css__assets_images_tonecentral_btn_tonecentraldown_over_png_803368349_777362260;
      
      private var _embed_css__assets_images_tonecentral_btn_tonecentralup_up_png__1805440117_2097560374:Class = _class_embed_css__assets_images_tonecentral_btn_tonecentralup_up_png__1805440117_2097560374;
      
      private var _embed_css__assets_images_btn_write_down_png_767851877_1413476225:Class = _class_embed_css__assets_images_btn_write_down_png_767851877_1413476225;
      
      private var _embed_css__assets_images_player_btn_re4_sele_down_png__1156039225_1742465490:Class = _class_embed_css__assets_images_player_btn_re4_sele_down_png__1156039225_1742465490;
      
      private var _embed_css__assets_images_btn_vtgl_over_png_2103022467_1737410250:Class = _class_embed_css__assets_images_btn_vtgl_over_png_2103022467_1737410250;
      
      private var _embed_css__assets_images_player_btn_play_over_png__1999387506_1283561773:Class = _class_embed_css__assets_images_player_btn_play_over_png__1999387506_1283561773;
      
      private var _embed_css__assets_images_btn_v_txtboxdown_down_png_224135150_2064507543:Class = _class_embed_css__assets_images_btn_v_txtboxdown_down_png_224135150_2064507543;
      
      private var _embed_css__assets_images_player_btn_re2_sele_up_png_1875519678_494926845:Class = _class_embed_css__assets_images_player_btn_re2_sele_up_png_1875519678_494926845;
      
      private var _embed_css__assets_images_player_btn_re2_sele_over_png__774170505_1620496290:Class = _class_embed_css__assets_images_player_btn_re2_sele_over_png__774170505_1620496290;
      
      private var _embed_css__assets_images_btn_nomalbtn_up_png__910468696_1073859745:Class = _class_embed_css__assets_images_btn_nomalbtn_up_png__910468696_1073859745;
      
      private var _embed_css__assets_images_btn_txtboxup_over_png__1887287344_2019479399:Class = _class_embed_css__assets_images_btn_txtboxup_over_png__1887287344_2019479399;
      
      private var _embed__font_Helvetica67_CondensedMedium_medium_normal_1831217423:Class = BOSS_TONE_STUDIO_for_KATANA__embed__font_Helvetica67_CondensedMedium_medium_normal_1831217423;
      
      private var _embed_css__assets_images_effectchain_btn_chainwindow_over_png_1354050212_1868806738:Class = _class_embed_css__assets_images_effectchain_btn_chainwindow_over_png_1354050212_1868806738;
      
      private var _embed_css__assets_images_player_btn_prevnote_up_png__1376707068_1458999891:Class = _class_embed_css__assets_images_player_btn_prevnote_up_png__1376707068_1458999891;
      
      private var _embed_css__assets_images_player_btn_re1_sele_down_png__1383727356_757011475:Class = _class_embed_css__assets_images_player_btn_re1_sele_down_png__1383727356_757011475;
      
      private var _embed_css__assets_images_btn_pageing_center_up_png__553007092_1160997596:Class = _class_embed_css__assets_images_btn_pageing_center_up_png__553007092_1160997596;
      
      private var _embed_css__assets_images_btn_disagree_over_png__1578494168_1287209057:Class = _class_embed_css__assets_images_btn_disagree_over_png__1578494168_1287209057;
      
      private var _embed_css__assets_images_btn_memory_over_png_1554284133_1456543654:Class = _class_embed_css__assets_images_btn_memory_over_png_1554284133_1456543654;
      
      private var _embed_css__assets_images_btn_vradio_up_png_1937567080_1501206561:Class = _class_embed_css__assets_images_btn_vradio_up_png_1937567080_1501206561;
      
      private var _embed_css__assets_images_btn_vradio_down_png__378164369_605804372:Class = _class_embed_css__assets_images_btn_vradio_down_png__378164369_605804372;
      
      private var _embed_css__assets_images_btn_memory_selected_png_128703916_1015210219:Class = _class_embed_css__assets_images_btn_memory_selected_png_128703916_1015210219;
      
      private var _embed_css__assets_images_effectchain_img_lampon_png__119785358_1734226703:Class = _class_embed_css__assets_images_effectchain_img_lampon_png__119785358_1734226703;
      
      private var _embed_css__assets_images_effectchain_btn_steat_selected_over_png__1470135580_328297597:Class = _class_embed_css__assets_images_effectchain_btn_steat_selected_over_png__1470135580_328297597;
      
      private var _embed_css__assets_images_multituner_btn_tuneboxup_over_png__1858031444_1085597099:Class = _class_embed_css__assets_images_multituner_btn_tuneboxup_over_png__1858031444_1085597099;
      
      private var _embed_css__assets_images_effectchain_btn_negative_down_png_1170070272_2095010839:Class = _class_embed_css__assets_images_effectchain_btn_negative_down_png_1170070272_2095010839;
      
      private var _embed_css__assets_images_btn_manualdownload_over_png__689176648_1458101843:Class = _class_embed_css__assets_images_btn_manualdownload_over_png__689176648_1458101843;
      
      private var _embed_css__assets_images_btn_tgg_l_up_png_238248764_1671792177:Class = _class_embed_css__assets_images_btn_tgg_l_up_png_238248764_1671792177;
      
      private var _embed_css__assets_images_btn_agree_down_png_283916600_1609022251:Class = _class_embed_css__assets_images_btn_agree_down_png_283916600_1609022251;
      
      private var _embed_css__assets_images_player_btn_re1_sele_selected_png__1621574403_992130168:Class = _class_embed_css__assets_images_player_btn_re1_sele_selected_png__1621574403_992130168;
      
      private var _embed_css__assets_images_player_btn_re5_sele_selected_png__704494591_1734598500:Class = _class_embed_css__assets_images_player_btn_re5_sele_selected_png__704494591_1734598500;
      
      private var _embed_css__assets_images_btn_tgg_l_selected_png_191496892_614779535:Class = _class_embed_css__assets_images_btn_tgg_l_selected_png_191496892_614779535;
      
      private var _embed_css__assets_images_btn_vradio_over_png__1276159327_846869562:Class = _class_embed_css__assets_images_btn_vradio_over_png__1276159327_846869562;
      
      private var _embed_css__assets_images_multituner_btn_tuneboxup_down_png__960036486_156740179:Class = _class_embed_css__assets_images_multituner_btn_tuneboxup_down_png__960036486_156740179;
      
      private var _embed_css__assets_images_btn_pageing_right_selected_png__1194825587_334161423:Class = _class_embed_css__assets_images_btn_pageing_right_selected_png__1194825587_334161423;
      
      private var _embed_css__assets_images_tonecentral_btn_tonecentralup_down_png_1774513362_1719496987:Class = _class_embed_css__assets_images_tonecentral_btn_tonecentralup_down_png_1774513362_1719496987;
      
      private var _embed_css__assets_images_player_btn_recstop_down_png_1890657686_238964271:Class = _class_embed_css__assets_images_player_btn_recstop_down_png_1890657686_238964271;
      
      private var _embed_css__assets_images_btn_txtboxdown_over_png__924166551_1782737186:Class = _class_embed_css__assets_images_btn_txtboxdown_over_png__924166551_1782737186;
      
      private var _embed_css__assets_images_btn_pageing_left_selected_png_2062171162_522771866:Class = _class_embed_css__assets_images_btn_pageing_left_selected_png_2062171162_522771866;
      
      private var _embed_css__assets_images_player_btn_re2_sele_down_png_123824453_1026761136:Class = _class_embed_css__assets_images_player_btn_re2_sele_down_png_123824453_1026761136;
      
      private var _embed_css__assets_images_txt_chab_down_png__403333726_1654618229:Class = _class_embed_css__assets_images_txt_chab_down_png__403333726_1654618229;
      
      private var _embed_css__assets_images_player_btn_re3_sele_up_png_1582116671_720559482:Class = _class_embed_css__assets_images_player_btn_re3_sele_up_png_1582116671_720559482;
      
      private var _embed_css__assets_images_scr_h_bt_up_png__1080891030_1641856474:Class = _class_embed_css__assets_images_scr_h_bt_up_png__1080891030_1641856474;
      
      private var _embed_css__assets_images_player_btn_re4_down_png__505318233_1352977436:Class = _class_embed_css__assets_images_player_btn_re4_down_png__505318233_1352977436;
      
      private var _embed_css__assets_images_btn_vslider_over_png_4614303_1332319206:Class = _class_embed_css__assets_images_btn_vslider_over_png_4614303_1332319206;
      
      private var _embed_css__assets_images_tonecentral_btn_tonecentraldown_up_png_902860644_364619847:Class = _class_embed_css__assets_images_tonecentral_btn_tonecentraldown_up_png_902860644_364619847;
      
      private var _embed_css__assets_images_btn_v_txtboxup_down_png_1710406421_992448982:Class = _class_embed_css__assets_images_btn_v_txtboxup_down_png_1710406421_992448982;
      
      private var _embed_css__assets_images_btn_manual_selected_png_530848519_2069810684:Class = _class_embed_css__assets_images_btn_manual_selected_png_530848519_2069810684;
      
      private var _embed_css__assets_images_player_btn_re4_over_png__1403313191_713962990:Class = _class_embed_css__assets_images_player_btn_re4_over_png__1403313191_713962990;
      
      private var _embed_css__assets_images_ctl_img_lamponl_s_png_1689333903_514882356:Class = _class_embed_css__assets_images_ctl_img_lamponl_s_png_1689333903_514882356;
      
      private var _embed_css__assets_images_btn_manual_up_png_2093764551_1414459900:Class = _class_embed_css__assets_images_btn_manual_up_png_2093764551_1414459900;
      
      private var _embed_css__assets_images_btn_manualdownload_up_png_1656613951_650713978:Class = _class_embed_css__assets_images_btn_manualdownload_up_png_1656613951_650713978;
      
      private var _embed_css__assets_images_btn_v_mode2_over_png_1639302256_873869137:Class = _class_embed_css__assets_images_btn_v_mode2_over_png_1639302256_873869137;
      
      private var _embed_css__assets_images_player_btn_nextnote_over_png__202693763_1044844664:Class = _class_embed_css__assets_images_player_btn_nextnote_over_png__202693763_1044844664;
      
      private var _embed_css__assets_images_effectchain_btn_steat_over_png__736724162_1304850173:Class = _class_embed_css__assets_images_effectchain_btn_steat_over_png__736724162_1304850173;
      
      private var _embed_css__assets_images_btn_vslider_up_png__845454618_2032469813:Class = _class_embed_css__assets_images_btn_vslider_up_png__845454618_2032469813;
      
      private var _embed_css__assets_images_player_btn_re2_sele_selected_png_1828921022_765006397:Class = _class_embed_css__assets_images_player_btn_re2_sele_selected_png_1828921022_765006397;
      
      private var _embed_css__assets_images_player_btn_re1_down_png_84222282_1508361149:Class = _class_embed_css__assets_images_player_btn_re1_down_png_84222282_1508361149;
      
      private var _embed_css__assets_images_img_vslider_bar_png__305621851_658276371:Class = _class_embed_css__assets_images_img_vslider_bar_png__305621851_658276371;
      
      private var _embed_css__assets_images_library_img_delete_up_png_1457566741_1990955414:Class = _class_embed_css__assets_images_library_img_delete_up_png_1457566741_1990955414;
      
      private var _embed_css__assets_images_player_btn_rec_over_png__2049513334_621570179:Class = _class_embed_css__assets_images_player_btn_rec_over_png__2049513334_621570179;
      
      private var _embed_css__assets_images_btn_v_txtboxdown_detail_over_png_1340711948_1246757035:Class = _class_embed_css__assets_images_btn_v_txtboxdown_detail_over_png_1340711948_1246757035;
      
      private var _embed_css__assets_images_effectchain_img_lamponl_png_636915536_1804365607:Class = _class_embed_css__assets_images_effectchain_img_lamponl_png_636915536_1804365607;
      
      private var _embed_css__assets_images_btn_memory_down_png__1842688205_338397384:Class = _class_embed_css__assets_images_btn_memory_down_png__1842688205_338397384;
      
      private var _embed_css__assets_images_img_pinch_over_png__1995298347_1169372224:Class = _class_embed_css__assets_images_img_pinch_over_png__1995298347_1169372224;
      
      private var _embed_css__assets_images_btn_vslider_down_png_902609261_820713592:Class = _class_embed_css__assets_images_btn_vslider_down_png_902609261_820713592;
      
      private var _embed_css__assets_images_player_btn_re4_up_png__1472617312_1932072713:Class = _class_embed_css__assets_images_player_btn_re4_up_png__1472617312_1932072713;
      
      private var _embed_css__assets_images_btn_txtboxup_down_png__989292386_1038105753:Class = _class_embed_css__assets_images_btn_txtboxup_down_png__989292386_1038105753;
      
      private var _embed_css__assets_images_scr_h_bg_png_1086942681_1721313095:Class = _class_embed_css__assets_images_scr_h_bg_png_1086942681_1721313095;
      
      private var _embed_css__assets_images_btn_pageing_right_up_png__1534936627_757007631:Class = _class_embed_css__assets_images_btn_pageing_right_up_png__1534936627_757007631;
      
      private var _embed_css__assets_images_player_btn_re3_sele_down_png_1631376262_783679595:Class = _class_embed_css__assets_images_player_btn_re3_sele_down_png_1631376262_783679595;
      
      private var _embed_css__assets_images_btn_v_txtboxdown_detail_up_png__1849649773_331880590:Class = _class_embed_css__assets_images_btn_v_txtboxdown_detail_up_png__1849649773_331880590;
      
      private var _embed_css__assets_images_img_pinch_png__1772303244_1073445203:Class = _class_embed_css__assets_images_img_pinch_png__1772303244_1073445203;
      
      private var _embed_css__assets_images_player_btn_re4_sele_up_png_1288713664_1016449823:Class = _class_embed_css__assets_images_player_btn_re4_sele_up_png_1288713664_1016449823;
      
      private var _embed_css__assets_images_btn_tgg_r_over_png_882397743_1783369314:Class = _class_embed_css__assets_images_btn_tgg_r_over_png_882397743_1783369314;
      
      private var _embed_css__assets_images_effectchain_btn_usbpri_down_png_341374610_1103585381:Class = _class_embed_css__assets_images_effectchain_btn_usbpri_down_png_341374610_1103585381;
      
      private var _embed_css__assets_images_btn_disagree_up_png__1740955729_176098668:Class = _class_embed_css__assets_images_btn_disagree_up_png__1740955729_176098668;
      
      private var _embed_css__assets_images_player_btn_nextnote_down_png_695301195_1199790218:Class = _class_embed_css__assets_images_player_btn_nextnote_down_png_695301195_1199790218;
      
      private var _embed_css__assets_images_btn_radio_selected_png_566293570_483932383:Class = _class_embed_css__assets_images_btn_radio_selected_png_566293570_483932383;
      
      private var _embed_css__assets_images_btn_radio_off_png__360183362_1357165689:Class = _class_embed_css__assets_images_btn_radio_off_png__360183362_1357165689;
      
      private var _embed_css__assets_images_effectchain_btn_steat_selected_up_png_256920171_1788969888:Class = _class_embed_css__assets_images_effectchain_btn_steat_selected_up_png_256920171_1788969888;
      
      private var _embed_css__assets_images_player_btn_stop_over_png_534171520_1854367201:Class = _class_embed_css__assets_images_player_btn_stop_over_png_534171520_1854367201;
      
      private var _embed_css__assets_images_player_btn_play_down_png__1101392548_1862019419:Class = _class_embed_css__assets_images_player_btn_play_down_png__1101392548_1862019419;
      
      private var _embed_css__assets_images_txt_write_up_png_1426440522_1849337305:Class = _class_embed_css__assets_images_txt_write_up_png_1426440522_1849337305;
      
      private var _embed_css__assets_images_scr_v_bt_down_png__1826158081_1241285835:Class = _class_embed_css__assets_images_scr_v_bt_down_png__1826158081_1241285835;
      
      private var _embed_css__assets_images_tonecentral_btn_sebtn_up_png__1661564705_276546943:Class = _class_embed_css__assets_images_tonecentral_btn_sebtn_up_png__1661564705_276546943;
      
      private var _embed_css__assets_images_btn_tgg_r_down_png_1780392701_64356020:Class = _class_embed_css__assets_images_btn_tgg_r_down_png_1780392701_64356020;
      
      private var _embed_css__assets_images_btn_radio_over_png__1228386309_12985786:Class = _class_embed_css__assets_images_btn_radio_over_png__1228386309_12985786;
      
      private var _embed_css__assets_images_tonecentral_btn_tonecentraldown_down_png_1701363307_1407197142:Class = _class_embed_css__assets_images_tonecentral_btn_tonecentraldown_down_png_1701363307_1407197142;
      
      private var _embed_css__assets_images_effectchain_btn_steat_down_png_161270796_1816400363:Class = _class_embed_css__assets_images_effectchain_btn_steat_down_png_161270796_1816400363;
      
      private var _embed__font_A_OTF____Pro_B_medium_normal_1353197259:Class = BOSS_TONE_STUDIO_for_KATANA__embed__font_A_OTF____Pro_B_medium_normal_1353197259;
      
      private var _embed_css__assets_images_player_btn_value_up_png__248021360_1110097561:Class = _class_embed_css__assets_images_player_btn_value_up_png__248021360_1110097561;
      
      private var _embed_css__assets_images_btn_write_up_png__970734370_1412096689:Class = _class_embed_css__assets_images_btn_write_up_png__970734370_1412096689;
      
      private var _embed_css__assets_images_btn_v_txtboxdown_up_png_838753703_2132697316:Class = _class_embed_css__assets_images_btn_v_txtboxdown_up_png_838753703_2132697316;
      
      private var _embed_css__assets_images_btn_nomalbtn_over_png_1950594785_1315103046:Class = _class_embed_css__assets_images_btn_nomalbtn_over_png_1950594785_1315103046;
      
      private var _embed_css__assets_images_player_btn_re3_down_png__308804728_1842550145:Class = _class_embed_css__assets_images_player_btn_re3_down_png__308804728_1842550145;
      
      private var _embed_css__assets_images_btn_write_up_png__970734370_1412096684:Class = _class_embed_css__assets_images_btn_write_up_png__970734370_1412096684;
      
      private var _embed_css__assets_images_effectchain_img_lampoffl_over_png_1122741593_1791082834:Class = _class_embed_css__assets_images_effectchain_img_lampoffl_over_png_1122741593_1791082834;
      
      private var _embed_css__assets_images_player_btn_rec_up_png__1164910191_1464341930:Class = _class_embed_css__assets_images_player_btn_rec_up_png__1164910191_1464341930;
      
      private var _embed_css__assets_images_btn_vtgl_down_png__1293949871_1440489736:Class = _class_embed_css__assets_images_btn_vtgl_down_png__1293949871_1440489736;
      
      private var _embed_css__assets_images_library_bgi_patch_textinput_png__910263123_1192247490:Class = _class_embed_css__assets_images_library_bgi_patch_textinput_png__910263123_1192247490;
      
      private var _embed_css__assets_images_multituner_btn_tuneboxdown_over_png_1420949573_946521926:Class = _class_embed_css__assets_images_multituner_btn_tuneboxdown_over_png_1420949573_946521926;
      
      private var _embed_css__assets_images_btn_vtgl_selected_png__277531702_1486592893:Class = _class_embed_css__assets_images_btn_vtgl_selected_png__277531702_1486592893;
      
      private var _embed_css__assets_images_player_btn_stop_down_png_1432166478_1477734931:Class = _class_embed_css__assets_images_player_btn_stop_down_png_1432166478_1477734931;
      
      private var _embed_css__assets_images_tonecentral_btn_tonecentralup_over_png_876518404_392463079:Class = _class_embed_css__assets_images_tonecentral_btn_tonecentralup_over_png_876518404_392463079;
      
      private var _embed_css__assets_images_edit_footer_menu_btn_foot_up_png_859019208_1079401129:Class = _class_embed_css__assets_images_edit_footer_menu_btn_foot_up_png_859019208_1079401129;
      
      private var _embed_css__assets_images_player_btn_play_up_png_6090389_149158016:Class = _class_embed_css__assets_images_player_btn_play_up_png_6090389_149158016;
      
      private var _embed_css__assets_images_player_btn_prevnote_down_png_1470113035_1290530250:Class = _class_embed_css__assets_images_player_btn_prevnote_down_png_1470113035_1290530250;
      
      private var _embed_css__assets_images_btn_tgg_r_up_png_2105176182_392604359:Class = _class_embed_css__assets_images_btn_tgg_r_up_png_2105176182_392604359;
      
      private var _embed_css__assets_images_btn_vtgl_up_png__494668086_10102333:Class = _class_embed_css__assets_images_btn_vtgl_up_png__494668086_10102333;
      
      private var _embed_css__assets_images_player_btn_re3_sele_selected_png_984449151_671339770:Class = _class_embed_css__assets_images_player_btn_re3_sele_selected_png_984449151_671339770;
      
      private var _embed_css__assets_images_btn_tgg_l_down_png__1335493565_10455986:Class = _class_embed_css__assets_images_btn_tgg_l_down_png__1335493565_10455986;
      
      private var _embed_css__assets_images_btn_memory_up_png_1810903596_829633237:Class = _class_embed_css__assets_images_btn_memory_up_png_1810903596_829633237;
      
      private var _embed_css__assets_images_btn_tgg_l_over_png_2061478773_427628300:Class = _class_embed_css__assets_images_btn_tgg_l_over_png_2061478773_427628300;
      
      private var _embed_css__assets_images_btn_v_txtboxup_detail_down_png__1110984749_257109710:Class = _class_embed_css__assets_images_btn_v_txtboxup_detail_down_png__1110984749_257109710;
      
      private var _embed_css__assets_images_btn_manualdownload_down_png_208818310_1383509631:Class = _class_embed_css__assets_images_btn_manualdownload_down_png_208818310_1383509631;
      
      private var _embed_css__assets_images_player_btn_stop_up_png__701886969_1792710866:Class = _class_embed_css__assets_images_player_btn_stop_up_png__701886969_1792710866;
      
      private var _embed_css__assets_images_btn_vradio_selected_png__914998296_1721111199:Class = _class_embed_css__assets_images_btn_vradio_selected_png__914998296_1721111199;
      
      private var _embed_css__assets_images_effectchain_btn_usbsec_png__1594131505_2146995926:Class = _class_embed_css__assets_images_effectchain_btn_usbsec_png__1594131505_2146995926;
      
      private var _embed_css__assets_images_player_btn_re3_sele_over_png_733381304_1229885209:Class = _class_embed_css__assets_images_player_btn_re3_sele_over_png_733381304_1229885209;
      
      private var _embed_css__assets_images_player_btn_re3_over_png__1206799686_1731430995:Class = _class_embed_css__assets_images_player_btn_re3_over_png__1206799686_1731430995;
      
      private var _embed_css__assets_images_player_btn_re5_up_png_270193023_615933244:Class = _class_embed_css__assets_images_player_btn_re5_up_png_270193023_615933244;
      
      private var _embed_css__assets_images_player_btn_re2_down_png__112291223_1454282018:Class = _class_embed_css__assets_images_player_btn_re2_down_png__112291223_1454282018;
      
      private var _embed_css__assets_images_scr_h_bt_down_png__2013483279_1863710215:Class = _class_embed_css__assets_images_scr_h_bt_down_png__2013483279_1863710215;
      
      private var _embed_css__assets_images_player_btn_rec_down_png__1151518376_1736504433:Class = _class_embed_css__assets_images_player_btn_rec_down_png__1151518376_1736504433;
      
      private var _embed_css__assets_images_player_btn_re5_sele_over_png__546482374_978881641:Class = _class_embed_css__assets_images_player_btn_re5_sele_over_png__546482374_978881641;
      
      private var _embed_css__assets_images_img_v_arrowdropbox_png_1396471832_100445433:Class = _class_embed_css__assets_images_img_v_arrowdropbox_png_1396471832_100445433;
      
      private var _embed_css__assets_images_effectchain_btn_steat_up_png_20812101_1320729008:Class = _class_embed_css__assets_images_effectchain_btn_steat_up_png_20812101_1320729008;
      
      private var _embed_css__assets_images_scr_h_bt_over_png_1383489059_174849611:Class = _class_embed_css__assets_images_scr_h_bt_over_png_1383489059_174849611;
      
      private var _embed_css__assets_images_btn_v_txtboxup_over_png_812411463_2117591868:Class = _class_embed_css__assets_images_btn_v_txtboxup_over_png_812411463_2117591868;
      
      private var _embed_css__assets_images_edit_footer_menu_btn_foot_over_png_1621421313_816059812:Class = _class_embed_css__assets_images_edit_footer_menu_btn_foot_over_png_1621421313_816059812;
      
      private var _embed_css__assets_images_effectchain_img_lamponl_sq_png__189702269_756439646:Class = _class_embed_css__assets_images_effectchain_img_lamponl_sq_png__189702269_756439646;
      
      private var _embed_css__assets_images_btn_vtgl_up_png__494668086_317723425:Class = _class_embed_css__assets_images_btn_vtgl_up_png__494668086_317723425;
      
      private var _embed_css__assets_images_btn_txtboxdown_up_png__1860945104_1582001273:Class = _class_embed_css__assets_images_btn_txtboxdown_up_png__1860945104_1582001273;
      
      private var _embed_css__assets_images_tonecentral_btn_sebtn_selected_png_823468575_1825642497:Class = _class_embed_css__assets_images_tonecentral_btn_sebtn_selected_png_823468575_1825642497;
      
      private var _embed_css__assets_images_btn_vtgl_up_png__494668086_317723429:Class = _class_embed_css__assets_images_btn_vtgl_up_png__494668086_317723429;
      
      private var _embed_css__assets_images_btn_radio_on_up_png__1368029622_686051133:Class = _class_embed_css__assets_images_btn_radio_on_up_png__1368029622_686051133;
      
      private var _embed_css__assets_images_effectchain_btn_chainwindow_selected_png__285322645_1830482763:Class = _class_embed_css__assets_images_effectchain_btn_chainwindow_selected_png__285322645_1830482763;
      
      private var _embed_css__assets_images_btn_nomalbtn_up_png__910468696_1401685685:Class = _class_embed_css__assets_images_btn_nomalbtn_up_png__910468696_1401685685;
      
      private var _embed_css__assets_images_btn_v_txtboxdown_over_png__673859808_144008969:Class = _class_embed_css__assets_images_btn_v_txtboxdown_over_png__673859808_144008969;
      
      private var _embed_css__assets_images_btn_vtgl_red_up_png__1247327176_742967369:Class = _class_embed_css__assets_images_btn_vtgl_red_up_png__1247327176_742967369;
      
      private var _embed_css__assets_images_player_btn_recstop_over_png_992662728_140361919:Class = _class_embed_css__assets_images_player_btn_recstop_over_png_992662728_140361919;
      
      private var _embed_css__assets_images_scr_v_bg_png__283516405_1753723965:Class = _class_embed_css__assets_images_scr_v_bg_png__283516405_1753723965;
      
      private var _embed_css__assets_images_btn_driverdownload_down_png__632344476_1878895589:Class = _class_embed_css__assets_images_btn_driverdownload_down_png__632344476_1878895589;
      
      private var _embed_css__assets_images_btn_v_checkbox_down_png_1362016040_504073823:Class = _class_embed_css__assets_images_btn_v_checkbox_down_png_1362016040_504073823;
      
      private var _embed_css__assets_images_btn_vtgl_red_selected_png__923648328_1519257847:Class = _class_embed_css__assets_images_btn_vtgl_red_selected_png__923648328_1519257847;
      
      private var _embed_css__assets_images_btn_v_txtboxup_detail_over_png__2008979707_247094576:Class = _class_embed_css__assets_images_btn_v_txtboxup_detail_over_png__2008979707_247094576;
      
      private var _embed_css__assets_images_player_btn_re1_sele_over_png_2013244982_302618981:Class = _class_embed_css__assets_images_player_btn_re1_sele_over_png_2013244982_302618981;
      
      private var _embed_css__assets_images_btn_agree_over_png__614078358_2053130777:Class = _class_embed_css__assets_images_btn_agree_over_png__614078358_2053130777;
      
      private var _embed_css__assets_images_btn_pageing_center_selected_png_1307937676_739982108:Class = _class_embed_css__assets_images_btn_pageing_center_selected_png_1307937676_739982108;
      
      private var _embed_css__assets_images_btn_vtgl_over_png_2103022467_1737410246:Class = _class_embed_css__assets_images_btn_vtgl_over_png_2103022467_1737410246;
      
      private var _embed_css__assets_images_scr_v_bt_up_png__468406280_162817432:Class = _class_embed_css__assets_images_scr_v_bt_up_png__468406280_162817432;
      
      private var _embed_css__assets_images_btn_v_mode2_selected_png__146463177_2042399774:Class = _class_embed_css__assets_images_btn_v_mode2_selected_png__146463177_2042399774;
      
      private var _embed_css__assets_images_btn_driverdownload_over_png__1530339434_628209815:Class = _class_embed_css__assets_images_btn_driverdownload_over_png__1530339434_628209815;
      
      private var _embed_css__assets_images_btn_driverdownload_up_png__1620235363_71866186:Class = _class_embed_css__assets_images_btn_driverdownload_up_png__1620235363_71866186;
      
      private var _embed_css__assets_images_btn_v_txtboxdown_detail_down_png__2056260390_1690341513:Class = _class_embed_css__assets_images_btn_v_txtboxdown_detail_down_png__2056260390_1690341513;
      
      private var _embed_css__assets_images_btn_tab_selected_png__1307058968_319671682:Class = _class_embed_css__assets_images_btn_tab_selected_png__1307058968_319671682;
      
      private var _embed_css__assets_images_btn_v_mode1_down_png__1561156577_238235802:Class = _class_embed_css__assets_images_btn_v_mode1_down_png__1561156577_238235802;
      
      private var _embed_css__assets_images_btn_manual_down_png__596250098_689857655:Class = _class_embed_css__assets_images_btn_manual_down_png__596250098_689857655;
      
      private var _embed_css__assets_images_player_btn_re4_sele_selected_png_139977280_368951007:Class = _class_embed_css__assets_images_player_btn_re4_sele_selected_png_139977280_368951007;
      
      private var _embed_css__assets_images_player_btn_re1_sele_up_png__2126044611_536149624:Class = _class_embed_css__assets_images_player_btn_re1_sele_up_png__2126044611_536149624;
      
      private var _embed_css__assets_images_btn_txtboxdown_down_png__26171593_1604935220:Class = _class_embed_css__assets_images_btn_txtboxdown_down_png__26171593_1604935220;
      
      private var _embed_css__assets_images_player_btn_re5_over_png__1599826696_241129617:Class = _class_embed_css__assets_images_player_btn_re5_over_png__1599826696_241129617;
      
      private var _embed_css__assets_images_btn_write_over_png__130143081_1770619089:Class = _class_embed_css__assets_images_btn_write_over_png__130143081_1770619089;
      
      private var _embed_css__assets_images_player_btn_nextnote_up_png_642596164_755846253:Class = _class_embed_css__assets_images_player_btn_nextnote_up_png_642596164_755846253;
      
      private var _embed_css__assets_images_multituner_btn_tuneboxdown_png_198293508_1903506899:Class = _class_embed_css__assets_images_multituner_btn_tuneboxdown_png_198293508_1903506899;
      
      private var _embed_css__assets_images_library_bgi_liveset_textinput_png__16245541_1429078297:Class = _class_embed_css__assets_images_library_bgi_liveset_textinput_png__16245541_1429078297;
      
      private var _embed_css__assets_images_effectchain_img_lampoff_png_402341202_2104424741:Class = _class_embed_css__assets_images_effectchain_img_lampoff_png_402341202_2104424741;
      
      private var _embed_css__assets_images_player_btn_re5_sele_down_png_351512584_1795316969:Class = _class_embed_css__assets_images_player_btn_re5_sele_down_png_351512584_1795316969;
      
      private var _embed_css__assets_images_ctl_img_lampoffl_s_over_png_1663340912_536776071:Class = _class_embed_css__assets_images_ctl_img_lampoffl_s_over_png_1663340912_536776071;
      
      private var _embed_css__assets_images_btn_radio_on_over_png_321209091_1141623704:Class = _class_embed_css__assets_images_btn_radio_on_over_png_321209091_1141623704;
      
      private var _embed_css__assets_images_effectchain_btn_usbpri_up_png__202463925_1634643968:Class = _class_embed_css__assets_images_effectchain_btn_usbpri_up_png__202463925_1634643968;
      
      private var _embed_css__assets_images_txt_write_down_png__1944514863_917117772:Class = _class_embed_css__assets_images_txt_write_down_png__1944514863_917117772;
      
      private var _embed_css__assets_images_btn_vtgl_up_png__494668086_317723433:Class = _class_embed_css__assets_images_btn_vtgl_up_png__494668086_317723433;
      
      private var _embed_css__assets_images_btn_v_txtboxup_up_png_925216398_267721015:Class = _class_embed_css__assets_images_btn_v_txtboxup_up_png_925216398_267721015;
      
      private var _embed_css__assets_images_bgi_txtbox_png_1273838038_1762951156:Class = _class_embed_css__assets_images_bgi_txtbox_png_1273838038_1762951156;
      
      private var _embed_css__assets_images_player_btn_re4_sele_over_png__2054034183_626744100:Class = _class_embed_css__assets_images_player_btn_re4_sele_over_png__2054034183_626744100;
      
      private var _embed_css__assets_images_btn_agree_up_png__1650566799_915587494:Class = _class_embed_css__assets_images_btn_agree_up_png__1650566799_915587494;
      
      private var _embed_css__assets_images_player_btn_re2_up_png__663270686_2107228853:Class = _class_embed_css__assets_images_player_btn_re2_up_png__663270686_2107228853;
      
      private var _embed_css__assets_images_player_btn_value_over_png__1387642423_622084866:Class = _class_embed_css__assets_images_player_btn_value_over_png__1387642423_622084866;
      
      private var _embed_css__assets_images_player_btn_re3_up_png_1079539649_714022950:Class = _class_embed_css__assets_images_player_btn_re3_up_png_1079539649_714022950;
      
      private var _embed_css__assets_images_player_btn_recstop_up_png__942750385_663077516:Class = _class_embed_css__assets_images_player_btn_recstop_up_png__942750385_663077516;
      
      private var _embed_css__assets_images_tonecentral_btn_sebtn_down_png__1695136474_838192922:Class = _class_embed_css__assets_images_tonecentral_btn_sebtn_down_png__1695136474_838192922;
      
      private var _embed_css__assets_images_player_btn_value_down_png__489647465_1168395244:Class = _class_embed_css__assets_images_player_btn_value_down_png__489647465_1168395244;
      
      private var _embed_css__assets_images_btn_vtgl_selected_png__277531702_1158767131:Class = _class_embed_css__assets_images_btn_vtgl_selected_png__277531702_1158767131;
      
      private var _embed_css__assets_images_btn_v_mode1_over_png_1835815761_411820660:Class = _class_embed_css__assets_images_btn_v_mode1_over_png_1835815761_411820660;
      
      private var _embed_css__assets_images_effectchain_img_lampoffl_sq_png__1325206429_1907710456:Class = _class_embed_css__assets_images_effectchain_img_lampoffl_sq_png__1325206429_1907710456;
      
      private var _embed_css__assets_images_btn_nomalbtn_down_png__1446377553_2006668824:Class = _class_embed_css__assets_images_btn_nomalbtn_down_png__1446377553_2006668824;
      
      private var _embed_css__assets_images_player_btn_re2_over_png__1010286181_1860426672:Class = _class_embed_css__assets_images_player_btn_re2_over_png__1010286181_1860426672;
      
      private var _embed_css__assets_images_btn_v_mode1_selected_png_359095448_1738862919:Class = _class_embed_css__assets_images_btn_v_mode1_selected_png_359095448_1738862919;
      
      private var _embed_css__assets_images_ctl_img_lampoffl_s_png__1320628231_1816149020:Class = _class_embed_css__assets_images_ctl_img_lampoffl_s_png__1320628231_1816149020;
      
      private var _embed_css__assets_images_txt_chab_over_png__1301328684_1765148403:Class = _class_embed_css__assets_images_txt_chab_over_png__1301328684_1765148403;
      
      private var _embed_css__assets_images_img_amp_lampoff_png_1054837910_1516238394:Class = _class_embed_css__assets_images_img_amp_lampoff_png_1054837910_1516238394;
      
      private var _embed_css__assets_images_btn_txtboxup_up_png__2080941481_39990036:Class = _class_embed_css__assets_images_btn_txtboxup_up_png__2080941481_39990036;
      
      private var _embed_css__assets_images_effectchain_btn_negative_over_png_272075314_1151996155:Class = _class_embed_css__assets_images_effectchain_btn_negative_over_png_272075314_1151996155;
      
      private var _embed__font_A_OTF____Pro_R_medium_normal_1353197233:Class = BOSS_TONE_STUDIO_for_KATANA__embed__font_A_OTF____Pro_R_medium_normal_1353197233;
      
      private var _embed_css__assets_images_btn_write_over_png__130143081_1770619094:Class = _class_embed_css__assets_images_btn_write_over_png__130143081_1770619094;
      
      private var _embed_css__assets_images_player_btn_re5_sele_up_png_995310657_701450084:Class = _class_embed_css__assets_images_player_btn_re5_sele_up_png_995310657_701450084;
      
      private var _embed_css__assets_images_btn_tab_up_png_1512787560_391796674:Class = _class_embed_css__assets_images_btn_tab_up_png_1512787560_391796674;
      
      private var _embed_css__assets_images_btn_radio_up_png__1494781630_615246367:Class = _class_embed_css__assets_images_btn_radio_up_png__1494781630_615246367;
      
      private var _embed_css__assets_images_library_img_delete_over_png_1299982862_586593929:Class = _class_embed_css__assets_images_library_img_delete_over_png_1299982862_586593929;
      
      private var _embed_css__assets_images_library_img_liveseteditnamebox_png__1940522672_1601065144:Class = _class_embed_css__assets_images_library_img_liveseteditnamebox_png__1940522672_1601065144;
      
      private var _embed_css__assets_images_btn_radio_down_png__330391351_1504693524:Class = _class_embed_css__assets_images_btn_radio_down_png__330391351_1504693524;
      
      private var _embed_css__assets_images_btn_v_mode2_up_png__1205764361_367184738:Class = _class_embed_css__assets_images_btn_v_mode2_up_png__1205764361_367184738;
      
      private var _embed_css__assets_images_library_img_delete_down_png__2096989476_1076872549:Class = _class_embed_css__assets_images_library_img_delete_down_png__2096989476_1076872549;
      
      private var _embed_css__assets_images_effectchain_btn_usbpri_over_png__556620348_2017782691:Class = _class_embed_css__assets_images_effectchain_btn_usbpri_over_png__556620348_2017782691;
      
      private var _embed_css__assets_images_btn_v_checkbox_selected_png_1373684513_1328518074:Class = _class_embed_css__assets_images_btn_v_checkbox_selected_png_1373684513_1328518074;
      
      private var _embed_css__assets_images_effectchain_btn_steat_selected_down_png__572140622_365361979:Class = _class_embed_css__assets_images_effectchain_btn_steat_selected_down_png__572140622_365361979;
      
      private var _embed_css__assets_images_btn_tab_over_png__1467384927_38296775:Class = _class_embed_css__assets_images_btn_tab_over_png__1467384927_38296775;
      
      private var _embed_css__assets_images_btn_vtgl_down_png__1293949871_1440489740:Class = _class_embed_css__assets_images_btn_vtgl_down_png__1293949871_1440489740;
      
      private var _embed_css__assets_images_btn_vtgl_selected_png__277531702_1158767127:Class = _class_embed_css__assets_images_btn_vtgl_selected_png__277531702_1158767127;
      
      private var _embed_css__assets_images_effectchain_btn_negative_up_png_209571129_701907762:Class = _class_embed_css__assets_images_effectchain_btn_negative_up_png_209571129_701907762;
      
      private var _embed_css__assets_images_edit_footer_menu_btn_foot_down_png__1775551025_433748522:Class = _class_embed_css__assets_images_edit_footer_menu_btn_foot_down_png__1775551025_433748522;
      
      private var _embed_css__assets_images_btn_pageing_left_up_png_1262058266_733408986:Class = _class_embed_css__assets_images_btn_pageing_left_up_png_1262058266_733408986;
      
      public function BOSS_TONE_STUDIO_for_KATANA()
      {
         super();
         mx_internal::_document = this;
         this.showStatusBar = false;
         this.width = 1024;
         this.height = 768;
         this.minWidth = 1024;
         this.minHeight = 650;
         this.preloaderChromeColor = 0;
         this.mxmlContentFactory = new DeferredInstanceFromFunction(this._BOSS_TONE_STUDIO_for_KATANA_Array1_c);
         this._BOSS_TONE_STUDIO_for_KATANA_ToneCentralLogic1_i();
         this.addEventListener("resize",this.___BOSS_TONE_STUDIO_for_KATANA_WindowedApplication1_resize);
      }
      
      override public function set moduleFactory(param1:IFlexModuleFactory) : void
      {
         var factory:IFlexModuleFactory = param1;
         super.moduleFactory = factory;
         if(this.__moduleFactoryInitialized)
         {
            return;
         }
         this.__moduleFactoryInitialized = true;
         if(!this.styleDeclaration)
         {
            this.styleDeclaration = new CSSStyleDeclaration(null,styleManager);
         }
         this.styleDeclaration.defaultFactory = function():void
         {
            this.backgroundColor = 0;
         };
         mx_internal::_BOSS_TONE_STUDIO_for_KATANA_StylesInit();
      }
      
      override public function initialize() : void
      {
         super.initialize();
      }
      
      protected function windowResizeHandler(param1:Event) : void
      {
         this.logic.windowResize(param1);
         if(Context.isInit)
         {
            Context.dialogMng.resize();
         }
      }
      
      override protected function updateDisplayList(param1:Number, param2:Number) : void
      {
         super.updateDisplayList(param1,param2);
         this.logic.updateDisplayList(param1,param2);
      }
      
      private function _BOSS_TONE_STUDIO_for_KATANA_ToneCentralLogic1_i() : ToneCentralLogic
      {
         var _loc1_:ToneCentralLogic = new ToneCentralLogic();
         _loc1_.initialized(this,"logic");
         this.logic = _loc1_;
         BindingManager.executeBindings(this,"logic",this.logic);
         return _loc1_;
      }
      
      private function _BOSS_TONE_STUDIO_for_KATANA_Array1_c() : Array
      {
         return [this._BOSS_TONE_STUDIO_for_KATANA_SideAreaContainer1_i(),this._BOSS_TONE_STUDIO_for_KATANA_ContentsAreaContainer1_i(),this._BOSS_TONE_STUDIO_for_KATANA_InfoArea1_i(),this._BOSS_TONE_STUDIO_for_KATANA_AddLivesetMsgArea1_i(),this._BOSS_TONE_STUDIO_for_KATANA_Loading1_i()];
      }
      
      private function _BOSS_TONE_STUDIO_for_KATANA_SideAreaContainer1_i() : SideAreaContainer
      {
         var _loc1_:SideAreaContainer = new SideAreaContainer();
         _loc1_.id = "sideArea";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.sideArea = _loc1_;
         BindingManager.executeBindings(this,"sideArea",this.sideArea);
         return _loc1_;
      }
      
      private function _BOSS_TONE_STUDIO_for_KATANA_ContentsAreaContainer1_i() : ContentsAreaContainer
      {
         var _loc1_:ContentsAreaContainer = new ContentsAreaContainer();
         _loc1_.x = 180;
         _loc1_.id = "contentsArea";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.contentsArea = _loc1_;
         BindingManager.executeBindings(this,"contentsArea",this.contentsArea);
         return _loc1_;
      }
      
      private function _BOSS_TONE_STUDIO_for_KATANA_InfoArea1_i() : InfoArea
      {
         var _loc1_:InfoArea = new InfoArea();
         _loc1_.visible = false;
         _loc1_.id = "infoArea";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.infoArea = _loc1_;
         BindingManager.executeBindings(this,"infoArea",this.infoArea);
         return _loc1_;
      }
      
      private function _BOSS_TONE_STUDIO_for_KATANA_AddLivesetMsgArea1_i() : AddLivesetMsgArea
      {
         var _loc1_:AddLivesetMsgArea = new AddLivesetMsgArea();
         _loc1_.x = 80;
         _loc1_.y = 155;
         _loc1_.visible = false;
         _loc1_.id = "addLivesetMsgArea";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.addLivesetMsgArea = _loc1_;
         BindingManager.executeBindings(this,"addLivesetMsgArea",this.addLivesetMsgArea);
         return _loc1_;
      }
      
      private function _BOSS_TONE_STUDIO_for_KATANA_Loading1_i() : Loading
      {
         var _loc1_:Loading = new Loading();
         _loc1_.visible = false;
         _loc1_.id = "loading";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.loading = _loc1_;
         BindingManager.executeBindings(this,"loading",this.loading);
         return _loc1_;
      }
      
      public function ___BOSS_TONE_STUDIO_for_KATANA_WindowedApplication1_resize(param1:ResizeEvent) : void
      {
         this.windowResizeHandler(param1);
      }
      
      mx_internal function _BOSS_TONE_STUDIO_for_KATANA_StylesInit() : void
      {
         var style:CSSStyleDeclaration = null;
         var effects:Array = null;
         var conditions:Array = null;
         var condition:CSSCondition = null;
         var selector:CSSSelector = null;
         if(mx_internal::_BOSS_TONE_STUDIO_for_KATANA_StylesInit_done)
         {
            return;
         }
         mx_internal::_BOSS_TONE_STUDIO_for_KATANA_StylesInit_done = true;
         selector = null;
         conditions = null;
         conditions = null;
         selector = new CSSSelector("global",conditions,selector);
         style = styleManager.getStyleDeclaration("global");
         if(!style)
         {
            style = new CSSStyleDeclaration(selector,styleManager);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.modalTransparency = 0.5;
               this.modalTransparencyColor = 16777215;
            };
         }
         selector = null;
         conditions = null;
         conditions = [];
         condition = new CSSCondition("class","numericStepperBlack");
         conditions.push(condition);
         selector = new CSSSelector("",conditions,selector);
         style = styleManager.getStyleDeclaration(".numericStepperBlack");
         if(!style)
         {
            style = new CSSStyleDeclaration(selector,styleManager);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.labelStyle = "numericStepperTextBlack";
            };
         }
         selector = null;
         conditions = null;
         conditions = [];
         condition = new CSSCondition("class","numericStepper");
         conditions.push(condition);
         selector = new CSSSelector("",conditions,selector);
         style = styleManager.getStyleDeclaration(".numericStepper");
         if(!style)
         {
            style = new CSSStyleDeclaration(selector,styleManager);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.labelStyle = "numericStepperText";
            };
         }
         selector = null;
         conditions = null;
         conditions = [];
         condition = new CSSCondition("class","numericStepperDetail");
         conditions.push(condition);
         selector = new CSSSelector("",conditions,selector);
         style = styleManager.getStyleDeclaration(".numericStepperDetail");
         if(!style)
         {
            style = new CSSStyleDeclaration(selector,styleManager);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.labelStyle = "numericStepperDetailText";
            };
         }
         selector = null;
         conditions = null;
         conditions = [];
         condition = new CSSCondition("class","numericStepperChanging");
         conditions.push(condition);
         selector = new CSSSelector("",conditions,selector);
         style = styleManager.getStyleDeclaration(".numericStepperChanging");
         if(!style)
         {
            style = new CSSStyleDeclaration(selector,styleManager);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.labelStyle = "numericStepperTextChanging";
            };
         }
         selector = null;
         conditions = null;
         conditions = [];
         condition = new CSSCondition("class","numericStepperDetailChanging");
         conditions.push(condition);
         selector = new CSSSelector("",conditions,selector);
         style = styleManager.getStyleDeclaration(".numericStepperDetailChanging");
         if(!style)
         {
            style = new CSSStyleDeclaration(selector,styleManager);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.labelStyle = "numericStepperDetailTextChanging";
            };
         }
         selector = null;
         conditions = null;
         conditions = [];
         condition = new CSSCondition("class","numericStepperBlackChanging");
         conditions.push(condition);
         selector = new CSSSelector("",conditions,selector);
         style = styleManager.getStyleDeclaration(".numericStepperBlackChanging");
         if(!style)
         {
            style = new CSSStyleDeclaration(selector,styleManager);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.labelStyle = "numericStepperTextBlack";
            };
         }
         selector = null;
         conditions = null;
         conditions = null;
         selector = new CSSSelector("mx.controls.ToolTip",conditions,selector);
         style = styleManager.getStyleDeclaration("mx.controls.ToolTip");
         if(!style)
         {
            style = new CSSStyleDeclaration(selector,styleManager);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.borderStyle = "solid";
               this.borderColor = 16777215;
               this.paddingTop = 5;
               this.backgroundColor = 0;
               this.color = 16777215;
               this.borderSkin = HaloBorder;
               this.fontSize = 12;
            };
         }
         selector = null;
         conditions = null;
         conditions = [];
         condition = new CSSCondition("class","deviceList");
         conditions.push(condition);
         selector = new CSSSelector("spark.components.RadioButton",conditions,selector);
         style = styleManager.getStyleDeclaration("spark.components.RadioButton.deviceList");
         if(!style)
         {
            style = new CSSStyleDeclaration(selector,styleManager);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.labelStyle = "deviceListButtonLabel";
               this.overImage = _embed_css__assets_images_btn_vtgl_selected_png__277531702_1486592893;
               this.selectedLabelStyle = "selectDeviceListButtonLabel";
               this.upImage = _embed_css__assets_images_btn_vtgl_up_png__494668086_10102333;
               this.downImage = _embed_css__assets_images_btn_vtgl_selected_png__277531702_1486592893;
            };
         }
         selector = null;
         conditions = null;
         conditions = [];
         condition = new CSSCondition("class","dialogConnectPortRadioButton");
         conditions.push(condition);
         selector = new CSSSelector("spark.components.RadioButton",conditions,selector);
         style = styleManager.getStyleDeclaration("spark.components.RadioButton.dialogConnectPortRadioButton");
         if(!style)
         {
            style = new CSSStyleDeclaration(selector,styleManager);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.labelStyle = "dialogConnectPortRadioItemLabel";
               this.selectedImage = _embed_css__assets_images_btn_radio_on_up_png__1368029622_686051133;
               this.overImage = _embed_css__assets_images_btn_radio_on_over_png_321209091_1141623704;
               this.upImage = _embed_css__assets_images_btn_radio_off_png__360183362_1357165689;
               this.downImage = _embed_css__assets_images_btn_radio_on_down_png_1219204049_1383777430;
            };
         }
         selector = null;
         conditions = null;
         conditions = [];
         condition = new CSSCondition("class","writePatchNoList");
         conditions.push(condition);
         selector = new CSSSelector("spark.components.RadioButton",conditions,selector);
         style = styleManager.getStyleDeclaration("spark.components.RadioButton.writePatchNoList");
         if(!style)
         {
            style = new CSSStyleDeclaration(selector,styleManager);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.labelStyle = "writePatchNoListButtonLabel";
               this.overImage = _embed_css__assets_images_btn_vtgl_selected_png__277531702_1486592893;
               this.selectedLabelStyle = "selectWritePatchNoListButtonLabel";
               this.upImage = _embed_css__assets_images_btn_vtgl_up_png__494668086_10102333;
               this.downImage = _embed_css__assets_images_btn_vtgl_selected_png__277531702_1486592893;
            };
         }
         selector = null;
         conditions = null;
         conditions = [];
         condition = new CSSCondition("class","settingRadio");
         conditions.push(condition);
         selector = new CSSSelector("spark.components.RadioButton",conditions,selector);
         style = styleManager.getStyleDeclaration("spark.components.RadioButton.settingRadio");
         if(!style)
         {
            style = new CSSStyleDeclaration(selector,styleManager);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.labelStyle = "settingCaption";
               this.selectedImage = _embed_css__assets_images_btn_radio_selected_png_566293570_483932383;
               this.overImage = _embed_css__assets_images_btn_radio_over_png__1228386309_12985786;
               this.upImage = _embed_css__assets_images_btn_radio_up_png__1494781630_615246367;
               this.downImage = _embed_css__assets_images_btn_radio_down_png__330391351_1504693524;
            };
         }
         selector = null;
         conditions = null;
         conditions = [];
         condition = new CSSCondition("class","settingRadioJP");
         conditions.push(condition);
         selector = new CSSSelector("spark.components.RadioButton",conditions,selector);
         style = styleManager.getStyleDeclaration("spark.components.RadioButton.settingRadioJP");
         if(!style)
         {
            style = new CSSStyleDeclaration(selector,styleManager);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.labelStyle = "settingCaptionJP";
               this.selectedImage = _embed_css__assets_images_btn_radio_selected_png_566293570_483932383;
               this.overImage = _embed_css__assets_images_btn_radio_over_png__1228386309_12985786;
               this.upImage = _embed_css__assets_images_btn_radio_up_png__1494781630_615246367;
               this.downImage = _embed_css__assets_images_btn_radio_down_png__330391351_1504693524;
            };
         }
         selector = null;
         conditions = null;
         conditions = [];
         condition = new CSSCondition("class","edit");
         conditions.push(condition);
         selector = new CSSSelector("spark.components.RadioButton",conditions,selector);
         style = styleManager.getStyleDeclaration("spark.components.RadioButton.edit");
         if(!style)
         {
            style = new CSSStyleDeclaration(selector,styleManager);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.labelStyle = "editLibSwitchButtonLabel";
               this.selectedImage = _embed_css__assets_images_btn_tgg_l_selected_png_191496892_614779535;
               this.overImage = _embed_css__assets_images_btn_tgg_l_over_png_2061478773_427628300;
               this.selectedLabelStyle = "selectEditLibSwitchButtonLabel";
               this.upImage = _embed_css__assets_images_btn_tgg_l_up_png_238248764_1671792177;
               this.downImage = _embed_css__assets_images_btn_tgg_l_down_png__1335493565_10455986;
            };
         }
         selector = null;
         conditions = null;
         conditions = [];
         condition = new CSSCondition("class","library");
         conditions.push(condition);
         selector = new CSSSelector("spark.components.RadioButton",conditions,selector);
         style = styleManager.getStyleDeclaration("spark.components.RadioButton.library");
         if(!style)
         {
            style = new CSSStyleDeclaration(selector,styleManager);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.labelStyle = "editLibSwitchButtonLabel";
               this.selectedImage = _embed_css__assets_images_btn_tgg_r_selected_png_1453112438_22132359;
               this.overImage = _embed_css__assets_images_btn_tgg_r_over_png_882397743_1783369314;
               this.selectedLabelStyle = "selectEditLibSwitchButtonLabel";
               this.upImage = _embed_css__assets_images_btn_tgg_r_up_png_2105176182_392604359;
               this.downImage = _embed_css__assets_images_btn_tgg_r_down_png_1780392701_64356020;
            };
         }
         selector = null;
         conditions = null;
         conditions = [];
         condition = new CSSCondition("class","memoryModeStyle");
         conditions.push(condition);
         selector = new CSSSelector("spark.components.RadioButton",conditions,selector);
         style = styleManager.getStyleDeclaration("spark.components.RadioButton.memoryModeStyle");
         if(!style)
         {
            style = new CSSStyleDeclaration(selector,styleManager);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.selectedImage = _embed_css__assets_images_btn_memory_selected_png_128703916_1015210219;
               this.overImage = _embed_css__assets_images_btn_memory_over_png_1554284133_1456543654;
               this.upImage = _embed_css__assets_images_btn_memory_up_png_1810903596_829633237;
               this.downImage = _embed_css__assets_images_btn_memory_down_png__1842688205_338397384;
            };
         }
         selector = null;
         conditions = null;
         conditions = [];
         condition = new CSSCondition("class","manualModeStyle");
         conditions.push(condition);
         selector = new CSSSelector("spark.components.RadioButton",conditions,selector);
         style = styleManager.getStyleDeclaration("spark.components.RadioButton.manualModeStyle");
         if(!style)
         {
            style = new CSSStyleDeclaration(selector,styleManager);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.selectedImage = _embed_css__assets_images_btn_manual_selected_png_530848519_2069810684;
               this.overImage = _embed_css__assets_images_btn_manual_over_png__1494245056_830088855;
               this.upImage = _embed_css__assets_images_btn_manual_up_png_2093764551_1414459900;
               this.downImage = _embed_css__assets_images_btn_manual_down_png__596250098_689857655;
            };
         }
         selector = null;
         conditions = null;
         conditions = [];
         condition = new CSSCondition("class","efectDisp");
         conditions.push(condition);
         selector = new CSSSelector("spark.components.RadioButton",conditions,selector);
         style = styleManager.getStyleDeclaration("spark.components.RadioButton.efectDisp");
         if(!style)
         {
            style = new CSSStyleDeclaration(selector,styleManager);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.labelStyle = "efectDispLabel";
               this.selectedImage = _embed_css__assets_images_effectchain_btn_chainwindow_selected_png__285322645_1830482763;
               this.overImage = _embed_css__assets_images_effectchain_btn_chainwindow_over_png_1354050212_1868806738;
               this.selectedLabelStyle = "efectDispLabel";
               this.upImage = _embed_css__assets_images_effectchain_btn_chainwindow_up_png__1939021269_1587420213;
               this.downImage = _embed_css__assets_images_effectchain_btn_chainwindow_down_png__2042922126_706652592;
            };
         }
         selector = null;
         conditions = null;
         conditions = [];
         condition = new CSSCondition("class","ampSelect");
         conditions.push(condition);
         selector = new CSSSelector("spark.components.RadioButton",conditions,selector);
         style = styleManager.getStyleDeclaration("spark.components.RadioButton.ampSelect");
         if(!style)
         {
            style = new CSSStyleDeclaration(selector,styleManager);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.labelStyle = "efectDispLabel";
               this.selectedImage = _embed_css__assets_images_img_amp_lampon_png__1068568402_827626776;
               this.overImage = _embed_css__assets_images_img_amp_lampoff_png_1054837910_1516238394;
               this.selectedLabelStyle = "efectDispLabel";
               this.upImage = _embed_css__assets_images_img_amp_lampoff_png_1054837910_1516238394;
               this.downImage = _embed_css__assets_images_img_amp_lampoff_png_1054837910_1516238394;
            };
         }
         selector = null;
         conditions = null;
         conditions = [];
         condition = new CSSCondition("class","ctlDetail");
         conditions.push(condition);
         selector = new CSSSelector("spark.components.RadioButton",conditions,selector);
         style = styleManager.getStyleDeclaration("spark.components.RadioButton.ctlDetail");
         if(!style)
         {
            style = new CSSStyleDeclaration(selector,styleManager);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.selectedImage = _embed_css__assets_images_btn_v_mode1_selected_png_359095448_1738862919;
               this.overImage = _embed_css__assets_images_btn_v_mode1_over_png_1835815761_411820660;
               this.upImage = _embed_css__assets_images_btn_v_mode1_up_png_1346392600_842941561;
               this.downImage = _embed_css__assets_images_btn_v_mode1_down_png__1561156577_238235802;
            };
         }
         selector = null;
         conditions = null;
         conditions = [];
         condition = new CSSCondition("class","ctlList");
         conditions.push(condition);
         selector = new CSSSelector("spark.components.RadioButton",conditions,selector);
         style = styleManager.getStyleDeclaration("spark.components.RadioButton.ctlList");
         if(!style)
         {
            style = new CSSStyleDeclaration(selector,styleManager);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.selectedImage = _embed_css__assets_images_btn_v_mode2_selected_png__146463177_2042399774;
               this.overImage = _embed_css__assets_images_btn_v_mode2_over_png_1639302256_873869137;
               this.upImage = _embed_css__assets_images_btn_v_mode2_up_png__1205764361_367184738;
               this.downImage = _embed_css__assets_images_btn_v_mode2_down_png__1757670082_228499651;
            };
         }
         selector = null;
         conditions = null;
         conditions = [];
         condition = new CSSCondition("class","ctlRadio");
         conditions.push(condition);
         selector = new CSSSelector("spark.components.RadioButton",conditions,selector);
         style = styleManager.getStyleDeclaration("spark.components.RadioButton.ctlRadio");
         if(!style)
         {
            style = new CSSStyleDeclaration(selector,styleManager);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.labelStyle = "ctlCaption";
               this.selectedImage = _embed_css__assets_images_btn_radio_selected_png_566293570_483932383;
               this.overImage = _embed_css__assets_images_btn_radio_over_png__1228386309_12985786;
               this.upImage = _embed_css__assets_images_btn_radio_up_png__1494781630_615246367;
               this.downImage = _embed_css__assets_images_btn_radio_down_png__330391351_1504693524;
            };
         }
         selector = null;
         conditions = null;
         conditions = [];
         condition = new CSSCondition("class","customRadioBtn");
         conditions.push(condition);
         selector = new CSSSelector("spark.components.RadioButton",conditions,selector);
         style = styleManager.getStyleDeclaration("spark.components.RadioButton.customRadioBtn");
         if(!style)
         {
            style = new CSSStyleDeclaration(selector,styleManager);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.labelStyle = "customRadioBtnLabel";
               this.selectedImage = _embed_css__assets_images_btn_vradio_selected_png__914998296_1721111199;
               this.overImage = _embed_css__assets_images_btn_vradio_over_png__1276159327_846869562;
               this.upImage = _embed_css__assets_images_btn_vradio_up_png_1937567080_1501206561;
               this.downImage = _embed_css__assets_images_btn_vradio_down_png__378164369_605804372;
            };
         }
         selector = null;
         conditions = null;
         conditions = [];
         condition = new CSSCondition("class","effectSwSquare");
         conditions.push(condition);
         selector = new CSSSelector("spark.components.RadioButton",conditions,selector);
         style = styleManager.getStyleDeclaration("spark.components.RadioButton.effectSwSquare");
         if(!style)
         {
            style = new CSSStyleDeclaration(selector,styleManager);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.selectedImage = _embed_css__assets_images_effectchain_btn_lampon_sq_png__1276743174_1587106643;
               this.overImage = _embed_css__assets_images_effectchain_btn_lampoff_sq_png__487862648_2043212969;
               this.upImage = _embed_css__assets_images_effectchain_btn_lampoff_sq_png__487862648_2043212969;
               this.downImage = _embed_css__assets_images_effectchain_btn_lampon_sq_png__1276743174_1587106643;
            };
         }
         selector = null;
         conditions = null;
         conditions = [];
         condition = new CSSCondition("class","recBt");
         conditions.push(condition);
         selector = new CSSSelector("spark.components.RadioButton",conditions,selector);
         style = styleManager.getStyleDeclaration("spark.components.RadioButton.recBt");
         if(!style)
         {
            style = new CSSStyleDeclaration(selector,styleManager);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.labelStyle = "playMenuButtonLabel";
               this.selectedImage = _embed_css__assets_images_btn_vtgl_selected_png__277531702_1158767127;
               this.overImage = _embed_css__assets_images_btn_vtgl_selected_png__277531702_1158767127;
               this.selectedLabelStyle = "selectPlayMenuButtonLabel";
               this.upImage = _embed_css__assets_images_btn_vtgl_up_png__494668086_317723433;
               this.downImage = _embed_css__assets_images_btn_vtgl_selected_png__277531702_1158767127;
            };
         }
         selector = null;
         conditions = null;
         conditions = [];
         condition = new CSSCondition("class","noRepeatRadio");
         conditions.push(condition);
         selector = new CSSSelector("spark.components.RadioButton",conditions,selector);
         style = styleManager.getStyleDeclaration("spark.components.RadioButton.noRepeatRadio");
         if(!style)
         {
            style = new CSSStyleDeclaration(selector,styleManager);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.selectedImage = _embed_css__assets_images_player_btn_re1_sele_selected_png__1621574403_992130168;
               this.overImage = _embed_css__assets_images_player_btn_re1_sele_over_png_2013244982_302618981;
               this.upImage = _embed_css__assets_images_player_btn_re1_sele_up_png__2126044611_536149624;
               this.downImage = _embed_css__assets_images_player_btn_re1_sele_down_png__1383727356_757011475;
            };
         }
         selector = null;
         conditions = null;
         conditions = [];
         condition = new CSSCondition("class","abRepeatRadio");
         conditions.push(condition);
         selector = new CSSSelector("spark.components.RadioButton",conditions,selector);
         style = styleManager.getStyleDeclaration("spark.components.RadioButton.abRepeatRadio");
         if(!style)
         {
            style = new CSSStyleDeclaration(selector,styleManager);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.selectedImage = _embed_css__assets_images_player_btn_re2_sele_selected_png_1828921022_765006397;
               this.overImage = _embed_css__assets_images_player_btn_re2_sele_over_png__774170505_1620496290;
               this.upImage = _embed_css__assets_images_player_btn_re2_sele_up_png_1875519678_494926845;
               this.downImage = _embed_css__assets_images_player_btn_re2_sele_down_png_123824453_1026761136;
            };
         }
         selector = null;
         conditions = null;
         conditions = [];
         condition = new CSSCondition("class","oneRepeatRadio");
         conditions.push(condition);
         selector = new CSSSelector("spark.components.RadioButton",conditions,selector);
         style = styleManager.getStyleDeclaration("spark.components.RadioButton.oneRepeatRadio");
         if(!style)
         {
            style = new CSSStyleDeclaration(selector,styleManager);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.selectedImage = _embed_css__assets_images_player_btn_re3_sele_selected_png_984449151_671339770;
               this.overImage = _embed_css__assets_images_player_btn_re3_sele_over_png_733381304_1229885209;
               this.upImage = _embed_css__assets_images_player_btn_re3_sele_up_png_1582116671_720559482;
               this.downImage = _embed_css__assets_images_player_btn_re3_sele_down_png_1631376262_783679595;
            };
         }
         selector = null;
         conditions = null;
         conditions = [];
         condition = new CSSCondition("class","allRepeatRadio");
         conditions.push(condition);
         selector = new CSSSelector("spark.components.RadioButton",conditions,selector);
         style = styleManager.getStyleDeclaration("spark.components.RadioButton.allRepeatRadio");
         if(!style)
         {
            style = new CSSStyleDeclaration(selector,styleManager);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.selectedImage = _embed_css__assets_images_player_btn_re4_sele_selected_png_139977280_368951007;
               this.overImage = _embed_css__assets_images_player_btn_re4_sele_over_png__2054034183_626744100;
               this.upImage = _embed_css__assets_images_player_btn_re4_sele_up_png_1288713664_1016449823;
               this.downImage = _embed_css__assets_images_player_btn_re4_sele_down_png__1156039225_1742465490;
            };
         }
         selector = null;
         conditions = null;
         conditions = [];
         condition = new CSSCondition("class","strateRepeatRadio");
         conditions.push(condition);
         selector = new CSSSelector("spark.components.RadioButton",conditions,selector);
         style = styleManager.getStyleDeclaration("spark.components.RadioButton.strateRepeatRadio");
         if(!style)
         {
            style = new CSSStyleDeclaration(selector,styleManager);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.selectedImage = _embed_css__assets_images_player_btn_re5_sele_selected_png__704494591_1734598500;
               this.overImage = _embed_css__assets_images_player_btn_re5_sele_over_png__546482374_978881641;
               this.upImage = _embed_css__assets_images_player_btn_re5_sele_up_png_995310657_701450084;
               this.downImage = _embed_css__assets_images_player_btn_re5_sele_down_png_351512584_1795316969;
            };
         }
         selector = null;
         conditions = null;
         conditions = [];
         condition = new CSSCondition("class","tagButton");
         conditions.push(condition);
         selector = new CSSSelector("spark.components.RadioButton",conditions,selector);
         style = styleManager.getStyleDeclaration("spark.components.RadioButton.tagButton");
         if(!style)
         {
            style = new CSSStyleDeclaration(selector,styleManager);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.labelStyle = "tagButtonLabel";
               this.selectedImage = _embed_css__assets_images_tonecentral_btn_sebtn_selected_png_823468575_1825642497;
               this.overImage = _embed_css__assets_images_tonecentral_btn_sebtn_over_png_1701835864_255213676;
               this.selectedLabelStyle = "tagButtonLabel";
               this.upImage = _embed_css__assets_images_tonecentral_btn_sebtn_up_png__1661564705_276546943;
               this.downImage = _embed_css__assets_images_tonecentral_btn_sebtn_down_png__1695136474_838192922;
            };
         }
         selector = null;
         conditions = null;
         conditions = [];
         condition = new CSSCondition("class","pagingLeftButton");
         conditions.push(condition);
         selector = new CSSSelector("spark.components.RadioButton",conditions,selector);
         style = styleManager.getStyleDeclaration("spark.components.RadioButton.pagingLeftButton");
         if(!style)
         {
            style = new CSSStyleDeclaration(selector,styleManager);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.labelStyle = "pagingButtonLabel";
               this.selectedImage = _embed_css__assets_images_btn_pageing_left_selected_png_2062171162_522771866;
               this.overImage = _embed_css__assets_images_btn_pageing_left_selected_png_2062171162_522771866;
               this.selectedLabelStyle = "pagingButtonLabel";
               this.upImage = _embed_css__assets_images_btn_pageing_left_up_png_1262058266_733408986;
               this.downImage = _embed_css__assets_images_btn_pageing_left_selected_png_2062171162_522771866;
            };
         }
         selector = null;
         conditions = null;
         conditions = [];
         condition = new CSSCondition("class","pagingCenterButton");
         conditions.push(condition);
         selector = new CSSSelector("spark.components.RadioButton",conditions,selector);
         style = styleManager.getStyleDeclaration("spark.components.RadioButton.pagingCenterButton");
         if(!style)
         {
            style = new CSSStyleDeclaration(selector,styleManager);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.labelStyle = "pagingButtonLabel";
               this.selectedImage = _embed_css__assets_images_btn_pageing_center_selected_png_1307937676_739982108;
               this.overImage = _embed_css__assets_images_btn_pageing_center_selected_png_1307937676_739982108;
               this.selectedLabelStyle = "pagingButtonLabel";
               this.upImage = _embed_css__assets_images_btn_pageing_center_up_png__553007092_1160997596;
               this.downImage = _embed_css__assets_images_btn_pageing_center_selected_png_1307937676_739982108;
            };
         }
         selector = null;
         conditions = null;
         conditions = [];
         condition = new CSSCondition("class","pagingRightButton");
         conditions.push(condition);
         selector = new CSSSelector("spark.components.RadioButton",conditions,selector);
         style = styleManager.getStyleDeclaration("spark.components.RadioButton.pagingRightButton");
         if(!style)
         {
            style = new CSSStyleDeclaration(selector,styleManager);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.labelStyle = "pagingButtonLabel";
               this.selectedImage = _embed_css__assets_images_btn_pageing_right_selected_png__1194825587_334161423;
               this.overImage = _embed_css__assets_images_btn_pageing_right_selected_png__1194825587_334161423;
               this.selectedLabelStyle = "pagingButtonLabel";
               this.upImage = _embed_css__assets_images_btn_pageing_right_up_png__1534936627_757007631;
               this.downImage = _embed_css__assets_images_btn_pageing_right_selected_png__1194825587_334161423;
            };
         }
         selector = null;
         conditions = null;
         conditions = [];
         condition = new CSSCondition("class","tabButton");
         conditions.push(condition);
         selector = new CSSSelector("spark.components.RadioButton",conditions,selector);
         style = styleManager.getStyleDeclaration("spark.components.RadioButton.tabButton");
         if(!style)
         {
            style = new CSSStyleDeclaration(selector,styleManager);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.labelStyle = "tabLabel";
               this.selectedImage = _embed_css__assets_images_btn_tab_selected_png__1307058968_319671682;
               this.overImage = _embed_css__assets_images_btn_tab_over_png__1467384927_38296775;
               this.selectedLabelStyle = "tabLabel";
               this.upImage = _embed_css__assets_images_btn_tab_up_png_1512787560_391796674;
               this.downImage = _embed_css__assets_images_btn_tab_down_png__569389969_213316757;
            };
         }
         selector = null;
         conditions = null;
         conditions = [];
         condition = new CSSCondition("class","chainSelectDisp");
         conditions.push(condition);
         selector = new CSSSelector("spark.components.RadioButton",conditions,selector);
         style = styleManager.getStyleDeclaration("spark.components.RadioButton.chainSelectDisp");
         if(!style)
         {
            style = new CSSStyleDeclaration(selector,styleManager);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.selectedImage = _embed_css__assets_images_btn_vtgl_up_png__494668086_317723425;
               this.overImage = _embed_css__assets_images_btn_vtgl_over_png_2103022467_1737410246;
               this.upImage = _embed_css__assets_images_btn_vtgl_up_png__494668086_317723425;
               this.downImage = _embed_css__assets_images_btn_vtgl_down_png__1293949871_1440489740;
            };
         }
         selector = null;
         conditions = null;
         conditions = [];
         condition = new CSSCondition("class","dialogConnectPortTitleLabel");
         conditions.push(condition);
         selector = new CSSSelector("spark.components.Label",conditions,selector);
         style = styleManager.getStyleDeclaration("spark.components.Label.dialogConnectPortTitleLabel");
         if(!style)
         {
            style = new CSSStyleDeclaration(selector,styleManager);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.color = 9430271;
               this.fontFamily = "Helvetica67-CondensedMedium";
               this.fontSize = 24;
            };
         }
         selector = null;
         conditions = null;
         conditions = [];
         condition = new CSSCondition("class","dialogConnectPortItemLabel");
         conditions.push(condition);
         selector = new CSSSelector("spark.components.Label",conditions,selector);
         style = styleManager.getStyleDeclaration("spark.components.Label.dialogConnectPortItemLabel");
         if(!style)
         {
            style = new CSSStyleDeclaration(selector,styleManager);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.color = 9430271;
               this.fontFamily = "Helvetica67-CondensedMedium";
               this.fontSize = 16;
            };
         }
         selector = null;
         conditions = null;
         conditions = [];
         condition = new CSSCondition("class","dialogConnectPortRadioItemLabel");
         conditions.push(condition);
         selector = new CSSSelector("spark.components.Label",conditions,selector);
         style = styleManager.getStyleDeclaration("spark.components.Label.dialogConnectPortRadioItemLabel");
         if(!style)
         {
            style = new CSSStyleDeclaration(selector,styleManager);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.color = 9430271;
               this.fontFamily = "A-OTF 新ゴ Pro R";
               this.fontSize = 11;
            };
         }
         selector = null;
         conditions = null;
         conditions = [];
         condition = new CSSCondition("class","libraryItemRendererLabel");
         conditions.push(condition);
         selector = new CSSSelector("spark.components.Label",conditions,selector);
         style = styleManager.getStyleDeclaration("spark.components.Label.libraryItemRendererLabel");
         if(!style)
         {
            style = new CSSStyleDeclaration(selector,styleManager);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.color = "#FFFFFF";
            };
         }
         selector = null;
         conditions = null;
         conditions = [];
         condition = new CSSCondition("class","pagingButtonLabel");
         conditions.push(condition);
         selector = new CSSSelector("spark.components.Label",conditions,selector);
         style = styleManager.getStyleDeclaration("spark.components.Label.pagingButtonLabel");
         if(!style)
         {
            style = new CSSStyleDeclaration(selector,styleManager);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.color = 10480127;
               this.fontSize = 13;
            };
         }
         selector = null;
         conditions = null;
         conditions = [];
         condition = new CSSCondition("class","editLiveSetName");
         conditions.push(condition);
         selector = new CSSSelector("spark.components.Label",conditions,selector);
         style = styleManager.getStyleDeclaration("spark.components.Label.editLiveSetName");
         if(!style)
         {
            style = new CSSStyleDeclaration(selector,styleManager);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.color = 16777215;
               this.fontSize = 15;
            };
         }
         selector = null;
         conditions = null;
         conditions = [];
         condition = new CSSCondition("class","LibEditLabel");
         conditions.push(condition);
         selector = new CSSSelector("spark.components.Label",conditions,selector);
         style = styleManager.getStyleDeclaration("spark.components.Label.LibEditLabel");
         if(!style)
         {
            style = new CSSStyleDeclaration(selector,styleManager);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.color = 13553358;
               this.fontFamily = "Helvetica67-CondensedMedium";
               this.fontSize = 14;
            };
         }
         selector = null;
         conditions = null;
         conditions = [];
         condition = new CSSCondition("class","LibEditNoteLabel");
         conditions.push(condition);
         selector = new CSSSelector("spark.components.Label",conditions,selector);
         style = styleManager.getStyleDeclaration("spark.components.Label.LibEditNoteLabel");
         if(!style)
         {
            style = new CSSStyleDeclaration(selector,styleManager);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.color = 10594472;
               this.fontFamily = "Helvetica67-CondensedMedium";
               this.fontSize = 10;
            };
         }
         selector = null;
         conditions = null;
         conditions = [];
         condition = new CSSCondition("class","LibEditNoteLabelJP");
         conditions.push(condition);
         selector = new CSSSelector("spark.components.Label",conditions,selector);
         style = styleManager.getStyleDeclaration("spark.components.Label.LibEditNoteLabelJP");
         if(!style)
         {
            style = new CSSStyleDeclaration(selector,styleManager);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.color = 10594472;
               this.fontFamily = "A-OTF 新ゴ Pro R";
               this.fontSize = 10;
            };
         }
         selector = null;
         conditions = null;
         conditions = [];
         condition = new CSSCondition("class","LibEditTitleLabel");
         conditions.push(condition);
         selector = new CSSSelector("spark.components.Label",conditions,selector);
         style = styleManager.getStyleDeclaration("spark.components.Label.LibEditTitleLabel");
         if(!style)
         {
            style = new CSSStyleDeclaration(selector,styleManager);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.color = 16777215;
               this.fontFamily = "Helvetica67-CondensedMedium";
               this.fontSize = 16;
            };
         }
         selector = null;
         conditions = null;
         conditions = [];
         condition = new CSSCondition("class","libEditTitleLabel");
         conditions.push(condition);
         selector = new CSSSelector("spark.components.Label",conditions,selector);
         style = styleManager.getStyleDeclaration("spark.components.Label.libEditTitleLabel");
         if(!style)
         {
            style = new CSSStyleDeclaration(selector,styleManager);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.color = 9430271;
               this.fontFamily = "Helvetica67-CondensedMedium";
               this.fontSize = 24;
            };
         }
         selector = null;
         conditions = null;
         conditions = [];
         condition = new CSSCondition("class","dialogCheckBoxLabel");
         conditions.push(condition);
         selector = new CSSSelector("spark.components.Label",conditions,selector);
         style = styleManager.getStyleDeclaration("spark.components.Label.dialogCheckBoxLabel");
         if(!style)
         {
            style = new CSSStyleDeclaration(selector,styleManager);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.color = 11119017;
               this.fontFamily = "A-OTF 新ゴ Pro R";
               this.fontSize = 12;
            };
         }
         selector = null;
         conditions = null;
         conditions = [];
         condition = new CSSCondition("class","disconnectLabelStyle");
         conditions.push(condition);
         selector = new CSSSelector("spark.components.Label",conditions,selector);
         style = styleManager.getStyleDeclaration("spark.components.Label.disconnectLabelStyle");
         if(!style)
         {
            style = new CSSStyleDeclaration(selector,styleManager);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.color = 3355443;
               this.fontFamily = "Helvetica67-CondensedMedium";
               this.fontSize = 14;
            };
         }
         selector = null;
         conditions = null;
         conditions = [];
         condition = new CSSCondition("class","effectDetailEffectName");
         conditions.push(condition);
         selector = new CSSSelector("spark.components.Label",conditions,selector);
         style = styleManager.getStyleDeclaration("spark.components.Label.effectDetailEffectName");
         if(!style)
         {
            style = new CSSStyleDeclaration(selector,styleManager);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.color = 9430271;
               this.fontSize = 16;
            };
         }
         selector = null;
         conditions = null;
         conditions = [];
         condition = new CSSCondition("class","editorListEffectType");
         conditions.push(condition);
         selector = new CSSSelector("spark.components.Label",conditions,selector);
         style = styleManager.getStyleDeclaration("spark.components.Label.editorListEffectType");
         if(!style)
         {
            style = new CSSStyleDeclaration(selector,styleManager);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.color = 9430271;
               this.fontSize = 14;
            };
         }
         selector = null;
         conditions = null;
         conditions = null;
         selector = new CSSSelector("spark.components.Label",conditions,selector);
         style = styleManager.getStyleDeclaration("spark.components.Label");
         if(!style)
         {
            style = new CSSStyleDeclaration(selector,styleManager);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.fontFamily = "Helvetica67-CondensedMedium";
            };
         }
         selector = null;
         conditions = null;
         conditions = [];
         condition = new CSSCondition("class","loadingLabel");
         conditions.push(condition);
         selector = new CSSSelector("spark.components.Label",conditions,selector);
         style = styleManager.getStyleDeclaration("spark.components.Label.loadingLabel");
         if(!style)
         {
            style = new CSSStyleDeclaration(selector,styleManager);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.color = 13421772;
               this.fontSize = 18;
            };
         }
         selector = null;
         conditions = null;
         conditions = [];
         condition = new CSSCondition("class","headerParamName");
         conditions.push(condition);
         selector = new CSSSelector("spark.components.Label",conditions,selector);
         style = styleManager.getStyleDeclaration("spark.components.Label.headerParamName");
         if(!style)
         {
            style = new CSSStyleDeclaration(selector,styleManager);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.color = 16777215;
               this.textAlign = "right";
               this.fontFamily = "Helvetica67-CondensedMedium";
               this.fontSize = 14;
            };
         }
         selector = null;
         conditions = null;
         conditions = [];
         condition = new CSSCondition("class","dialogButtonLabel");
         conditions.push(condition);
         selector = new CSSSelector("spark.components.Label",conditions,selector);
         style = styleManager.getStyleDeclaration("spark.components.Label.dialogButtonLabel");
         if(!style)
         {
            style = new CSSStyleDeclaration(selector,styleManager);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.color = 16777215;
               this.fontSize = 13;
            };
         }
         selector = null;
         conditions = null;
         conditions = [];
         condition = new CSSCondition("class","dialogTitleLabel");
         conditions.push(condition);
         selector = new CSSSelector("spark.components.Label",conditions,selector);
         style = styleManager.getStyleDeclaration("spark.components.Label.dialogTitleLabel");
         if(!style)
         {
            style = new CSSStyleDeclaration(selector,styleManager);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.color = 16777215;
               this.fontSize = 18;
            };
         }
         selector = null;
         conditions = null;
         conditions = [];
         condition = new CSSCondition("class","dialogMsgLabel");
         conditions.push(condition);
         selector = new CSSSelector("spark.components.Label",conditions,selector);
         style = styleManager.getStyleDeclaration("spark.components.Label.dialogMsgLabel");
         if(!style)
         {
            style = new CSSStyleDeclaration(selector,styleManager);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.color = 16777215;
               this.fontSize = 14;
            };
         }
         selector = null;
         conditions = null;
         conditions = [];
         condition = new CSSCondition("class","dialogTitleLabelJP");
         conditions.push(condition);
         selector = new CSSSelector("spark.components.Label",conditions,selector);
         style = styleManager.getStyleDeclaration("spark.components.Label.dialogTitleLabelJP");
         if(!style)
         {
            style = new CSSStyleDeclaration(selector,styleManager);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.color = 16777215;
               this.fontFamily = "A-OTF 新ゴ Pro R";
               this.fontSize = 14;
            };
         }
         selector = null;
         conditions = null;
         conditions = [];
         condition = new CSSCondition("class","dialogMsgLabelJP");
         conditions.push(condition);
         selector = new CSSSelector("spark.components.Label",conditions,selector);
         style = styleManager.getStyleDeclaration("spark.components.Label.dialogMsgLabelJP");
         if(!style)
         {
            style = new CSSStyleDeclaration(selector,styleManager);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.color = 16777215;
               this.fontFamily = "A-OTF 新ゴ Pro R";
               this.fontSize = 12;
            };
         }
         selector = null;
         conditions = null;
         conditions = [];
         condition = new CSSCondition("class","dialogTitleLabel2");
         conditions.push(condition);
         selector = new CSSSelector("spark.components.Label",conditions,selector);
         style = styleManager.getStyleDeclaration("spark.components.Label.dialogTitleLabel2");
         if(!style)
         {
            style = new CSSStyleDeclaration(selector,styleManager);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.color = 16777215;
               this.fontSize = 16;
            };
         }
         selector = null;
         conditions = null;
         conditions = [];
         condition = new CSSCondition("class","dialogMsgLabel2");
         conditions.push(condition);
         selector = new CSSSelector("spark.components.Label",conditions,selector);
         style = styleManager.getStyleDeclaration("spark.components.Label.dialogMsgLabel2");
         if(!style)
         {
            style = new CSSStyleDeclaration(selector,styleManager);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.color = 11119017;
               this.fontSize = 14;
            };
         }
         selector = null;
         conditions = null;
         conditions = [];
         condition = new CSSCondition("class","dialogTitleLabelJP2");
         conditions.push(condition);
         selector = new CSSSelector("spark.components.Label",conditions,selector);
         style = styleManager.getStyleDeclaration("spark.components.Label.dialogTitleLabelJP2");
         if(!style)
         {
            style = new CSSStyleDeclaration(selector,styleManager);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.color = 16777215;
               this.fontFamily = "A-OTF 新ゴ Pro R";
               this.fontSize = 14;
            };
         }
         selector = null;
         conditions = null;
         conditions = [];
         condition = new CSSCondition("class","dialogMsgLabelJP2");
         conditions.push(condition);
         selector = new CSSSelector("spark.components.Label",conditions,selector);
         style = styleManager.getStyleDeclaration("spark.components.Label.dialogMsgLabelJP2");
         if(!style)
         {
            style = new CSSStyleDeclaration(selector,styleManager);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.lineHeight = 17;
               this.color = 11119017;
               this.fontFamily = "A-OTF 新ゴ Pro R";
               this.fontSize = 12;
            };
         }
         selector = null;
         conditions = null;
         conditions = [];
         condition = new CSSCondition("class","dialogMsgLabel3");
         conditions.push(condition);
         selector = new CSSSelector("spark.components.Label",conditions,selector);
         style = styleManager.getStyleDeclaration("spark.components.Label.dialogMsgLabel3");
         if(!style)
         {
            style = new CSSStyleDeclaration(selector,styleManager);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.color = 2960685;
               this.fontSize = 14;
            };
         }
         selector = null;
         conditions = null;
         conditions = [];
         condition = new CSSCondition("class","dialogMsgLabelJP3");
         conditions.push(condition);
         selector = new CSSSelector("spark.components.Label",conditions,selector);
         style = styleManager.getStyleDeclaration("spark.components.Label.dialogMsgLabelJP3");
         if(!style)
         {
            style = new CSSStyleDeclaration(selector,styleManager);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.color = 2960685;
               this.fontFamily = "A-OTF 新ゴ Pro R";
               this.fontSize = 12;
            };
         }
         selector = null;
         conditions = null;
         conditions = [];
         condition = new CSSCondition("class","manualUpdateTxt");
         conditions.push(condition);
         selector = new CSSSelector("spark.components.Label",conditions,selector);
         style = styleManager.getStyleDeclaration("spark.components.Label.manualUpdateTxt");
         if(!style)
         {
            style = new CSSStyleDeclaration(selector,styleManager);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.color = 11119017;
               this.fontSize = 16;
            };
         }
         selector = null;
         conditions = null;
         conditions = [];
         condition = new CSSCondition("class","modalNotconnectedDeviceMsg");
         conditions.push(condition);
         selector = new CSSSelector("spark.components.Label",conditions,selector);
         style = styleManager.getStyleDeclaration("spark.components.Label.modalNotconnectedDeviceMsg");
         if(!style)
         {
            style = new CSSStyleDeclaration(selector,styleManager);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.color = 16777215;
               this.fontSize = 20;
            };
         }
         selector = null;
         conditions = null;
         conditions = [];
         condition = new CSSCondition("class","modalNotconnectedDeviceMsgJP");
         conditions.push(condition);
         selector = new CSSSelector("spark.components.Label",conditions,selector);
         style = styleManager.getStyleDeclaration("spark.components.Label.modalNotconnectedDeviceMsgJP");
         if(!style)
         {
            style = new CSSStyleDeclaration(selector,styleManager);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.color = 16777215;
               this.fontFamily = "A-OTF 新ゴ Pro R";
               this.fontSize = 20;
            };
         }
         selector = null;
         conditions = null;
         conditions = [];
         condition = new CSSCondition("class","modalNotconnectedDeviceSubMsg");
         conditions.push(condition);
         selector = new CSSSelector("spark.components.Label",conditions,selector);
         style = styleManager.getStyleDeclaration("spark.components.Label.modalNotconnectedDeviceSubMsg");
         if(!style)
         {
            style = new CSSStyleDeclaration(selector,styleManager);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.color = 11119017;
               this.fontSize = 16;
            };
         }
         selector = null;
         conditions = null;
         conditions = [];
         condition = new CSSCondition("class","modalNotconnectedDeviceSubMsgJP");
         conditions.push(condition);
         selector = new CSSSelector("spark.components.Label",conditions,selector);
         style = styleManager.getStyleDeclaration("spark.components.Label.modalNotconnectedDeviceSubMsgJP");
         if(!style)
         {
            style = new CSSStyleDeclaration(selector,styleManager);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.color = 11119017;
               this.fontFamily = "A-OTF 新ゴ Pro R";
               this.fontSize = 16;
            };
         }
         selector = null;
         conditions = null;
         conditions = [];
         condition = new CSSCondition("class","modalNotconnectedDeviceButtonLabel");
         conditions.push(condition);
         selector = new CSSSelector("spark.components.Label",conditions,selector);
         style = styleManager.getStyleDeclaration("spark.components.Label.modalNotconnectedDeviceButtonLabel");
         if(!style)
         {
            style = new CSSStyleDeclaration(selector,styleManager);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.color = 16777215;
               this.fontSize = 16;
            };
         }
         selector = null;
         conditions = null;
         conditions = [];
         condition = new CSSCondition("class","modalNotconnectedDeviceButtonLabelJP");
         conditions.push(condition);
         selector = new CSSSelector("spark.components.Label",conditions,selector);
         style = styleManager.getStyleDeclaration("spark.components.Label.modalNotconnectedDeviceButtonLabelJP");
         if(!style)
         {
            style = new CSSStyleDeclaration(selector,styleManager);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.color = 16777215;
               this.fontFamily = "A-OTF 新ゴ Pro R";
               this.fontSize = 14;
            };
         }
         selector = null;
         conditions = null;
         conditions = [];
         condition = new CSSCondition("class","modalLoadfaultTCMsg");
         conditions.push(condition);
         selector = new CSSSelector("spark.components.Label",conditions,selector);
         style = styleManager.getStyleDeclaration("spark.components.Label.modalLoadfaultTCMsg");
         if(!style)
         {
            style = new CSSStyleDeclaration(selector,styleManager);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.color = 16777215;
               this.fontSize = 20;
            };
         }
         selector = null;
         conditions = null;
         conditions = [];
         condition = new CSSCondition("class","modalLoadfaultTCMsgJP");
         conditions.push(condition);
         selector = new CSSSelector("spark.components.Label",conditions,selector);
         style = styleManager.getStyleDeclaration("spark.components.Label.modalLoadfaultTCMsgJP");
         if(!style)
         {
            style = new CSSStyleDeclaration(selector,styleManager);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.color = 16777215;
               this.fontFamily = "A-OTF 新ゴ Pro R";
               this.fontSize = 20;
            };
         }
         selector = null;
         conditions = null;
         conditions = [];
         condition = new CSSCondition("class","modalLoadfaultTCSubMsg");
         conditions.push(condition);
         selector = new CSSSelector("spark.components.Label",conditions,selector);
         style = styleManager.getStyleDeclaration("spark.components.Label.modalLoadfaultTCSubMsg");
         if(!style)
         {
            style = new CSSStyleDeclaration(selector,styleManager);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.color = 11119017;
               this.fontSize = 16;
            };
         }
         selector = null;
         conditions = null;
         conditions = [];
         condition = new CSSCondition("class","modalLoadfaultTCSubMsgJP");
         conditions.push(condition);
         selector = new CSSSelector("spark.components.Label",conditions,selector);
         style = styleManager.getStyleDeclaration("spark.components.Label.modalLoadfaultTCSubMsgJP");
         if(!style)
         {
            style = new CSSStyleDeclaration(selector,styleManager);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.color = 11119017;
               this.fontFamily = "A-OTF 新ゴ Pro R";
               this.fontSize = 16;
            };
         }
         selector = null;
         conditions = null;
         conditions = [];
         condition = new CSSCondition("class","modalLoadfaultTCButtonLabel");
         conditions.push(condition);
         selector = new CSSSelector("spark.components.Label",conditions,selector);
         style = styleManager.getStyleDeclaration("spark.components.Label.modalLoadfaultTCButtonLabel");
         if(!style)
         {
            style = new CSSStyleDeclaration(selector,styleManager);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.color = 16777215;
               this.fontSize = 16;
            };
         }
         selector = null;
         conditions = null;
         conditions = [];
         condition = new CSSCondition("class","manualButtonLabel");
         conditions.push(condition);
         selector = new CSSSelector("spark.components.Label",conditions,selector);
         style = styleManager.getStyleDeclaration("spark.components.Label.manualButtonLabel");
         if(!style)
         {
            style = new CSSStyleDeclaration(selector,styleManager);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.color = 16777215;
               this.fontSize = 12;
            };
         }
         selector = null;
         conditions = null;
         conditions = [];
         condition = new CSSCondition("class","manualButtonLabelJP");
         conditions.push(condition);
         selector = new CSSSelector("spark.components.Label",conditions,selector);
         style = styleManager.getStyleDeclaration("spark.components.Label.manualButtonLabelJP");
         if(!style)
         {
            style = new CSSStyleDeclaration(selector,styleManager);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.color = 16777215;
               this.fontFamily = "A-OTF 新ゴ Pro R";
               this.fontSize = 12;
            };
         }
         selector = null;
         conditions = null;
         conditions = [];
         condition = new CSSCondition("class","dialogMsgLabelSelectedJP");
         conditions.push(condition);
         selector = new CSSSelector("spark.components.Label",conditions,selector);
         style = styleManager.getStyleDeclaration("spark.components.Label.dialogMsgLabelSelectedJP");
         if(!style)
         {
            style = new CSSStyleDeclaration(selector,styleManager);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.color = 10480127;
               this.fontFamily = "A-OTF 新ゴ Pro R";
               this.fontSize = 12;
            };
         }
         selector = null;
         conditions = null;
         conditions = [];
         condition = new CSSCondition("class","dialogMsgLabelSelected");
         conditions.push(condition);
         selector = new CSSSelector("spark.components.Label",conditions,selector);
         style = styleManager.getStyleDeclaration("spark.components.Label.dialogMsgLabelSelected");
         if(!style)
         {
            style = new CSSStyleDeclaration(selector,styleManager);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.color = 10480127;
               this.fontSize = 12;
            };
         }
         selector = null;
         conditions = null;
         conditions = [];
         condition = new CSSCondition("class","deviceListButtonLabel");
         conditions.push(condition);
         selector = new CSSSelector("spark.components.Label",conditions,selector);
         style = styleManager.getStyleDeclaration("spark.components.Label.deviceListButtonLabel");
         if(!style)
         {
            style = new CSSStyleDeclaration(selector,styleManager);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.color = 16777215;
               this.fontSize = 13;
            };
         }
         selector = null;
         conditions = null;
         conditions = [];
         condition = new CSSCondition("class","selectDeviceListButtonLabel");
         conditions.push(condition);
         selector = new CSSSelector("spark.components.Label",conditions,selector);
         style = styleManager.getStyleDeclaration("spark.components.Label.selectDeviceListButtonLabel");
         if(!style)
         {
            style = new CSSStyleDeclaration(selector,styleManager);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.color = 9430271;
               this.fontSize = 13;
            };
         }
         selector = null;
         conditions = null;
         conditions = [];
         condition = new CSSCondition("class","notFindDeviceError");
         conditions.push(condition);
         selector = new CSSSelector("spark.components.Label",conditions,selector);
         style = styleManager.getStyleDeclaration("spark.components.Label.notFindDeviceError");
         if(!style)
         {
            style = new CSSStyleDeclaration(selector,styleManager);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.color = 16777215;
               this.textAlign = "center";
               this.fontSize = 13;
            };
         }
         selector = null;
         conditions = null;
         conditions = [];
         condition = new CSSCondition("class","settingMenuLabelJP");
         conditions.push(condition);
         selector = new CSSSelector("spark.components.Label",conditions,selector);
         style = styleManager.getStyleDeclaration("spark.components.Label.settingMenuLabelJP");
         if(!style)
         {
            style = new CSSStyleDeclaration(selector,styleManager);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.color = 16777215;
               this.fontFamily = "A-OTF 新ゴ Pro R";
               this.fontSize = 12;
            };
         }
         selector = null;
         conditions = null;
         conditions = [];
         condition = new CSSCondition("class","settingMenuLabelSelectedJP");
         conditions.push(condition);
         selector = new CSSSelector("spark.components.Label",conditions,selector);
         style = styleManager.getStyleDeclaration("spark.components.Label.settingMenuLabelSelectedJP");
         if(!style)
         {
            style = new CSSStyleDeclaration(selector,styleManager);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.color = 10480127;
               this.fontFamily = "A-OTF 新ゴ Pro R";
               this.fontSize = 12;
            };
         }
         selector = null;
         conditions = null;
         conditions = [];
         condition = new CSSCondition("class","settingMenuLabel");
         conditions.push(condition);
         selector = new CSSSelector("spark.components.Label",conditions,selector);
         style = styleManager.getStyleDeclaration("spark.components.Label.settingMenuLabel");
         if(!style)
         {
            style = new CSSStyleDeclaration(selector,styleManager);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.color = 16777215;
               this.fontSize = 14;
            };
         }
         selector = null;
         conditions = null;
         conditions = [];
         condition = new CSSCondition("class","settingMenuLabelSelected");
         conditions.push(condition);
         selector = new CSSSelector("spark.components.Label",conditions,selector);
         style = styleManager.getStyleDeclaration("spark.components.Label.settingMenuLabelSelected");
         if(!style)
         {
            style = new CSSStyleDeclaration(selector,styleManager);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.color = 10480127;
               this.fontSize = 14;
            };
         }
         selector = null;
         conditions = null;
         conditions = [];
         condition = new CSSCondition("class","volumeLabel");
         conditions.push(condition);
         selector = new CSSSelector("spark.components.Label",conditions,selector);
         style = styleManager.getStyleDeclaration("spark.components.Label.volumeLabel");
         if(!style)
         {
            style = new CSSStyleDeclaration(selector,styleManager);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.color = 16777215;
               this.fontSize = 14;
            };
         }
         selector = null;
         conditions = null;
         conditions = [];
         condition = new CSSCondition("class","writePatchNoListButtonLabel");
         conditions.push(condition);
         selector = new CSSSelector("spark.components.Label",conditions,selector);
         style = styleManager.getStyleDeclaration("spark.components.Label.writePatchNoListButtonLabel");
         if(!style)
         {
            style = new CSSStyleDeclaration(selector,styleManager);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.color = 16777215;
               this.fontSize = 13;
            };
         }
         selector = null;
         conditions = null;
         conditions = [];
         condition = new CSSCondition("class","selectWritePatchNoListButtonLabel");
         conditions.push(condition);
         selector = new CSSSelector("spark.components.Label",conditions,selector);
         style = styleManager.getStyleDeclaration("spark.components.Label.selectWritePatchNoListButtonLabel");
         if(!style)
         {
            style = new CSSStyleDeclaration(selector,styleManager);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.color = 9430271;
               this.fontSize = 13;
            };
         }
         selector = null;
         conditions = null;
         conditions = [];
         condition = new CSSCondition("class","notFindwritePatchNoError");
         conditions.push(condition);
         selector = new CSSSelector("spark.components.Label",conditions,selector);
         style = styleManager.getStyleDeclaration("spark.components.Label.notFindwritePatchNoError");
         if(!style)
         {
            style = new CSSStyleDeclaration(selector,styleManager);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.color = 16777215;
               this.textAlign = "center";
               this.fontSize = 13;
            };
         }
         selector = null;
         conditions = null;
         conditions = [];
         condition = new CSSCondition("class","patchlistNo");
         conditions.push(condition);
         selector = new CSSSelector("spark.components.Label",conditions,selector);
         style = styleManager.getStyleDeclaration("spark.components.Label.patchlistNo");
         if(!style)
         {
            style = new CSSStyleDeclaration(selector,styleManager);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.color = 16777215;
               this.fontSize = 13;
            };
         }
         selector = null;
         conditions = null;
         conditions = [];
         condition = new CSSCondition("class","patchlistName");
         conditions.push(condition);
         selector = new CSSSelector("spark.components.Label",conditions,selector);
         style = styleManager.getStyleDeclaration("spark.components.Label.patchlistName");
         if(!style)
         {
            style = new CSSStyleDeclaration(selector,styleManager);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.color = 16777215;
               this.fontSize = 15;
            };
         }
         selector = null;
         conditions = null;
         conditions = [];
         condition = new CSSCondition("class","dropdownLabel");
         conditions.push(condition);
         selector = new CSSSelector("spark.components.Label",conditions,selector);
         style = styleManager.getStyleDeclaration("spark.components.Label.dropdownLabel");
         if(!style)
         {
            style = new CSSStyleDeclaration(selector,styleManager);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.color = 16777215;
               this.fontSize = 13;
            };
         }
         selector = null;
         conditions = null;
         conditions = [];
         condition = new CSSCondition("class","dropdownLabelSelected");
         conditions.push(condition);
         selector = new CSSSelector("spark.components.Label",conditions,selector);
         style = styleManager.getStyleDeclaration("spark.components.Label.dropdownLabelSelected");
         if(!style)
         {
            style = new CSSStyleDeclaration(selector,styleManager);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.color = 10480127;
               this.fontSize = 13;
            };
         }
         selector = null;
         conditions = null;
         conditions = [];
         condition = new CSSCondition("class","dropdownLabelJP");
         conditions.push(condition);
         selector = new CSSSelector("spark.components.Label",conditions,selector);
         style = styleManager.getStyleDeclaration("spark.components.Label.dropdownLabelJP");
         if(!style)
         {
            style = new CSSStyleDeclaration(selector,styleManager);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.color = 16777215;
               this.fontFamily = "A-OTF 新ゴ Pro R";
               this.fontSize = 12;
            };
         }
         selector = null;
         conditions = null;
         conditions = [];
         condition = new CSSCondition("class","dropdownLabelSelectedJP");
         conditions.push(condition);
         selector = new CSSSelector("spark.components.Label",conditions,selector);
         style = styleManager.getStyleDeclaration("spark.components.Label.dropdownLabelSelectedJP");
         if(!style)
         {
            style = new CSSStyleDeclaration(selector,styleManager);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.color = 10480127;
               this.fontFamily = "A-OTF 新ゴ Pro R";
               this.fontSize = 12;
            };
         }
         selector = null;
         conditions = null;
         conditions = [];
         condition = new CSSCondition("class","ctlCaption");
         conditions.push(condition);
         selector = new CSSSelector("spark.components.Label",conditions,selector);
         style = styleManager.getStyleDeclaration("spark.components.Label.ctlCaption");
         if(!style)
         {
            style = new CSSStyleDeclaration(selector,styleManager);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.color = 16777215;
               this.fontSize = 14;
            };
         }
         selector = null;
         conditions = null;
         conditions = [];
         condition = new CSSCondition("class","paramTypeName");
         conditions.push(condition);
         selector = new CSSSelector("spark.components.Label",conditions,selector);
         style = styleManager.getStyleDeclaration("spark.components.Label.paramTypeName");
         if(!style)
         {
            style = new CSSStyleDeclaration(selector,styleManager);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.color = 9430271;
               this.fontSize = 15;
            };
         }
         selector = null;
         conditions = null;
         conditions = [];
         condition = new CSSCondition("class","paramName");
         conditions.push(condition);
         selector = new CSSSelector("spark.components.Label",conditions,selector);
         style = styleManager.getStyleDeclaration("spark.components.Label.paramName");
         if(!style)
         {
            style = new CSSStyleDeclaration(selector,styleManager);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.color = 9430271;
               this.fontSize = 12;
            };
         }
         selector = null;
         conditions = null;
         conditions = [];
         condition = new CSSCondition("class","effectCategory");
         conditions.push(condition);
         selector = new CSSSelector("spark.components.Label",conditions,selector);
         style = styleManager.getStyleDeclaration("spark.components.Label.effectCategory");
         if(!style)
         {
            style = new CSSStyleDeclaration(selector,styleManager);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.color = 9430271;
               this.fontSize = 14;
            };
         }
         selector = null;
         conditions = null;
         conditions = [];
         condition = new CSSCondition("class","ctlTitleName");
         conditions.push(condition);
         selector = new CSSSelector("spark.components.Label",conditions,selector);
         style = styleManager.getStyleDeclaration("spark.components.Label.ctlTitleName");
         if(!style)
         {
            style = new CSSStyleDeclaration(selector,styleManager);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.color = 9430271;
               this.fontSize = 14;
            };
         }
         selector = null;
         conditions = null;
         conditions = [];
         condition = new CSSCondition("class","ctlParamName");
         conditions.push(condition);
         selector = new CSSSelector("spark.components.Label",conditions,selector);
         style = styleManager.getStyleDeclaration("spark.components.Label.ctlParamName");
         if(!style)
         {
            style = new CSSStyleDeclaration(selector,styleManager);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.color = 9430271;
               this.fontSize = 12;
            };
         }
         selector = null;
         conditions = null;
         conditions = [];
         condition = new CSSCondition("class","efectCategoryName");
         conditions.push(condition);
         selector = new CSSSelector("spark.components.Label",conditions,selector);
         style = styleManager.getStyleDeclaration("spark.components.Label.efectCategoryName");
         if(!style)
         {
            style = new CSSStyleDeclaration(selector,styleManager);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.color = 3355443;
               this.textAlign = "center";
               this.fontSize = 14;
            };
         }
         selector = null;
         conditions = null;
         conditions = [];
         condition = new CSSCondition("class","efectTypeName");
         conditions.push(condition);
         selector = new CSSSelector("spark.components.Label",conditions,selector);
         style = styleManager.getStyleDeclaration("spark.components.Label.efectTypeName");
         if(!style)
         {
            style = new CSSStyleDeclaration(selector,styleManager);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.color = 16777215;
               this.textAlign = "center";
               this.fontSize = 11;
            };
         }
         selector = null;
         conditions = null;
         conditions = [];
         condition = new CSSCondition("class","ctrlEffectOnOffJPText");
         conditions.push(condition);
         selector = new CSSSelector("spark.components.Label",conditions,selector);
         style = styleManager.getStyleDeclaration("spark.components.Label.ctrlEffectOnOffJPText");
         if(!style)
         {
            style = new CSSStyleDeclaration(selector,styleManager);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.color = 9430271;
               this.textAlign = "left";
               this.fontFamily = "A-OTF 新ゴ Pro R";
               this.verticalAlign = "bottom";
               this.fontSize = 12;
            };
         }
         selector = null;
         conditions = null;
         conditions = [];
         condition = new CSSCondition("class","ctrlEffectOnOffENText");
         conditions.push(condition);
         selector = new CSSSelector("spark.components.Label",conditions,selector);
         style = styleManager.getStyleDeclaration("spark.components.Label.ctrlEffectOnOffENText");
         if(!style)
         {
            style = new CSSStyleDeclaration(selector,styleManager);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.color = 9430271;
               this.textAlign = "left";
               this.fontFamily = "Helvetica67-CondensedMedium";
               this.verticalAlign = "bottom";
               this.fontSize = 14;
            };
         }
         selector = null;
         conditions = null;
         conditions = [];
         condition = new CSSCondition("class","customRadioBtnLabel");
         conditions.push(condition);
         selector = new CSSSelector("spark.components.Label",conditions,selector);
         style = styleManager.getStyleDeclaration("spark.components.Label.customRadioBtnLabel");
         if(!style)
         {
            style = new CSSStyleDeclaration(selector,styleManager);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.color = 9430271;
               this.textAlign = "left";
               this.fontFamily = "Helvetica67-CondensedMedium";
               this.verticalAlign = "bottom";
               this.fontSize = 18;
            };
         }
         selector = null;
         conditions = null;
         conditions = [];
         condition = new CSSCondition("class","customCheckboxLabel");
         conditions.push(condition);
         selector = new CSSSelector("spark.components.Label",conditions,selector);
         style = styleManager.getStyleDeclaration("spark.components.Label.customCheckboxLabel");
         if(!style)
         {
            style = new CSSStyleDeclaration(selector,styleManager);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.color = 9430271;
               this.fontFamily = "Helvetica67-CondensedMedium";
               this.verticalAlign = "bottom";
               this.fontSize = 12;
            };
         }
         selector = null;
         conditions = null;
         conditions = [];
         condition = new CSSCondition("class","systemDropDownLabel");
         conditions.push(condition);
         selector = new CSSSelector("spark.components.Label",conditions,selector);
         style = styleManager.getStyleDeclaration("spark.components.Label.systemDropDownLabel");
         if(!style)
         {
            style = new CSSStyleDeclaration(selector,styleManager);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.color = 16777215;
               this.textAlign = "center";
               this.fontSize = 14;
            };
         }
         selector = null;
         conditions = null;
         conditions = [];
         condition = new CSSCondition("class","systemDropDownLabelJP");
         conditions.push(condition);
         selector = new CSSSelector("spark.components.Label",conditions,selector);
         style = styleManager.getStyleDeclaration("spark.components.Label.systemDropDownLabelJP");
         if(!style)
         {
            style = new CSSStyleDeclaration(selector,styleManager);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.color = 16777215;
               this.textAlign = "center";
               this.fontFamily = "A-OTF 新ゴ Pro R";
               this.fontSize = 12;
            };
         }
         selector = null;
         conditions = null;
         conditions = [];
         condition = new CSSCondition("class","editType");
         conditions.push(condition);
         selector = new CSSSelector("spark.components.Label",conditions,selector);
         style = styleManager.getStyleDeclaration("spark.components.Label.editType");
         if(!style)
         {
            style = new CSSStyleDeclaration(selector,styleManager);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.color = 9430271;
               this.textAlign = "center";
               this.fontSize = 14;
            };
         }
         selector = null;
         conditions = null;
         conditions = [];
         condition = new CSSCondition("class","categoryDropDownLabel");
         conditions.push(condition);
         selector = new CSSSelector("spark.components.Label",conditions,selector);
         style = styleManager.getStyleDeclaration("spark.components.Label.categoryDropDownLabel");
         if(!style)
         {
            style = new CSSStyleDeclaration(selector,styleManager);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.color = 16777215;
               this.textAlign = "center";
               this.fontSize = 14;
            };
         }
         selector = null;
         conditions = null;
         conditions = [];
         condition = new CSSCondition("class","redEditType");
         conditions.push(condition);
         selector = new CSSSelector("spark.components.Label",conditions,selector);
         style = styleManager.getStyleDeclaration("spark.components.Label.redEditType");
         if(!style)
         {
            style = new CSSStyleDeclaration(selector,styleManager);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.color = 16729413;
               this.textAlign = "center";
               this.fontSize = 14;
            };
         }
         selector = null;
         conditions = null;
         conditions = [];
         condition = new CSSCondition("class","effectDetailBlueDropDownLabel");
         conditions.push(condition);
         selector = new CSSSelector("spark.components.Label",conditions,selector);
         style = styleManager.getStyleDeclaration("spark.components.Label.effectDetailBlueDropDownLabel");
         if(!style)
         {
            style = new CSSStyleDeclaration(selector,styleManager);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.color = 9430271;
               this.textAlign = "center";
               this.fontSize = 22;
            };
         }
         selector = null;
         conditions = null;
         conditions = [];
         condition = new CSSCondition("class","effectDetailRedDropDownLabel");
         conditions.push(condition);
         selector = new CSSSelector("spark.components.Label",conditions,selector);
         style = styleManager.getStyleDeclaration("spark.components.Label.effectDetailRedDropDownLabel");
         if(!style)
         {
            style = new CSSStyleDeclaration(selector,styleManager);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.color = 16729413;
               this.textAlign = "center";
               this.fontSize = 22;
            };
         }
         selector = null;
         conditions = null;
         conditions = [];
         condition = new CSSCondition("class","effectListBlueDropDownLabel");
         conditions.push(condition);
         selector = new CSSSelector("spark.components.Label",conditions,selector);
         style = styleManager.getStyleDeclaration("spark.components.Label.effectListBlueDropDownLabel");
         if(!style)
         {
            style = new CSSStyleDeclaration(selector,styleManager);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.color = 9430271;
               this.textAlign = "center";
               this.fontSize = 18;
            };
         }
         selector = null;
         conditions = null;
         conditions = [];
         condition = new CSSCondition("class","effectListRedDropDownLabel");
         conditions.push(condition);
         selector = new CSSSelector("spark.components.Label",conditions,selector);
         style = styleManager.getStyleDeclaration("spark.components.Label.effectListRedDropDownLabel");
         if(!style)
         {
            style = new CSSStyleDeclaration(selector,styleManager);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.color = 16729413;
               this.textAlign = "center";
               this.fontSize = 18;
            };
         }
         selector = null;
         conditions = null;
         conditions = [];
         condition = new CSSCondition("class","quickSettingDropDownLabel");
         conditions.push(condition);
         selector = new CSSSelector("spark.components.Label",conditions,selector);
         style = styleManager.getStyleDeclaration("spark.components.Label.quickSettingDropDownLabel");
         if(!style)
         {
            style = new CSSStyleDeclaration(selector,styleManager);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.color = 9430271;
               this.textAlign = "center";
               this.fontSize = 15;
            };
         }
         selector = null;
         conditions = null;
         conditions = [];
         condition = new CSSCondition("class","editTypeJP");
         conditions.push(condition);
         selector = new CSSSelector("spark.components.Label",conditions,selector);
         style = styleManager.getStyleDeclaration("spark.components.Label.editTypeJP");
         if(!style)
         {
            style = new CSSStyleDeclaration(selector,styleManager);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.color = 9430271;
               this.textAlign = "center";
               this.fontFamily = "A-OTF 新ゴ Pro R";
               this.fontSize = 12;
            };
         }
         selector = null;
         conditions = null;
         conditions = [];
         condition = new CSSCondition("class","effecterName");
         conditions.push(condition);
         selector = new CSSSelector("spark.components.Label",conditions,selector);
         style = styleManager.getStyleDeclaration("spark.components.Label.effecterName");
         if(!style)
         {
            style = new CSSStyleDeclaration(selector,styleManager);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.color = 16777215;
               this.fontSize = 20;
            };
         }
         selector = null;
         conditions = null;
         conditions = [];
         condition = new CSSCondition("class","effecterNameSelected");
         conditions.push(condition);
         selector = new CSSSelector("spark.components.Label",conditions,selector);
         style = styleManager.getStyleDeclaration("spark.components.Label.effecterNameSelected");
         if(!style)
         {
            style = new CSSStyleDeclaration(selector,styleManager);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.color = 10480127;
               this.fontSize = 20;
            };
         }
         selector = null;
         conditions = null;
         conditions = [];
         condition = new CSSCondition("class","effecterDesc");
         conditions.push(condition);
         selector = new CSSSelector("spark.components.Label",conditions,selector);
         style = styleManager.getStyleDeclaration("spark.components.Label.effecterDesc");
         if(!style)
         {
            style = new CSSStyleDeclaration(selector,styleManager);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.lineHeight = 18;
               this.color = 16777215;
               this.fontSize = 14;
            };
         }
         selector = null;
         conditions = null;
         conditions = [];
         condition = new CSSCondition("class","effecterDescSelected");
         conditions.push(condition);
         selector = new CSSSelector("spark.components.Label",conditions,selector);
         style = styleManager.getStyleDeclaration("spark.components.Label.effecterDescSelected");
         if(!style)
         {
            style = new CSSStyleDeclaration(selector,styleManager);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.lineHeight = 18;
               this.color = 10480127;
               this.fontSize = 14;
            };
         }
         selector = null;
         conditions = null;
         conditions = [];
         condition = new CSSCondition("class","effecterDescJP");
         conditions.push(condition);
         selector = new CSSSelector("spark.components.Label",conditions,selector);
         style = styleManager.getStyleDeclaration("spark.components.Label.effecterDescJP");
         if(!style)
         {
            style = new CSSStyleDeclaration(selector,styleManager);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.lineHeight = 18;
               this.color = 16777215;
               this.fontFamily = "A-OTF 新ゴ Pro R";
               this.fontSize = 12;
            };
         }
         selector = null;
         conditions = null;
         conditions = [];
         condition = new CSSCondition("class","effecterDescSelectedJP");
         conditions.push(condition);
         selector = new CSSSelector("spark.components.Label",conditions,selector);
         style = styleManager.getStyleDeclaration("spark.components.Label.effecterDescSelectedJP");
         if(!style)
         {
            style = new CSSStyleDeclaration(selector,styleManager);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.lineHeight = 18;
               this.color = 10480127;
               this.fontFamily = "A-OTF 新ゴ Pro R";
               this.fontSize = 12;
            };
         }
         selector = null;
         conditions = null;
         conditions = [];
         condition = new CSSCondition("class","detailParamName");
         conditions.push(condition);
         selector = new CSSSelector("spark.components.Label",conditions,selector);
         style = styleManager.getStyleDeclaration("spark.components.Label.detailParamName");
         if(!style)
         {
            style = new CSSStyleDeclaration(selector,styleManager);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.color = 9430271;
               this.fontSize = 15;
            };
         }
         selector = null;
         conditions = null;
         conditions = [];
         condition = new CSSCondition("class","detailParamNameChanging");
         conditions.push(condition);
         selector = new CSSSelector("spark.components.Label",conditions,selector);
         style = styleManager.getStyleDeclaration("spark.components.Label.detailParamNameChanging");
         if(!style)
         {
            style = new CSSStyleDeclaration(selector,styleManager);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.color = 16729413;
               this.fontSize = 15;
            };
         }
         selector = null;
         conditions = null;
         conditions = [];
         condition = new CSSCondition("class","scale");
         conditions.push(condition);
         selector = new CSSSelector("spark.components.Label",conditions,selector);
         style = styleManager.getStyleDeclaration("spark.components.Label.scale");
         if(!style)
         {
            style = new CSSStyleDeclaration(selector,styleManager);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.color = 9430271;
               this.textAlign = "right";
               this.fontSize = 16;
            };
         }
         selector = null;
         conditions = null;
         conditions = [];
         condition = new CSSCondition("class","parameterName");
         conditions.push(condition);
         selector = new CSSSelector("spark.components.Label",conditions,selector);
         style = styleManager.getStyleDeclaration("spark.components.Label.parameterName");
         if(!style)
         {
            style = new CSSStyleDeclaration(selector,styleManager);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.lineHeight = 13;
               this.color = 9430271;
               this.textAlign = "center";
               this.fontSize = 13;
            };
         }
         selector = null;
         conditions = null;
         conditions = [];
         condition = new CSSCondition("class","datailEfectTypeName");
         conditions.push(condition);
         selector = new CSSSelector("spark.components.Label",conditions,selector);
         style = styleManager.getStyleDeclaration("spark.components.Label.datailEfectTypeName");
         if(!style)
         {
            style = new CSSStyleDeclaration(selector,styleManager);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.color = 9430271;
               this.fontSize = 20;
            };
         }
         selector = null;
         conditions = null;
         conditions = [];
         condition = new CSSCondition("class","ampParameterName");
         conditions.push(condition);
         selector = new CSSSelector("spark.components.Label",conditions,selector);
         style = styleManager.getStyleDeclaration("spark.components.Label.ampParameterName");
         if(!style)
         {
            style = new CSSStyleDeclaration(selector,styleManager);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.lineHeight = 13;
               this.color = 16777215;
               this.textAlign = "center";
               this.fontSize = 15;
            };
         }
         selector = null;
         conditions = null;
         conditions = [];
         condition = new CSSCondition("class","ampKnobName");
         conditions.push(condition);
         selector = new CSSSelector("spark.components.Label",conditions,selector);
         style = styleManager.getStyleDeclaration("spark.components.Label.ampKnobName");
         if(!style)
         {
            style = new CSSStyleDeclaration(selector,styleManager);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.lineHeight = 13;
               this.color = 16777215;
               this.textAlign = "center";
               this.fontSize = 12;
            };
         }
         selector = null;
         conditions = null;
         conditions = [];
         condition = new CSSCondition("class","delayTime");
         conditions.push(condition);
         selector = new CSSSelector("spark.components.Label",conditions,selector);
         style = styleManager.getStyleDeclaration("spark.components.Label.delayTime");
         if(!style)
         {
            style = new CSSStyleDeclaration(selector,styleManager);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.lineHeight = 13;
               this.color = 9430271;
               this.textAlign = "right";
               this.fontSize = 13;
            };
         }
         selector = null;
         conditions = null;
         conditions = [];
         condition = new CSSCondition("class","selectPatchNo");
         conditions.push(condition);
         selector = new CSSSelector("spark.components.Label",conditions,selector);
         style = styleManager.getStyleDeclaration("spark.components.Label.selectPatchNo");
         if(!style)
         {
            style = new CSSStyleDeclaration(selector,styleManager);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.color = 16426022;
               this.textAlign = "center";
               this.fontFamily = "Helvetica67-CondensedMedium";
               this.fontSize = 14;
            };
         }
         selector = null;
         conditions = null;
         conditions = [];
         condition = new CSSCondition("class","selectPatchNo_p");
         conditions.push(condition);
         selector = new CSSSelector("spark.components.Label",conditions,selector);
         style = styleManager.getStyleDeclaration("spark.components.Label.selectPatchNo_p");
         if(!style)
         {
            style = new CSSStyleDeclaration(selector,styleManager);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.color = 11184810;
               this.textAlign = "center";
               this.fontFamily = "Helvetica67-CondensedMedium";
               this.fontSize = 14;
            };
         }
         selector = null;
         conditions = null;
         conditions = [];
         condition = new CSSCondition("class","patchCategoryName");
         conditions.push(condition);
         selector = new CSSSelector("spark.components.Label",conditions,selector);
         style = styleManager.getStyleDeclaration("spark.components.Label.patchCategoryName");
         if(!style)
         {
            style = new CSSStyleDeclaration(selector,styleManager);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.color = 10066329;
               this.textAlign = "right";
               this.fontFamily = "Helvetica67-CondensedMedium";
               this.fontSize = 12;
            };
         }
         selector = null;
         conditions = null;
         conditions = [];
         condition = new CSSCondition("class","patchCategoryNameSelect");
         conditions.push(condition);
         selector = new CSSSelector("spark.components.Label",conditions,selector);
         style = styleManager.getStyleDeclaration("spark.components.Label.patchCategoryNameSelect");
         if(!style)
         {
            style = new CSSStyleDeclaration(selector,styleManager);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.color = 10676734;
               this.fontSize = 12;
            };
         }
         selector = null;
         conditions = null;
         conditions = [];
         condition = new CSSCondition("class","tempo");
         conditions.push(condition);
         selector = new CSSSelector("spark.components.Label",conditions,selector);
         style = styleManager.getStyleDeclaration("spark.components.Label.tempo");
         if(!style)
         {
            style = new CSSStyleDeclaration(selector,styleManager);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.color = 16777215;
               this.textAlign = "center";
               this.fontSize = 14;
            };
         }
         selector = null;
         conditions = null;
         conditions = [];
         condition = new CSSCondition("class","selectPachName");
         conditions.push(condition);
         selector = new CSSSelector("spark.components.Label",conditions,selector);
         style = styleManager.getStyleDeclaration("spark.components.Label.selectPachName");
         if(!style)
         {
            style = new CSSStyleDeclaration(selector,styleManager);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.color = 16777215;
               this.fontFamily = "Helvetica67-CondensedMedium";
               this.fontSize = 15;
            };
         }
         selector = null;
         conditions = null;
         conditions = [];
         condition = new CSSCondition("class","infoTitleLabel");
         conditions.push(condition);
         selector = new CSSSelector("spark.components.Label",conditions,selector);
         style = styleManager.getStyleDeclaration("spark.components.Label.infoTitleLabel");
         if(!style)
         {
            style = new CSSStyleDeclaration(selector,styleManager);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.color = 16777215;
               this.fontSize = 14;
            };
         }
         selector = null;
         conditions = null;
         conditions = [];
         condition = new CSSCondition("class","infoTitleLabelCountZERO");
         conditions.push(condition);
         selector = new CSSSelector("spark.components.Label",conditions,selector);
         style = styleManager.getStyleDeclaration("spark.components.Label.infoTitleLabelCountZERO");
         if(!style)
         {
            style = new CSSStyleDeclaration(selector,styleManager);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.color = 10066329;
               this.fontSize = 14;
            };
         }
         selector = null;
         conditions = null;
         conditions = [];
         condition = new CSSCondition("class","infoCountLabel");
         conditions.push(condition);
         selector = new CSSSelector("spark.components.Label",conditions,selector);
         style = styleManager.getStyleDeclaration("spark.components.Label.infoCountLabel");
         if(!style)
         {
            style = new CSSStyleDeclaration(selector,styleManager);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.color = 16777215;
               this.textAlign = "center";
               this.fontSize = 14;
            };
         }
         selector = null;
         conditions = null;
         conditions = [];
         condition = new CSSCondition("class","InfoTagItem");
         conditions.push(condition);
         selector = new CSSSelector("spark.components.Label",conditions,selector);
         style = styleManager.getStyleDeclaration("spark.components.Label.InfoTagItem");
         if(!style)
         {
            style = new CSSStyleDeclaration(selector,styleManager);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.color = 10066329;
               this.textAlign = "center";
               this.fontFamily = "Helvetica67-CondensedMedium";
               this.fontSize = 14;
            };
         }
         selector = null;
         conditions = null;
         conditions = [];
         condition = new CSSCondition("class","SCTrackLabel");
         conditions.push(condition);
         selector = new CSSSelector("spark.components.Label",conditions,selector);
         style = styleManager.getStyleDeclaration("spark.components.Label.SCTrackLabel");
         if(!style)
         {
            style = new CSSStyleDeclaration(selector,styleManager);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.color = 16777215;
               this.fontFamily = "Helvetica67-CondensedMedium";
               this.fontSize = 14;
            };
         }
         selector = null;
         conditions = null;
         conditions = [];
         condition = new CSSCondition("class","TCHeaderLabel");
         conditions.push(condition);
         selector = new CSSSelector("spark.components.Label",conditions,selector);
         style = styleManager.getStyleDeclaration("spark.components.Label.TCHeaderLabel");
         if(!style)
         {
            style = new CSSStyleDeclaration(selector,styleManager);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.color = 16777215;
               this.fontFamily = "Helvetica67-CondensedMedium";
               this.fontSize = 14;
            };
         }
         selector = null;
         conditions = null;
         conditions = [];
         condition = new CSSCondition("class","quickSettingLabel");
         conditions.push(condition);
         selector = new CSSSelector("spark.components.Label",conditions,selector);
         style = styleManager.getStyleDeclaration("spark.components.Label.quickSettingLabel");
         if(!style)
         {
            style = new CSSStyleDeclaration(selector,styleManager);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.color = 10480127;
               this.textAlign = "right";
               this.fontFamily = "Helvetica67-CondensedMedium";
               this.fontSize = 12;
            };
         }
         selector = null;
         conditions = null;
         conditions = [];
         condition = new CSSCondition("class","chainInOutLabel");
         conditions.push(condition);
         selector = new CSSSelector("spark.components.Label",conditions,selector);
         style = styleManager.getStyleDeclaration("spark.components.Label.chainInOutLabel");
         if(!style)
         {
            style = new CSSStyleDeclaration(selector,styleManager);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.color = 16777215;
               this.fontSize = 12;
            };
         }
         selector = null;
         conditions = null;
         conditions = [];
         condition = new CSSCondition("class","chainEffectTypeLabel");
         conditions.push(condition);
         selector = new CSSSelector("spark.components.Label",conditions,selector);
         style = styleManager.getStyleDeclaration("spark.components.Label.chainEffectTypeLabel");
         if(!style)
         {
            style = new CSSStyleDeclaration(selector,styleManager);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.color = 16777215;
               this.fontSize = 12;
            };
         }
         selector = null;
         conditions = null;
         conditions = [];
         condition = new CSSCondition("class","playMenuButtonLabel");
         conditions.push(condition);
         selector = new CSSSelector("spark.components.Label",conditions,selector);
         style = styleManager.getStyleDeclaration("spark.components.Label.playMenuButtonLabel");
         if(!style)
         {
            style = new CSSStyleDeclaration(selector,styleManager);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.color = 16777215;
               this.fontSize = 13;
            };
         }
         selector = null;
         conditions = null;
         conditions = [];
         condition = new CSSCondition("class","selectPlayMenuButtonLabel");
         conditions.push(condition);
         selector = new CSSSelector("spark.components.Label",conditions,selector);
         style = styleManager.getStyleDeclaration("spark.components.Label.selectPlayMenuButtonLabel");
         if(!style)
         {
            style = new CSSStyleDeclaration(selector,styleManager);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.color = 9430271;
               this.fontSize = 13;
            };
         }
         selector = null;
         conditions = null;
         conditions = [];
         condition = new CSSCondition("class","recSliderTimeStart");
         conditions.push(condition);
         selector = new CSSSelector("spark.components.Label",conditions,selector);
         style = styleManager.getStyleDeclaration("spark.components.Label.recSliderTimeStart");
         if(!style)
         {
            style = new CSSStyleDeclaration(selector,styleManager);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.color = 16777215;
               this.textAlign = "right";
               this.fontSize = 12;
            };
         }
         selector = null;
         conditions = null;
         conditions = [];
         condition = new CSSCondition("class","recSliderTimeEnd");
         conditions.push(condition);
         selector = new CSSSelector("spark.components.Label",conditions,selector);
         style = styleManager.getStyleDeclaration("spark.components.Label.recSliderTimeEnd");
         if(!style)
         {
            style = new CSSStyleDeclaration(selector,styleManager);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.color = 16777215;
               this.fontSize = 12;
            };
         }
         selector = null;
         conditions = null;
         conditions = [];
         condition = new CSSCondition("class","mainMeterLabel");
         conditions.push(condition);
         selector = new CSSSelector("spark.components.Label",conditions,selector);
         style = styleManager.getStyleDeclaration("spark.components.Label.mainMeterLabel");
         if(!style)
         {
            style = new CSSStyleDeclaration(selector,styleManager);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.color = 0;
               this.fontSize = 22;
            };
         }
         selector = null;
         conditions = null;
         conditions = [];
         condition = new CSSCondition("class","mainMeterLabelFocus");
         conditions.push(condition);
         selector = new CSSSelector("spark.components.Label",conditions,selector);
         style = styleManager.getStyleDeclaration("spark.components.Label.mainMeterLabelFocus");
         if(!style)
         {
            style = new CSSStyleDeclaration(selector,styleManager);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.color = 10480127;
               this.fontSize = 22;
            };
         }
         selector = null;
         conditions = null;
         conditions = [];
         condition = new CSSCondition("class","subMeterLabel");
         conditions.push(condition);
         selector = new CSSSelector("spark.components.Label",conditions,selector);
         style = styleManager.getStyleDeclaration("spark.components.Label.subMeterLabel");
         if(!style)
         {
            style = new CSSStyleDeclaration(selector,styleManager);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.color = 0;
               this.fontSize = 18;
            };
         }
         selector = null;
         conditions = null;
         conditions = [];
         condition = new CSSCondition("class","subMeterLabelFocus");
         conditions.push(condition);
         selector = new CSSSelector("spark.components.Label",conditions,selector);
         style = styleManager.getStyleDeclaration("spark.components.Label.subMeterLabelFocus");
         if(!style)
         {
            style = new CSSStyleDeclaration(selector,styleManager);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.color = 10480127;
               this.fontSize = 18;
            };
         }
         selector = null;
         conditions = null;
         conditions = [];
         condition = new CSSCondition("class","tunerMarkLabel");
         conditions.push(condition);
         selector = new CSSSelector("spark.components.Label",conditions,selector);
         style = styleManager.getStyleDeclaration("spark.components.Label.tunerMarkLabel");
         if(!style)
         {
            style = new CSSStyleDeclaration(selector,styleManager);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.color = 0;
               this.fontFamily = "A-OTF 新ゴ Pro R";
               this.fontSize = 28;
            };
         }
         selector = null;
         conditions = null;
         conditions = [];
         condition = new CSSCondition("class","pitchLabel");
         conditions.push(condition);
         selector = new CSSSelector("spark.components.Label",conditions,selector);
         style = styleManager.getStyleDeclaration("spark.components.Label.pitchLabel");
         if(!style)
         {
            style = new CSSStyleDeclaration(selector,styleManager);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.color = 16777215;
               this.fontSize = 18;
            };
         }
         selector = null;
         conditions = null;
         conditions = [];
         condition = new CSSCondition("class","settingItemJP");
         conditions.push(condition);
         selector = new CSSSelector("spark.components.Label",conditions,selector);
         style = styleManager.getStyleDeclaration("spark.components.Label.settingItemJP");
         if(!style)
         {
            style = new CSSStyleDeclaration(selector,styleManager);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.color = 16777215;
               this.fontFamily = "A-OTF 新ゴ Pro R";
               this.fontSize = 13;
            };
         }
         selector = null;
         conditions = null;
         conditions = [];
         condition = new CSSCondition("class","settingCaptionJP");
         conditions.push(condition);
         selector = new CSSSelector("spark.components.Label",conditions,selector);
         style = styleManager.getStyleDeclaration("spark.components.Label.settingCaptionJP");
         if(!style)
         {
            style = new CSSStyleDeclaration(selector,styleManager);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.lineHeight = 16;
               this.color = 16777215;
               this.fontFamily = "A-OTF 新ゴ Pro R";
               this.fontSize = 11;
            };
         }
         selector = null;
         conditions = null;
         conditions = [];
         condition = new CSSCondition("class","settingItem");
         conditions.push(condition);
         selector = new CSSSelector("spark.components.Label",conditions,selector);
         style = styleManager.getStyleDeclaration("spark.components.Label.settingItem");
         if(!style)
         {
            style = new CSSStyleDeclaration(selector,styleManager);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.color = 16777215;
               this.fontSize = 16;
            };
         }
         selector = null;
         conditions = null;
         conditions = [];
         condition = new CSSCondition("class","unitNameStyle");
         conditions.push(condition);
         selector = new CSSSelector("spark.components.Label",conditions,selector);
         style = styleManager.getStyleDeclaration("spark.components.Label.unitNameStyle");
         if(!style)
         {
            style = new CSSStyleDeclaration(selector,styleManager);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.color = 16777215;
               this.fontSize = 14;
            };
         }
         selector = null;
         conditions = null;
         conditions = [];
         condition = new CSSCondition("class","settingCaption");
         conditions.push(condition);
         selector = new CSSSelector("spark.components.Label",conditions,selector);
         style = styleManager.getStyleDeclaration("spark.components.Label.settingCaption");
         if(!style)
         {
            style = new CSSStyleDeclaration(selector,styleManager);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.color = 16777215;
               this.fontSize = 14;
            };
         }
         selector = null;
         conditions = null;
         conditions = [];
         condition = new CSSCondition("class","manualButtoLabelJP");
         conditions.push(condition);
         selector = new CSSSelector("spark.components.Label",conditions,selector);
         style = styleManager.getStyleDeclaration("spark.components.Label.manualButtoLabelJP");
         if(!style)
         {
            style = new CSSStyleDeclaration(selector,styleManager);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.color = 16777215;
               this.fontFamily = "A-OTF 新ゴ Pro R";
               this.fontSize = 12;
            };
         }
         selector = null;
         conditions = null;
         conditions = [];
         condition = new CSSCondition("class","recordingTitle");
         conditions.push(condition);
         selector = new CSSSelector("spark.components.Label",conditions,selector);
         style = styleManager.getStyleDeclaration("spark.components.Label.recordingTitle");
         if(!style)
         {
            style = new CSSStyleDeclaration(selector,styleManager);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.color = 16777215;
               this.fontFamily = "A-OTF 新ゴ Pro R";
               this.fontSize = 12;
            };
         }
         selector = null;
         conditions = null;
         conditions = [];
         condition = new CSSCondition("class","recordingTimeLabel");
         conditions.push(condition);
         selector = new CSSSelector("spark.components.Label",conditions,selector);
         style = styleManager.getStyleDeclaration("spark.components.Label.recordingTimeLabel");
         if(!style)
         {
            style = new CSSStyleDeclaration(selector,styleManager);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.color = 16777215;
               this.fontSize = 25;
            };
         }
         selector = null;
         conditions = null;
         conditions = [];
         condition = new CSSCondition("class","dataGridItemLabel");
         conditions.push(condition);
         selector = new CSSSelector("spark.components.Label",conditions,selector);
         style = styleManager.getStyleDeclaration("spark.components.Label.dataGridItemLabel");
         if(!style)
         {
            style = new CSSStyleDeclaration(selector,styleManager);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.color = 16777215;
               this.fontSize = 15;
            };
         }
         selector = null;
         conditions = null;
         conditions = [];
         condition = new CSSCondition("class","dataGridItemNameLabel");
         conditions.push(condition);
         selector = new CSSSelector("spark.components.Label",conditions,selector);
         style = styleManager.getStyleDeclaration("spark.components.Label.dataGridItemNameLabel");
         if(!style)
         {
            style = new CSSStyleDeclaration(selector,styleManager);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.color = 16777215;
               this.fontFamily = "A-OTF 新ゴ Pro R";
               this.fontSize = 12;
            };
         }
         selector = null;
         conditions = null;
         conditions = [];
         condition = new CSSCondition("class","editLibSwitchButtonLabel");
         conditions.push(condition);
         selector = new CSSSelector("spark.components.Label",conditions,selector);
         style = styleManager.getStyleDeclaration("spark.components.Label.editLibSwitchButtonLabel");
         if(!style)
         {
            style = new CSSStyleDeclaration(selector,styleManager);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.color = 16777215;
               this.fontSize = 13;
            };
         }
         selector = null;
         conditions = null;
         conditions = [];
         condition = new CSSCondition("class","selectEditLibSwitchButtonLabel");
         conditions.push(condition);
         selector = new CSSSelector("spark.components.Label",conditions,selector);
         style = styleManager.getStyleDeclaration("spark.components.Label.selectEditLibSwitchButtonLabel");
         if(!style)
         {
            style = new CSSStyleDeclaration(selector,styleManager);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.color = 9430271;
               this.fontSize = 13;
            };
         }
         selector = null;
         conditions = null;
         conditions = [];
         condition = new CSSCondition("class","headerButtonLabel");
         conditions.push(condition);
         selector = new CSSSelector("spark.components.Label",conditions,selector);
         style = styleManager.getStyleDeclaration("spark.components.Label.headerButtonLabel");
         if(!style)
         {
            style = new CSSStyleDeclaration(selector,styleManager);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.color = 16777215;
               this.fontSize = 13;
            };
         }
         selector = null;
         conditions = null;
         conditions = [];
         condition = new CSSCondition("class","youtubePlayButtonLabel");
         conditions.push(condition);
         selector = new CSSSelector("spark.components.Label",conditions,selector);
         style = styleManager.getStyleDeclaration("spark.components.Label.youtubePlayButtonLabel");
         if(!style)
         {
            style = new CSSStyleDeclaration(selector,styleManager);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.color = 16777215;
               this.fontFamily = "A-OTF 新ゴ Pro R";
               this.fontSize = 12;
            };
         }
         selector = null;
         conditions = null;
         conditions = [];
         condition = new CSSCondition("class","youtubePlayButtonLabelEn");
         conditions.push(condition);
         selector = new CSSSelector("spark.components.Label",conditions,selector);
         style = styleManager.getStyleDeclaration("spark.components.Label.youtubePlayButtonLabelEn");
         if(!style)
         {
            style = new CSSStyleDeclaration(selector,styleManager);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.color = 16777215;
               this.fontSize = 16;
            };
         }
         selector = null;
         conditions = null;
         conditions = [];
         condition = new CSSCondition("class","libraryItemLabel");
         conditions.push(condition);
         selector = new CSSSelector("spark.components.Label",conditions,selector);
         style = styleManager.getStyleDeclaration("spark.components.Label.libraryItemLabel");
         if(!style)
         {
            style = new CSSStyleDeclaration(selector,styleManager);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.color = 16777215;
               this.fontSize = 15;
            };
         }
         selector = null;
         conditions = null;
         conditions = [];
         condition = new CSSCondition("class","libraryItemLabelSelect");
         conditions.push(condition);
         selector = new CSSSelector("spark.components.Label",conditions,selector);
         style = styleManager.getStyleDeclaration("spark.components.Label.libraryItemLabelSelect");
         if(!style)
         {
            style = new CSSStyleDeclaration(selector,styleManager);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.color = 10676734;
               this.fontSize = 15;
            };
         }
         selector = null;
         conditions = null;
         conditions = [];
         condition = new CSSCondition("class","libraryPatchLabel");
         conditions.push(condition);
         selector = new CSSSelector("spark.components.Label",conditions,selector);
         style = styleManager.getStyleDeclaration("spark.components.Label.libraryPatchLabel");
         if(!style)
         {
            style = new CSSStyleDeclaration(selector,styleManager);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.color = 16777215;
               this.fontSize = 14;
            };
         }
         selector = null;
         conditions = null;
         conditions = [];
         condition = new CSSCondition("class","libraryPatchLabelSelect");
         conditions.push(condition);
         selector = new CSSSelector("spark.components.Label",conditions,selector);
         style = styleManager.getStyleDeclaration("spark.components.Label.libraryPatchLabelSelect");
         if(!style)
         {
            style = new CSSStyleDeclaration(selector,styleManager);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.color = 10676734;
               this.fontSize = 14;
            };
         }
         selector = null;
         conditions = null;
         conditions = [];
         condition = new CSSCondition("class","libraryMemoLabel");
         conditions.push(condition);
         selector = new CSSSelector("spark.components.Label",conditions,selector);
         style = styleManager.getStyleDeclaration("spark.components.Label.libraryMemoLabel");
         if(!style)
         {
            style = new CSSStyleDeclaration(selector,styleManager);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.color = 13421772;
               this.fontSize = 14;
            };
         }
         selector = null;
         conditions = null;
         conditions = [];
         condition = new CSSCondition("class","tcPlaylistName");
         conditions.push(condition);
         selector = new CSSSelector("spark.components.Label",conditions,selector);
         style = styleManager.getStyleDeclaration("spark.components.Label.tcPlaylistName");
         if(!style)
         {
            style = new CSSStyleDeclaration(selector,styleManager);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.color = 12632256;
               this.fontSize = 24;
            };
         }
         selector = null;
         conditions = null;
         conditions = [];
         condition = new CSSCondition("class","tcInfoDesc");
         conditions.push(condition);
         selector = new CSSSelector("spark.components.Label",conditions,selector);
         style = styleManager.getStyleDeclaration("spark.components.Label.tcInfoDesc");
         if(!style)
         {
            style = new CSSStyleDeclaration(selector,styleManager);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.lineHeight = 17;
               this.color = 12632256;
               this.fontSize = 14;
            };
         }
         selector = null;
         conditions = null;
         conditions = [];
         condition = new CSSCondition("class","tcInfoText");
         conditions.push(condition);
         selector = new CSSSelector("spark.components.Label",conditions,selector);
         style = styleManager.getStyleDeclaration("spark.components.Label.tcInfoText");
         if(!style)
         {
            style = new CSSStyleDeclaration(selector,styleManager);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.lineHeight = 17;
               this.color = 16777215;
               this.fontSize = 14;
            };
         }
         selector = null;
         conditions = null;
         conditions = [];
         condition = new CSSCondition("class","tcInfoDescJP");
         conditions.push(condition);
         selector = new CSSSelector("spark.components.Label",conditions,selector);
         style = styleManager.getStyleDeclaration("spark.components.Label.tcInfoDescJP");
         if(!style)
         {
            style = new CSSStyleDeclaration(selector,styleManager);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.lineHeight = 17;
               this.color = 12632256;
               this.fontFamily = "A-OTF 新ゴ Pro R";
               this.fontSize = 12;
            };
         }
         selector = null;
         conditions = null;
         conditions = [];
         condition = new CSSCondition("class","tcInfoTextJP");
         conditions.push(condition);
         selector = new CSSSelector("spark.components.Label",conditions,selector);
         style = styleManager.getStyleDeclaration("spark.components.Label.tcInfoTextJP");
         if(!style)
         {
            style = new CSSStyleDeclaration(selector,styleManager);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.lineHeight = 17;
               this.color = 16777215;
               this.fontFamily = "A-OTF 新ゴ Pro R";
               this.fontSize = 12;
            };
         }
         selector = null;
         conditions = null;
         conditions = [];
         condition = new CSSCondition("class","playerTime");
         conditions.push(condition);
         selector = new CSSSelector("spark.components.Label",conditions,selector);
         style = styleManager.getStyleDeclaration("spark.components.Label.playerTime");
         if(!style)
         {
            style = new CSSStyleDeclaration(selector,styleManager);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.color = 16777215;
               this.textAlign = "center";
               this.fontSize = 10;
            };
         }
         selector = null;
         conditions = null;
         conditions = [];
         condition = new CSSCondition("class","tagButtonLabel");
         conditions.push(condition);
         selector = new CSSSelector("spark.components.Label",conditions,selector);
         style = styleManager.getStyleDeclaration("spark.components.Label.tagButtonLabel");
         if(!style)
         {
            style = new CSSStyleDeclaration(selector,styleManager);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.color = 16777215;
               this.fontFamily = "Helvetica67-CondensedMedium";
               this.fontSize = 14;
            };
         }
         selector = null;
         conditions = null;
         conditions = [];
         condition = new CSSCondition("class","tagButtonLabelJP");
         conditions.push(condition);
         selector = new CSSSelector("spark.components.Label",conditions,selector);
         style = styleManager.getStyleDeclaration("spark.components.Label.tagButtonLabelJP");
         if(!style)
         {
            style = new CSSStyleDeclaration(selector,styleManager);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.color = 16777215;
               this.fontFamily = "A-OTF 新ゴ Pro R";
               this.fontSize = 12;
            };
         }
         selector = null;
         conditions = null;
         conditions = [];
         condition = new CSSCondition("class","dataGridHeader");
         conditions.push(condition);
         selector = new CSSSelector("spark.components.Label",conditions,selector);
         style = styleManager.getStyleDeclaration("spark.components.Label.dataGridHeader");
         if(!style)
         {
            style = new CSSStyleDeclaration(selector,styleManager);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.color = 16777215;
               this.fontFamily = "Helvetica67-CondensedMedium";
               this.fontSize = 12;
            };
         }
         selector = null;
         conditions = null;
         conditions = [];
         condition = new CSSCondition("class","tagGenreLabel");
         conditions.push(condition);
         selector = new CSSSelector("spark.components.Label",conditions,selector);
         style = styleManager.getStyleDeclaration("spark.components.Label.tagGenreLabel");
         if(!style)
         {
            style = new CSSStyleDeclaration(selector,styleManager);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.color = 10066329;
               this.fontFamily = "Helvetica67-CondensedMedium";
               this.fontSize = 14;
            };
         }
         selector = null;
         conditions = null;
         conditions = [];
         condition = new CSSCondition("class","patchDescNum");
         conditions.push(condition);
         selector = new CSSSelector("spark.components.Label",conditions,selector);
         style = styleManager.getStyleDeclaration("spark.components.Label.patchDescNum");
         if(!style)
         {
            style = new CSSStyleDeclaration(selector,styleManager);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.color = 16777215;
               this.fontSize = 14;
            };
         }
         selector = null;
         conditions = null;
         conditions = [];
         condition = new CSSCondition("class","patchDescJP");
         conditions.push(condition);
         selector = new CSSSelector("spark.components.Label",conditions,selector);
         style = styleManager.getStyleDeclaration("spark.components.Label.patchDescJP");
         if(!style)
         {
            style = new CSSStyleDeclaration(selector,styleManager);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.color = 16777215;
               this.fontFamily = "A-OTF 新ゴ Pro R";
               this.fontSize = 12;
            };
         }
         selector = null;
         conditions = null;
         conditions = [];
         condition = new CSSCondition("class","patchDesc");
         conditions.push(condition);
         selector = new CSSSelector("spark.components.Label",conditions,selector);
         style = styleManager.getStyleDeclaration("spark.components.Label.patchDesc");
         if(!style)
         {
            style = new CSSStyleDeclaration(selector,styleManager);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.color = 16777215;
               this.fontSize = 14;
            };
         }
         selector = null;
         conditions = null;
         conditions = [];
         condition = new CSSCondition("class","patchDescName");
         conditions.push(condition);
         selector = new CSSSelector("spark.components.Label",conditions,selector);
         style = styleManager.getStyleDeclaration("spark.components.Label.patchDescName");
         if(!style)
         {
            style = new CSSStyleDeclaration(selector,styleManager);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.color = 16777215;
               this.fontSize = 14;
            };
         }
         selector = null;
         conditions = null;
         conditions = [];
         condition = new CSSCondition("class","pickup");
         conditions.push(condition);
         selector = new CSSSelector("spark.components.Label",conditions,selector);
         style = styleManager.getStyleDeclaration("spark.components.Label.pickup");
         if(!style)
         {
            style = new CSSStyleDeclaration(selector,styleManager);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.color = 16729413;
               this.fontSize = 10;
            };
         }
         selector = null;
         conditions = null;
         conditions = [];
         condition = new CSSCondition("class","infoItemDateLabel");
         conditions.push(condition);
         selector = new CSSSelector("spark.components.Label",conditions,selector);
         style = styleManager.getStyleDeclaration("spark.components.Label.infoItemDateLabel");
         if(!style)
         {
            style = new CSSStyleDeclaration(selector,styleManager);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.color = 16777215;
               this.fontSize = 16;
            };
         }
         selector = null;
         conditions = null;
         conditions = [];
         condition = new CSSCondition("class","addButtonLabelStyle");
         conditions.push(condition);
         selector = new CSSSelector("spark.components.Label",conditions,selector);
         style = styleManager.getStyleDeclaration("spark.components.Label.addButtonLabelStyle");
         if(!style)
         {
            style = new CSSStyleDeclaration(selector,styleManager);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.color = 16777215;
               this.fontFamily = "Helvetica67-CondensedMedium";
               this.fontSize = 12;
            };
         }
         selector = null;
         conditions = null;
         conditions = [];
         condition = new CSSCondition("class","addButtonLabelStyleJP");
         conditions.push(condition);
         selector = new CSSSelector("spark.components.Label",conditions,selector);
         style = styleManager.getStyleDeclaration("spark.components.Label.addButtonLabelStyleJP");
         if(!style)
         {
            style = new CSSStyleDeclaration(selector,styleManager);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.color = 16777215;
               this.fontFamily = "A-OTF 新ゴ Pro R";
               this.fontSize = 10;
            };
         }
         selector = null;
         conditions = null;
         conditions = [];
         condition = new CSSCondition("class","devLabelStyle");
         conditions.push(condition);
         selector = new CSSSelector("spark.components.Label",conditions,selector);
         style = styleManager.getStyleDeclaration("spark.components.Label.devLabelStyle");
         if(!style)
         {
            style = new CSSStyleDeclaration(selector,styleManager);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.color = 16777215;
               this.fontFamily = "Helvetica67-CondensedMedium";
               this.fontSize = 14;
            };
         }
         selector = null;
         conditions = null;
         conditions = [];
         condition = new CSSCondition("class","tabLabel");
         conditions.push(condition);
         selector = new CSSSelector("spark.components.Label",conditions,selector);
         style = styleManager.getStyleDeclaration("spark.components.Label.tabLabel");
         if(!style)
         {
            style = new CSSStyleDeclaration(selector,styleManager);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.color = 16777215;
               this.fontFamily = "Helvetica67-CondensedMedium";
               this.fontSize = 15;
            };
         }
         selector = null;
         conditions = null;
         conditions = [];
         condition = new CSSCondition("class","USBRoutingLabel");
         conditions.push(condition);
         selector = new CSSSelector("spark.components.Label",conditions,selector);
         style = styleManager.getStyleDeclaration("spark.components.Label.USBRoutingLabel");
         if(!style)
         {
            style = new CSSStyleDeclaration(selector,styleManager);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.color = 9430271;
               this.fontFamily = "Helvetica67-CondensedMedium";
               this.fontSize = 15;
            };
         }
         selector = null;
         conditions = null;
         conditions = [];
         condition = new CSSCondition("class","efectDispLabel");
         conditions.push(condition);
         selector = new CSSSelector("spark.components.Label",conditions,selector);
         style = styleManager.getStyleDeclaration("spark.components.Label.efectDispLabel");
         if(!style)
         {
            style = new CSSStyleDeclaration(selector,styleManager);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.color = 16777215;
               this.fontFamily = "Helvetica67-CondensedMedium";
               this.fontSize = 11;
            };
         }
         selector = null;
         conditions = null;
         conditions = [];
         condition = new CSSCondition("class","dialogOKButton");
         conditions.push(condition);
         selector = new CSSSelector("spark.components.Button",conditions,selector);
         style = styleManager.getStyleDeclaration("spark.components.Button.dialogOKButton");
         if(!style)
         {
            style = new CSSStyleDeclaration(selector,styleManager);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.labelStyle = "dialogButtonLabel";
               this.overImage = _embed_css__assets_images_btn_agree_over_png__614078358_2053130777;
               this.upImage = _embed_css__assets_images_btn_agree_up_png__1650566799_915587494;
               this.downImage = _embed_css__assets_images_btn_agree_down_png_283916600_1609022251;
            };
         }
         selector = null;
         conditions = null;
         conditions = [];
         condition = new CSSCondition("class","dialogCloseButton");
         conditions.push(condition);
         selector = new CSSSelector("spark.components.Button",conditions,selector);
         style = styleManager.getStyleDeclaration("spark.components.Button.dialogCloseButton");
         if(!style)
         {
            style = new CSSStyleDeclaration(selector,styleManager);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.labelStyle = "dialogButtonLabel";
               this.overImage = _embed_css__assets_images_btn_disagree_over_png__1578494168_1287209057;
               this.upImage = _embed_css__assets_images_btn_disagree_up_png__1740955729_176098668;
               this.downImage = _embed_css__assets_images_btn_disagree_down_png__680499210_1867993167;
            };
         }
         selector = null;
         conditions = null;
         conditions = [];
         condition = new CSSCondition("class","clearButton");
         conditions.push(condition);
         selector = new CSSSelector("spark.components.Button",conditions,selector);
         style = styleManager.getStyleDeclaration("spark.components.Button.clearButton");
         if(!style)
         {
            style = new CSSStyleDeclaration(selector,styleManager);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.labelStyle = "dialogButtonLabel";
               this.overImage = _embed_css__assets_images_effectchain_btn_negative_over_png_272075314_1151996155;
               this.upImage = _embed_css__assets_images_effectchain_btn_negative_up_png_209571129_701907762;
               this.downImage = _embed_css__assets_images_effectchain_btn_negative_down_png_1170070272_2095010839;
            };
         }
         selector = null;
         conditions = null;
         conditions = [];
         condition = new CSSCondition("class","modalNotconnectedDeviceButton");
         conditions.push(condition);
         selector = new CSSSelector("spark.components.Button",conditions,selector);
         style = styleManager.getStyleDeclaration("spark.components.Button.modalNotconnectedDeviceButton");
         if(!style)
         {
            style = new CSSStyleDeclaration(selector,styleManager);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.labelStyle = "modalNotconnectedDeviceButtonLabel";
               this.overImage = _embed_css__assets_images_btn_manualdownload_over_png__689176648_1458101843;
               this.upImage = _embed_css__assets_images_btn_manualdownload_up_png_1656613951_650713978;
               this.downImage = _embed_css__assets_images_btn_manualdownload_down_png_208818310_1383509631;
            };
         }
         selector = null;
         conditions = null;
         conditions = [];
         condition = new CSSCondition("class","modalNotconnectedDeviceButtonJP");
         conditions.push(condition);
         selector = new CSSSelector("spark.components.Button",conditions,selector);
         style = styleManager.getStyleDeclaration("spark.components.Button.modalNotconnectedDeviceButtonJP");
         if(!style)
         {
            style = new CSSStyleDeclaration(selector,styleManager);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.labelStyle = "modalNotconnectedDeviceButtonLabelJP";
               this.overImage = _embed_css__assets_images_btn_manualdownload_over_png__689176648_1458101843;
               this.upImage = _embed_css__assets_images_btn_manualdownload_up_png_1656613951_650713978;
               this.downImage = _embed_css__assets_images_btn_manualdownload_down_png_208818310_1383509631;
            };
         }
         selector = null;
         conditions = null;
         conditions = [];
         condition = new CSSCondition("class","modalLoadfaultTCButton");
         conditions.push(condition);
         selector = new CSSSelector("spark.components.Button",conditions,selector);
         style = styleManager.getStyleDeclaration("spark.components.Button.modalLoadfaultTCButton");
         if(!style)
         {
            style = new CSSStyleDeclaration(selector,styleManager);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.labelStyle = "modalLoadfaultTCButtonLabel";
               this.overImage = _embed_css__assets_images_btn_manualdownload_over_png__689176648_1458101843;
               this.upImage = _embed_css__assets_images_btn_manualdownload_up_png_1656613951_650713978;
               this.downImage = _embed_css__assets_images_btn_manualdownload_down_png_208818310_1383509631;
            };
         }
         selector = null;
         conditions = null;
         conditions = [];
         condition = new CSSCondition("class","notConnectedDeviseDownloadButton");
         conditions.push(condition);
         selector = new CSSSelector("spark.components.Button",conditions,selector);
         style = styleManager.getStyleDeclaration("spark.components.Button.notConnectedDeviseDownloadButton");
         if(!style)
         {
            style = new CSSStyleDeclaration(selector,styleManager);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.labelStyle = "dialogButtonLabel";
               this.overImage = _embed_css__assets_images_btn_driverdownload_over_png__1530339434_628209815;
               this.upImage = _embed_css__assets_images_btn_driverdownload_up_png__1620235363_71866186;
               this.downImage = _embed_css__assets_images_btn_driverdownload_down_png__632344476_1878895589;
            };
         }
         selector = null;
         conditions = null;
         conditions = [];
         condition = new CSSCondition("class","update");
         conditions.push(condition);
         selector = new CSSSelector("spark.components.Button",conditions,selector);
         style = styleManager.getStyleDeclaration("spark.components.Button.update");
         if(!style)
         {
            style = new CSSStyleDeclaration(selector,styleManager);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.labelStyle = "headerButtonLabel";
               this.overImage = _embed_css__assets_images_btn_nomalbtn_over_png_1950594785_1642928986;
               this.upImage = _embed_css__assets_images_btn_nomalbtn_up_png__910468696_1401685685;
               this.downImage = _embed_css__assets_images_btn_nomalbtn_down_png__1446377553_2006668824;
            };
         }
         selector = null;
         conditions = null;
         conditions = [];
         condition = new CSSCondition("class","youtubePlayButton");
         conditions.push(condition);
         selector = new CSSSelector("spark.components.Button",conditions,selector);
         style = styleManager.getStyleDeclaration("spark.components.Button.youtubePlayButton");
         if(!style)
         {
            style = new CSSStyleDeclaration(selector,styleManager);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.labelStyle = "youtubePlayButtonLabel";
               this.overImage = _embed_css__assets_images_btn_nomalbtn_over_png_1950594785_1642928986;
               this.upImage = _embed_css__assets_images_btn_nomalbtn_up_png__910468696_1401685685;
               this.downImage = _embed_css__assets_images_btn_nomalbtn_down_png__1446377553_2006668824;
            };
         }
         selector = null;
         conditions = null;
         conditions = [];
         condition = new CSSCondition("class","vScrollBarTrack");
         conditions.push(condition);
         condition = new CSSCondition("pseudo","up");
         conditions.push(condition);
         selector = new CSSSelector("spark.components.Button",conditions,selector);
         style = styleManager.getStyleDeclaration("spark.components.Button.vScrollBarTrack:up");
         if(!style)
         {
            style = new CSSStyleDeclaration(selector,styleManager);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.image = _embed_css__assets_images_scr_v_bg_png__283516405_1753723965;
            };
         }
         selector = null;
         conditions = null;
         conditions = [];
         condition = new CSSCondition("class","vScrollBarTrack");
         conditions.push(condition);
         condition = new CSSCondition("pseudo","over");
         conditions.push(condition);
         selector = new CSSSelector("spark.components.Button",conditions,selector);
         style = styleManager.getStyleDeclaration("spark.components.Button.vScrollBarTrack:over");
         if(!style)
         {
            style = new CSSStyleDeclaration(selector,styleManager);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.image = _embed_css__assets_images_scr_v_bg_png__283516405_1753723965;
            };
         }
         selector = null;
         conditions = null;
         conditions = [];
         condition = new CSSCondition("class","vScrollBarTrack");
         conditions.push(condition);
         condition = new CSSCondition("pseudo","down");
         conditions.push(condition);
         selector = new CSSSelector("spark.components.Button",conditions,selector);
         style = styleManager.getStyleDeclaration("spark.components.Button.vScrollBarTrack:down");
         if(!style)
         {
            style = new CSSStyleDeclaration(selector,styleManager);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.image = _embed_css__assets_images_scr_v_bg_png__283516405_1753723965;
            };
         }
         selector = null;
         conditions = null;
         conditions = [];
         condition = new CSSCondition("class","vScrollBarThumb");
         conditions.push(condition);
         condition = new CSSCondition("pseudo","up");
         conditions.push(condition);
         selector = new CSSSelector("spark.components.Button",conditions,selector);
         style = styleManager.getStyleDeclaration("spark.components.Button.vScrollBarThumb:up");
         if(!style)
         {
            style = new CSSStyleDeclaration(selector,styleManager);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.image = _embed_css__assets_images_scr_v_bt_up_png__468406280_162817432;
            };
         }
         selector = null;
         conditions = null;
         conditions = [];
         condition = new CSSCondition("class","vScrollBarThumb");
         conditions.push(condition);
         condition = new CSSCondition("pseudo","over");
         conditions.push(condition);
         selector = new CSSSelector("spark.components.Button",conditions,selector);
         style = styleManager.getStyleDeclaration("spark.components.Button.vScrollBarThumb:over");
         if(!style)
         {
            style = new CSSStyleDeclaration(selector,styleManager);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.image = _embed_css__assets_images_scr_v_bt_over_png_1570814257_596505853;
            };
         }
         selector = null;
         conditions = null;
         conditions = [];
         condition = new CSSCondition("class","vScrollBarThumb");
         conditions.push(condition);
         condition = new CSSCondition("pseudo","down");
         conditions.push(condition);
         selector = new CSSSelector("spark.components.Button",conditions,selector);
         style = styleManager.getStyleDeclaration("spark.components.Button.vScrollBarThumb:down");
         if(!style)
         {
            style = new CSSStyleDeclaration(selector,styleManager);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.image = _embed_css__assets_images_scr_v_bt_down_png__1826158081_1241285835;
            };
         }
         selector = null;
         conditions = null;
         conditions = [];
         condition = new CSSCondition("class","vScrollBarThumb");
         conditions.push(condition);
         condition = new CSSCondition("pseudo","disabled");
         conditions.push(condition);
         selector = new CSSSelector("spark.components.Button",conditions,selector);
         style = styleManager.getStyleDeclaration("spark.components.Button.vScrollBarThumb:disabled");
         if(!style)
         {
            style = new CSSStyleDeclaration(selector,styleManager);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.image = _embed_css__assets_images_scr_v_bt_up_png__468406280_162817432;
            };
         }
         selector = null;
         conditions = null;
         conditions = [];
         condition = new CSSCondition("class","hScrollBarTrack");
         conditions.push(condition);
         condition = new CSSCondition("pseudo","up");
         conditions.push(condition);
         selector = new CSSSelector("spark.components.Button",conditions,selector);
         style = styleManager.getStyleDeclaration("spark.components.Button.hScrollBarTrack:up");
         if(!style)
         {
            style = new CSSStyleDeclaration(selector,styleManager);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.image = _embed_css__assets_images_scr_h_bg_png_1086942681_1721313095;
            };
         }
         selector = null;
         conditions = null;
         conditions = [];
         condition = new CSSCondition("class","hScrollBarTrack");
         conditions.push(condition);
         condition = new CSSCondition("pseudo","over");
         conditions.push(condition);
         selector = new CSSSelector("spark.components.Button",conditions,selector);
         style = styleManager.getStyleDeclaration("spark.components.Button.hScrollBarTrack:over");
         if(!style)
         {
            style = new CSSStyleDeclaration(selector,styleManager);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.image = _embed_css__assets_images_scr_h_bg_png_1086942681_1721313095;
            };
         }
         selector = null;
         conditions = null;
         conditions = [];
         condition = new CSSCondition("class","hScrollBarTrack");
         conditions.push(condition);
         condition = new CSSCondition("pseudo","down");
         conditions.push(condition);
         selector = new CSSSelector("spark.components.Button",conditions,selector);
         style = styleManager.getStyleDeclaration("spark.components.Button.hScrollBarTrack:down");
         if(!style)
         {
            style = new CSSStyleDeclaration(selector,styleManager);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.image = _embed_css__assets_images_scr_h_bg_png_1086942681_1721313095;
            };
         }
         selector = null;
         conditions = null;
         conditions = [];
         condition = new CSSCondition("class","hScrollBarThumb");
         conditions.push(condition);
         condition = new CSSCondition("pseudo","up");
         conditions.push(condition);
         selector = new CSSSelector("spark.components.Button",conditions,selector);
         style = styleManager.getStyleDeclaration("spark.components.Button.hScrollBarThumb:up");
         if(!style)
         {
            style = new CSSStyleDeclaration(selector,styleManager);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.image = _embed_css__assets_images_scr_h_bt_up_png__1080891030_1641856474;
            };
         }
         selector = null;
         conditions = null;
         conditions = [];
         condition = new CSSCondition("class","hScrollBarThumb");
         conditions.push(condition);
         condition = new CSSCondition("pseudo","over");
         conditions.push(condition);
         selector = new CSSSelector("spark.components.Button",conditions,selector);
         style = styleManager.getStyleDeclaration("spark.components.Button.hScrollBarThumb:over");
         if(!style)
         {
            style = new CSSStyleDeclaration(selector,styleManager);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.image = _embed_css__assets_images_scr_h_bt_over_png_1383489059_174849611;
            };
         }
         selector = null;
         conditions = null;
         conditions = [];
         condition = new CSSCondition("class","hScrollBarThumb");
         conditions.push(condition);
         condition = new CSSCondition("pseudo","down");
         conditions.push(condition);
         selector = new CSSSelector("spark.components.Button",conditions,selector);
         style = styleManager.getStyleDeclaration("spark.components.Button.hScrollBarThumb:down");
         if(!style)
         {
            style = new CSSStyleDeclaration(selector,styleManager);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.image = _embed_css__assets_images_scr_h_bt_down_png__2013483279_1863710215;
            };
         }
         selector = null;
         conditions = null;
         conditions = [];
         condition = new CSSCondition("class","hScrollBarThumb");
         conditions.push(condition);
         condition = new CSSCondition("pseudo","disabled");
         conditions.push(condition);
         selector = new CSSSelector("spark.components.Button",conditions,selector);
         style = styleManager.getStyleDeclaration("spark.components.Button.hScrollBarThumb:disabled");
         if(!style)
         {
            style = new CSSStyleDeclaration(selector,styleManager);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.image = _embed_css__assets_images_scr_h_bt_up_png__1080891030_1641856474;
            };
         }
         selector = null;
         conditions = null;
         conditions = [];
         condition = new CSSCondition("class","memory_manual_select");
         conditions.push(condition);
         selector = new CSSSelector("spark.components.Button",conditions,selector);
         style = styleManager.getStyleDeclaration("spark.components.Button.memory_manual_select");
         if(!style)
         {
            style = new CSSStyleDeclaration(selector,styleManager);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.color = 9430271;
               this.overImage = _embed_css__assets_images_btn_nomalbtn_over_png_1950594785_1315103046;
               this.fontSize = 14;
               this.upImage = _embed_css__assets_images_btn_nomalbtn_up_png__910468696_1073859745;
               this.downImage = _embed_css__assets_images_btn_nomalbtn_down_png__1446377553_1960472532;
            };
         }
         selector = null;
         conditions = null;
         conditions = [];
         condition = new CSSCondition("class","numericStepperUp");
         conditions.push(condition);
         condition = new CSSCondition("pseudo","up");
         conditions.push(condition);
         selector = new CSSSelector("spark.components.Button",conditions,selector);
         style = styleManager.getStyleDeclaration("spark.components.Button.numericStepperUp:up");
         if(!style)
         {
            style = new CSSStyleDeclaration(selector,styleManager);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.image = _embed_css__assets_images_btn_v_txtboxup_up_png_925216398_267721015;
            };
         }
         selector = null;
         conditions = null;
         conditions = [];
         condition = new CSSCondition("class","numericStepperUp");
         conditions.push(condition);
         condition = new CSSCondition("pseudo","over");
         conditions.push(condition);
         selector = new CSSSelector("spark.components.Button",conditions,selector);
         style = styleManager.getStyleDeclaration("spark.components.Button.numericStepperUp:over");
         if(!style)
         {
            style = new CSSStyleDeclaration(selector,styleManager);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.image = _embed_css__assets_images_btn_v_txtboxup_over_png_812411463_2117591868;
            };
         }
         selector = null;
         conditions = null;
         conditions = [];
         condition = new CSSCondition("class","numericStepperUp");
         conditions.push(condition);
         condition = new CSSCondition("pseudo","down");
         conditions.push(condition);
         selector = new CSSSelector("spark.components.Button",conditions,selector);
         style = styleManager.getStyleDeclaration("spark.components.Button.numericStepperUp:down");
         if(!style)
         {
            style = new CSSStyleDeclaration(selector,styleManager);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.image = _embed_css__assets_images_btn_v_txtboxup_down_png_1710406421_992448982;
            };
         }
         selector = null;
         conditions = null;
         conditions = [];
         condition = new CSSCondition("class","numericStepperUp");
         conditions.push(condition);
         condition = new CSSCondition("pseudo","disabled");
         conditions.push(condition);
         selector = new CSSSelector("spark.components.Button",conditions,selector);
         style = styleManager.getStyleDeclaration("spark.components.Button.numericStepperUp:disabled");
         if(!style)
         {
            style = new CSSStyleDeclaration(selector,styleManager);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.image = _embed_css__assets_images_btn_v_txtboxup_up_png_925216398_267721015;
            };
         }
         selector = null;
         conditions = null;
         conditions = [];
         condition = new CSSCondition("class","numericStepperDown");
         conditions.push(condition);
         condition = new CSSCondition("pseudo","up");
         conditions.push(condition);
         selector = new CSSSelector("spark.components.Button",conditions,selector);
         style = styleManager.getStyleDeclaration("spark.components.Button.numericStepperDown:up");
         if(!style)
         {
            style = new CSSStyleDeclaration(selector,styleManager);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.image = _embed_css__assets_images_btn_v_txtboxdown_up_png_838753703_2132697316;
            };
         }
         selector = null;
         conditions = null;
         conditions = [];
         condition = new CSSCondition("class","numericStepperDown");
         conditions.push(condition);
         condition = new CSSCondition("pseudo","over");
         conditions.push(condition);
         selector = new CSSSelector("spark.components.Button",conditions,selector);
         style = styleManager.getStyleDeclaration("spark.components.Button.numericStepperDown:over");
         if(!style)
         {
            style = new CSSStyleDeclaration(selector,styleManager);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.image = _embed_css__assets_images_btn_v_txtboxdown_over_png__673859808_144008969;
            };
         }
         selector = null;
         conditions = null;
         conditions = [];
         condition = new CSSCondition("class","numericStepperDown");
         conditions.push(condition);
         condition = new CSSCondition("pseudo","down");
         conditions.push(condition);
         selector = new CSSSelector("spark.components.Button",conditions,selector);
         style = styleManager.getStyleDeclaration("spark.components.Button.numericStepperDown:down");
         if(!style)
         {
            style = new CSSStyleDeclaration(selector,styleManager);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.image = _embed_css__assets_images_btn_v_txtboxdown_down_png_224135150_2064507543;
            };
         }
         selector = null;
         conditions = null;
         conditions = [];
         condition = new CSSCondition("class","numericStepperDown");
         conditions.push(condition);
         condition = new CSSCondition("pseudo","disabled");
         conditions.push(condition);
         selector = new CSSSelector("spark.components.Button",conditions,selector);
         style = styleManager.getStyleDeclaration("spark.components.Button.numericStepperDown:disabled");
         if(!style)
         {
            style = new CSSStyleDeclaration(selector,styleManager);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.image = _embed_css__assets_images_btn_v_txtboxdown_up_png_838753703_2132697316;
            };
         }
         selector = null;
         conditions = null;
         conditions = [];
         condition = new CSSCondition("class","numericStepperUpBlack");
         conditions.push(condition);
         condition = new CSSCondition("pseudo","up");
         conditions.push(condition);
         selector = new CSSSelector("spark.components.Button",conditions,selector);
         style = styleManager.getStyleDeclaration("spark.components.Button.numericStepperUpBlack:up");
         if(!style)
         {
            style = new CSSStyleDeclaration(selector,styleManager);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.image = _embed_css__assets_images_btn_txtboxup_up_png__2080941481_39990036;
            };
         }
         selector = null;
         conditions = null;
         conditions = [];
         condition = new CSSCondition("class","numericStepperUpBlack");
         conditions.push(condition);
         condition = new CSSCondition("pseudo","over");
         conditions.push(condition);
         selector = new CSSSelector("spark.components.Button",conditions,selector);
         style = styleManager.getStyleDeclaration("spark.components.Button.numericStepperUpBlack:over");
         if(!style)
         {
            style = new CSSStyleDeclaration(selector,styleManager);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.image = _embed_css__assets_images_btn_txtboxup_over_png__1887287344_2019479399;
            };
         }
         selector = null;
         conditions = null;
         conditions = [];
         condition = new CSSCondition("class","numericStepperUpBlack");
         conditions.push(condition);
         condition = new CSSCondition("pseudo","down");
         conditions.push(condition);
         selector = new CSSSelector("spark.components.Button",conditions,selector);
         style = styleManager.getStyleDeclaration("spark.components.Button.numericStepperUpBlack:down");
         if(!style)
         {
            style = new CSSStyleDeclaration(selector,styleManager);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.image = _embed_css__assets_images_btn_txtboxup_down_png__989292386_1038105753;
            };
         }
         selector = null;
         conditions = null;
         conditions = [];
         condition = new CSSCondition("class","numericStepperUpBlack");
         conditions.push(condition);
         condition = new CSSCondition("pseudo","disabled");
         conditions.push(condition);
         selector = new CSSSelector("spark.components.Button",conditions,selector);
         style = styleManager.getStyleDeclaration("spark.components.Button.numericStepperUpBlack:disabled");
         if(!style)
         {
            style = new CSSStyleDeclaration(selector,styleManager);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.image = _embed_css__assets_images_btn_txtboxup_up_png__2080941481_39990036;
            };
         }
         selector = null;
         conditions = null;
         conditions = [];
         condition = new CSSCondition("class","numericStepperDownBlack");
         conditions.push(condition);
         condition = new CSSCondition("pseudo","up");
         conditions.push(condition);
         selector = new CSSSelector("spark.components.Button",conditions,selector);
         style = styleManager.getStyleDeclaration("spark.components.Button.numericStepperDownBlack:up");
         if(!style)
         {
            style = new CSSStyleDeclaration(selector,styleManager);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.image = _embed_css__assets_images_btn_txtboxdown_up_png__1860945104_1582001273;
            };
         }
         selector = null;
         conditions = null;
         conditions = [];
         condition = new CSSCondition("class","numericStepperDownBlack");
         conditions.push(condition);
         condition = new CSSCondition("pseudo","over");
         conditions.push(condition);
         selector = new CSSSelector("spark.components.Button",conditions,selector);
         style = styleManager.getStyleDeclaration("spark.components.Button.numericStepperDownBlack:over");
         if(!style)
         {
            style = new CSSStyleDeclaration(selector,styleManager);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.image = _embed_css__assets_images_btn_txtboxdown_over_png__924166551_1782737186;
            };
         }
         selector = null;
         conditions = null;
         conditions = [];
         condition = new CSSCondition("class","numericStepperDownBlack");
         conditions.push(condition);
         condition = new CSSCondition("pseudo","down");
         conditions.push(condition);
         selector = new CSSSelector("spark.components.Button",conditions,selector);
         style = styleManager.getStyleDeclaration("spark.components.Button.numericStepperDownBlack:down");
         if(!style)
         {
            style = new CSSStyleDeclaration(selector,styleManager);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.image = _embed_css__assets_images_btn_txtboxdown_down_png__26171593_1604935220;
            };
         }
         selector = null;
         conditions = null;
         conditions = [];
         condition = new CSSCondition("class","numericStepperDownBlack");
         conditions.push(condition);
         condition = new CSSCondition("pseudo","disabled");
         conditions.push(condition);
         selector = new CSSSelector("spark.components.Button",conditions,selector);
         style = styleManager.getStyleDeclaration("spark.components.Button.numericStepperDownBlack:disabled");
         if(!style)
         {
            style = new CSSStyleDeclaration(selector,styleManager);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.image = _embed_css__assets_images_btn_txtboxdown_up_png__1860945104_1582001273;
            };
         }
         selector = null;
         conditions = null;
         conditions = [];
         condition = new CSSCondition("class","numericStepperUpDetail");
         conditions.push(condition);
         condition = new CSSCondition("pseudo","up");
         conditions.push(condition);
         selector = new CSSSelector("spark.components.Button",conditions,selector);
         style = styleManager.getStyleDeclaration("spark.components.Button.numericStepperUpDetail:up");
         if(!style)
         {
            style = new CSSStyleDeclaration(selector,styleManager);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.image = _embed_css__assets_images_btn_v_txtboxup_detail_up_png__588332340_1021063403;
            };
         }
         selector = null;
         conditions = null;
         conditions = [];
         condition = new CSSCondition("class","numericStepperUpDetail");
         conditions.push(condition);
         condition = new CSSCondition("pseudo","over");
         conditions.push(condition);
         selector = new CSSSelector("spark.components.Button",conditions,selector);
         style = styleManager.getStyleDeclaration("spark.components.Button.numericStepperUpDetail:over");
         if(!style)
         {
            style = new CSSStyleDeclaration(selector,styleManager);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.image = _embed_css__assets_images_btn_v_txtboxup_detail_over_png__2008979707_247094576;
            };
         }
         selector = null;
         conditions = null;
         conditions = [];
         condition = new CSSCondition("class","numericStepperUpDetail");
         conditions.push(condition);
         condition = new CSSCondition("pseudo","down");
         conditions.push(condition);
         selector = new CSSSelector("spark.components.Button",conditions,selector);
         style = styleManager.getStyleDeclaration("spark.components.Button.numericStepperUpDetail:down");
         if(!style)
         {
            style = new CSSStyleDeclaration(selector,styleManager);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.image = _embed_css__assets_images_btn_v_txtboxup_detail_down_png__1110984749_257109710;
            };
         }
         selector = null;
         conditions = null;
         conditions = [];
         condition = new CSSCondition("class","numericStepperUpDetail");
         conditions.push(condition);
         condition = new CSSCondition("pseudo","disabled");
         conditions.push(condition);
         selector = new CSSSelector("spark.components.Button",conditions,selector);
         style = styleManager.getStyleDeclaration("spark.components.Button.numericStepperUpDetail:disabled");
         if(!style)
         {
            style = new CSSStyleDeclaration(selector,styleManager);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.image = _embed_css__assets_images_btn_v_txtboxup_detail_up_png__588332340_1021063403;
            };
         }
         selector = null;
         conditions = null;
         conditions = [];
         condition = new CSSCondition("class","numericStepperDownDetail");
         conditions.push(condition);
         condition = new CSSCondition("pseudo","up");
         conditions.push(condition);
         selector = new CSSSelector("spark.components.Button",conditions,selector);
         style = styleManager.getStyleDeclaration("spark.components.Button.numericStepperDownDetail:up");
         if(!style)
         {
            style = new CSSStyleDeclaration(selector,styleManager);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.image = _embed_css__assets_images_btn_v_txtboxdown_detail_up_png__1849649773_331880590;
            };
         }
         selector = null;
         conditions = null;
         conditions = [];
         condition = new CSSCondition("class","numericStepperDownDetail");
         conditions.push(condition);
         condition = new CSSCondition("pseudo","over");
         conditions.push(condition);
         selector = new CSSSelector("spark.components.Button",conditions,selector);
         style = styleManager.getStyleDeclaration("spark.components.Button.numericStepperDownDetail:over");
         if(!style)
         {
            style = new CSSStyleDeclaration(selector,styleManager);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.image = _embed_css__assets_images_btn_v_txtboxdown_detail_over_png_1340711948_1246757035;
            };
         }
         selector = null;
         conditions = null;
         conditions = [];
         condition = new CSSCondition("class","numericStepperDownDetail");
         conditions.push(condition);
         condition = new CSSCondition("pseudo","down");
         conditions.push(condition);
         selector = new CSSSelector("spark.components.Button",conditions,selector);
         style = styleManager.getStyleDeclaration("spark.components.Button.numericStepperDownDetail:down");
         if(!style)
         {
            style = new CSSStyleDeclaration(selector,styleManager);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.image = _embed_css__assets_images_btn_v_txtboxdown_detail_down_png__2056260390_1690341513;
            };
         }
         selector = null;
         conditions = null;
         conditions = [];
         condition = new CSSCondition("class","numericStepperDownDetail");
         conditions.push(condition);
         condition = new CSSCondition("pseudo","disabled");
         conditions.push(condition);
         selector = new CSSSelector("spark.components.Button",conditions,selector);
         style = styleManager.getStyleDeclaration("spark.components.Button.numericStepperDownDetail:disabled");
         if(!style)
         {
            style = new CSSStyleDeclaration(selector,styleManager);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.image = _embed_css__assets_images_btn_v_txtboxdown_detail_up_png__1849649773_331880590;
            };
         }
         selector = null;
         conditions = null;
         conditions = [];
         condition = new CSSCondition("class","editTypedropDown");
         conditions.push(condition);
         selector = new CSSSelector("spark.components.Button",conditions,selector);
         style = styleManager.getStyleDeclaration("spark.components.Button.editTypedropDown");
         if(!style)
         {
            style = new CSSStyleDeclaration(selector,styleManager);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.color = 9430271;
               this.overImage = _embed_css__assets_images_img_v_arrowdropbox_png_1396471832_100445433;
               this.fontFamily = "Helvetica67-CondensedMedium";
               this.fontSize = 1;
               this.upImage = _embed_css__assets_images_img_v_arrowdropbox_png_1396471832_100445433;
               this.downImage = _embed_css__assets_images_img_v_arrowdropbox_png_1396471832_100445433;
            };
         }
         selector = null;
         conditions = null;
         conditions = [];
         condition = new CSSCondition("class","blackButtonDropDownButton");
         conditions.push(condition);
         selector = new CSSSelector("spark.components.Button",conditions,selector);
         style = styleManager.getStyleDeclaration("spark.components.Button.blackButtonDropDownButton");
         if(!style)
         {
            style = new CSSStyleDeclaration(selector,styleManager);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.overImage = _embed_css__assets_images_btn_nomalbtn_over_png_1950594785_1642928986;
               this.upImage = _embed_css__assets_images_btn_nomalbtn_up_png__910468696_1401685685;
               this.downImage = _embed_css__assets_images_btn_nomalbtn_down_png__1446377553_2006668824;
            };
         }
         selector = null;
         conditions = null;
         conditions = [];
         condition = new CSSCondition("class","blueBorderDropDownButton");
         conditions.push(condition);
         selector = new CSSSelector("spark.components.Button",conditions,selector);
         style = styleManager.getStyleDeclaration("spark.components.Button.blueBorderDropDownButton");
         if(!style)
         {
            style = new CSSStyleDeclaration(selector,styleManager);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.overImage = _embed_css__assets_images_btn_vtgl_selected_png__277531702_1158767127;
               this.upImage = _embed_css__assets_images_btn_vtgl_up_png__494668086_317723433;
               this.downImage = _embed_css__assets_images_btn_vtgl_selected_png__277531702_1158767127;
            };
         }
         selector = null;
         conditions = null;
         conditions = [];
         condition = new CSSCondition("class","redBorderDropDownButton");
         conditions.push(condition);
         selector = new CSSSelector("spark.components.Button",conditions,selector);
         style = styleManager.getStyleDeclaration("spark.components.Button.redBorderDropDownButton");
         if(!style)
         {
            style = new CSSStyleDeclaration(selector,styleManager);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.overImage = _embed_css__assets_images_btn_vtgl_red_selected_png__923648328_1519257847;
               this.upImage = _embed_css__assets_images_btn_vtgl_red_up_png__1247327176_742967369;
               this.downImage = _embed_css__assets_images_btn_vtgl_red_selected_png__923648328_1519257847;
            };
         }
         selector = null;
         conditions = null;
         conditions = [];
         condition = new CSSCondition("class","sliderTrack");
         conditions.push(condition);
         selector = new CSSSelector("spark.components.Button",conditions,selector);
         style = styleManager.getStyleDeclaration("spark.components.Button.sliderTrack");
         if(!style)
         {
            style = new CSSStyleDeclaration(selector,styleManager);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.overImage = _embed_css__assets_images_btn_vtgl_up_png__494668086_317723433;
               this.upImage = _embed_css__assets_images_btn_vtgl_up_png__494668086_317723433;
               this.downImage = _embed_css__assets_images_btn_vtgl_up_png__494668086_317723433;
            };
         }
         selector = null;
         conditions = null;
         conditions = [];
         condition = new CSSCondition("class","geqSliderTrack");
         conditions.push(condition);
         selector = new CSSSelector("spark.components.Button",conditions,selector);
         style = styleManager.getStyleDeclaration("spark.components.Button.geqSliderTrack");
         if(!style)
         {
            style = new CSSStyleDeclaration(selector,styleManager);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.overImage = _embed_css__assets_images_img_vslider_bar_png__305621851_658276371;
               this.upImage = _embed_css__assets_images_img_vslider_bar_png__305621851_658276371;
               this.downImage = _embed_css__assets_images_img_vslider_bar_png__305621851_658276371;
            };
         }
         selector = null;
         conditions = null;
         conditions = [];
         condition = new CSSCondition("class","sliderThumb");
         conditions.push(condition);
         selector = new CSSSelector("spark.components.Button",conditions,selector);
         style = styleManager.getStyleDeclaration("spark.components.Button.sliderThumb");
         if(!style)
         {
            style = new CSSStyleDeclaration(selector,styleManager);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.overImage = _embed_css__assets_images_img_pinch_over_png__1995298347_1169372224;
               this.upImage = _embed_css__assets_images_img_pinch_png__1772303244_1073445203;
               this.downImage = _embed_css__assets_images_img_pinch_over_png__1995298347_1169372224;
            };
         }
         selector = null;
         conditions = null;
         conditions = [];
         condition = new CSSCondition("class","geqSliderThumb");
         conditions.push(condition);
         selector = new CSSSelector("spark.components.Button",conditions,selector);
         style = styleManager.getStyleDeclaration("spark.components.Button.geqSliderThumb");
         if(!style)
         {
            style = new CSSStyleDeclaration(selector,styleManager);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.overImage = _embed_css__assets_images_btn_vslider_over_png_4614303_1332319206;
               this.upImage = _embed_css__assets_images_btn_vslider_up_png__845454618_2032469813;
               this.downImage = _embed_css__assets_images_btn_vslider_down_png_902609261_820713592;
            };
         }
         selector = null;
         conditions = null;
         conditions = [];
         condition = new CSSCondition("class","usbPriButton");
         conditions.push(condition);
         selector = new CSSSelector("spark.components.Button",conditions,selector);
         style = styleManager.getStyleDeclaration("spark.components.Button.usbPriButton");
         if(!style)
         {
            style = new CSSStyleDeclaration(selector,styleManager);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.overImage = _embed_css__assets_images_effectchain_btn_usbpri_over_png__556620348_2017782691;
               this.upImage = _embed_css__assets_images_effectchain_btn_usbpri_up_png__202463925_1634643968;
               this.downImage = _embed_css__assets_images_effectchain_btn_usbpri_down_png_341374610_1103585381;
            };
         }
         selector = null;
         conditions = null;
         conditions = [];
         condition = new CSSCondition("class","usbSecButton");
         conditions.push(condition);
         selector = new CSSSelector("spark.components.Button",conditions,selector);
         style = styleManager.getStyleDeclaration("spark.components.Button.usbSecButton");
         if(!style)
         {
            style = new CSSStyleDeclaration(selector,styleManager);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.overImage = _embed_css__assets_images_effectchain_btn_usbsec_png__1594131505_2146995926;
               this.upImage = _embed_css__assets_images_effectchain_btn_usbsec_png__1594131505_2146995926;
               this.downImage = _embed_css__assets_images_effectchain_btn_usbsec_png__1594131505_2146995926;
            };
         }
         selector = null;
         conditions = null;
         conditions = [];
         condition = new CSSCondition("class","write");
         conditions.push(condition);
         selector = new CSSSelector("spark.components.Button",conditions,selector);
         style = styleManager.getStyleDeclaration("spark.components.Button.write");
         if(!style)
         {
            style = new CSSStyleDeclaration(selector,styleManager);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.color = 16777215;
               this.overTextImage = _embed_css__assets_images_txt_write_over_png_1452457475_533819554;
               this.upTextImage = _embed_css__assets_images_txt_write_up_png_1426440522_1849337305;
               this.overImage = _embed_css__assets_images_btn_write_over_png__130143081_1770619089;
               this.fontFamily = "Helvetica67-CondensedMedium";
               this.fontSize = 12;
               this.upImage = _embed_css__assets_images_btn_write_up_png__970734370_1412096684;
               this.downTextImage = _embed_css__assets_images_txt_write_down_png__1944514863_917117772;
               this.downImage = _embed_css__assets_images_btn_write_down_png_767851877_1413476225;
            };
         }
         selector = null;
         conditions = null;
         conditions = [];
         condition = new CSSCondition("class","chab");
         conditions.push(condition);
         selector = new CSSSelector("spark.components.Button",conditions,selector);
         style = styleManager.getStyleDeclaration("spark.components.Button.chab");
         if(!style)
         {
            style = new CSSStyleDeclaration(selector,styleManager);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.overTextImage = _embed_css__assets_images_txt_chab_over_png__1301328684_1765148403;
               this.upTextImage = _embed_css__assets_images_txt_chab_up_png_1235865691_2082753424;
               this.overImage = _embed_css__assets_images_btn_write_over_png__130143081_1770619089;
               this.upImage = _embed_css__assets_images_btn_write_up_png__970734370_1412096684;
               this.downTextImage = _embed_css__assets_images_txt_chab_down_png__403333726_1654618229;
               this.downImage = _embed_css__assets_images_btn_write_down_png_767851877_1413476225;
            };
         }
         selector = null;
         conditions = null;
         conditions = [];
         condition = new CSSCondition("class","offsetUpButton");
         conditions.push(condition);
         selector = new CSSSelector("spark.components.Button",conditions,selector);
         style = styleManager.getStyleDeclaration("spark.components.Button.offsetUpButton");
         if(!style)
         {
            style = new CSSStyleDeclaration(selector,styleManager);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.overImage = _embed_css__assets_images_multituner_btn_tuneboxup_over_png__1858031444_1085597099;
               this.upImage = _embed_css__assets_images_multituner_btn_tuneboxup_png_1093475133_250034120;
               this.downImage = _embed_css__assets_images_multituner_btn_tuneboxup_down_png__960036486_156740179;
            };
         }
         selector = null;
         conditions = null;
         conditions = [];
         condition = new CSSCondition("class","offsetDownButton");
         conditions.push(condition);
         selector = new CSSSelector("spark.components.Button",conditions,selector);
         style = styleManager.getStyleDeclaration("spark.components.Button.offsetDownButton");
         if(!style)
         {
            style = new CSSStyleDeclaration(selector,styleManager);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.overImage = _embed_css__assets_images_multituner_btn_tuneboxdown_over_png_1420949573_946521926;
               this.upImage = _embed_css__assets_images_multituner_btn_tuneboxdown_png_198293508_1903506899;
               this.downImage = _embed_css__assets_images_multituner_btn_tuneboxdown_down_png__1976022765_231880808;
            };
         }
         selector = null;
         conditions = null;
         conditions = [];
         condition = new CSSCondition("class","playButton");
         conditions.push(condition);
         selector = new CSSSelector("spark.components.Button",conditions,selector);
         style = styleManager.getStyleDeclaration("spark.components.Button.playButton");
         if(!style)
         {
            style = new CSSStyleDeclaration(selector,styleManager);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.overImage = _embed_css__assets_images_player_btn_play_over_png__1999387506_1283561773;
               this.upImage = _embed_css__assets_images_player_btn_play_up_png_6090389_149158016;
               this.downImage = _embed_css__assets_images_player_btn_play_down_png__1101392548_1862019419;
            };
         }
         selector = null;
         conditions = null;
         conditions = [];
         condition = new CSSCondition("class","recButton");
         conditions.push(condition);
         selector = new CSSSelector("spark.components.Button",conditions,selector);
         style = styleManager.getStyleDeclaration("spark.components.Button.recButton");
         if(!style)
         {
            style = new CSSStyleDeclaration(selector,styleManager);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.overImage = _embed_css__assets_images_player_btn_rec_over_png__2049513334_621570179;
               this.upImage = _embed_css__assets_images_player_btn_rec_up_png__1164910191_1464341930;
               this.downImage = _embed_css__assets_images_player_btn_rec_down_png__1151518376_1736504433;
            };
         }
         selector = null;
         conditions = null;
         conditions = [];
         condition = new CSSCondition("class","recStopButton");
         conditions.push(condition);
         selector = new CSSSelector("spark.components.Button",conditions,selector);
         style = styleManager.getStyleDeclaration("spark.components.Button.recStopButton");
         if(!style)
         {
            style = new CSSStyleDeclaration(selector,styleManager);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.overImage = _embed_css__assets_images_player_btn_recstop_over_png_992662728_140361919;
               this.upImage = _embed_css__assets_images_player_btn_recstop_up_png__942750385_663077516;
               this.downImage = _embed_css__assets_images_player_btn_recstop_down_png_1890657686_238964271;
            };
         }
         selector = null;
         conditions = null;
         conditions = [];
         condition = new CSSCondition("class","stopButton");
         conditions.push(condition);
         selector = new CSSSelector("spark.components.Button",conditions,selector);
         style = styleManager.getStyleDeclaration("spark.components.Button.stopButton");
         if(!style)
         {
            style = new CSSStyleDeclaration(selector,styleManager);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.overImage = _embed_css__assets_images_player_btn_stop_over_png_534171520_1854367201;
               this.upImage = _embed_css__assets_images_player_btn_stop_up_png__701886969_1792710866;
               this.downImage = _embed_css__assets_images_player_btn_stop_down_png_1432166478_1477734931;
            };
         }
         selector = null;
         conditions = null;
         conditions = [];
         condition = new CSSCondition("class","prevButton");
         conditions.push(condition);
         selector = new CSSSelector("spark.components.Button",conditions,selector);
         style = styleManager.getStyleDeclaration("spark.components.Button.prevButton");
         if(!style)
         {
            style = new CSSStyleDeclaration(selector,styleManager);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.overImage = _embed_css__assets_images_player_btn_prevnote_over_png_572118077_1798109384;
               this.upImage = _embed_css__assets_images_player_btn_prevnote_up_png__1376707068_1458999891;
               this.downImage = _embed_css__assets_images_player_btn_prevnote_down_png_1470113035_1290530250;
            };
         }
         selector = null;
         conditions = null;
         conditions = [];
         condition = new CSSCondition("class","nextButton");
         conditions.push(condition);
         selector = new CSSSelector("spark.components.Button",conditions,selector);
         style = styleManager.getStyleDeclaration("spark.components.Button.nextButton");
         if(!style)
         {
            style = new CSSStyleDeclaration(selector,styleManager);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.overImage = _embed_css__assets_images_player_btn_nextnote_over_png__202693763_1044844664;
               this.upImage = _embed_css__assets_images_player_btn_nextnote_up_png_642596164_755846253;
               this.downImage = _embed_css__assets_images_player_btn_nextnote_down_png_695301195_1199790218;
            };
         }
         selector = null;
         conditions = null;
         conditions = [];
         condition = new CSSCondition("class","importButton");
         conditions.push(condition);
         selector = new CSSSelector("spark.components.Button",conditions,selector);
         style = styleManager.getStyleDeclaration("spark.components.Button.importButton");
         if(!style)
         {
            style = new CSSStyleDeclaration(selector,styleManager);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.labelStyle = "tagButtonLabel";
               this.overImage = _embed_css__assets_images_btn_nomalbtn_over_png_1950594785_1642928986;
               this.upImage = _embed_css__assets_images_btn_nomalbtn_up_png__910468696_1401685685;
               this.downImage = _embed_css__assets_images_btn_nomalbtn_down_png__1446377553_2006668824;
            };
         }
         selector = null;
         conditions = null;
         conditions = [];
         condition = new CSSCondition("class","importButtonJP");
         conditions.push(condition);
         selector = new CSSSelector("spark.components.Button",conditions,selector);
         style = styleManager.getStyleDeclaration("spark.components.Button.importButtonJP");
         if(!style)
         {
            style = new CSSStyleDeclaration(selector,styleManager);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.labelStyle = "tagButtonLabelJP";
               this.overImage = _embed_css__assets_images_btn_nomalbtn_over_png_1950594785_1642928986;
               this.upImage = _embed_css__assets_images_btn_nomalbtn_up_png__910468696_1401685685;
               this.downImage = _embed_css__assets_images_btn_nomalbtn_down_png__1446377553_2006668824;
            };
         }
         selector = null;
         conditions = null;
         conditions = [];
         condition = new CSSCondition("class","noRepeatButton");
         conditions.push(condition);
         selector = new CSSSelector("spark.components.Button",conditions,selector);
         style = styleManager.getStyleDeclaration("spark.components.Button.noRepeatButton");
         if(!style)
         {
            style = new CSSStyleDeclaration(selector,styleManager);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.overImage = _embed_css__assets_images_player_btn_re1_over_png__813772676_1956368123;
               this.disabledImage = _embed_css__assets_images_player_btn_re1_up_png_1888886275_87732888;
               this.upImage = _embed_css__assets_images_player_btn_re1_up_png_1888886275_87732888;
               this.downImage = _embed_css__assets_images_player_btn_re1_down_png_84222282_1508361149;
            };
         }
         selector = null;
         conditions = null;
         conditions = [];
         condition = new CSSCondition("class","abRepeatButton");
         conditions.push(condition);
         selector = new CSSSelector("spark.components.Button",conditions,selector);
         style = styleManager.getStyleDeclaration("spark.components.Button.abRepeatButton");
         if(!style)
         {
            style = new CSSStyleDeclaration(selector,styleManager);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.overImage = _embed_css__assets_images_player_btn_re2_over_png__1010286181_1860426672;
               this.upImage = _embed_css__assets_images_player_btn_re2_up_png__663270686_2107228853;
               this.downImage = _embed_css__assets_images_player_btn_re2_down_png__112291223_1454282018;
            };
         }
         selector = null;
         conditions = null;
         conditions = [];
         condition = new CSSCondition("class","oneRepeatButton");
         conditions.push(condition);
         selector = new CSSSelector("spark.components.Button",conditions,selector);
         style = styleManager.getStyleDeclaration("spark.components.Button.oneRepeatButton");
         if(!style)
         {
            style = new CSSStyleDeclaration(selector,styleManager);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.overImage = _embed_css__assets_images_player_btn_re3_over_png__1206799686_1731430995;
               this.upImage = _embed_css__assets_images_player_btn_re3_up_png_1079539649_714022950;
               this.downImage = _embed_css__assets_images_player_btn_re3_down_png__308804728_1842550145;
            };
         }
         selector = null;
         conditions = null;
         conditions = [];
         condition = new CSSCondition("class","allRepeatButton");
         conditions.push(condition);
         selector = new CSSSelector("spark.components.Button",conditions,selector);
         style = styleManager.getStyleDeclaration("spark.components.Button.allRepeatButton");
         if(!style)
         {
            style = new CSSStyleDeclaration(selector,styleManager);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.overImage = _embed_css__assets_images_player_btn_re4_over_png__1403313191_713962990;
               this.upImage = _embed_css__assets_images_player_btn_re4_up_png__1472617312_1932072713;
               this.downImage = _embed_css__assets_images_player_btn_re4_down_png__505318233_1352977436;
            };
         }
         selector = null;
         conditions = null;
         conditions = [];
         condition = new CSSCondition("class","strateRepeatButton");
         conditions.push(condition);
         selector = new CSSSelector("spark.components.Button",conditions,selector);
         style = styleManager.getStyleDeclaration("spark.components.Button.strateRepeatButton");
         if(!style)
         {
            style = new CSSStyleDeclaration(selector,styleManager);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.overImage = _embed_css__assets_images_player_btn_re5_over_png__1599826696_241129617;
               this.upImage = _embed_css__assets_images_player_btn_re5_up_png_270193023_615933244;
               this.downImage = _embed_css__assets_images_player_btn_re5_down_png__701831738_1493198783;
            };
         }
         selector = null;
         conditions = null;
         conditions = [];
         condition = new CSSCondition("class","playerSliderThumb");
         conditions.push(condition);
         selector = new CSSSelector("spark.components.Button",conditions,selector);
         style = styleManager.getStyleDeclaration("spark.components.Button.playerSliderThumb");
         if(!style)
         {
            style = new CSSStyleDeclaration(selector,styleManager);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.overImage = _embed_css__assets_images_player_btn_value_over_png__1387642423_622084866;
               this.disabledImage = _embed_css__assets_images_player_btn_value_up_png__248021360_1110097561;
               this.upImage = _embed_css__assets_images_player_btn_value_up_png__248021360_1110097561;
               this.downImage = _embed_css__assets_images_player_btn_value_down_png__489647465_1168395244;
            };
         }
         selector = null;
         conditions = null;
         conditions = [];
         condition = new CSSCondition("class","manualButton");
         conditions.push(condition);
         selector = new CSSSelector("spark.components.Button",conditions,selector);
         style = styleManager.getStyleDeclaration("spark.components.Button.manualButton");
         if(!style)
         {
            style = new CSSStyleDeclaration(selector,styleManager);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.labelStyle = "manualButtonLabel";
               this.overImage = _embed_css__assets_images_btn_manualdownload_over_png__689176648_1458101843;
               this.upImage = _embed_css__assets_images_btn_manualdownload_up_png_1656613951_650713978;
               this.downImage = _embed_css__assets_images_btn_manualdownload_down_png_208818310_1383509631;
            };
         }
         selector = null;
         conditions = null;
         conditions = [];
         condition = new CSSCondition("class","manualButtonJP");
         conditions.push(condition);
         selector = new CSSSelector("spark.components.Button",conditions,selector);
         style = styleManager.getStyleDeclaration("spark.components.Button.manualButtonJP");
         if(!style)
         {
            style = new CSSStyleDeclaration(selector,styleManager);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.labelStyle = "manualButtonLabelJP";
               this.overImage = _embed_css__assets_images_btn_manualdownload_over_png__689176648_1458101843;
               this.upImage = _embed_css__assets_images_btn_manualdownload_up_png_1656613951_650713978;
               this.downImage = _embed_css__assets_images_btn_manualdownload_down_png_208818310_1383509631;
            };
         }
         selector = null;
         conditions = null;
         conditions = [];
         condition = new CSSCondition("class","toneCentralUp");
         conditions.push(condition);
         selector = new CSSSelector("spark.components.Button",conditions,selector);
         style = styleManager.getStyleDeclaration("spark.components.Button.toneCentralUp");
         if(!style)
         {
            style = new CSSStyleDeclaration(selector,styleManager);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.overImage = _embed_css__assets_images_tonecentral_btn_tonecentralup_over_png_876518404_392463079;
               this.upImage = _embed_css__assets_images_tonecentral_btn_tonecentralup_up_png__1805440117_2097560374;
               this.downImage = _embed_css__assets_images_tonecentral_btn_tonecentralup_down_png_1774513362_1719496987;
            };
         }
         selector = null;
         conditions = null;
         conditions = [];
         condition = new CSSCondition("class","toneCentralDown");
         conditions.push(condition);
         selector = new CSSSelector("spark.components.Button",conditions,selector);
         style = styleManager.getStyleDeclaration("spark.components.Button.toneCentralDown");
         if(!style)
         {
            style = new CSSStyleDeclaration(selector,styleManager);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.overImage = _embed_css__assets_images_tonecentral_btn_tonecentraldown_over_png_803368349_777362260;
               this.upImage = _embed_css__assets_images_tonecentral_btn_tonecentraldown_up_png_902860644_364619847;
               this.downImage = _embed_css__assets_images_tonecentral_btn_tonecentraldown_down_png_1701363307_1407197142;
            };
         }
         selector = null;
         conditions = null;
         conditions = [];
         condition = new CSSCondition("class","itemDeleteButton");
         conditions.push(condition);
         selector = new CSSSelector("spark.components.Button",conditions,selector);
         style = styleManager.getStyleDeclaration("spark.components.Button.itemDeleteButton");
         if(!style)
         {
            style = new CSSStyleDeclaration(selector,styleManager);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.selectedImage = _embed_css__assets_images_library_img_delete_up_png_1457566741_1990955414;
               this.overImage = _embed_css__assets_images_library_img_delete_over_png_1299982862_586593929;
               this.upImage = _embed_css__assets_images_library_img_delete_up_png_1457566741_1990955414;
               this.downImage = _embed_css__assets_images_library_img_delete_down_png__2096989476_1076872549;
            };
         }
         selector = null;
         conditions = null;
         conditions = [];
         condition = new CSSCondition("class","addButtonStyle");
         conditions.push(condition);
         selector = new CSSSelector("spark.components.Button",conditions,selector);
         style = styleManager.getStyleDeclaration("spark.components.Button.addButtonStyle");
         if(!style)
         {
            style = new CSSStyleDeclaration(selector,styleManager);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.labelStyle = "addButtonLabelStyle";
               this.overImage = _embed_css__assets_images_btn_write_over_png__130143081_1770619094;
               this.upImage = _embed_css__assets_images_btn_write_up_png__970734370_1412096689;
               this.downImage = _embed_css__assets_images_btn_write_down_png_767851877_1413476220;
            };
         }
         selector = null;
         conditions = null;
         conditions = [];
         condition = new CSSCondition("class","addButtonStyleJP");
         conditions.push(condition);
         selector = new CSSSelector("spark.components.Button",conditions,selector);
         style = styleManager.getStyleDeclaration("spark.components.Button.addButtonStyleJP");
         if(!style)
         {
            style = new CSSStyleDeclaration(selector,styleManager);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.labelStyle = "addButtonLabelStyleJP";
               this.overImage = _embed_css__assets_images_btn_write_over_png__130143081_1770619094;
               this.upImage = _embed_css__assets_images_btn_write_up_png__970734370_1412096689;
               this.downImage = _embed_css__assets_images_btn_write_down_png_767851877_1413476220;
            };
         }
         selector = null;
         conditions = null;
         conditions = [];
         condition = new CSSCondition("class","phantom");
         conditions.push(condition);
         selector = new CSSSelector("spark.components.Button",conditions,selector);
         style = styleManager.getStyleDeclaration("spark.components.Button.phantom");
         if(!style)
         {
            style = new CSSStyleDeclaration(selector,styleManager);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.color = 16777215;
               this.fontFamily = "Helvetica67-CondensedMedium";
               this.fontSize = 12;
            };
         }
         selector = null;
         conditions = null;
         conditions = [];
         condition = new CSSCondition("class","memoHideButton");
         conditions.push(condition);
         selector = new CSSSelector("spark.components.ToggleButton",conditions,selector);
         style = styleManager.getStyleDeclaration("spark.components.ToggleButton.memoHideButton");
         if(!style)
         {
            style = new CSSStyleDeclaration(selector,styleManager);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.selectedOverImage = _embed_css__assets_images_btn_nomalbtn_over_png_1950594785_1642928986;
               this.labelStyle = "headerButtonLabel";
               this.selectedImage = _embed_css__assets_images_btn_nomalbtn_up_png__910468696_1401685685;
               this.overImage = _embed_css__assets_images_btn_nomalbtn_over_png_1950594785_1642928986;
               this.selectedDownImage = _embed_css__assets_images_btn_nomalbtn_down_png__1446377553_2006668824;
               this.upImage = _embed_css__assets_images_btn_nomalbtn_up_png__910468696_1401685685;
               this.downImage = _embed_css__assets_images_btn_nomalbtn_down_png__1446377553_2006668824;
            };
         }
         selector = null;
         conditions = null;
         conditions = [];
         condition = new CSSCondition("class","ctl");
         conditions.push(condition);
         selector = new CSSSelector("spark.components.ToggleButton",conditions,selector);
         style = styleManager.getStyleDeclaration("spark.components.ToggleButton.ctl");
         if(!style)
         {
            style = new CSSStyleDeclaration(selector,styleManager);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.color = 9430271;
               this.selectedImage = _embed_css__assets_images_btn_vtgl_selected_png__277531702_1158767131;
               this.overImage = _embed_css__assets_images_btn_vtgl_over_png_2103022467_1737410250;
               this.fontFamily = "Helvetica67-CondensedMedium";
               this.fontSize = 14;
               this.upImage = _embed_css__assets_images_btn_vtgl_up_png__494668086_317723429;
               this.downImage = _embed_css__assets_images_btn_vtgl_down_png__1293949871_1440489736;
            };
         }
         selector = null;
         conditions = null;
         conditions = [];
         condition = new CSSCondition("class","effectSw");
         conditions.push(condition);
         selector = new CSSSelector("spark.components.ToggleButton",conditions,selector);
         style = styleManager.getStyleDeclaration("spark.components.ToggleButton.effectSw");
         if(!style)
         {
            style = new CSSStyleDeclaration(selector,styleManager);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.selectedImage = _embed_css__assets_images_effectchain_img_lampon_png__119785358_1734226703;
               this.overImage = _embed_css__assets_images_effectchain_img_lampoff_png_402341202_2104424741;
               this.upImage = _embed_css__assets_images_effectchain_img_lampoff_png_402341202_2104424741;
               this.downImage = _embed_css__assets_images_effectchain_img_lampon_png__119785358_1734226703;
            };
         }
         selector = null;
         conditions = null;
         conditions = [];
         condition = new CSSCondition("class","effectSwLarge");
         conditions.push(condition);
         selector = new CSSSelector("spark.components.ToggleButton",conditions,selector);
         style = styleManager.getStyleDeclaration("spark.components.ToggleButton.effectSwLarge");
         if(!style)
         {
            style = new CSSStyleDeclaration(selector,styleManager);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.selectedImage = _embed_css__assets_images_effectchain_img_lamponl_png_636915536_1804365607;
               this.overImage = _embed_css__assets_images_effectchain_img_lampoffl_over_png_1122741593_1791082834;
               this.upImage = _embed_css__assets_images_effectchain_img_lampoffl_png__357030288_2008817071;
               this.downImage = _embed_css__assets_images_effectchain_img_lamponl_png_636915536_1804365607;
            };
         }
         selector = null;
         conditions = null;
         conditions = [];
         condition = new CSSCondition("class","effectSwLargeSquare");
         conditions.push(condition);
         selector = new CSSSelector("spark.components.ToggleButton",conditions,selector);
         style = styleManager.getStyleDeclaration("spark.components.ToggleButton.effectSwLargeSquare");
         if(!style)
         {
            style = new CSSStyleDeclaration(selector,styleManager);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.selectedImage = _embed_css__assets_images_effectchain_img_lamponl_sq_png__189702269_756439646;
               this.overImage = _embed_css__assets_images_effectchain_img_lampoffl_sq_png__1325206429_1907710456;
               this.upImage = _embed_css__assets_images_effectchain_img_lampoffl_sq_png__1325206429_1907710456;
               this.downImage = _embed_css__assets_images_effectchain_img_lamponl_sq_png__189702269_756439646;
            };
         }
         selector = null;
         conditions = null;
         conditions = [];
         condition = new CSSCondition("class","phantom");
         conditions.push(condition);
         selector = new CSSSelector("spark.components.ToggleButton",conditions,selector);
         style = styleManager.getStyleDeclaration("spark.components.ToggleButton.phantom");
         if(!style)
         {
            style = new CSSStyleDeclaration(selector,styleManager);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.selectedOverImage = _embed_css__assets_images_effectchain_btn_steat_selected_over_png__1470135580_328297597;
               this.labelStyle = "playMenuButtonLabel";
               this.selectedImage = _embed_css__assets_images_effectchain_btn_steat_selected_up_png_256920171_1788969888;
               this.overImage = _embed_css__assets_images_effectchain_btn_steat_over_png__736724162_1304850173;
               this.selectedDownImage = _embed_css__assets_images_effectchain_btn_steat_selected_down_png__572140622_365361979;
               this.selectedLabelStyle = "selectPlayMenuButtonLabel";
               this.upImage = _embed_css__assets_images_effectchain_btn_steat_up_png_20812101_1320729008;
               this.downImage = _embed_css__assets_images_effectchain_btn_steat_down_png_161270796_1816400363;
            };
         }
         selector = null;
         conditions = null;
         conditions = [];
         condition = new CSSCondition("class","playMenuBt");
         conditions.push(condition);
         selector = new CSSSelector("spark.components.ToggleButton",conditions,selector);
         style = styleManager.getStyleDeclaration("spark.components.ToggleButton.playMenuBt");
         if(!style)
         {
            style = new CSSStyleDeclaration(selector,styleManager);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.labelStyle = "playMenuButtonLabel";
               this.selectedImage = _embed_css__assets_images_edit_footer_menu_btn_foot_down_png__1775551025_433748522;
               this.overImage = _embed_css__assets_images_edit_footer_menu_btn_foot_over_png_1621421313_816059812;
               this.selectedLabelStyle = "selectPlayMenuButtonLabel";
               this.upImage = _embed_css__assets_images_edit_footer_menu_btn_foot_up_png_859019208_1079401129;
               this.downImage = _embed_css__assets_images_edit_footer_menu_btn_foot_down_png__1775551025_433748522;
            };
         }
         selector = null;
         conditions = null;
         conditions = [];
         condition = new CSSCondition("class","ctlAssignSw");
         conditions.push(condition);
         selector = new CSSSelector("spark.components.ToggleButton",conditions,selector);
         style = styleManager.getStyleDeclaration("spark.components.ToggleButton.ctlAssignSw");
         if(!style)
         {
            style = new CSSStyleDeclaration(selector,styleManager);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.selectedImage = _embed_css__assets_images_ctl_img_lamponl_s_png_1689333903_514882356;
               this.overImage = _embed_css__assets_images_ctl_img_lampoffl_s_over_png_1663340912_536776071;
               this.upImage = _embed_css__assets_images_ctl_img_lampoffl_s_png__1320628231_1816149020;
               this.downImage = _embed_css__assets_images_ctl_img_lamponl_s_png_1689333903_514882356;
            };
         }
         selector = null;
         conditions = null;
         conditions = [];
         condition = new CSSCondition("class","patchlist");
         conditions.push(condition);
         selector = new CSSSelector("spark.components.List",conditions,selector);
         style = styleManager.getStyleDeclaration("spark.components.List.patchlist");
         if(!style)
         {
            style = new CSSStyleDeclaration(selector,styleManager);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.skinClass = VScrollBarSkin;
            };
         }
         selector = null;
         conditions = null;
         conditions = [];
         condition = new CSSCondition("class","liraryList");
         conditions.push(condition);
         selector = new CSSSelector("spark.components.List",conditions,selector);
         style = styleManager.getStyleDeclaration("spark.components.List.liraryList");
         if(!style)
         {
            style = new CSSStyleDeclaration(selector,styleManager);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.alternatingItemColors = "[0x414141, 0x414141]";
            };
         }
         selector = null;
         conditions = null;
         conditions = [];
         condition = new CSSCondition("class","ctlcheck");
         conditions.push(condition);
         selector = new CSSSelector("spark.components.CheckBox",conditions,selector);
         style = styleManager.getStyleDeclaration("spark.components.CheckBox.ctlcheck");
         if(!style)
         {
            style = new CSSStyleDeclaration(selector,styleManager);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.selectedImage = _embed_css__assets_images_btn_v_checkbox_selected_png_1373684513_1328518074;
               this.overImage = _embed_css__assets_images_btn_v_checkbox_over_png_464021082_2021398669;
               this.upImage = _embed_css__assets_images_btn_v_checkbox_up_png__1555590303_1800848582;
               this.downImage = _embed_css__assets_images_btn_v_checkbox_down_png_1362016040_504073823;
            };
         }
         selector = null;
         conditions = null;
         conditions = [];
         condition = new CSSCondition("class","customCheckbox");
         conditions.push(condition);
         selector = new CSSSelector("spark.components.CheckBox",conditions,selector);
         style = styleManager.getStyleDeclaration("spark.components.CheckBox.customCheckbox");
         if(!style)
         {
            style = new CSSStyleDeclaration(selector,styleManager);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.labelStyle = "customCheckboxLabel";
               this.selectedImage = _embed_css__assets_images_btn_v_checkbox_selected_png_1373684513_1328518074;
               this.overImage = _embed_css__assets_images_btn_v_checkbox_over_png_464021082_2021398669;
               this.upImage = _embed_css__assets_images_btn_v_checkbox_up_png__1555590303_1800848582;
               this.downImage = _embed_css__assets_images_btn_v_checkbox_down_png_1362016040_504073823;
            };
         }
         selector = null;
         conditions = null;
         conditions = [];
         condition = new CSSCondition("class","systemDropDown");
         conditions.push(condition);
         selector = new CSSSelector("spark.components.DropDownList",conditions,selector);
         style = styleManager.getStyleDeclaration("spark.components.DropDownList.systemDropDown");
         if(!style)
         {
            style = new CSSStyleDeclaration(selector,styleManager);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.buttonStyle = "blackButtonDropDownButton";
               this.labelStyle = "systemDropDownLabel";
            };
         }
         selector = null;
         conditions = null;
         conditions = [];
         condition = new CSSCondition("class","systemDropDownJP");
         conditions.push(condition);
         selector = new CSSSelector("spark.components.DropDownList",conditions,selector);
         style = styleManager.getStyleDeclaration("spark.components.DropDownList.systemDropDownJP");
         if(!style)
         {
            style = new CSSStyleDeclaration(selector,styleManager);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.buttonStyle = "blackButtonDropDownButton";
               this.labelStyle = "systemDropDownLabelJP";
            };
         }
         selector = null;
         conditions = null;
         conditions = [];
         condition = new CSSCondition("class","categoryButtonDropDown");
         conditions.push(condition);
         selector = new CSSSelector("spark.components.DropDownList",conditions,selector);
         style = styleManager.getStyleDeclaration("spark.components.DropDownList.categoryButtonDropDown");
         if(!style)
         {
            style = new CSSStyleDeclaration(selector,styleManager);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.buttonStyle = "blackButtonDropDownButton";
               this.labelStyle = "categoryDropDownLabel";
            };
         }
         selector = null;
         conditions = null;
         conditions = [];
         condition = new CSSCondition("class","blueBorderDropDown");
         conditions.push(condition);
         selector = new CSSSelector("spark.components.DropDownList",conditions,selector);
         style = styleManager.getStyleDeclaration("spark.components.DropDownList.blueBorderDropDown");
         if(!style)
         {
            style = new CSSStyleDeclaration(selector,styleManager);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.buttonStyle = "blueBorderDropDownButton";
               this.borderColor = 10480127;
               this.labelStyle = "editType";
            };
         }
         selector = null;
         conditions = null;
         conditions = [];
         condition = new CSSCondition("class","redBorderDropDown");
         conditions.push(condition);
         selector = new CSSSelector("spark.components.DropDownList",conditions,selector);
         style = styleManager.getStyleDeclaration("spark.components.DropDownList.redBorderDropDown");
         if(!style)
         {
            style = new CSSStyleDeclaration(selector,styleManager);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.buttonStyle = "redBorderDropDownButton";
               this.borderColor = 16729413;
               this.labelStyle = "redEditType";
            };
         }
         selector = null;
         conditions = null;
         conditions = [];
         condition = new CSSCondition("class","effectDetailBlueDropDown");
         conditions.push(condition);
         selector = new CSSSelector("spark.components.DropDownList",conditions,selector);
         style = styleManager.getStyleDeclaration("spark.components.DropDownList.effectDetailBlueDropDown");
         if(!style)
         {
            style = new CSSStyleDeclaration(selector,styleManager);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.buttonStyle = "blueBorderDropDownButton";
               this.borderColor = 10480127;
               this.labelStyle = "effectDetailBlueDropDownLabel";
            };
         }
         selector = null;
         conditions = null;
         conditions = [];
         condition = new CSSCondition("class","effectDetailRedDropDown");
         conditions.push(condition);
         selector = new CSSSelector("spark.components.DropDownList",conditions,selector);
         style = styleManager.getStyleDeclaration("spark.components.DropDownList.effectDetailRedDropDown");
         if(!style)
         {
            style = new CSSStyleDeclaration(selector,styleManager);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.buttonStyle = "redBorderDropDownButton";
               this.borderColor = 16729413;
               this.labelStyle = "effectDetailRedDropDownLabel";
            };
         }
         selector = null;
         conditions = null;
         conditions = [];
         condition = new CSSCondition("class","effectListBlueDropDown");
         conditions.push(condition);
         selector = new CSSSelector("spark.components.DropDownList",conditions,selector);
         style = styleManager.getStyleDeclaration("spark.components.DropDownList.effectListBlueDropDown");
         if(!style)
         {
            style = new CSSStyleDeclaration(selector,styleManager);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.buttonStyle = "blueBorderDropDownButton";
               this.borderColor = 10480127;
               this.labelStyle = "effectListBlueDropDownLabel";
            };
         }
         selector = null;
         conditions = null;
         conditions = [];
         condition = new CSSCondition("class","effectListRedDropDown");
         conditions.push(condition);
         selector = new CSSSelector("spark.components.DropDownList",conditions,selector);
         style = styleManager.getStyleDeclaration("spark.components.DropDownList.effectListRedDropDown");
         if(!style)
         {
            style = new CSSStyleDeclaration(selector,styleManager);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.buttonStyle = "redBorderDropDownButton";
               this.borderColor = 16729413;
               this.labelStyle = "effectListRedDropDownLabel";
            };
         }
         selector = null;
         conditions = null;
         conditions = [];
         condition = new CSSCondition("class","quickSettingDropDown");
         conditions.push(condition);
         selector = new CSSSelector("spark.components.DropDownList",conditions,selector);
         style = styleManager.getStyleDeclaration("spark.components.DropDownList.quickSettingDropDown");
         if(!style)
         {
            style = new CSSStyleDeclaration(selector,styleManager);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.buttonStyle = "blueBorderDropDownButton";
               this.borderColor = 10480127;
               this.labelStyle = "quickSettingDropDownLabel";
            };
         }
         selector = null;
         conditions = null;
         conditions = [];
         condition = new CSSCondition("class","selectPachNameInput");
         conditions.push(condition);
         selector = new CSSSelector("spark.components.TextInput",conditions,selector);
         style = styleManager.getStyleDeclaration("spark.components.TextInput.selectPachNameInput");
         if(!style)
         {
            style = new CSSStyleDeclaration(selector,styleManager);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.focusColor = 10676734;
               this.labelStyle = "selectPachNameLabel";
               this.focusAlpha = 1;
               this.image = _embed_css__assets_images_bgi_txtbox_png_1273838038_1762951156;
            };
         }
         selector = null;
         conditions = null;
         conditions = [];
         condition = new CSSCondition("class","liveSetTextInput");
         conditions.push(condition);
         selector = new CSSSelector("spark.components.TextInput",conditions,selector);
         style = styleManager.getStyleDeclaration("spark.components.TextInput.liveSetTextInput");
         if(!style)
         {
            style = new CSSStyleDeclaration(selector,styleManager);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.labelStyle = "libLiveSetName";
               this.focusAlpha = 0;
               this.image = _embed_css__assets_images_library_bgi_liveset_textinput_png__16245541_1429078297;
            };
         }
         selector = null;
         conditions = null;
         conditions = [];
         condition = new CSSCondition("class","patchTextInput");
         conditions.push(condition);
         selector = new CSSSelector("spark.components.TextInput",conditions,selector);
         style = styleManager.getStyleDeclaration("spark.components.TextInput.patchTextInput");
         if(!style)
         {
            style = new CSSStyleDeclaration(selector,styleManager);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.focusColor = 10676734;
               this.labelStyle = "libPatchName";
               this.focusAlpha = 1;
               this.image = _embed_css__assets_images_library_bgi_patch_textinput_png__910263123_1192247490;
            };
         }
         selector = null;
         conditions = null;
         conditions = [];
         condition = new CSSCondition("class","liveSetEditTextInput");
         conditions.push(condition);
         selector = new CSSSelector("spark.components.TextInput",conditions,selector);
         style = styleManager.getStyleDeclaration("spark.components.TextInput.liveSetEditTextInput");
         if(!style)
         {
            style = new CSSStyleDeclaration(selector,styleManager);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.focusColor = 10676734;
               this.labelStyle = "libLiveSetNameEdit";
               this.focusAlpha = 1;
               this.image = _embed_css__assets_images_library_img_liveseteditnamebox_png__1940522672_1601065144;
            };
         }
         selector = null;
         conditions = null;
         conditions = [];
         condition = new CSSCondition("class","patchTextArea");
         conditions.push(condition);
         selector = new CSSSelector("spark.components.TextArea",conditions,selector);
         style = styleManager.getStyleDeclaration("spark.components.TextArea.patchTextArea");
         if(!style)
         {
            style = new CSSStyleDeclaration(selector,styleManager);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.focusColor = 10676734;
               this.labelStyle = "libPatchName";
               this.focusAlpha = 1;
               this.image = _embed_css__assets_images_library_bgi_patch_textinput_png__910263123_1192247490;
            };
         }
         selector = null;
         conditions = null;
         conditions = [];
         condition = new CSSCondition("class","recGridEditor");
         conditions.push(condition);
         selector = new CSSSelector("spark.components.TextArea",conditions,selector);
         style = styleManager.getStyleDeclaration("spark.components.TextArea.recGridEditor");
         if(!style)
         {
            style = new CSSStyleDeclaration(selector,styleManager);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.labelStyle = "recGridEditorText";
               this.focusAlpha = 0;
               this.image = _embed_css__assets_images_library_bgi_patch_textinput_png__910263123_1192247490;
            };
         }
         selector = null;
         conditions = null;
         conditions = [];
         condition = new CSSCondition("class","libLiveSetNameEdit");
         conditions.push(condition);
         selector = new CSSSelector("spark.components.RichEditableText",conditions,selector);
         style = styleManager.getStyleDeclaration("spark.components.RichEditableText.libLiveSetNameEdit");
         if(!style)
         {
            style = new CSSStyleDeclaration(selector,styleManager);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.color = 16777215;
               this.fontFamily = "A-OTF 新ゴ Pro R";
               this.fontSize = 12;
            };
         }
         selector = null;
         conditions = null;
         conditions = [];
         condition = new CSSCondition("class","numericStepperText");
         conditions.push(condition);
         selector = new CSSSelector("spark.components.RichEditableText",conditions,selector);
         style = styleManager.getStyleDeclaration("spark.components.RichEditableText.numericStepperText");
         if(!style)
         {
            style = new CSSStyleDeclaration(selector,styleManager);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.color = 9430271;
               this.textAlign = "right";
               this.verticalAlign = "middle";
               this.fontSize = 16;
               this.focusedTextSelectionColor = 16776368;
            };
         }
         selector = null;
         conditions = null;
         conditions = [];
         condition = new CSSCondition("class","numericStepperTextBlack");
         conditions.push(condition);
         selector = new CSSSelector("spark.components.RichEditableText",conditions,selector);
         style = styleManager.getStyleDeclaration("spark.components.RichEditableText.numericStepperTextBlack");
         if(!style)
         {
            style = new CSSStyleDeclaration(selector,styleManager);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.color = 16777215;
               this.textAlign = "right";
               this.fontSize = 14;
               this.focusedTextSelectionColor = 26367;
            };
         }
         selector = null;
         conditions = null;
         conditions = [];
         condition = new CSSCondition("class","numericStepperDetailText");
         conditions.push(condition);
         selector = new CSSSelector("spark.components.RichEditableText",conditions,selector);
         style = styleManager.getStyleDeclaration("spark.components.RichEditableText.numericStepperDetailText");
         if(!style)
         {
            style = new CSSStyleDeclaration(selector,styleManager);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.color = 9430271;
               this.textAlign = "right";
               this.fontSize = 20;
               this.focusedTextSelectionColor = 16776368;
            };
         }
         selector = null;
         conditions = null;
         conditions = [];
         condition = new CSSCondition("class","numericStepperTextChanging");
         conditions.push(condition);
         selector = new CSSSelector("spark.components.RichEditableText",conditions,selector);
         style = styleManager.getStyleDeclaration("spark.components.RichEditableText.numericStepperTextChanging");
         if(!style)
         {
            style = new CSSStyleDeclaration(selector,styleManager);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.color = 16729413;
               this.textAlign = "right";
               this.fontSize = 16;
            };
         }
         selector = null;
         conditions = null;
         conditions = [];
         condition = new CSSCondition("class","numericStepperDetailTextChanging");
         conditions.push(condition);
         selector = new CSSSelector("spark.components.RichEditableText",conditions,selector);
         style = styleManager.getStyleDeclaration("spark.components.RichEditableText.numericStepperDetailTextChanging");
         if(!style)
         {
            style = new CSSStyleDeclaration(selector,styleManager);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.color = 16729413;
               this.textAlign = "right";
               this.fontSize = 20;
            };
         }
         selector = null;
         conditions = null;
         conditions = [];
         condition = new CSSCondition("class","selectPachNameLabel");
         conditions.push(condition);
         selector = new CSSSelector("spark.components.RichEditableText",conditions,selector);
         style = styleManager.getStyleDeclaration("spark.components.RichEditableText.selectPachNameLabel");
         if(!style)
         {
            style = new CSSStyleDeclaration(selector,styleManager);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.color = 16777215;
               this.fontFamily = "A-OTF 新ゴ Pro R";
               this.fontSize = 12;
            };
         }
         selector = null;
         conditions = null;
         conditions = [];
         condition = new CSSCondition("class","recGridEditorText");
         conditions.push(condition);
         selector = new CSSSelector("spark.components.RichEditableText",conditions,selector);
         style = styleManager.getStyleDeclaration("spark.components.RichEditableText.recGridEditorText");
         if(!style)
         {
            style = new CSSStyleDeclaration(selector,styleManager);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.color = 16777215;
               this.fontSize = 17;
            };
         }
         selector = null;
         conditions = null;
         conditions = [];
         condition = new CSSCondition("class","libLiveSetName");
         conditions.push(condition);
         selector = new CSSSelector("spark.components.RichEditableText",conditions,selector);
         style = styleManager.getStyleDeclaration("spark.components.RichEditableText.libLiveSetName");
         if(!style)
         {
            style = new CSSStyleDeclaration(selector,styleManager);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.color = 16777215;
               this.fontFamily = "A-OTF 新ゴ Pro R";
               this.fontSize = 12;
            };
         }
         selector = null;
         conditions = null;
         conditions = [];
         condition = new CSSCondition("class","libPatchName");
         conditions.push(condition);
         selector = new CSSSelector("spark.components.RichEditableText",conditions,selector);
         style = styleManager.getStyleDeclaration("spark.components.RichEditableText.libPatchName");
         if(!style)
         {
            style = new CSSStyleDeclaration(selector,styleManager);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.color = 16777215;
               this.fontFamily = "A-OTF 新ゴ Pro R";
               this.fontSize = 12;
            };
         }
         selector = null;
         conditions = null;
         conditions = [];
         condition = new CSSCondition("class","infoItemDescLabel");
         conditions.push(condition);
         selector = new CSSSelector("spark.components.RichText",conditions,selector);
         style = styleManager.getStyleDeclaration("spark.components.RichText.infoItemDescLabel");
         if(!style)
         {
            style = new CSSStyleDeclaration(selector,styleManager);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.color = 16777215;
               this.fontSize = 13;
            };
         }
         selector = null;
         conditions = null;
         conditions = [];
         condition = new CSSCondition("class","infoItemDescLabelJP");
         conditions.push(condition);
         selector = new CSSSelector("spark.components.RichText",conditions,selector);
         style = styleManager.getStyleDeclaration("spark.components.RichText.infoItemDescLabelJP");
         if(!style)
         {
            style = new CSSStyleDeclaration(selector,styleManager);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.color = 16777215;
               this.fontFamily = "A-OTF 新ゴ Pro R";
               this.fontSize = 11;
            };
         }
         styleManager.initProtoChainRoots();
      }
      
      [Bindable(event="propertyChange")]
      public function get addLivesetMsgArea() : AddLivesetMsgArea
      {
         return this._200450599addLivesetMsgArea;
      }
      
      public function set addLivesetMsgArea(param1:AddLivesetMsgArea) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this._200450599addLivesetMsgArea;
         if(_loc2_ !== param1)
         {
            this._200450599addLivesetMsgArea = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"addLivesetMsgArea",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get contentsArea() : ContentsAreaContainer
      {
         return this._848790215contentsArea;
      }
      
      public function set contentsArea(param1:ContentsAreaContainer) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this._848790215contentsArea;
         if(_loc2_ !== param1)
         {
            this._848790215contentsArea = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"contentsArea",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get infoArea() : InfoArea
      {
         return this._177381979infoArea;
      }
      
      public function set infoArea(param1:InfoArea) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this._177381979infoArea;
         if(_loc2_ !== param1)
         {
            this._177381979infoArea = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"infoArea",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get loading() : Loading
      {
         return this._336650556loading;
      }
      
      public function set loading(param1:Loading) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this._336650556loading;
         if(_loc2_ !== param1)
         {
            this._336650556loading = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"loading",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get logic() : ToneCentralLogic
      {
         return this._103149406logic;
      }
      
      public function set logic(param1:ToneCentralLogic) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this._103149406logic;
         if(_loc2_ !== param1)
         {
            this._103149406logic = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"logic",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get sideArea() : SideAreaContainer
      {
         return this._216571524sideArea;
      }
      
      public function set sideArea(param1:SideAreaContainer) : void
      {
         var _loc2_:Object = null;
         _loc2_ = this._216571524sideArea;
         if(_loc2_ !== param1)
         {
            this._216571524sideArea = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"sideArea",_loc2_,param1));
            }
         }
      }
   }
}

