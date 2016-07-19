// A_object_fnc_setVariable

#include "../../includes/macro.h"


ARGV(0,_object);
ARGV(1,_variable_name);
ARGV(2,_variable_value);
ARGV(3,_remote);

if (undefined(_remote)) then {
	_remote =  false;
};

if (undefined(_variable_name)) exitWith {null};

private["_storage_object"];
_storage_object = _object getVariable ["storage", null];
if (defined(_storage_object)) then {
	_object = _storage_object;
};

//player groupChat format["%1 setVariable [""%2"", %3, %4];", _object, _variable_name, _variable_value, _remote];
if (undefined(_variable_value)) then {
	_object setVariable [_variable_name, nil, _remote];
}
else {
	_object setVariable [_variable_name, _variable_value, _remote];
};
