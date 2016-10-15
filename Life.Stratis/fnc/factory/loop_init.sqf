// A_factory_fnc_loop_init
// starts up the loop
// needs to go, needs to be more event driven

#include "header.h"


params[["_factory_id",null,[""]]];
if (UNDEFINED(_factory_id)) exitWith {};

private _factory = [_factory_id] call A_factory_fnc_lookup_id;
if (UNDEFINED(_factory)) exitWith {};

[_factory] call A_factory_fnc_loop1;