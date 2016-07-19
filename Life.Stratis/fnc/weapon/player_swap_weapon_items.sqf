// A_weapon_fnc_player_swap_weapon_items

#include "../../includes/macro.h"
#include "../../includes/constants.h"


ARGV(0,_player);
ARGV(1,_weapon_id);
ARGV(2,_attached_item_id);
ARGV(3,_inventory_item_id);

if (not([_player] call A_player_fnc_human)) exitWith {null};
if (undefined(_weapon_id)) exitWith {null};
if (typeName _weapon_id != "STRING") exitWith {null};
if (undefined(_attached_item_id)) exitWith {null};
if (typeName _attached_item_id != "STRING") exitWith {null};
if (undefined(_inventory_item_id)) exitWith {null};
if (typeName _inventory_item_id != "STRING") exitWith {null};

private["_floorDropNotification"];
_floorDropNotification = {
	private["_name"];
	ARGV(0,_item_id);
	_name = [_item_id] call A_weapon_fnc_display_name;
	player groupChat format["Attachment ""%1"" did not fit in your inventory. It was placed on the ground.", _name];
};

//adding attachment to empty weapon slot
if (_attached_item_id == "" && _inventory_item_id != "") exitWith {
	_player removeItem _inventory_item_id;
	[_player, _weapon_id, _inventory_item_id] call A_player_fnc_add_weapon_item;
};

//removing attachment from weapon
if (_attached_item_id != "" && _inventory_item_id == "") exitWith {
	if (not([_player, _attached_item_id] call A_player_fnc_add_item)) then {
		[_attached_item_id] call _floorDropNotification;
	};
	[_player, _weapon_id, _attached_item_id] call A_player_fnc_remove_weapon_item;
};

//no-op
if (_attached_item_id == "" && _inventory_item_id == "") exitWith {null};

//actual swapping 
if (_attached_item_id != "" && _inventory_item_id != "") exitWith {
	[_player, _weapon_id, _attached_item_id] call A_player_fnc_remove_weapon_item;
	_player removeItem _inventory_item_id;
	
	[_player, _weapon_id, _inventory_item_id] call A_player_fnc_add_weapon_item;
	if (not([_player, _attached_item_id] call A_player_fnc_add_item)) then {
		[_attached_item_id] call _floorDropNotification;
	};
};	
