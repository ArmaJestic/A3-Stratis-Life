// A_client_fnc_check_smoke_grenade

#include "..\..\includes\macro.h"


private["_flashed"];
_flashed = [player, "flashed"] call A_object_fnc_getVariable;

if (undefined(_flashed)) exitWith {null};
if (typeName _flashed != "BOOL") exitWith {null};
if (not(_flashed)) exitWith {null};

private ["_mask", "_fadeInTime", "_fadeOutTime"];

_mask = [player, "gasmask"] call A_object_fnc_getVariable;
_mask = if (undefined(_mask)) then { false } else { _mask };
_mask = if (typeName "_mask" != "BOOL") then { false } else { _mask };

[player, "gasmask", _mask, true] call A_object_fnc_setVariable;
if (_mask) exitWith {null};

[] spawn {
	private ["_fadeInTime", "_fadeOutTime"];
	_fadeInTime   = 1;
	_fadeOutTime  = 5;
	if (not(alive player)) exitWith {null};
	titleCut ["","WHITE OUT",0];
	sleep _fadeOutTime;
	titleCut ["","WHITE IN",0];
	sleep _fadeInTime;
	[player, "flashed", false, true] call A_object_fnc_setVariable;
};
