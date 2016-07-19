// A_interaction_fnc_heal_receive

#include "../../includes/macro.h"
#include "../../includes/constants.h"
#include "../../includes/dikcodes.h"


ARGV(0,_player);
ARGV(1,_target);

if (not([_player] call A_player_fnc_human)) exitWith {null};
if (not([_target] call A_player_fnc_human)) exitWith {null};

if (_target != player) exitWith {null};

player setDamage 0;
player groupChat format["%1-%2 healed you", _player, (name _player)];
