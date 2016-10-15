// A_doors_fnc_house_doors_disable

#include "header.h"


ARGV(0,_player);
ARGV(1,_house);

private["_object", "_door"];
_object = _house select INDEX_OBJECT;
_door = _house select INDEX_DOOR;

private["_i", "_bis_door_variable_name", "_disabled"];
_i = 1;
while {_i < 10} do {
	_bis_door_variable_name = format["bis_disabled_door_%1", _i];
	_disabled = _object getVariable [_bis_door_variable_name,0];
	if (!(_disabled == 1)) then {
		_object setVariable[_bis_door_variable_name, 1];
	};
	_i = _i + 1;
};
