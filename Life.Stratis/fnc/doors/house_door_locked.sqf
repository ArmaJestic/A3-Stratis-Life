// A_doors_fnc_house_door_locked

#include "../../includes/constants.h"
#include "../../includes/macro.h"
#include "../../includes/dikcodes.h"


ARGV(0,_house);

if (undefined(_house)) exitWith {false};


private["_object", "_door"];
_object = _house select A_doors_var_house_data_object;
_door = _house select A_doors_var_house_data_door;

((_object getVariable [format["disabled_%1", _door], 0]) == 1)
