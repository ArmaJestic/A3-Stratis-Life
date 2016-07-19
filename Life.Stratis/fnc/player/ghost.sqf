// A_player_fnc_ghost

#include "..\..\includes\macro.h"


ARGV(0,_player);
if (not([_player] call A_player_fnc_exists)) exitWith {false};
private["_isGhost"];
_isGhost = [_player, "isGhost"] call A_object_fnc_getVariable;
if (undefined(_isGhost)) exitWith {false};
if (typeName _isGhost != "BOOL") exitWith {false};
_isGhost
