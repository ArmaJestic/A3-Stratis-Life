// A_input_fnc_keydown_handler

#include "..\..\includes\macro.h"
#include "..\..\includes\dikcodes.h"


params["_disp","_key","_shift","_ctrl","_alt"];
private _handled = false;


if (_key in(actionKeys "LookAround")) exitwith {
	A_input_var_lookingaround = true;
	false
};

if (([] call A_input_fnc_stunned_check) || {[] call A_input_fnc_restrained_check}) exitWith {
	!(_key in (call A_input_fnc_get_stunned_allowed_keys))
};

//Fix for exploit using cross-arms animation, that allows players to glitch through walls
if ((animationState player) == "shaftoe_c0briefing_otazky_loop6") then {
	player setPosATL ([player, "animation_position"] call A_object_fnc_getVariable);
};

private["_inVehicle", "_isDriver"];
_inVehicle = ((vehicle player) != player);
_isDriver = ((driver (vehicle player)) == player);
	
if ((_key == DIK_W) && {!A_input_var_w_key_down}) then {
	A_input_var_w_key_down_count = A_input_var_w_key_down_count + 1;
	if (A_input_var_w_key_down_count > 10) then {
		A_input_var_w_key_down = true;
	};
};

if ((_key == DIK_S) && {!A_input_var_s_key_down}) then {
	A_input_var_s_key_down_count = A_input_var_s_key_down_count + 1;
	if (A_input_var_s_key_down_count > 10) then {
		A_input_var_s_key_down = true;
	};
};

if (_key == DIK_LSHIFT) then {
	A_input_var_lshift_down = true;
};

switch _key do {
	// handled in keyup_handler
	case DIK_Y: {
		_handled = A_inv_var_shortcuts;
	};
	case DIK_TAB: {
		_handled = A_inv_var_shortcuts;
	};
	case DIK_T: {
		_handled = A_inv_var_shortcuts;
	};
	case DIK_E: {
		_handled = A_inv_var_shortcuts;
	};
	case DIK_SPACE: {
		_handled = (_ctrl && {A_inv_var_shortcuts});
	};
	case DIK_F: {
		_handled = (_ctrl && {A_inv_var_shortcuts});
	};
	case DIK_G: {
		_handled = (_ctrl && {A_inv_var_shortcuts});
	};
	case DIK_H: {
		_handled = (_ctrl && {A_inv_var_shortcuts});
	};
	case DIK_GRAVE: {
		_handled = A_inv_var_shortcuts;
	};
	case DIK_1: {
		_handled = A_inv_var_shortcuts;
	};
	case DIK_2: {
		_handled = A_inv_var_shortcuts;
	};
	case DIK_3: {
		_handled = A_inv_var_shortcuts;
	};
	case DIK_4: {
		_handled = A_inv_var_shortcuts;
	};
	case DIK_5: {
		_handled = A_inv_var_shortcuts;
	};
	case DIK_6: {
		_handled = A_inv_var_shortcuts;
	};
	case DIK_7: {
		_handled = A_inv_var_shortcuts;
	};
	case DIK_8: {
		_handled = A_inv_var_shortcuts;
	};
	case DIK_END: {
		_handled = A_inv_var_shortcuts;
	};
	case DIK_LSHIFT: {
		if (_inVehicle) then {
			_handled = [] call keyboard_vehicle_nitro_handler;
		};
	};
};

_handled