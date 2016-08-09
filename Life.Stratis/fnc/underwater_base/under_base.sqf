// A_underwater_base_fnc_under_base

#include "..\..\includes\constants.h"
#include "..\..\includes\macro.h"


ARGV(0,_player);
if (!([_player] call A_object_fnc_exists)) exitWith {false};
([_player] call A_underwater_base_fnc_underwater_base_player_inside || {[_player] call A_underwater_base_fnc_underground_base_player_inside})
