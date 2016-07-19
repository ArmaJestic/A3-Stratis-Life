// A_weapon_fnc_compatible_with_attachment

#include "..\..\includes\macro.h"
#include "..\..\includes\constants.h"


ARGV(0,_weapon_id);
ARGV(1,_item_id);

if (undefined(_weapon_id)) exitWith {false};
if (typeName _weapon_id != "STRING") exitWith {false};
if (_weapon_id == "") exitWith {false};
if (undefined(_item_id)) exitWith {false};
if (typeName _item_id != "STRING") exitWith {false};
if (_item_id == "") exitWith {false};

private["_compatible"];
_compatible = [_weapon_id] call A_weapon_fnc_compatible_attachments;
_compatible = (_compatible select A_weapon_var_slot_side_rail) + 
			(_compatible select A_weapon_var_slot_top_rail) + 
			(_compatible select A_weapon_var_slot_muzzle); 

(toLower(_item_id) in _compatible)
