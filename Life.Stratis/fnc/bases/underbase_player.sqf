// A_bases_fnc_underbase_player

#include "header.h"


params["_player"];
if (!([_player] call A_object_fnc_exists)) exitWith {false};
([_player] call A_bases_fnc_underwater_player_inside || {[_player] call A_bases_fnc_underground_player_inside})