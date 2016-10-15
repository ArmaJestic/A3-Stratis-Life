// A_weapon_fnc_compatible_attachments

#include "header.h"


params["_weapon_id"];

 _default = [[],[],[]];

if (UNDEFINED(_weapon_id)) exitWith {_default};
if (typeName _weapon_id != "STRING") exitWith {_default};
if (_weapon_id == "") exitWith {_default};

private _comaptible_side_rail = [_weapon_id, "PointerSlot"] call A_weapon_fnc_compatible_slot_attachments;
private _compatible_top_rail = [_weapon_id, "CowsSlot"] call A_weapon_fnc_compatible_slot_attachments;
private _compatible_muzzle = [_weapon_id, "MuzzleSlot"] call A_weapon_fnc_compatible_slot_attachments;

private _result = [];
_result set [INDEX_SLOT_SIDE_RAIL, _comaptible_side_rail];
_result set [INDEX_SLOT_TOP_RAIL, _comaptible_top_rail];
_result set [INDEX_SLOT_MUZZLE, _compatible_top_rail];
(_result)