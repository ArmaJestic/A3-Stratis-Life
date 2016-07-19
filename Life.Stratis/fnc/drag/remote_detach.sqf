// A_drag_fnc_remote_detach

#include "..\..\includes\constants.h"
#include "..\..\includes\macro.h"


player grouPChat format["A_drag_fnc_remote_detach %1", _this];
ARGV(0,_object);
ARGV(1,_player);

if (undefined(_object)) exitWith {};
detach _object;


//player grouPChat format["ishelper %1", (_object isKindOf "Helper_Base_F")];

if (([_object] call A_drag_fnc_object_weightless) && {not(surfaceIsWater position _object)}) then {
	private["_pos"];
	_pos =  getPos _object;
	_pos set [2,0];
	
	if (_object isKindOf "Animal") then {
		_object setPos _pos;
		_object setVectorUp [0,0,1];
	}
	else {
		private["_vup", "_vdir"];
		_vup = vectorUp _object;
		_vdir = vectorDir _object;
		_object setPos _pos;
		_object setVectorDirAndUp [_vdir, [0,0,1]];
	};
}
else { if (_object isKindOf "Skeet_Clay_F") then {
	_object setVectorUp [0,0,1];
};};

private["_last_holder"];
_last_holder = [_object, "last_holder", objNull] call A_object_fnc_getVariable;
if (_last_holder == _player) then {
	player groupChat format["Usetting last holder"];
	[_object, "last_holder", nil, true] call A_object_fnc_setVariable;
};

if (not(isPlayer _object)) exitWith {};
if (undefined(_player)) exitWith {};

private["_pos", "_off"];
_off = _player worldToModel (_object modelToWorld [0,0,0]);
_pos = ATLtoASL(_player modelToWorld _off);
private["_z_terrain", "_z_player"];
_z_player = _pos select 2;
_z_terrain = getTerrainHeightASL _pos;
if (_z_player < _z_terrain) then {
	_pos set [2, _z_terrain];
};
_object setPosASL (_pos);
