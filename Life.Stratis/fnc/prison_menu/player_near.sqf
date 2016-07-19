// A_prison_menu_fnc_player_near

#include "../../includes/constants.h"
#include "../../includes/macro.h"


//player groupChat format["A_prison_menu_fnc_player_near %1", _this];
ARGV(0,_player);
ARGV(1,_distance);

if (not([_player] call A_player_fnc_exists)) exitWith {null};
if (undefined(_distance)) exitWith {null};
if (typeName _distance != "SCALAR") exitWith {null};

private["_min_distance", "_min_prison"];
_min_distance = _distance;
_min_prison = null;

{
	private["_cprison", "_cdistance", "_cobject"];
	_cprison = _x;
	_cobject = _cprison select A_prison_menu_var_data_guard_object;
	_cdistance = _player distance _cobject;
	if (_cdistance < _min_distance) then {
		_min_distance = _cdistance;
		_min_prison = _cprison;
	};
} forEach A_prison_menu_var_data;

_min_prison
