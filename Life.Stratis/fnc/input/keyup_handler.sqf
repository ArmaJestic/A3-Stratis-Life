// A_input_fnc_keyup_handler

#include "..\..\includes\macro.h"
#include "..\..\includes\dikcodes.h"


params["_disp","_key","_shift","_ctrl","_alt"];
private _handled = false;


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
			diag_log format['A_input_fnc_keyup_handler(%1): calling A_input_fnc_interact_handler'];
			_handled = [_ctrl] call A_input_fnc_interact_handler;
		};
	};
	case DIK_SPACE: {
		if (_ctrl) then {
			_handled = [] call A_input_fnc_lock_unlock_handler;
		};
	};
	case DIK_F: {
		if (_ctrl) then {
			if (_inVehicle) then {
				if (isblu) then {
					_handled = [] call A_input_fnc_cop_siren_handler;
				};
			}else{
				_handled = [] call A_input_fnc_stun_handler;
			};
		};
	};
	case DIK_G: {
		if (_ctrl) then {
			if (isblue && {_inVehicle} && {_isDriver}) then {
				_handled = [] call A_input_fnc_cop_speed_gun_handler;
			};
		};
	};
	case DIK_H: {
		if (_ctrl) then {
			if (isblu && {_inVehicle} && {_isDriver}) then {
				_handled = [] call A_input_fnc_cop_horn_handler;
			};
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
	case DIK_7: {
		_handled = [] call A_input_fnc_holster_handle;
	};
	case DIK_8: {
		_handled = [] call A_input_fnc_weapon_modifications_handler;
	};
	case DIK_END: {
		_handled = [] call A_input_fnc_mute_handler;
	};
	case DIK_U:{
		_handled = [] call A_input_fnc_admin_menu_handler;
	};
};

_handled
