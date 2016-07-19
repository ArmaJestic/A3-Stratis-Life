// A_doors_fnc_house_remove_spawn_data

#include "../../includes/constants.h"
#include "../../includes/macro.h"
#include "../../includes/dikcodes.h"


player groupChat format["A_doors_fnc_house_remove_spawn_data %1", _this];
ARGV(0,_player);
ARGV(1,_object);

if (undefined(_player)) exitWith {null};
if (undefined(_object)) exitWith {null};

private["_houses_spawn_data"];
_houses_spawn_data = [_player, "houses_spawn_data", null] call A_object_fnc_getVariable;
if (undefined(_houses_spawn_data)) exitWith {null};

private["_house_id"];
_house_id = netId _object;

private["_index", "_spawn_data"];
_spawn_data = objNull;
_index = -1;

{
	private["_cspawn_data", "_chouse_id"];
	_cspawn_data = _x;
	_chouse_id = _cspawn_data select A_doors_var_house_spawn_data_house_id;
	if (_chouse_id == _house_id) exitWith {
		_index = _forEachIndex;
		_spawn_data = _cspawn_data;
	};
} forEach _houses_spawn_data;

if (_index == -1) exitWith {null};

private["_respawn_id", "_result"];
_respawn_id = _spawn_data select A_doors_var_house_spawn_data_respawn_id;
_result = [_player,_respawn_id]  call BIS_fnc_removeRespawnPosition;
if (not(_result)) exitWith {
	diag_log format["WARNING: could not remove respawn position for %1", [_player, _respawn_id]];
	null
};
_spawn_data
