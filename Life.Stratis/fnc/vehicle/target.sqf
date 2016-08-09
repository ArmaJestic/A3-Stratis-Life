// A_vehicle_fnc_target

#include "..\..\includes\macro.h"


//player groupChat format["A_vehicle_fnc_target %1", _this];
ARGV(0,_player);
ARGV(1,_distance);
if (!([_player] call A_player_fnc_human)) exitWith {null};
if (undefined(_distance)) exitWith {null};
if (typeName _distance != "SCALAR") exitWith {null};


private["_target"];
_target = cursorTarget;

if (!(_target isKindOf "Air" || 
		_target isKindOf "Ship" || 
		_target isKindOF "LandVehicle") ||
	_target isKindOf "Man") exitWith {null};

if (!([getpos _player, getdir _player, 45, getpos _target] call A_pos_fnc_angle_sector)) then {
	null
};

if (!((_player distance _target) < _distance)) exitWith {
	null
};

_target 
