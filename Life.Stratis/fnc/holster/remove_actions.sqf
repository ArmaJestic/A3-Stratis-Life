// A_holster_fnc_remove_actions

#include "..\..\includes\macro.h"


ARGV(0,_player);

{	
	private["_action_id"];
	_action_id = _x;
	_player removeAction _action_id;
} forEach A_holster_var_actions;
