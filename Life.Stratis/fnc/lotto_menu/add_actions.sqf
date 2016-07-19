// A_lotto_menu_fnc_add_actions

#include "..\..\includes\constants.h"
#include "..\..\includes\macro.h"


if (count A_lotto_menu_var_actions > 0) exitWith {};
ARGV(0,_player);
ARGV(1,_lotto_id);

if (not([_player] call A_player_fnc_human)) exitWith {};
if (undefined(_lotto_id)) exitWith {};

private["_action_id"];
_action_id = player addAction ["Play Lottery", "noscript.sqf", format['[%1, %2] call A_lotto_menu_fnc_menu_create;', _player, _lotto_id]];
A_lotto_menu_var_actions = A_lotto_menu_var_actions + [_action_id];
