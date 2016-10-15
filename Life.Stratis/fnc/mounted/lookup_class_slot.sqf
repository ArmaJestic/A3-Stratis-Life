// A_mounted_fnc_lookup_class_slot

#include "header.h"


ARGV(0,_class);
ARGV(1,_slot_id);

private["_entry"]; 
_entry = [_class] call A_mounted_fnc_lookup_class;
if (UNDEFINED(_entry)) exitWith {null};

if (UNDEFINED(_slot_id)) exitWith {null};
if (typeName _slot_id != "STRING") exitWith {null};

private["_slot_entry"];
_slot_entry = null;

{
	private["_cslot_entry", "_cslot_name"];
	_cslot_entry = _x;
	_cslot_name = _cslot_entry select INDEX_SLOT_ID;
	if (_cslot_name == _slot_id) exitWith {
		_slot_entry = _cslot_entry;
	};
} forEach (_entry select INDEX_SLOTS);

_slot_entry
