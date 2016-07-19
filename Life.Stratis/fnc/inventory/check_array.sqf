// A_inventory_fnc_check_array

#include "../../includes/constants.h"
#include "../../includes/macro.h"


ARGV(0,_object);
ARGV(1,_array_name);

if (undefined(_object)) exitWith {null};
if (typeName _object != "OBJECT") exitWith {null};
if (undefined(_array_name)) exitWith {null};
if (typeName _array_name != "STRING") exitWith {null};


private["_array_variable"];
_array_variable = [_object, _array_name] call A_object_fnc_getVariable;
if (undefined(_array_variable)) exitWith {
	[_object, _array_name, [], true] call A_object_fnc_setVariable;
};

if (typeName _array_variable != "ARRAY") exitWith {
	[_object, _array_name, [], true] call A_object_fnc_setVariable;
};
