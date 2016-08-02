// A_actions_fnc_add_new_action

#include "..\..\includes\macro.h"


if (undefined(_this) || typeName _this != "ARRAY" ) exitWIth { hint "You tried to add an invalid action";};

private ["_target", "_action", "_action_number"];
_target = _this select 0;
_action = _this select 1;


_action_number = _target addAction _action;
if (undefined(_action)) exitWith { hint "Could not add action";};

if (undefined(new_actions)) then { new_actions = [];};
new_actions = new_actions + [[_action_number, _target]];