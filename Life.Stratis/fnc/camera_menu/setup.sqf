// A_camera_menu_fnc_setup

#include "..\..\includes\macro.h"
#include "..\..\includes\constants.h"


disableSerialization;

private["_display"];
_display = uiNamespace getVariable "CAMERA_MENU";
player groupChat format["_display = %1", _display];

private["_header", "_background", 
		"_input_label", "_input_field",
		"_object_label", "_object_field",
		"_command_label", "_command_field",
		"_execute_button", 
		"_close_button"];
		
 _object_label = _display displayCtrl camera_menu_object_label_idc;
 _object_field = _display displayCtrl camera_menu_object_field_idc;
 _command_label = _display displayCtrl camera_menu_command_label_idc;
 _command_field = _display displayCtrl camera_menu_command_field_idc;
 _input_label = _display displayCtrl camera_menu_input_label_idc;
 _input_field = _display displayCtrl camera_menu_input_field_idc;
 _execute_button = _display displayCtrl camera_menu_execute_button_idc;
 _background = _display displayCtrl camera_menu_background_idc;
 _header = _display displayCtrl camera_menu_header_idc;
 _close_button = _display displayCtrl camera_menu_close_button_idc;
 
private["_ysep", "_sep", "_x", "_y", "_w", "_h"];
_title = "CAMERA MENU";
_x = 0.14;
_y = 0.14;
_w = 0.65;
_h = 0.3;
_ysep = 0.003;
_sep = 0.01;

private["_button_font_height"];
_button_font_height = MENU_TITLE_FONT_HEIGHT;

//header
private["_hx", "_hy", "_hw", "_hh"];
_hx = _x;
_hy = _y;
_hw = _w;
_hh = 0.045;

_header ctrlSetPosition [_hx, _hy, _hw, _hh];
_header ctrlSetFontHeight _button_font_height;
_header ctrlSetText _title;
_header ctrlSetFont "PuristaMedium";
_header ctrlCommit 0;

//close button
private["_cx", "_cy", "_cw", "_ch"];
_cw = 0.14;
_ch = _hh;
_cx = _x + _w - _cw;
_cy = _y + _h - _ch;

_close_button ctrlSetText "Close";
_close_button ctrlSetPosition [_cx, _cy, _cw, _ch];
buttonSetAction [(ctrlIDC _close_button), "closeDialog 0"];
_close_button ctrlCommit 0;

//background
private["_bx", "_by", "_bw", "_bh"];
_bx = _x;
_by = _hy + _hh + _ysep;
_bw = _w;
_bh = (_cy ) - (_hy ) - _ch - _ysep - _ysep;

_background ctrlSetPosition [_bx, _by, _bw, _bh];
_background ctrlCommit 0;

//execute button
private["_ex", "_ey" ,"_ew", "_eh"];
_ex = _hx;
_ey = _by + _bh + _ysep;
_ew = _cw * 1.2;
_eh = _ch;

_execute_button ctrlSetText "Execute";
_execute_button ctrlSetPosition [_ex, _ey, _ew, _eh];
_execute_button ctrlCommit 0;

//input label
private["_ilx", "_ily", "_ilh", "_ilw"];
_ilx = _bx + _sep * 2;
_ily = _by + _sep * 2;
_ilw = _hh * 6.5;
_ilh = 0.04;

_input_label ctrlSetText "Command input: ";
_input_label ctrlSetPosition [_ilx, _ily, _ilw, _ilh];
_input_label ctrlSetFontHeight _button_font_height - 0.003;
_input_label ctrlCommit 0;

//input field
private["_ifx", "_ify", "_ifw", "_ifh"];
_ifx = _ilx + _ilw + _sep ;
_ify = _ily;
_ifw = _ilw;
_ifh = _ilh;

_input_field ctrlSetFontHeight _button_font_height - 0.003;;
_input_field ctrlSetFont "PuristaMedium";
_input_field ctrlSetPosition [_ifx, _ify, _ifw, _ifh];
_input_field ctrlSetBackgroundColor [1,1,1,0.08];
_input_field ctrlCommit 0;

//object label
private["_olx", "_oly", "_olh", "_olw"];
_olx = _bx + _sep * 2;
_oly = _ily + _ilh + _sep;
_olw = _ilw;
_olh = _ilh;

_object_label ctrlSetText "Target object: ";
_object_label ctrlSetPosition [_olx, _oly, _olw, _olh];
_object_label ctrlSetFontHeight _button_font_height - 0.003;
_object_label ctrlCommit 0;

//object field
private["_ofx", "_ofy", "_ofw", "_ofh"];
_ofx = _olx + _olw + _sep ;
_ofy = _oly;
_ofw = _olw;
_ofh = _olh;

_object_field ctrlSetFontHeight _button_font_height - 0.003;;
_object_field ctrlSetFont "PuristaMedium";
_object_field ctrlSetPosition [_ofx, _ofy, _ofw, _ofh];
_object_field ctrlSetBackgroundColor [1,1,1,0.08];
_object_field ctrlCommit 0;

_object_field ctrlAddEventHandler ["SetFocus", "(_this) call A_camera_menu_fnc_combo_focus"];
_object_field ctrlAddEventHandler ["KillFocus", "(_this) call A_camera_menu_fnc_combo_blur"];

//command label
private["_clx", "_cly", "_clh", "_clw"];
_clx = _bx + _sep * 2;
_cly = _oly + _olh + _sep;
_clw = _olw;
_clh = _olh;

_command_label ctrlSetText "Command: ";
_command_label ctrlSetPosition [_clx, _cly, _clw, _clh];
_command_label ctrlSetFontHeight _button_font_height - 0.003;
_command_label ctrlCommit 0;

//command field
private["_cfx", "_cfy", "_cfw", "_cfh"];
_cfx = _clx + _clw + _sep ;
_cfy = _cly;
_cfw = _clw;
_cfh = _clh;

_command_field ctrlSetFontHeight _button_font_height - 0.003;;
_command_field ctrlSetFont "PuristaMedium";
_command_field ctrlSetPosition [_cfx, _cfy, _cfw, _cfh];
_command_field ctrlSetBackgroundColor [1,1,1,0.08];
_command_field ctrlCommit 0;

_command_field ctrlAddEventHandler ["SetFocus", "(_this) call A_camera_menu_fnc_combo_focus"];
_command_field ctrlAddEventHandler ["KillFocus", "(_this) call A_camera_menu_fnc_combo_blur"];
