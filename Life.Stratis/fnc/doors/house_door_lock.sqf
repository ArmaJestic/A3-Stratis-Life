// A_doors_fnc_house_door_lock

#include "..\..\includes\constants.h"
#include "..\..\includes\macro.h"
#include "..\..\includes\dikcodes.h"


ARGV(0,_this);
ARGV(0,_house);
ARGV(1,_state);
if (undefined(_house)) exitWith {};
if (undefined(_state)) then {
	_state = 1;
};

private["_object", "_door"];
_object = _house select A_doors_var_house_data_object;
_door = _house select A_doors_var_house_data_door;

_object setVariable [format["disabled_%1", _door], _state, true];
