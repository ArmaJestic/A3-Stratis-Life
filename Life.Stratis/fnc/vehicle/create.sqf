// A_vehicle_fnc_create

#include "..\..\includes\macro.h"


//player groupChat format["A_vehicle_fnc_create %1", _this];
ARGV(0,_class);
ARGV(1,_position);
ARGV(2,_exact);

if (undefined(_class)) exitWith {null};
if (undefined(_position)) exitWith {null};
if (undefined(_exact)) exitWith {null};

if (typeName _class != "STRING") exitWith {null};
if (typeName _position != "ARRAY") exitWith {null};
if (typeName _exact != "BOOL") exitWith {null};


private["_vehicle"];
_vehicle = createVehicle [_class, _position, [], 0, "NONE"];

if (_exact) then {
	_vehicle setPosATL _position;
	[_vehicle] spawn {
		ARGV(0,_vehicle);
		sleep 1;
		_vehicle setDamage 0;
	};
};


if (_vehicle isKindOf "UAV_01_base_F") then {
	createVehicleCrew _vehicle;
};

_vehicle addEventHandler ["fired", {_this execVM "Awesome\EH\A_eh_fnc_fired_vehicle.sqf"}];
_vehicle addMPEventhandler ["MPKilled", {_this call A_vehicle_fnc_handle_mpkilled}];

_vehicle
