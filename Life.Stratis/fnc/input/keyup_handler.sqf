// A_input_fnc_keyup_handler

#include "..\..\includes\macro.h"
#include "..\..\includes\dikcodes.h"


//player groupChat format["A_input_fnc_keyup_handler %1", _this];
private["_handled"];

_disp	= _this select 0;
_key    = _this select 1;
_shift  = _this select 2;
_ctrl	= _this select 3;
_alt	= _this select 4;

_handled = false;

if (_key in(actionKeys "LookAround")) then {
	A_input_var_lookingaround = false;
};

if ((call A_input_fnc_stunned_check) || (call A_input_fnc_restrained_check)) exitWith {
	!(_key in (call A_input_fnc_get_stunned_allowed_keys))
};

//Fix for exploit using cross-arms animation, that allows players to glitch through walls
if ((animationState player) == "shaftoe_c0briefing_otazky_loop6") then {
	player setPosATL ([player, "animation_position"] call A_object_fnc_getVariable);
};

if (_key == DIK_W) then {
	A_input_var_w_key_down = false;
	A_input_var_w_key_down_count = 0;
};

if (_key == DIK_LSHIFT) then {
	A_input_var_lshift_down = false;
};

if (_key == DIK_S) then {
	A_input_var_s_key_down = false;
};

private["_inVehicle"];
_inVehicle = ((vehicle player) != player);

switch _key do {
	case DIK_Y: {
		_handled = [] call A_input_fnc_animation_handler;
	};
	case DIK_TAB: {
		_handled = [] call A_input_fnc_keys_handler;
	};
	case DIK_T: {
		_handled = [] call A_input_fnc_trunk_handler;
	};
	case DIK_E: {			
		if (_ctrl) then {
			_handled = [] call A_input_fnc_breakout_vehicle_handler;
		}else{
			_handled = [_ctrl] call A_input_fnc_interact_handler;
		};
	};
	case DIK_GRAVE: {
		_handled = [] call A_input_fnc_cop_menu_handler;
	};

	case DIK_1: {
		_handled = [] call A_input_fnc_main_dialog_handler;
	};
	case DIK_2: {
		_handled = [] call A_input_fnc_inventory_dialog_handler;
	};
	case DIK_3: {
		if (_inVehicle) exitWith {_handled=false;};
		_handled = [] call A_input_fnc_surrender_handler;
	};
	case DIK_4: {
		if (_inVehicle) exitWith {_handled=false;};
		_handled = [] call A_input_fnc_switch_normal_handler;
	};
	case DIK_5: {
		_handled = [] call A_input_fnc_gangs_handler;
	};
	case DIK_6: {
		_handled = [] call A_input_fnc_retributions_handler;
	};
	/*
	case DIK_7: {
		[] spawn {
			call compile preprocessFile "buffer.sqf";
		};
	};
	*/
	case DIK_8: {
		_handled = [] call A_input_fnc_weapon_modifications_handler;
	};
	case DIK_O:{
		_handled = [] call A_input_fnc_admin_menu_handler;
	};
};

if (_inVehicle && _key == DIK_E) exitWith {
	_inVehicle
};

if (_key in A_input_var_overlapping_keys) exitWith {
	false;
};

_handled
