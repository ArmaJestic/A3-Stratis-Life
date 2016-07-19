// A_interaction_fnc_rob_handler

#include "..\..\includes\macro.h"
#include "..\..\includes\constants.h"
#include "..\..\includes\dikcodes.h"


ARGV(2,_this);
ARGV(0,_player);
ARGV(1,_target);

if (A_interaction_var_interact_rob_active) exitWith {
	player groupChat format["%1-%2, you are already robbing a player", (_player), (name _player)];
};
A_interaction_var_interact_rob_active = true;
[_player, _target] call A_interaction_fnc_rob_player;
A_interaction_var_interact_rob_active = false;
closeDialog 0;
