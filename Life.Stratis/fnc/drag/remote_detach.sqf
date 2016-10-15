// A_drag_fnc_remote_detach

#include "header.h"


params["_object","_player"];

if (UNDEFINED(_object)) exitWith {};
detach _object;

if (([_object] call A_drag_fnc_object_weightless) && {!(surfaceIsWater position _object)}) then {
	private _pos = getPos _object;
	_pos set [2,0];
	
	if (_object isKindOf "Animal") then {
		_object setPos _pos;
		_object setVectorUp [0,0,1];
	}else{
		private _vup = vectorUp _object;
		private _vdir = vectorDir _object;
		_object setPos _pos;
		_object setVectorDirAndUp [_vdir, [0,0,1]];
	};
}else{ 
	if (_object isKindOf "Skeet_Clay_F") then {
		_object setVectorUp [0,0,1];
	};
};

private _last_holder = [_object, "last_holder", objNull] call A_object_fnc_getVariable;
if (_last_holder == _player) then {
	player groupChat format["Usetting last holder"];
	[_object, "last_holder", nil, true] call A_object_fnc_setVariable;
};

if (!(isPlayer _object)) exitWith {};
if (UNDEFINED(_player)) exitWith {};

private _off = _player worldToModel (_object modelToWorld [0,0,0]);
private _pos = ATLtoASL(_player modelToWorld _off);
private _z_player = _pos select 2;
private _z_terrain = getTerrainHeightASL _pos;
if (_z_player < _z_terrain) then {
	_pos set[2, _z_terrain];
};
_object setPosASL (_pos);