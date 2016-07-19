// A_player_fnc_init_stats

#include "../../includes/macro.h"


ARGV(0,_player);
if (not([_player] call A_player_fnc_human)) exitWith {null};

role = _player;
INV_hunger = 25;
shoveldur = 20;
pickaxedur = 50;
hammerdur = 100;
alreadygotaworkplacejob = 0;
respawnButtonPressed = false;
demerits = if ("car" call A_inventory_fnc_has_license) then {10} else {demerits};
[_player, "stunned", false] call A_player_fnc_set_bool;
[_player, "restrained", false] call A_player_fnc_set_bool;
[_player, "extradeadtime", 0] call A_player_fnc_set_scalar;

if (not(isblu)) then {
	[_player, "sidemarkers", true] call A_player_fnc_set_bool;	
};

[_player] call A_player_fnc_init_civilian_stats;
[_player] call A_player_fnc_init_cop_stats;
