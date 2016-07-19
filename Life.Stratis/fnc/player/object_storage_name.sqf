// A_player_fnc_object_storage_name

#include "../../includes/macro.h"


ARGV(0,_object);
if (undefined(_object)) exitWith {""};
if (typeName _object != "OBJECT") exitWith {""};

if (_object isKindOf "Man") exitWith {
	([_object] call A_player_fnc_inventory_name)
};

([_object] call A_vehicle_fnc_storage_name)
