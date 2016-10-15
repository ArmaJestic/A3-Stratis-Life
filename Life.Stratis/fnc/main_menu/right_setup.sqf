// A_main_menu_fnc_right_setup

#include "header.h"


disableSerialization;
ARGV(0,_title);
ARGV(1,_x);
ARGV(2,_y);
ARGV(3,_w);
ARGV(4,_h);

if (!(createDialog "main_menu_right")) exitWith {
	player groupChat format["ERROR: cannot create main menu right dialog"];
};
	

private["_display"];
_display = uiNamespace getVariable "MAIN_MENU_RIGHT";

private["_header", "_background", 
		"_button_close", "_list"];
		
_header = _display displayCtrl main_menu_right_header_idc;
_background = _display displayCtrl main_menu_right_background_idc;
_button_close = _display displayCtrl main_menu_right_button_close_idc;
_list = _display displayCtrl main_menu_right_content_idc;

private["_ysep", "_sep"];
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

_button_close ctrlSetText "Close";
_button_close ctrlSetPosition [_cx, _cy, _cw, _ch];
buttonSetAction [(ctrlIDC _button_close), "closeDialog 0"];
_button_close ctrlCommit 0;

//background
private["_bx", "_by", "_bw", "_bh"];
_bx = _x;
_by = _hy + _hh + _ysep;
_bw = _w;
_bh = (_cy ) - (_hy ) - _ch - _ysep - _ysep;

_background ctrlSetPosition [_bx, _by, _bw, _bh];
_background ctrlSetBackgroundColor [0,0,0,0.45];
_background ctrlCommit 0;

//list
private["_lx", "_ly", "_lw", "_ly"];
_lx = _bx + _ysep * 3 ;
_ly = _by + _ysep * 3;
_lw = _bw - _ysep * 6;
_lh = _bh - _ysep * 6;

_list ctrlSetPosition [_lx, _ly, _lw, _lh];
_list ctrlSetFontHeight _button_font_height - 0.003;
_list ctrlCommit 0;

_list
