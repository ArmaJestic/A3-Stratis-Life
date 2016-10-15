// A_doors_fnc_house_door_move

#include "header.h"


ARGV(0,_this);
ARGV(0,_house);
ARGV(1,_percent);
if (UNDEFINED(_house)) exitWith {};	
if (UNDEFINED(_percent)) exitWith {};

if (_percent >= 0.99) then {
	_percent = 0.99;
};

if (_percent <= 0.1) then {
	_percent = 0.1;
};

private["_object", "_door"];
_object = _house select INDEX_OBJECT;
_door = _house select INDEX_DOOR;

_object animate [format["%1_rot", _door], _percent];
