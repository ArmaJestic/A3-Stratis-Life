// A_vehicle_fnc_create

#include "header.h"


params[["_class",null,[""]],["_position",null,[[]]],["_exact",null,[false]]];
if UNDEFINED(_class) exitWith {null};
if UNDEFINED(_position) exitWith {null};
if UNDEFINED(_exact) exitWith {null};

private _vehicle = createVehicle[_class, _position, [], 0, "NONE"];

if (_exact) then {
	_vehicle setPosATL _position;
	[1,[_vehicle],{(_this select 0) setDamage 0;}] call A_frame_fnc_wait;
};


if (_vehicle isKindOf "UAV_01_base_F") then {
	createVehicleCrew _vehicle;
};

_vehicle addEventHandler ["fired", {_this call A_eh_fnc_fired_vehicle}];
_vehicle addMPEventhandler ["MPKilled", {_this call A_vehicle_fnc_handle_mpkilled}];

_vehicle