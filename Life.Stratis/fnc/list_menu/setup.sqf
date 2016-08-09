// A_list_menu_fnc_setup

#include "..\..\includes\macro.h"
#include "..\..\includes\constants.h"


disableSerialization;
//player groupChat format["A_list_menu_fnc_setup %1", _this];
ARGV(0,_player);
ARGV(1,_list_id);

if (!([_player] call A_player_fnc_human)) exitWith {null};
if (undefined(_list_id)) exitWith {null};
if (typeName _list_id != "STRING") exitWith {null};
if (_list_id == "") exitWith {null};

private["_data"];
_data = [_list_id] call A_list_fnc_data;
if (undefined(_data)) exitWith {
	player groupChat format["ERROR: The list identified by ""%1"" does not exist", _list_id];
};

private["_list_name"];
_A_list_var_name = _data select A_list_var_name;

private["_dialog_title"];
_dialog_title = if (_list_name == "") then {format["List ""%1""", _list_id]} else {format["%1", _list_name]};

private["_x", "_y"];
_x = (safezoneX + 0.5 * safezoneW);
_y = (safezoneY + 0.5 * safezoneH);

_display = (uiNamespace getVariable 'LIST_MENU');

private["_mainFrame_control", "_mainBackground_control", "_itemList_control", "_titleLabel_control",
		"_removeButton_control", "_addButton_control", "_closeButton_control"];
_mainFrame_control = _display displayCtrl listMenu_mainFrame_idc;
_mainBackground_control = _display displayCtrl listMenu_mainBackground_idc;
_titleLabel_control = _display displayCtrl listMenu_titleLabel_idc;
_itemList_control = _display displayCtrl listMenu_itemsList_idc;
_removeButton_control = _display displayCtrl listMenu_removeFromListButton_idc;
_addButton_control = _display displayCtrl listMenu_addToListButton_idc;
_closeButton_control = _display displayCtrl listMenu_closeButton_idc;

_titleLabel_control ctrlSetText _dialog_title;
_titleLabel_control ctrlSetBackgroundColor [0, 0, 0, 0];

private["_w", "_h", "_fontHeight"];
_xoff = -0.3; _yoff = -0.6; _ysep = 0.02;

//main background (m)
_mx = _x + _xoff; _my = _y + _yoff;
_mw = 0.45; _mh = 0.8;  

//title label (tl)
_tlx = _mx; _tly = _my + _ysep;
_tlw = _mw; _tlh = 0.04;

//item list (il)
_ilx = _mx + _ysep; _ily = _tly + _tlh + _ysep;
_ilw = _mw - _ysep * 2; _ilh = 0.5; 

//add to list (al)
_alx = _ilx; _aly = _ily + _ilh + 1.5*_ysep;
_alw = _ilw; _alh = 0.045;

//remove from list (rl)
_rlx = _ilx; _rly = _aly + _alh +  0.5 * _ysep;
_rlw = _ilw; _rlh = _alh;

//close button  (c)
_cx = _ilx; _cy = _rly + _rlh + 0.5 * _ysep;
_cw = _ilw; _ch = _alh;




_addButton_control buttonSetAction format['["%1"] call A_list_menu_fnc_add;', _list_id];
_removeButton_control buttonSetAction format['["%1"] call A_list_menu_fnc_remove', _list_id];
_closeButton_control buttonSetAction "closedialog 0;";
_addButton_control ctrlSetTextColor [0,1,0,0.8];
_removeButton_control ctrlSetTextColor [1,0,0,0.8];

_fontHeight = 0.031;
_buttonFHeight = 0.029;
_buttonF = "PuristaBold";

_mainFrame_control ctrlSetFontHeight _fontHeight;
_titleLabel_control ctrlSetFontHeight _fontHeight;
_titleLabel_control ctrlSetFont "PuristaBold";
_addButton_control ctrlSetFont _buttonF;
_removeButton_control ctrlSetFont _buttonF;
_closeButton_control ctrlSetFont _buttonF;
_addButton_control ctrlSetFontHeight _buttonFHeight;
_removeButton_control ctrlSetFontHeight _buttonFHeight;
_closeButton_control ctrlSetFontHeight _buttonFHeight;

_mainFrame_control ctrlSetPosition [_mx, _my,  _mw, _mh];
_mainBackground_control ctrlSetPosition [_mx, _my,  _mw, _mh];
_itemList_control ctrlSetPosition [_ilx, _ily, _ilw, _ilh];
_titleLabel_control ctrlSetPosition [_tlx, _tly, _tlw, _tlh];
_addButton_control ctrlSetPosition [_alx, _aly, _alw, _alh];
_removeButton_control ctrlSetPosition [_rlx, _rly, _rlw, _rlh];
_closeButton_control ctrlSetPosition [_cx, _cy, _cw, _ch];

_mainFrame_control ctrlCommit 0;
_mainBackground_control ctrlCommit 0;
_itemList_control ctrlCommit 0;
_titleLabel_control ctrlCommit 0;
_addButton_control ctrlCommit 0;
_removeButton_control ctrlCommit 0;
_closeButton_control ctrlCommit 0;

private["_uids"];
_uids = _data select A_list_var_keys;
[_itemList_control, _uids] call A_list_menu_fnc_populate;
