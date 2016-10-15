// A_holster_fnc_add_actions

#include "..\..\includes\macro.h"


ARGV(0,_player);
if (UNDEFINED(_player)) exitWith {null};

private["_holster_action", "_unholster_action"];

_holster_action = _player addAction ["A_other_fnc_holster pistol", A_actions_fnc_noscript, format['[%1] call A_holster_fnc_hide_weapon;', _player], 1, false, true,"", '_in_hands = (call A_holster_fnc_pistol_in_hands); _in_inv = (call A_holster_fnc_pistol_in_inventory); _in_hands && !(_in_inv)'];
_unholster_action = _player addAction ["Unholster pistol", A_actions_fnc_noscript, format['[%1] call A_holster_fnc_show_weapon;', _player], 1, false, true,"", '_in_hands = (call A_holster_fnc_pistol_in_hands); _in_inv = (call A_holster_fnc_pistol_in_inventory); !(_in_hands) && _in_inv'];

A_holster_var_actions = [_holster_action, _unholster_action];
