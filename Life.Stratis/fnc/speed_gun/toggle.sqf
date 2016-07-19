// A_speed_gun_fnc_toggle

#include "../../includes/constants.h"
#include "../../includes/macro.h"

 _this spawn {
player groupChat format["A_speed_gun_fnc_toggle = %1", _this];
A_speed_gun_var_active = not(A_speed_gun_var_active);
if (not(A_speed_gun_var_active)) exitWith {};

[] call A_speed_gun_fnc_hud_setup;	
A_speed_gun_var_hidden = false;
waitUntil {
	private["_check"];
	if (not([] call A_speed_gun_fnc_driver_check)) exitWith {true};
	if (not([] call A_speed_gun_fnc_hidden_check)) exitWith {true};
	if (not(A_speed_gun_var_active)) exitWith {true};
	
	private["_target"];
	_target = cursorTarget;
	if not(_target isKindOf "LandVehicle") exitWith {false};
	if (_target == (vehicle player)) exitWith {false};
	
	private["_speed"];
	_speed = speed _target;
	[abs(_speed)] call A_speed_gun_fnc_hud_update;
	false
};
[] call A_speed_gun_fnc_hud_remove;
A_speed_gun_var_active = false;
};
