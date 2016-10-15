// A_list_simple_menu_fnc_setup

#include "header.h"


disableSerialization;
params["_title","_ix","_y","_w","_y"];

if (!(createDialog "list_simple_menu")) exitWith {
	player groupChat format["ERROR: Could not create list simple menu dialog"];
};

private _display = (uiNamespace getVariable 'LIST_SIMPLE_MENU');

_list_simple_menu_header = _display displayCtrl list_simple_menu_header_idc;
_list_simple_menu_background = _display displayCtrl list_simple_menu_background_idc;
_list_simple_menu_select_button = _display displayCtrl list_simple_menu_submit_button_idc;
_list_simple_menu_close_button = _display displayCtrl list_simple_menu_close_button_idc;
_list_simple_menu_list = _display displayCtrl list_simple_menu_list_idc;

private _ysep = 0.003;
private _sep = 0.01;
private _header_title = _title;

private _button_font_height = MENU_TITLE_FONT_HEIGHT;
private _font_family = "PuristaMedium";


//header
private _lhx = _x;
private _lhy = _y;
private _lhw = _w;
private _lhh = 0.045;

_list_simple_menu_header ctrlSetPosition [_lhx, _lhy, _lhw, _lhh];
_list_simple_menu_header ctrlSetFontHeight _button_font_height;
_list_simple_menu_header ctrlSetFont _font_family;
_list_simple_menu_header ctrlSetText _header_title;
_list_simple_menu_header ctrlCommit 0;


//background
private _lbx = _lhx;
private _lby = _lhy + _lhh + _ysep;
private _lbw = _w;
private _lbh = _h - _lhh - _lhh - _ysep - _ysep;

_list_simple_menu_background ctrlSetPosition [_lbx, _lby, _lbw, _lbh];
_list_simple_menu_background ctrlSetBackgroundColor [0,0,0,0.65];
_list_simple_menu_background ctrlCommit 0;


//select button
private _lsw = 0.20;
private _lsh = _lhh;
private _lsx = _lhx;
private _lsy = _lby + _lbh + _ysep;

_list_simple_menu_select_button ctrlSetText "Submit";
_list_simple_menu_select_button ctrlSetPosition [_lsx, _lsy, _lsw, _lsh];
_list_simple_menu_select_button ctrlCommit 0;


//close button
private _lcw = 0.14;
private _lch = _lhh;
private _lcx = _lhx + _lhw - _lcw;
private _lcy = _lhy + _h - _lch;

_list_simple_menu_close_button ctrlSetText "Close";
_list_simple_menu_close_button ctrlSetPosition [_lcx, _lcy, _lcw, _lch];
buttonSetAction [(ctrlIDC _list_simple_menu_close_button), "closeDialog 0"];
_list_simple_menu_close_button ctrlCommit 0;


//list
private _llx = _lbx + _sep ; 
private _lly = _lby + _sep;
private _llw = _lhw - _sep * 2;
private _llh = _lbh - _sep * 2;

_list_simple_menu_list ctrlSetText "";
_list_simple_menu_list ctrlSetPosition [_llx, _lly, _llw, _llh];
_list_simple_menu_list ctrlSetFontHeight _button_font_height - 0.003;
_list_simple_menu_list ctrlCommit 0;



private _controls = [];
_controls set [DLG_LIST_SIMPLE_INDEX_HEADER, _list_simple_menu_header];
_controls set [DLG_LIST_SIMPLE_INDEX_LIST, _list_simple_menu_list];
_controls set [DLG_LIST_SIMPLE_INDEX_SUBMIT, _list_simple_menu_select_button];
_controls set [DLG_LIST_SIMPLE_INDEX_CLOSE, _list_simple_menu_close_button];

_controls