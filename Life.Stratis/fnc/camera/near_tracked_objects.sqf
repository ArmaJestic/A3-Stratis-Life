// A_camera_fnc_near_tracked_objects

#include "..\..\includes\dikcodes.h"
#include "..\..\includes\macro.h"


ARGV(0,_position);
ARGV(1,_distance);

private["_default"];
_default = [];

if (UNDEFINED(_position)) exitWith {_default};
if (UNDEFINED(_distance)) exitWith {_default};
if (typeName _position != "ARRAY") exitWith {_default};
if (typeName _distance != "SCALAR") exitWith {_default};

 private["_objects"];
 _objects = (nearestObjects [_position, [], _distance]);
 //player groupChat format["_objects = %1", _objects];
 {
	private["_cobject"];
	_cobject = _x;
	if (!(_cobject getVariable ["tracked", false])) then {
		_objects set [_forEachIndex, objNull];
	};
 } forEach _objects;
 _objects = _objects - [objNull];
_objects
