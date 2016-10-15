// A_speed_gun_fnc_toggle

#include "..\..\includes\macro.h"
#include "..\..\includes\constants.h"

 _this spawn {
player groupChat format["A_speed_gun_fnc_toggle = %1", _this];
A_speed_gun_var_active = !(A_speed_gun_var_active);
if (!(A_speed_gun_var_active)) exitWith {};

[] call A_speed_gun_fnc_hud_setup;	
A_speed_gun_var_hidden = false;
waitUntil {
	private["_check"];
	if (!([] call A_speed_gun_fnc_driver_check)) exitWith {true};
	if (!([] call A_speed_gun_fnc_hidden_check)) exitWith {true};
	if (!(A_speed_gun_var_active)) exitWith {true};
	
	private["_target"];
	_target = cursorTarget;
	if !(_target isKindOf "LandVehicle") exitWith {false};
	if (_target == (vehicle player)) exitWith {false};
	
	private["_speed"];
	_speed = speed _target;
	[abs(_speed)] call A_speed_gun_fnc_hud_update;
	false
};
[] call A_speed_gun_fnc_hud_remove;
A_speed_gun_var_active = false;
};
