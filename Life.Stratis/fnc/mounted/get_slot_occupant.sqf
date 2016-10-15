// A_mounted_fnc_get_slot_occupant

#include "header.h"


ARGV(0,_vehicle);
ARGV(1,_slot_id);

if (UNDEFINED(_slot_id)) exitWith {null};
if (typeName _slot_id != "STRING") exitWith {null};
if (UNDEFINED(_vehicle)) exitWith {null};

private["_occupant"];
_occupant = [_vehicle, _slot_id] call A_object_fnc_getVariable;
if (typeName _occupant == "OBJECT") then {
	_occupant = if (isNull _occupant) then { nil } else { _occupant };
};

_occupant
