// A_player_fnc_get_weapon_slot_item

#include "..\..\includes\macro.h"


//player groupChat format["A_player_fnc_get_weapon_slot_item %1", _this];
ARGV(0,_player);
ARGV(1,_weapon_id);
ARGV(2,_slot_id);

if (!([_player] call A_player_fnc_human)) exitWith {""};
if (undefined(_weapon_id)) exitWith {""};
if (typeName _weapon_id != "STRING") exitWith {""};
if (undefined(_slot_id)) exitWith {""};
if (typeName _slot_id != "SCALAR") exitWith {""};

private["_weapon_items"];
_weapon_items = [_player, _weapon_id] call A_player_fnc_weapon_attachments;
	
toLower(_weapon_items select _slot_id)
