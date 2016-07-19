// A_vehicle_fnc_object_build_list

#include "..\..\includes\macro.h"


ARGV(0,_list);
if (undefined(_list)) exitWith {[]};
if (typeName _list != "ARRAY") exitWith {[]};
if (count(_list) == 0) exitWith {[]};

private["_objects"];
_objects = [];


{ if (true) then {
	private["_object_name", "_object"];
	_object_name = _x;
	_object = missionNamespace getVariable [_vehicle_name, null];
	if (undefined(_object)) exitWith {null};
	if (typeName _object != "OBJECT") exitWith {null};
	if (isNull _object) exitWith {null};
	_objects set [count(_objects), _object];
};} forEach _list;

(_objects)
