// A_object_fnc_nonNetwork_convert

#include "..\..\includes\macro.h"


player groupChat format["A_object_fnc_nonNetwork_convert %1", _this];
ARGV(0,_object);
if (undefined(_object)) exitWith {objNull};


player groupChat format["TYPE: %1", typeName _object];
//if (true) exitWIth {_object};

if ((netId _object) != "0:0") exitWith {_object};

private["_class"];
_class = typeOf _object;

private["_new_object"];

//player groupChat format["damage = %1", (damage _object)];
_new_object = createAgent [_class, [0,0,0], [], 0, "CAN_COLLIDE"];
if (!(alive _object)) then {
	//player groupChat format["Object was dead!"];
	_new_object setDamage 1;
};
 
_new_object attachTo [_object, [0,0,0]];
[_new_object, true] call A_object_fnc_baptize;
detach _new_object;
deleteVehicle _object;
player groupChat format["_new_object = %1", _new_object];
_new_object
