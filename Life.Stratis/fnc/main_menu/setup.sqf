// A_main_menu_fnc_setup

#include "header.h"


disableSerialization;
player groupChat format["A_main_menu_fnc_setup "];

params["_menu_title","_buttons_data"];

if (!(createDialog "main_menu")) exitWith {
	systemChat format["ERROR: cannot create main menu dialog"];	
};

private _display = uiNamespace getVariable "MAIN_MENU";



private["_header",
		"_button_1", "_button_2", "_button_3", "_button_4", "_button_5",
		"_button_6", "_button_7", "_button_8", "_button_9", "_button_10",
		"_button_11", "_button_12", "_button_13", "_button_14", "_button_15",
		"_button_16", "_button_17", "_button_18", "_button_19", "_button_20"];
		
_header = _display displayCtrl main_menu_header_idc;



private["_i", "_buttons"];
_i = main_menu_button_start_idc;
_buttons = [];
while {_i <= main_menu_button_stop_idc } do {
	private["_control"];
	_control = _display displayCtrl _i;
	_buttons set [count(_buttons), _control];
	_i = _i + 1;
};

private["_ysep", "_sep"];
_ysep = 0.003;
_sep = 0.01;

private["_hx", "_hy", "_hw","_hh"];
//header position
_hx = 0.14; 
_hy = 0.14;
_hw = 0.32; 
_hh = 0.045;

_header ctrlSetPosition [_hx, _hy, _hw, _hh];
_header ctrlSetFontHeight (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1);
_header ctrlSetText _menu_title;
_header ctrlSetFont "PuristaMedium";
_header ctrlCommit 0;

private["_button_x", "_button_y"];
_button_x = _hx;
_button_y = _hy + _hh + _ysep;
_button_w = _hw;
_button_h = _hh;

private["_button_prev_y", "_button_sx", "_button_sy"];
_button_sx = _button_x;
_button_sy = _button_y;


if (UNDEFINED(A_main_menu_var_variable_data)) then {
	A_main_menu_var_variable_data = "Sign_Sphere10cm_F" createVehicle (getPos player); 
};


private["_button_last_x", "_button_last_y"];
private["_i"];
_i = 0;
while {_i < (count _buttons_data)} do {

	private["_button_data", "_button_title", "_button_function"];
	_button_data = _buttons_data select _i;
	_button_title = _button_data select DLG_MAIN_INDEX_TITLE;
	_button_handler = _button_data select DLG_MAIN_INDEX_HANDLER;
	_button_variables = _button_data select DLG_MAIN_INDEX_HANDLER_VARS;
	
	if (UNDEFINED(_button_variables)) then {
		_button_variables = [];
	};
	
	private["_button_control"];
	_button_control = _buttons select _i;
	
	_button_control ctrlSetText _button_title;
	[A_main_menu_var_variable_data, _button_title, _button_variables] call A_object_fnc_setVariable;
	
	buttonSetAction[(ctrlIDC _button_control), '[' + str(_button_title) + ', ' + str(player) +  ', ([A_main_menu_var_variable_data, ' + str(_button_title) + '] call A_object_fnc_getVariable)] call ' + str(_button_handler)];
	//player groupChat format["_button_handler = %1", _button_handler];
	
	_button_control ctrlSetPosition [_button_sx, _button_sy, _button_w, 0];
	_button_control ctrlCommit 0;
	_button_control ctrlSetPosition [_button_x, _button_y, _button_w, _button_h];
	_button_control ctrlCommit 0;
	_button_last_x = _button_x;
	_button_last_y = _button_y;
	_button_y = _button_y + _button_h + _ysep; 
		
	_i = _i + 1;
};
