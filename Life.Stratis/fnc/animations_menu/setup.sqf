// A_animations_menu_fnc_setup

#include "..\..\includes\macro.h"
#include "..\..\includes\constants.h"


disableSerialization;

if (!(createDialog "animations_menu_dialog")) exitWith {
	player groupChat format["ERROR: Could not create animations menu dialog"];
};

private["_display"];
_display = (uiNamespace getVariable 'ANIMATIONS_MENU');

_animations_menu_header = _display displayCtrl animations_menu_header_idc;
_animations_menu_background = _display displayCtrl animations_menu_background_idc;
_animations_menu_list = _display displayCtrl animations_menu_list_idc;
_animations_menu_select_button = _display displayCtrl animations_menu_select_button_idc;
_animations_menu_close_button = _display displayCtrl animations_menu_close_button_idc;



private["_x", "_y", "_ysep", "_sep", "_w", "_h", "_header_title"];
_x = 0.14;
_y = 0.14;
_w = 0.45;
_h = 0.50;
_ysep = 0.003;
_sep = 0.01;
_header_title = "ANIMATIONS";

private["_button_font_height", "_font_family"];
_button_font_height = MENU_TITLE_FONT_HEIGHT;
_font_family = "PuristaMedium";


//header
private["_ahx", "_ahy", "_ahw", "_ahh"];
_ahx = _x;
_ahy = _y;
_ahw = _w;
_ahh = 0.045;

_animations_menu_header ctrlSetPosition [_ahx, _ahy, _ahw, _ahh];
_animations_menu_header ctrlSetFontHeight _button_font_height;
_animations_menu_header ctrlSetFont _font_family;
_animations_menu_header ctrlSetText _header_title;
_animations_menu_header ctrlCommit 0;

//background
private["_abx", "_aby", "_abw", "_abh"];
_abx = _ahx;
_aby = _ahy + _ahh + _ysep;
_abw = _w;
_abh = _h - _ahh - _ahh - _ysep - _ysep;

_animations_menu_background ctrlSetPosition [_abx, _aby, _abw, _abh];
_animations_menu_background ctrlSetBackgroundColor [0,0,0,0.65];
_animations_menu_background ctrlCommit 0;

//buy button
private["_asx", "_asy", "_asw", "_ash"];
_asw = 0.12;
_ash = _ahh;
_asx = _ahx;
_asy = _aby + _abh + _ysep;

_animations_menu_select_button ctrlSetText "Select";
_animations_menu_select_button ctrlSetPosition [_asx, _asy, _asw, _ash];
_animations_menu_select_button ctrlCommit 0;


//close button
private["_acx", "_acy", "_acw", "_ach"];
_acw = 0.14;
_ach = _ahh;
_acx = _ahx + _ahw - _acw;
_acy = _ahy + _h - _ach;

_animations_menu_close_button ctrlSetText "Close";
_animations_menu_close_button ctrlSetPosition [_acx, _acy, _acw, _ach];
buttonSetAction [(ctrlIDC _lotto_close_button), "closeDialog 0"];
_animations_menu_close_button ctrlCommit 0;

//list
private["_alx", "_aly", "_alw", "_alh"];
_alx = _abx + _sep;
_aly = _aby + _sep;
_alw = _abw - _sep * 2;
_alh = _abh - _sep * 2;

_animations_menu_list ctrlSetPosition [_alx, _aly, _alw, _alh];
_animations_menu_list ctrlSetFontHeight _button_font_height * 0.9;
_animations_menu_list ctrlCommit 0;

_animations_menu_list
