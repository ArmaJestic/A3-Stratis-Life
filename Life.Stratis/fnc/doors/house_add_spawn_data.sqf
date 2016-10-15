// A_doors_fnc_house_add_spawn_data

#include "header.h"


diag_log format["A_doors_fnc_house_add_spawn_data %1", _this];
ARGV(0,_player);
ARGV(1,_object);

if (UNDEFINED(_player)) exitWith {null};
if (UNDEFINED(_object)) exitWith {null};

private["_spawn_data_info", "_pos"];
_pos = (_object buildingPos 1);
if (_pos isEqualTo [0,0,0]) then {
	_pos = _object modelToWorld [0,0,0];
};

//_spawn_data_info = [_player,_pos] call BIS_fnc_addRespawnPosition;
_spawn_data_info = [-1,-1];

private _spawn_data = [];
_spawn_data set[INDEX_SPAWN_ID_HOUSE, netId _object];
_spawn_data set[INDEX_SPAWN_ID_RESPAWN, (_spawn_data_info select 1)];

private _houses_spawn_data = [_player, "houses_spawn_data", []] call A_object_fnc_getVariable;
_houses_spawn_data pushBack _spawn_data;
[_player, "houses_spawn_data", _houses_spawn_data, true] call A_object_fnc_setVariable;

_spawn_data