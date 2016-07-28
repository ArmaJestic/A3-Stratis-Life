// A_actions_fnc_get_nearest_station

#include "..\..\includes\macro.h"


private["_distance", "_station"];

_max_distance = _this select 0;
_station = null;
_distance = -1;

{
	private["_cdistance", "_cstation"];
	_cstation = _x;
	_cdistance  = (player distance _cstation);

	if (_distance < 0 || _cdistance <= _distance) then {
		_distance = _cdistance;
		_station = _cstation;
	};	
} foreach A_bank_var_gasstationarray;


if (_distance > _max_distance) exitWith {null};
_station
