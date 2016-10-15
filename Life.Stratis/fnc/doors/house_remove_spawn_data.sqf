// A_doors_fnc_house_remove_spawn_data

#include "header.h"


params[["_player",null],["_object",null]];

if (UNDEFINED(_player)) exitWith {null};
if (UNDEFINED(_object)) exitWith {null};

private _houses_spawn_data = [_player, "houses_spawn_data", null] call A_object_fnc_getVariable;
if (UNDEFINED(_houses_spawn_data)) exitWith {null};

private _house_id = netId _object;
private _spawn_data = objNull;
private _index = -1;

{
	private["_cspawn_data", "_chouse_id"];
	_cspawn_data = _x;
	_chouse_id = _cspawn_data select INDEX_SPAWN_ID_HOUSE;
	if (_chouse_id == _house_id) exitWith {
		_index = _forEachIndex;
		_spawn_data = _cspawn_data;
	};
} forEach _houses_spawn_data;

if (_index == -1) exitWith {null};

private["_respawn_id","_result"];
_respawn_id = _spawn_data select INDEX_SPAWN_ID_RESPAWN;
//_result = [_player,_respawn_id]  call BIS_fnc_removeRespawnPosition;
_result = true;
if (!(_result)) exitWith {
	diag_log format["WARNING: could not remove respawn position for %1", [_player, _respawn_id]];
	null
};
_spawn_data