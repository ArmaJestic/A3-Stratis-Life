// A_doors_fnc_house_add_spawn_data

#include "../../includes/constants.h"
#include "../../includes/macro.h"
#include "../../includes/dikcodes.h"


player groupChat format["A_doors_fnc_house_add_spawn_data %1", _this];
ARGV(0,_player);
ARGV(1,_object);

if (undefined(_player)) exitWith {null};
if (undefined(_object)) exitWith {null};

private["_spawn_data_info", "_pos"];
_pos = (_object buildingPos 1);
if (str(_pos) == str([0,0,0])) then {
	_pos = _object modelToWorld [0,0,0];
};

_spawn_data_info = [_player,_pos] call BIS_fnc_addRespawnPosition;

private["_spawn_data"];
_spawn_data = [];
_spawn_data set [A_doors_var_house_spawn_data_house_id, netId _object];
_spawn_data set [A_doors_var_house_spawn_data_respawn_id, (_spawn_data_info select 1)];

private["_houses_spawn_data"];
_houses_spawn_data = [_player, "houses_spawn_data", []] call A_object_fnc_getVariable;
_houses_spawn_data set [count(_houses_spawn_data), _spawn_data];
[_player, "houses_spawn_data", _houses_spawn_data, true] call A_object_fnc_setVariable;

_spawn_data
