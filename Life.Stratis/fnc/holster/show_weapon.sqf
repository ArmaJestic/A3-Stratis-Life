// A_holster_fnc_show_weapon

#include "..\..\includes\macro.h"


ARGV(0,_player);
if (!(call A_holster_fnc_pistol_in_inventory)) exitWith {
	_player groupChat format["You have no pistol in your inventory"];
	INV_InventarPistol = null;
};

if (call A_holster_fnc_pistol_in_hands) exitWith {
	_player groupChat format["Cannot unholster inventory pistol, you already have a pistol in your hands"];
};

if (UNDEFINED(INV_InventarPistol)) exitWith {
	_player groupChat format["The type of pistol in your inventory is unknown, removing it"];
	[_player, 'pistol', 0] call A_inventory_fnc_set_item_amount;
};

_player addWeapon INV_InventarPistol;
_player selectWeapon INV_InventarPistol;
[_player, 'pistol', 0] call A_inventory_fnc_set_item_amount;
INV_InventarPistol = null;
_player action ["switchweapon", _player, _player, 0];
