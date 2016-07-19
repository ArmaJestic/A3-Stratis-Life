// A_object_fnc_getVariable

#include "../../includes/macro.h"


ARGV(0,_object);
ARGV(1,_variable_name);
ARGV(2,_default);
if (typeName _object != "OBJECT") exitWith {null};
if (undefined(_variable_name)) exitWith {null};
if (undefined(_default)) then {
	_default = null;
};


private["_storage_object"];
_storage_object = _object getVariable ["storage", _object];
if (not(isNull _storage_object)) then {
	_object = _storage_object;
};

//player groupChat format["_object = %1", _object];
private["_result"];
_result = _object getVariable [_variable_name, _default];

if (undefined(_result)) exitWith {_default};
_result
