// A_drag_fnc_put_inventory_avalable

#include "../../includes/constants.h"
#include "../../includes/macro.h"


ARGV(0,_object);
ARGV(1,_player);

if (undefined(_object)) exitWith {false};
if (undefined(_player)) exitWith {false};
if (isNull _object) exitWith {false};
if (isNull _player) exitWith {false};
if (alive _object && {_object isKindOf "Animal" || {_object isKindOf "Man"}}) exitWith {false};

([_player] call A_drag_fnc_object_active)
