// A_drag_fnc_put_inventory_avalable

#include "header.h"


params["_object","_player"];

if (UNDEFINED(_object)) exitWith {false};
if (UNDEFINED(_player)) exitWith {false};
if (isNull _object) exitWith {false};
if (isNull _player) exitWith {false};
if (alive _object && {_object isKindOf "Animal" || {_object isKindOf "Man"}}) exitWith {false};

([_player] call A_drag_fnc_object_active)