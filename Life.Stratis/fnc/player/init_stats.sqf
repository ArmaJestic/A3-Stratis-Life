// A_player_fnc_init_stats

#include "..\..\includes\macro.h"


ARGV(0,_player);
if (!([_player] call A_player_fnc_human)) exitWith {null};

role = _player;
INV_hunger = 25;
A_main_var_shoveldur = 20;
A_main_var_pickaxedur = 50;
A_main_var_hammerdur = 100;
alreadygotaworkplacejob = 0;
respawnButtonPressed = false;
A_main_var_A_main_var_demerits = if ("car" call A_inventory_fnc_has_license) then {10} else {A_main_var_A_main_var_demerits};
[_player, "stunned", false] call A_player_fnc_set_bool;
[_player, "restrained", false] call A_player_fnc_set_bool;
[_player, "extradeadtime", 0] call A_player_fnc_set_scalar;

if (!(isblu)) then {
	[_player, "sidemarkers", true] call A_player_fnc_set_bool;	
};

[_player] call A_player_fnc_init_civilian_stats;
[_player] call A_player_fnc_init_cop_stats;
