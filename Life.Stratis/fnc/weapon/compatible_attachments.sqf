// A_weapon_fnc_compatible_attachments

#include "../../includes/macro.h"
#include "../../includes/constants.h"


ARGV(0,_weapon_id);

private["_default"];
_default = [[],[],[]];

if (undefined(_weapon_id)) exitWith {_default};
if (typeName _weapon_id != "STRING") exitWith {_default};
if (_weapon_id == "") exitWith {_default};

private["_list", "_comaptible_side_rail", "_comaptible_top_rail", "_compatible_muzzle"];
_comaptible_side_rail = [_weapon_id, "PointerSlot"] call A_weapon_fnc_compatible_slot_attachments;
_comaptible_top_rail = [_weapon_id, "CowsSlot"] call A_weapon_fnc_compatible_slot_attachments;
_compatible_muzzle = [_weapon_id, "MuzzleSlot"] call A_weapon_fnc_compatible_slot_attachments;

private["_result"];
_result = [];
_result set [A_weapon_var_slot_side_rail, _comaptible_side_rail];
_result set [A_weapon_var_slot_top_rail, _comaptible_top_rail];
_result set [A_weapon_var_slot_muzzle, _compatible_muzzle];
(_result)
