// A_player_fnc_set_saved_group

#include "../../includes/macro.h"


ARGV(0,_player);
ARGV(1,_group);
if (not([_player] call A_player_fnc_human)) exitWith {null};
if (undefined(_group)) exitWith {null};
if (typeName _group != "GROUP") exitWith {null};

[_player, "saved_group", _group, true] call A_object_fnc_setVariable;
