// A_doors_fnc_house_door_move

#include "..\..\includes\constants.h"
#include "..\..\includes\macro.h"
#include "..\..\includes\dikcodes.h"


ARGV(0,_this);
ARGV(0,_house);
ARGV(1,_percent);
if (undefined(_house)) exitWith {};	
if (undefined(_percent)) exitWith {};

if (_percent >= 0.99) then {
	_percent = 0.99;
};

if (_percent <= 0.1) then {
	_percent = 0.1;
};

private["_object", "_door"];
_object = _house select A_doors_var_house_data_object;
_door = _house select A_doors_var_house_data_door;

_object animate [format["%1_rot", _door], _percent];
