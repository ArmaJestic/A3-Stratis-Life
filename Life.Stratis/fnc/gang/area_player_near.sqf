// A_gang_fnc_area_player_near

#include "header.h"


//player groupChat format["A_gang_fnc_area_player_near %1", _this];
ARGV(0,_player);
ARGV(1,_distance);

if (!([_player] call A_player_fnc_exists)) exitWith {null};
if (UNDEFINED(_distance)) exitWith {null};
if (typeName _distance != "SCALAR") exitWith {null};

private["_min_distance", "_min_gang_area"];
_min_distance = _distance;
_min_gang_area = null;

{
	private["_cgang_area", "_cdistance"];
	_cgang_area = _x;
	_cdistance = _player distance _cgang_area;
	if (_cdistance < _min_distance) then {
		_min_distance = _cdistance;
		_min_gang_area = _cgang_area;
	};
} forEach A_main_var_gangareas;

if (UNDEFINED(_min_gang_area)) exitWith {null};
_min_gang_area
