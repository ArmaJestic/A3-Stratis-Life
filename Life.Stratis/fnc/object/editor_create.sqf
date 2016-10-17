// A_object_fnc_editor_create

#include "..\..\includes\macro.h"


params["_class","_offset","_heading","_damage","_simulation","_attached","_name","_hidden","_id","_zref","_ref"];

private _roffset = _ref modelToWorld _offset;
private _object = createVehicle[_class,_roffset,[],0,"CAN_COLLIDE"];
_object enableSimulation false;
_object allowDamage _damage;

if (_zref) then {
	_offset = (_ref worldToModel _offset);
};
[_object, _ref, _offset, _heading, _attached] call A_object_fnc_fake_attach;

//it's important that we attach before setting simulation, otherwise the object may drop some distance before simulation is disabled
_object enableSimulation _simulation;
_object setVariable["tracked", true];
_object setVariable["offset", (_object modelToWorld [0,0,0]), true];
_object setVariable["heading", _heading, true];

if (_damage) then {
	// not sure what for
	_object setVariable["damage",_damage,true];
};

if (_attached) then {
	// useless, attachedTo command
	_object setVariable["attached", _attached, true];
};

if (_hidden) then {
	[[_object, true],"A_object_fnc_remote_hideObject",_object,true] call A_jip_fnc_register;
	_object setVariable["hidden",_hidden,true];
};

if (_name != "") then {
	_name = _name + _id;
	missionNamespace setVariable[_name, _object, true];
	_object setVariable["name", _name, true];
	
	[[_object,_name],"setVehicleVarName",_object,true] call A_jip_fnc_register;
};

_object