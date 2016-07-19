// A_holster_fnc_hide_weapon

#include "../../includes/macro.h"


ARGV(0,_player);

if (not(call A_holster_fnc_pistol_in_hands)) exitWith {
	player groupChat format["You have no pistol in your hands to holster"];
};

if ((call A_holster_fnc_pistol_in_inventory)) exitWith {
	player groupChat format["You already have a pistol in your inventory"];
};

INV_InventarPistol = currentWeapon(_player);
player removeWeapon INV_InventarPistol;
[_player, 'pistol', 1] call A_inventory_fnc_set_item_amount;
