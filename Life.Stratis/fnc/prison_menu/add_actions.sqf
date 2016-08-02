// A_prison_menu_fnc_add_actions

#include "..\..\includes\constants.h"
#include "..\..\includes\macro.h"


if (count A_prison_menu_var_actions > 0) exitWith {};
ARGV(0,_player);
ARGV(1,_prison_id);

if (not([_player] call A_player_fnc_human)) exitWith {};
if (undefined(_prison_id)) exitWith {};

private["_action_id"];
_action_id = player addAction ["Prison menu", A_other_fnc_noscript, format['[%1, %2] call A_prison_menu_fnc_menu_create;', _player, _prison_id]];
A_prison_menu_var_actions = A_prison_menu_var_actions + [_action_id];
