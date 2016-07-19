// A_doors_fnc_house_door_closed

#include "../../includes/constants.h"
#include "../../includes/macro.h"
#include "../../includes/dikcodes.h"


ARGV(0,_house);

if (undefined(_house)) exitWith {false};


private["_object", "_door"];
_object = _house select A_doors_var_house_data_object;
_door = _house select A_doors_var_house_data_door;

private["_animation_name"];
_animation_name = format["%1_rot", _door];

((_object animationPhase _animation_name) <= 0.1)
