// A_object_fnc_setVariable

#include "..\..\includes\macro.h"


params["_object","_variable_name","_variable_value",["_remote",false]];

if (UNDEFINED(_variable_name)) exitWith {null};

private _storage_object = _object getVariable["storage",null];
if (DEFINED(_storage_object)) then {
	_object = _storage_object;
};

if (UNDEFINED(_variable_value)) then {
	_object setVariable[_variable_name, nil, _remote];
}else{
	_object setVariable[_variable_name, _variable_value, _remote];
};