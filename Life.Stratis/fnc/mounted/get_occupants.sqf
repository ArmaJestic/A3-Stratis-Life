// A_mounted_fnc_get_occupants

#include "header.h"


ARGV(0,_vehicle);

private["_class"]; 
_class = (typeOf _vehicle);
private["_entry"];
_entry = [_class] call A_mounted_fnc_lookup_class;
if (UNDEFINED(_entry)) exitWith {[]};

private["_occupants"];
_occupants = [];

{
	private["_slot", "_slot_id", "_occupant"];
	_slot = _x;
	_slod_id = _slot select INDEX_SLOT_ID;
	_occupant = [_vehicle, _slod_id] call A_mounted_fnc_get_slot_occupant;
	if (!(UNDEFINED(_occupant))) then {
		_occupants = _occupants + [_occupant];
	};
} forEach (_entry select INDEX_SLOTS);

_occupants
