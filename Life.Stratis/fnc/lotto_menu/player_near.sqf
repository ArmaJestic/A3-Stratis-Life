// A_lotto_menu_fnc_player_near

#include "..\..\includes\constants.h"
#include "..\..\includes\macro.h"


//player groupChat format["A_lotto_menu_fnc_player_near %1", _this];
ARGV(0,_player);
ARGV(1,_distance);

if (not([_player] call A_player_fnc_exists)) exitWith {null};
if (undefined(_distance)) exitWith {null};
if (typeName _distance != "SCALAR") exitWith {null};

private["_min_distance", "_min_lotto"];
_min_distance = _distance;
_min_lotto = null;

{
	private["_clotto", "_cdistance", "_cobject"];
	_clotto = _x;
	_cobject = _clotto select A_lotto_menu_var_data_shop;
	_cdistance = _player distance _cobject;
	if (_cdistance < _min_distance) then {
		_min_distance = _cdistance;
		_min_lotto = _clotto;
	};
} forEach A_lotto_menu_var_data;

_min_lotto
