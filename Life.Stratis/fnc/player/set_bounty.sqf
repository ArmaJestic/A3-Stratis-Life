// A_player_fnc_set_bounty

#include "header.h"


ARGV(0,_player);
ARGV(1,_bounty);

if (UNDEFINED(_player)) exitWith {null};
    if (UNDEFINED(_bounty)) exitWith {null};

if (typeName _bounty != "SCALAR") exitWith {null};
_bounty = if (_bounty < 0) then {0} else {_bounty};
_bounty = round(_bounty);

private["_bounty_variable_name"];
_bounty_variable_name = format["bounty"];

[_player, _bounty_variable_name, _bounty, true] call A_object_fnc_setVariable;
[_player, _bounty_variable_name, _bounty] call A_stats_fnc_player_save;
