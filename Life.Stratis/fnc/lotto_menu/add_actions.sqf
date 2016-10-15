// A_lotto_menu_fnc_add_actions

#include "header.h"


if (count A_lotto_menu_var_actions > 0) exitWith {};
params["_player","_lotto_id"];

if (!([_player] call A_player_fnc_human)) exitWith {};
if (UNDEFINED(_lotto_id)) exitWith {};

private _action_id = player addAction ["Play Lottery", A_actions_fnc_noscript, format['[%1, %2] call A_lotto_menu_fnc_menu_create;', _player, _lotto_id]];
A_lotto_menu_var_actions pushBack _action_id;