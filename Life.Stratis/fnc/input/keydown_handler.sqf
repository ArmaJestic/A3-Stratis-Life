// A_input_fnc_keydown_handler

#include "..\..\includes\macro.h"
#include "..\..\includes\dikcodes.h"


//player groupChat format["A_input_fnc_keydown_handler %1", _this];
private["_handled"];
_handled = false;

_disp	= _this select 0;
_key    = _this select 1;
_shift  = _this select 2;
_ctrl	= _this select 3;
_alt	= _this select 4;


if (_key in(actionKeys "LookAround")) then {
	A_input_var_lookingaround = true;
};

if ((call A_input_fnc_stunned_check) || (call A_input_fnc_restrained_check)) exitWith {
	not(_key in (call A_input_fnc_get_stunned_allowed_keys))
};

//Fix for exploit using cross-arms animation, that allows players to glitch through walls
if ((animationState player) == "shaftoe_c0briefing_otazky_loop6") then {
	player setPosATL ([player, "animation_position"] call A_object_fnc_getVariable);
};

private["_inVehicle", "_isDriver"];
_inVehicle = ((vehicle player) != player);
_isDriver = ((driver (vehicle player)) == player);
	
if (_key == DIK_W && not(A_input_var_w_key_down)) then {
	A_input_var_w_key_down_count = A_input_var_w_key_down_count + 1;
	if (A_input_var_w_key_down_count > 10) then {
		A_input_var_w_key_down = true;
	};
};

if (_key == DIK_S && not(A_input_var_s_key_down)) then {
	A_input_var_s_key_down_count = A_input_var_s_key_down_count + 1;
	if (A_input_var_s_key_down_count > 10) then {
		A_input_var_s_key_down = true;
	};
};

if (_key == DIK_LSHIFT) then {
	A_input_var_lshift_down = true;
};

	
switch _key do {
	case DIK_Y: {
		_handled = INV_shortcuts;
	};
	case DIK_TAB: {
		_handled = INV_shortcuts;
	};
	case DIK_T: {
		_handled = INV_shortcuts;
	};
	case DIK_E: {
		_handled = INV_shortcuts;
	};
	case DIK_GRAVE: {
		_handled = INV_shortcuts;
	};
	case DIK_1: {
		_handled = INV_shortcuts;
	};
	case DIK_2: {
		_handled = INV_shortcuts;
	};
	case DIK_3: {
		_handled = INV_shortcuts;
	};
	case DIK_4: {
		_handled = INV_shortcuts;
	};
	case DIK_5: {
		_handled = INV_shortcuts;
	};
	case DIK_6: {
		_handled = INV_shortcuts;
	};
	case DIK_8: {
		_handled = INV_shortcuts;
	};

	case DIK_SPACE: {
		if (_ctrl) then {
			_handled = [] call A_input_fnc_lock_unlock_handler;
			//player groupChat format["_handled2 = %1", _handled];
		};
	};
	
	case DIK_F: {
		if (not(_ctrl)) exitWith {_handled = false;};
		
		if (_inVehicle && isblu) then {
			_handled = [] call A_input_fnc_cop_siren_handler;
		}
		else { if (not(_inVehicle)) then{
			_handled = [] call A_input_fnc_stun_handler;
		};};
	};
	
	case DIK_G: {
		if (not(_ctrl)) exitWith {_handled = false;};
		if (not(isblu && _inVehicle && _isDriver)) exitWith {_handled = false;};
		_handled = [] call A_input_fnc_cop_speed_gun_handler;
	};
	
	case DIK_H: {
		if (not(_ctrl)) exitWith {_handled = false;};
		if (not(isblu && _inVehicle && _isDriver)) exitWith {_handled = false;};
		_handled = [] call A_input_fnc_cop_horn_handler;
	};
	

	case DIK_Q: {
		if(!_inVehicle) exitWith { false };
		_handled = [] call A_input_fnc_an2_faster_handler;
	};
	
	case DIK_LSHIFT: {
		if(!_inVehicle) exitWith { false };
		_handled = [] call keyboard_vehicle_nitro_handler;
	};
};

if (_inVehicle && _key == DIK_E) exitWith {
	_inVehicle
};

if (_key in A_input_var_overlapping_keys) exitWith {
	false;
};

//player groupChat format["_handled = %1", _handled];
_handled
