// A_doors_fnc_house_door_lock

#include "header.h"


ARGV(0,_this);
ARGV(0,_house);
ARGV(1,_state);
if (UNDEFINED(_house)) exitWith {};
if (UNDEFINED(_state)) then {
	_state = 1;
};

private["_object", "_door"];
_object = _house select INDEX_OBJECT;
_door = _house select INDEX_DOOR;

_object setVariable[format["disabled_%1", _door], _state, true];
