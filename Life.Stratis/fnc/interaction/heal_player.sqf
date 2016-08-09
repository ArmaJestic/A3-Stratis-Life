// A_interaction_fnc_heal_player

#include "..\..\includes\macro.h"
#include "..\..\includes\constants.h"
#include "..\..\includes\dikcodes.h"


ARGV(0,_player);
ARGV(1,_target);

if (!([_player] call A_player_fnc_human)) exitWith {null};
if (!([_target] call A_player_fnc_human)) exitWith {null};

private["_interaction"];
_interaction = "heal";
if (!([_player, _target, _interaction] call A_interaction_fnc_check_distance)) exitWith {null};

player groupChat format["You healed %1-%2", _target, (name _target)];
[[_player,_target], "A_interaction_fnc_heal_receive", _target] call BIS_fnc_MP;
