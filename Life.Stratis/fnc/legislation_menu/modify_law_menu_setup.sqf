// A_legislation_menu_fnc_modify_law_menu_setup

#include "..\..\includes\macro.h"
#include "..\..\includes\constants.h"


disableSerialization;
ARGV(0,_title);
ARGV(1,_editable);

if (UNDEFINED(_editable)) then {
	_editable = true;
};

if (!(createDialog "legislation_modify_law_menu")) exitWith {
	player groupChat format["ERROR: Could not create legislation modify law menu dialog"];
};

private["_display"];
_display = (uiNamespace getVariable 'LEGISLATION_MODIFY_LAW_MENU');

_legislation_modify_law_menu_header = _display displayCtrl legislation_modify_law_menu_header_idc;
_legislation_modify_law_menu_background = _display displayCtrl legislation_modify_law_menu_background_idc;
_legislation_modify_law_menu_submit_button = _display displayCtrl legislation_modify_law_menu_submit_button_idc;
_legislation_modify_law_menu_close_button = _display displayCtrl legislation_modify_law_menu_close_button_idc;
_legislation_modify_law_menu_field = _display displayCtrl legislation_modify_law_menu_field_idc;

private["_x", "_y", "_ysep", "_sep", "_w", "_h", "_header_title"];
_x = 0.14;
_y = 0.14;
_w = 0.55;
_h = 0.25;
_ysep = 0.003;
_sep = 0.01;
_header_title = _title;

private["_button_font_height", "_font_family"];
_button_font_height = MENU_TITLE_FONT_HEIGHT;
_font_family = "PuristaMedium";

//header
private["_lhx", "_lhy", "_lhw", "_lhh"];
_lhx = _x;
_lhy = _y;
_lhw = _w;
_lhh = 0.045;

_legislation_modify_law_menu_header ctrlSetPosition [_lhx, _lhy, _lhw, _lhh];
_legislation_modify_law_menu_header ctrlSetFontHeight _button_font_height;
_legislation_modify_law_menu_header ctrlSetFont _font_family;
_legislation_modify_law_menu_header ctrlSetText _header_title;
_legislation_modify_law_menu_header ctrlCommit 0;

//background
private["_lbx", "_lby", "_lbw", "_lbh"];
_lbx = _lhx;
_lby = _lhy + _lhh + _ysep;
_lbw = _w;
_lbh = _h - _lhh - _lhh - _ysep - _ysep;

_legislation_modify_law_menu_background ctrlSetPosition [_lbx, _lby, _lbw, _lbh];
_legislation_modify_law_menu_background ctrlSetBackgroundColor [0,0,0,0.65];
_legislation_modify_law_menu_background ctrlCommit 0;

//submit button
private["_lsx", "_lsy", "_lsw", "_lsh"];
_lsw = 0.12;
_lsh = _lhh;
_lsx = _lhx;
_lsy = _lby + _lbh + _ysep;

_legislation_modify_law_menu_submit_button ctrlSetText "Submit";
_legislation_modify_law_menu_submit_button ctrlSetPosition [_lsx, _lsy, _lsw, _lsh];
_legislation_modify_law_menu_submit_button ctrlShow _editable;
_legislation_modify_law_menu_submit_button ctrlCommit 0;


//close button
private["_lcx", "_lcy", "_lcw", "_lch"];
_lcw = 0.14;
_lch = _lhh;
_lcx = _lhx + _lhw - _lcw;
_lcy = _lhy + _h - _lch;

_legislation_modify_law_menu_close_button ctrlSetText "Close";
_legislation_modify_law_menu_close_button ctrlSetPosition [_lcx, _lcy, _lcw, _lch];
buttonSetAction [(ctrlIDC _legislation_modify_law_menu_close_button), "closeDialog 0"];
_legislation_modify_law_menu_close_button ctrlCommit 0;

//field
private["_llx", "_lly", "_llw", "_llh"];
_llx = _lbx + _sep * 2; 
_lly = _lby + _sep * 2;
_llw = _lhw - _sep * 4;
_llh = _lbh - _sep * 4;;

_legislation_modify_law_menu_field ctrlSetText "";
_legislation_modify_law_menu_field ctrlSetPosition [_llx, _lly, _llw, _llh];
_legislation_modify_law_menu_field ctrlSetFontHeight _button_font_height - 0.003;
_legislation_modify_law_menu_field ctrlEnable _editable;
_legislation_modify_law_menu_field ctrlCommit 0;


_legislation_modify_law_menu_field	
