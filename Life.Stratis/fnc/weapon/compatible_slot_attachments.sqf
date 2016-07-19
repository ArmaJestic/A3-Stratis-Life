// A_weapon_fnc_compatible_slot_attachments

#include "..\..\includes\macro.h"
#include "..\..\includes\constants.h"


ARGV(0,_weapon_id);
ARGV(1,_slot);
if (undefined(_weapon_id)) exitWith {[]};
if (typeName "_weapon_id" != "STRING") exitWith {[]};
if (_weapon_id == "") exitWith {null};

if (undefined(_slot)) exitWith {[]};
if (typeName _slot != "STRING") exitWith {[]};
if (not(_slot in ["CowsSlot", "MuzzleSlot", "PointerSlot"])) exitWith {[]};

private["_slot_ids", "_slot_data"];
if (not(isClass(configFile >> "CfgWeapons" >> _weapon_id))) exitWith {[]};
_slot_ids = (getArray(configFile >> "CfgWeapons" >> _weapon_id >> "WeaponSlotsInfo" >> _slot >> "compatibleItems"));

([_slot_ids] call A_misc_fnc_toLowerArray)
