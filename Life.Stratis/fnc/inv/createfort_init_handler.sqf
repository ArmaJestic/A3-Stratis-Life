// A_inv_fnc_createfort_init_handler

#include "..\..\includes\macro.h"


ARGV(0,_object);
if (not([_object] call A_object_fnc_exists)) exitWith {null};
_object lock false;
