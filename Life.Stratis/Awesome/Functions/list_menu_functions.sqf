#include "macro.h"

if (not(undefined(list_menu_functions_defined))) exitWith {null};
#include "constants.h"

list_menu_populate = {
	ARGV(0,_control);
	ARGV(1,_uids);

	if (undefined(_control)) exitWith {null};
	if (undefined(_uids)) exitWith {null};
	if (typeName _uids != "ARRAY") exitWith {null};
	
	 lbClear _control;
	
	private["_i"];
	_i = 0;
	{if (true) then {
		private["_player", "_name", "_uid"];
		_player = _x;
		_name = (name _player);
		_uid = (getPlayerUID _player);
		
		if (not([_player] call player_human)) exitWith {null};
		
		_i = _i + 1;
		
		private["_color"];
		_color = [1,0,0,0.8];
		if (_uid in _uids) then {
			_color = [0,1,0,0.8]; 
		};
		
		private["_index"];
		_index = _control lbAdd format["%1. %2", _i, _name, _uid];
		_control lbSetData [_index, _uid];
		_control lbSetColor [_index, _color];	
	};} forEach (allUnits);

};

list_menu_add = {
	//player groupChat format["list_menu_add %1", _this];
	ARGV(0,_list_id);
	
	if (undefined(_list_id)) exitWith {null};
	if (typeName _list_id != "STRING") exitWith {null};
	
	
	private["_index"];
	_index = lbCurSel listMenu_itemsList_idc;
	if (_index == -1) exitWith {
		player groupChat format["No item selected to add"];
	};
	
	private["_item", "_text"];
	_item = lbData [listMenu_itemsList_idc, _index];
	_text = lbText [listMenu_itemsList_idc, _index];
	
	if ([_list_id, _item] call list_contains_key) exitWith {
		player groupChat format["List already contains ""%1""", _text];
	};
	
	lbSetColor [listMenu_itemsList_idc, _index, [0,1,0,1]];
	
	player groupChat format["%1 was added to the list", _text];
	
	[_list_id, _item, ""] call list_put_value;	
};

list_menu_remove = {
	//player groupChat format["list_menu_remove %1", _this];
	ARGV(0,_list_id);
	
	if (undefined(_list_id)) exitWith {null};
	if (typeName _list_id != "STRING") exitWith {null};
	
	private["_index"];
	_index = lbCurSel listMenu_itemsList_idc;
	
	if (_index == -1) exitWith {
		player groupChat format["No item selected to remove"];
	};
	
	private["_item", "_text"];
	_item = lbData [listMenu_itemsList_idc, _index];
	_text = lbText [listMenu_itemsList_idc, _index];
	
	if (not([_list_id, _item] call list_contains_key)) exitWith {
		player groupChat format["List does not contain ""%1""", _text];
	};
	
	lbSetColor [listMenu_itemsList_idc, _index, [1,0,0,1]];
	
	player groupChat format["%1 was removed from the list", _text];
	
	[_list_id, _item] call list_remove_key;
};

list_menu_setup = {
	disableSerialization;
	//player groupChat format["list_menu_setup %1", _this];
	ARGV(0,_player);
	ARGV(1,_list_id);
	
	if (not([_player] call player_human)) exitWith {null};
	if (undefined(_list_id)) exitWith {null};
	if (typeName _list_id != "STRING") exitWith {null};
	if (_list_id == "") exitWith {null};

	private["_data"];
	_data = [_list_id] call list_data;
	if (undefined(_data)) exitWith {
		player groupChat format["ERROR: The list identified by ""%1"" does not exist", _list_id];
	};
	
	private["_list_name"];
	_list_name = _data select list_name;
	
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
	


	
	_addButton_control buttonSetAction format['["%1"] call list_menu_add;', _list_id];
	_removeButton_control buttonSetAction format['["%1"] call list_menu_remove', _list_id];
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
	_uids = _data select list_keys;
	[_itemList_control, _uids] call list_menu_populate;
};

list_menu_functions_defined = true;