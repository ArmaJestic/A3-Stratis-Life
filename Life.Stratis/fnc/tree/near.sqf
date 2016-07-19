// A_tree_fnc_near

#include "..\..\includes\constants.h"
#include "..\..\includes\macro.h"


ARGV(0,_position);
ARGV(1,_names);
ARGV(2,_distance);

private["_objects", "_found_objects"];

_objects = nearestObjects [_position, [], _distance];
_found_objects = [];

{
	 private["_object_name", "_object"];
	 _object = _x;
	 _object_name = str(_object);
	 //player grouPChat format["_object_name = %1", _object_name];
	 private["_found"];
	 _found = false;
	 {
		private["_name"];
		_name = _x;
		if ([_name, _object_name] call BIS_fnc_inString) exitWith {
			_found_objects set [count(_found_objects), _object];
		};
	 } forEach _names;
} forEach _objects;
_found_objects
