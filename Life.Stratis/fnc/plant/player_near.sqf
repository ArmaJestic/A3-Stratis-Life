// A_plant_fnc_player_near

#include "..\..\includes\macro.h"
#include "..\..\includes\constants.h"


//player groupChat format["A_plant_fnc_player_near %1", _this];
ARGV(0,_player);
ARGV(1,_distance);

if (!([_player] call A_player_fnc_exists)) exitWith {null};
if (undefined(_distance)) exitWith {null};
if (typeName _distance != "SCALAR") exitWith {null};

_plant = nearCursorTarget;
if (isNull _plant || {!([_plant, "isPlant", false] call A_object_fnc_getVariable)}) exitWith {null};

(netId _plant)
