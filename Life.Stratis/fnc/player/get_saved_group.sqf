// A_player_fnc_get_saved_group

#include "..\..\includes\macro.h"


ARGV(0,_player);
if (not([_player] call A_player_fnc_human)) exitWith {null};

private["_group"];
_group = [_player, "saved_group"] call A_object_fnc_getVariable;
(_group)
