// A_jip_fnc_set

#include "..\..\includes\macro.h"
#include "..\..\includes\constants.h"

ARGV(0,_object);
ARGV(1,_variable_name);
ARGV(2,_value);

if (undefined(_object)) exitWith {};
if (undefined(_variable_name)) exitWith {};
if (typeName _object != "OBJECT") exitWith {};
if (typeName _variable_name != "STRING") exitWith {};

if (undefined(_value)) exitWIth {
	_object setVariable [_variable_name, nil, true];
};

_object setVariable [_variable_name, _value, true];
