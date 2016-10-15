// A_plant_fnc_player_near

#include "header.h"


params[["_player",null],["_distance",null,[0]]];

if (!([_player] call A_player_fnc_exists)) exitWith {null};
if (UNDEFINED(_distance)) exitWith {null};

_plant = nearCursorTarget;
if (isNull _plant || {!([_plant, "isPlant", false] call A_object_fnc_getVariable)}) exitWith {null};

(netId _plant)