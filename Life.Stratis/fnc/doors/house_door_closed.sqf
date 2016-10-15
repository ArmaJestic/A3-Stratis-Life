// A_doors_fnc_house_door_closed

#include "header.h"


ARGV(0,_house);

if (UNDEFINED(_house)) exitWith {false};


private["_object", "_door"];
_object = _house select INDEX_OBJECT;
_door = _house select INDEX_DOOR;

private["_animation_name"];
_animation_name = format["%1_rot", _door];

((_object animationPhase _animation_name) <= 0.1)
