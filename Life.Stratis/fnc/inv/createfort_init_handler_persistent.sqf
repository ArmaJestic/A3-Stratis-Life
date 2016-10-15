// A_inv_fnc_createfort_init_handler_persistent

#include "header.h"


ARGV(0,_object);
ARGV(1,_object_name);

if (UNDEFINED(_object)) exitWith {};
if (UNDEFINED(_object_name)) exitWith {};
if (typeName _object != "OBJECT") exitWith {};
if (isNull _object) exitWith {};
if (UNDEFINED(_object_name)) exitWith {};
if (typeName _object_name != "STRING") exitWith {};


missionNamespace setVariable[_object_name, _object];
