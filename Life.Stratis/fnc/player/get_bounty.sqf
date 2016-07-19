// A_player_fnc_get_bounty

#include "..\..\includes\macro.h"


ARGV(0,_player);

if (undefined(_player)) exitWith {null};

private["_bounty_variable_name"];
_bounty_variable_name = format["bounty"];

private["_bounty_variable"];
_bounty_variable = [_player, _bounty_variable_name] call A_object_fnc_getVariable;
_bounty_variable = if (undefined(_bounty_variable)) then { 0 } else { _bounty_variable };
_bounty_variable = if (typeName _bounty_variable != "SCALAR") then { 0 } else {_bounty_variable };
_bounty_variable
