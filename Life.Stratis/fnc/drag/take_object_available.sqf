// A_drag_fnc_take_object_available

#include "header.h"


params["_player","_object"];
if (!([_player] call A_player_fnc_exists)) exitWith {false};
if (UNDEFINED(_object)) exitWith {false};

if ([_player] call A_drag_fnc_object_active) exitWith {false};
if (isNull _object) exitWith {false};

if ((_player distance _object) > 2) exitWith {false};

true