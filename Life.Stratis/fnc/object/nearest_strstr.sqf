// A_object_fnc_nearest_strstr

#include "../../includes/macro.h"


ARGV(0,_position);
ARGV(1,_str);
ARGV(2,_distance);

if (undefined(_position)) exitWith {null};
if (undefined(_str)) exitWith {null};
if (undefined(_distance)) exitWith{null};
if (typeName _position != "ARRAY") exitWith {null};
if (typeName _str != "STRING") exitWith {null};
if (typeName _distance != "SCALAR") exitWith {null};


 private["_objects", "_object"];
 _object = objNull;
 _objects = (nearestObjects [_position, [], _distance]);
 //player groupChat format["_objects = %1", _objects];
 {
	private["_cobject"];
	_cobject = _x;
	if ([_str, str(_cobject)] call BIS_fnc_inString) exitWith {
		_object = _cobject;
	};
 } forEach _objects;
 
 if (isNull _object) exitWith {null};
 
 _object
