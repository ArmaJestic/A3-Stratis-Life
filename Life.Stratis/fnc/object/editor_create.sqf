// A_object_fnc_editor_create

#include "../../includes/macro.h"


//player grouPChat format["A_object_fnc_editor_create %1", _this];
private["_class", "_offset", "_heading", "_damage", "_simulation", "_attached", "_name", "_hidden", "_ref"];
ARGV(0,_class);
ARGV(1,_offset);
ARGV(2,_heading);
ARGV(3,_damage);
ARGV(4,_simulation);
ARGV(5,_attached);
ARGV(6,_name);
ARGV(7,_hidden);
ARGV(8,_id);
ARGV(9,_zref);
ARGV(10,_ref);

private["_roffset"];
_roffset = _ref modelToWorld _offset;
private["_object"];
_object = createVehicle [(_this select 0), _roffset, [], 0, "CAN_COLLIDE"];
_object enableSimulation false;
_object allowDamage _damage;

if (_zref) then {
	[_object, _ref,  (_ref worldToModel _offset), _heading, _attached] call A_object_fnc_fake_attach;
}
else {
	[_object, _ref, _offset, _heading, _attached] call A_object_fnc_fake_attach;
};

//it's important that we attach before setting simulation, otherwise the object may drop some distance before simulation is disabled
_object enableSimulation _simulation;
_object setVariable ["tracked", true];
_object setVariable ["offset", (_object modelToWorld [0,0,0]), true];
_object setVariable ["heading", _heading, true];

if (_damage) then {
	_object setVariable ["damage", _damage, true];
};

if (_attached) then {
	_object setVariable ["attached", _attached, true];
};

if (_hidden) then {
	[[_object, true], "A_object_fnc_remote_hideObject", true, true, _object] call A_jip_fnc_register;
	_object setVariable ["hidden", _hidden, true];
};

if (_name != "") then {
	_name = _name + _id;
	missionNamespace setVariable [_name, _object];
	_object setVehicleVarName _name;
	_object setVariable ["name", _name, true];
	
	missionNamespace setVariable[_name, _object];
	publicVariable _name;
};

_object
