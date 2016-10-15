// A_stats_fnc_compile_entry

#include "header.h"


params[["_entry",null,[[]],2],["_object",null,[objNull]]];

if (UNDEFINED(_entry)) exitWith {};
if (UNDEFINED(_object)) exitWith {};

_entry params["_name","_value"];
_value = (call compile _value) select 0;
if (UNDEFINED(_value)) then {
	_value = null;
};

[_object, _name, _value] call A_stats_fnc_init_entry;