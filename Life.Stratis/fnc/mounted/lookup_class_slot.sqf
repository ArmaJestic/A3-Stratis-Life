// A_mounted_fnc_lookup_class_slot

#include "..\..\includes\macro.h"
#include "..\..\includes\dikcodes.h"


ARGV(0,_class);
ARGV(1,_slot_id);

private["_entry"]; 
_entry = [_class] call A_mounted_fnc_lookup_class;
if (undefined(_entry)) exitWith {null};

if (undefined(_slot_id)) exitWith {null};
if (typeName _slot_id != "STRING") exitWith {null};

private["_slot_entry"];
_slot_entry = null;

{
	private["_cslot_entry", "_cslot_name"];
	_cslot_entry = _x;
	_cslot_name = _cslot_entry select A_mounted_var_slot_id;
	if (_cslot_name == _slot_id) exitWith {
		_slot_entry = _cslot_entry;
	};
} forEach (_entry select A_mounted_var_slots);

_slot_entry
