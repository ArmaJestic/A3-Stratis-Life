// A_inventory_menu_fnc_setup

#include "../../includes/macro.h"
#include "../../includes/constants.h"


disableSerialization;
private["_display"];
_display = (uiNamespace getVariable 'INVENTORY_MENU');
	
private["_header_control", "_background_control", "_close_button", 
		"_use_button", "_drop_button", "_give_button", "_selected_field",
		"_info_field", "_info_label", "_amount_label", "_amount_field", "_selected_label",
		"_weight_label", "_weight_field", "_target_label", "_target_field"];
		
_header_control = _display displayCtrl inventory_header_idc;
_background_control = _display displayCtrl inventory_background_idc;
_close_button = _display displayCtrl inventory_button_close_idc;
_use_button = _display displayCtrl inventory_button_use_idc;
_drop_button = _display displayCtrl inventory_button_drop_idc;
_give_button = _display displayCtrl inventory_button_give_idc;
_desc_field = _display displayCtrl inventory_desciption_text_idc;
_selected_field = _display displayCtrl inventory_textbox_amount_idc;

_target_field = _display displayCtrl inventory_player_list_idc;

_info_label = _display displayCtrl inventory_item_info_label_idc;
_info_field = _display displayCtrl inventory_items_list_idc;
_amount_label = _display displayCtrl inventory_item_amount_label_idc;
_amount_field = _display displayCtrl inventory_item_amount_field_idc;
_selected_label = _display displayCtrl inventory_item_info_add_label;
_weight_label = _display displayCtrl inventory_item_info_weight_label_idc;
_weight_field = _display displayCtrl inventory_item_info_weight_field_idc;
_target_label = _display displayCtrl inventory_item_info_field_idc;

_info_field ctrlAddEventHandler ["SetFocus", "(_this) call A_inventory_menu_fnc_combo_focus"];
_info_field ctrlAddEventHandler ["KillFocus", "(_this) call A_inventory_menu_fnc_combo_blur"];
_info_field ctrlAddEventHandler ["LBSelChanged", "(_this) call A_inventory_menu_fnc_interact_inventory_menu_item_changed"];

buttonSetAction [inventory_button_use_idc, format["[player, lbData [1, (lbCurSel 1)], ([(ctrlText 501)] call A_misc_fnc_parse_number)] call A_interaction_fnc_item_use_inventory; closedialog 0;"]];
buttonSetAction [inventory_button_drop_idc, format["[player, lbData [1, (lbCurSel 1)], ([(ctrlText 501)] call A_misc_fnc_parse_number)] call A_interaction_fnc_item_take_inventory; closedialog 0;"]];
buttonSetAction [inventory_button_give_idc, format["[player, lbData [1, (lbCurSel 1)], ([(ctrlText 501)] call A_misc_fnc_parse_number), (missionNamespace getVariable (lbData [99, (lbCurSel 99)]))] call A_interaction_fnc_item_give; closedialog 0;"]];

private["_ysep", "_sep"];
_ysep = 0.003;
_sep = 0.01;

private["_hx", "_hy", "_hw","_hh"];
//header position
_hx = 0.14; _hy = 0.14;
_hw = 0.55; _hh = 0.045;

//background position
private["_bx", "_by", "_bw", "_bh"];
_bx = _hx; 
_by = _hy + _hh + _ysep;
_bw = _hw; 
_bh = _hh * 12;

//close button position
private["_cx", "_cy", "_cw", "_ch"];
_cw = 0.13; _ch = 0.04;
_cx = _bx + _bw - _cw; 
_cy = _by + _bh + _ysep;

//description 
private["_ex", "_ey", "_ew", "_eh"];
_ex = _bx + _sep;
_ey = _by + _sep ;
_ew = _bw - _sep * 2;
_eh = 0.15;

//use button
private["_ux", "_uy", "_uw", "_uh"];
_ux = _bx;
_uy = _by + _bh + _ysep;
_uw = 0.12;
_uh = _ch;

//drop button
private["_dx", "_dy", "_dw", "_dh"];
_dx = _ux + _uw + _ysep;
_dy = _uy;
_dw = _uw;
_dh = _uh;


//give button
private["_gx", "_gy", "_gw", "_gh"];
_gx = _dx + _dw + _ysep;
_gy = _uy;
_gw = _uw;
_gh = _uh;

//info label
private["_ilx", "_ily", "_ilw", "_ilh"];
_ilx = _ex;
_ily = _ey + _eh + _sep;
_ilw = _ew / 2  - _sep;
_ilh = 0.04;

//item list
private["_lx", "_ly", "_lw", "_lh"];
//_lx = _ilx + _ilw + _sep ;
//_ly = _ily;
//_lw = _ilw;
//_lh = _ilh;

_lx = _ilx;
_ly = _ily;
_lw = _ew;
_lh = _eh * 1.3;

//amount label
private["_alx", "_aly", "_alw", "_alh"];
_alx = _ex;
_aly = _ly + _lh + _sep;
_alw = _ilw;
_alh = _ilh;

//amount field
private["_afx", "_afy", "_afw", "_afh"];
_afx = _alx + _alw + _sep * 2 ;
_afy = _aly;
_afw = _alw;
_afh = _alh;

//selected label
private["_slx", "_sly", "_slw", "_slh"];
_slx = _ex;
_sly = _aly + _alh + _sep;
_slw = _ilw;
_slh = _ilh;

//selected field
private["_sfx", "_sfy", "_sfw", "_sfh"];
_sfx = _slx + _slw + _sep * 2 ;
_sfy = _sly;
_sfw = _slw;
_sfh = _slh;

//weight label
private["_wlx", "_wly", "_wlw", "_wlh"];
_wlx = _ex;
_wly = _sly + _slh + _sep;
_wlw = _ilw;
_wlh = _ilh;

//weight field
private["_wfx", "_wfy", "_wfw", "_wfh"];
_wfx = _wlx + _wlw + _sep * 2 ;
_wfy = _wly;
_wfw = _wlw;
_wfh = _wlh;

//target label
private["_tlx", "_tly", "_slw", "_tlh"];
_tlx = _ex;
_tly = _wly + _wlh + _sep;
_tlw = _ilw;
_tlh = _ilh;

//target field
private["_tfx", "_tfy", "_tfw", "_tfh"];
_tfx = _tlx + _tlw + _sep * 2 ;
_tfy = _tly;
_tfw = _tlw;
_tfh = _tlh;

_header_control ctrlSetPosition [_hx, _hy, _hw, _hh];
_header_control ctrlSetFontHeight (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1);
_header_control ctrlSetText "INVENTORY";
_header_control ctrlSetFont "PuristaMedium";
_background_control ctrlSetPosition [_bx, _by, _bw, _bh];

private["_button_font_height"];
_button_font_height = MENU_TITLE_FONT_HEIGHT;

//close button
_close_button ctrlSetText "Close";
_close_button ctrlSetPosition [_cx, _cy, _cw, _ch];

//use button
_use_button ctrlSetText "Use";
_use_button ctrlSetPosition[_ux, _uy, _uw, _uh];

//drop button
_drop_button ctrlSetText "Take";
_drop_button ctrlSetPosition [_dx, _dy, _dw, _dh];

//give button
_give_button ctrlSetText "Give";
_give_button ctrlSetPosition [_gx, _gy, _gw, _gh];
_give_button ctrlShow false;

//description text
_desc_field ctrlSetFontheight _button_font_height - 0.001;
_desc_field ctrlSetPosition [_ex, _ey, _ew, _eh];
_desc_field ctrlSetBackgroundColor [0, 0, 0, 0.45];

_info_field ctrlSetFontHeight _button_font_height - 0.003;
_info_field ctrlSetPosition [_lx, _ly, _lw, _lh];
player groupChat format["_lh = %1", _lh];
_info_field ctrlSetBackgroundColor [0, 0, 0, 0.45];

_info_label ctrlSetText "Item name:";
_info_label ctrlSetPosition [_ilx, _ily, _ilw, _ilh];
_info_label ctrlSetFontHeight _button_font_height - 0.003;
_info_label ctrlShow false;

_amount_label ctrlSetText "Item amount:";
_amount_label ctrlSetPosition [_alx, _aly, _alw, _alh];
_amount_label ctrlSetFontHeight _button_font_height - 0.003;

_amount_field ctrlSetPosition [_afx, _afy, _afw, _afh];
_amount_field ctrlSetFontHeight _button_font_height - 0.003;
_amount_field ctrlSetBackgroundColor [1,1,1,0.08];

_selected_label ctrlSetText "Items selected:";
_selected_label ctrlSetPosition [_slx, _sly, _slw, _slh];
_selected_label ctrlSetFontHeight _button_font_height - 0.003;

_selected_field ctrlSetFontHeight _button_font_height - 0.003;;
_selected_field ctrlSetFont "PuristaMedium";
_selected_field ctrlSetPosition [_sfx, _sfy, _sfw, _sfh];
_selected_field ctrlSetBackgroundColor [1,1,1,0.08];

_weight_label ctrlSetText "Items weight (total):";
_weight_label ctrlSetPosition [_wlx, _wly, _wlw, _wlh];
_weight_label ctrlSetFontHeight _button_font_height - 0.003;

_weight_field ctrlSetFontHeight _button_font_height - 0.003;;
_weight_field ctrlSetFont "PuristaMedium";
_weight_field ctrlSetPosition [_wfx, _wfy, _wfw, _wfh];
_weight_field ctrlSetBackgroundColor [1,1,1,0.08];

_target_label ctrlSetText "Target player:";
_target_label ctrlSetPosition [_tlx, _tly, _tlw, _tlh];
_target_label ctrlSetFontHeight _button_font_height - 0.003;
_target_label ctrlShow false;

_target_field ctrlSetFontHeight _button_font_height - 0.003;;
_target_field ctrlSetFont "PuristaMedium";
_target_field ctrlSetPosition [_tfx, _tfy, _tfw, _tfh];
_target_field ctrlSetBackgroundColor [1,1,1,0.08];
_target_field ctrlShow false;

_background_control ctrlCommit 0;
_header_control ctrlCommit  0;
_close_button ctrlCommit 0;
_use_button ctrlCommit 0;
_drop_button ctrlCommit 0;
_give_button ctrlCommit 0;
_desc_field ctrlCommit 0;
_info_field ctrlCommit 0;
_info_label ctrlCommit 0;
_amount_label ctrlCommit 0;
_amount_field ctrlCommit 0;
_selected_label ctrlCommit 0;
_selected_field ctrlCommit 0;
_weight_label ctrlCommit 0;
_weight_field ctrlCommit 0;
_target_label ctrlCommit 0;
_target_field ctrlCommit 0;

_display
