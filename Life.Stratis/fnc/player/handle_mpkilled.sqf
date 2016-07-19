// A_player_fnc_handle_mpkilled

#include "..\..\includes\macro.h"

 _this spawn {
player groupChat format["player_handle_mpkilled2 %1", _this];
ARGV(0,_unit);
ARGV(1,_killer);



if (str(_unit) != str(player)) exitWith {null};

private["_player"];
_player = player;

[_unit, 15] spawn A_player_fnc_despawn;
[_player] spawn A_player_fnc_save_side_gear;
[_player] spawn A_player_fnc_save_side_inventory;


if (defined(victim)) then {
	[_killer, _player] call victim;
};

if (A_player_var_rejoin_choice_active) exitWith {};

[_player] call A_player_fnc_reset_gear;
[_player] call A_player_fnc_drop_inventory;
[_player] call A_player_fnc_reset_ui;
[_player] call A_player_fnc_reset_stats;
[_player] call A_player_fnc_dead_camera;
[_player] call A_player_fnc_rejoin_camera;

};
