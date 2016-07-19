#include "..\..\includes\macro.h"

if (not(undefined(new_actions_functions))) exitWith {null};

clear_new_actions = 
{
	if (undefined(new_actions) || typeName new_actions != "ARRAY") exitWith {null};
	
	{
		_action_number = _x select 0;
		_target = _x select 1;
		_target removeAction _action_number;
	} foreach new_actions;
	
	new_actions = null;
};


add_new_action = 
{
	if (undefined(_this) || typeName _this != "ARRAY" ) exitWIth { hint "You tried to add an invalid action";};
	
	private ["_target", "_action", "_action_number"];
	_target = _this select 0;
	_action = _this select 1;
	
	
	_action_number = _target addAction _action;
	if (undefined(_action_number)) exitWith { hint "Could not add action";};

	if (undefined(new_actions)) then { new_actions = [];};
	new_actions = new_actions + [[_action_number, _target]];
};

new_actions_functions = true;
