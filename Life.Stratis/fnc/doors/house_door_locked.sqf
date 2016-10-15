// A_doors_fnc_house_door_locked

#include "header.h"


ARGV(0,_house);

if (UNDEFINED(_house)) exitWith {false};


private["_object", "_door"];
_object = _house select INDEX_OBJECT;
_door = _house select INDEX_DOOR;

((_object getVariable [format["disabled_%1", _door], 0]) == 1)
