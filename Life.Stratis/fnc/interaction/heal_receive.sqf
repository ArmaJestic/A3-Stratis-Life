// A_interaction_fnc_heal_receive

#include "header.h"


ARGV(0,_player);
ARGV(1,_target);

if (!([_player] call A_player_fnc_human)) exitWith {null};
if (!([_target] call A_player_fnc_human)) exitWith {null};

if (_target != player) exitWith {null};

player setDamage 0;
player groupChat format["%1-%2 healed you", _player, (name _player)];
