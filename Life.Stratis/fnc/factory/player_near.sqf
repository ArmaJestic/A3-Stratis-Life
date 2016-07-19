// A_factory_fnc_player_near

#include "../../includes/macro.h"
#include "../../includes/constants.h"


//player groupChat format["A_factory_fnc_player_near %1", _this];
ARGV(0,_player);
ARGV(1,_distance);

if (not([_player] call A_player_fnc_exists)) exitWith {null};
if (undefined(_distance)) exitWith {null};
if (typeName _distance != "SCALAR") exitWith {null};

private["_min_distance", "_min_factory"];
_min_distance = _distance;
_min_factory = null;

{
	private["_cfactory", "_cdistance", "_cobject"];
	_cfactory = _x;
	_cobject = _cfactory select factory_object;
	_cdistance = _player distance _cobject;
	if (_cdistance < _min_distance) then {
		_min_distance = _cdistance;
		_min_factory = _cfactory;
	};
} forEach all_factories;

_min_factory
