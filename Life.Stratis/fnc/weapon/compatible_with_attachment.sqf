// A_weapon_fnc_compatible_with_attachment

#include "header.h"


ARGV(0,_weapon_id);
ARGV(1,_item_id);

if (UNDEFINED(_weapon_id)) exitWith {false};
if (typeName _weapon_id != "STRING") exitWith {false};
if (_weapon_id == "") exitWith {false};
if (UNDEFINED(_item_id)) exitWith {false};
if (typeName _item_id != "STRING") exitWith {false};
if (_item_id == "") exitWith {false};

private["_compatible"];
_compatible = [_weapon_id] call A_weapon_fnc_compatible_attachments;
_compatible = (_compatible select INDEX_SLOT_SIDE_RAIL) + 
			(_compatible select INDEX_SLOT_TOP_RAIL) + 
			(_compatible select INDEX_SLOT_MUZZLE); 

(toLower(_item_id) in _compatible)
