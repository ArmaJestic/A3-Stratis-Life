#include "macro.h"

if (not(undefined(holster_functions_defined))) exitWith {null};

holster_actions = [];

holster_pistol_in_hands = {
	([(currentWeapon player), "PistolCore"] call shop_weapon_inherits_from)
};

holster_pistol_in_inventory =  {
	(([player, "pistol"] call inventory_get_item_amount) > 0)
};

holster_add_actions = {
	ARGV(0,_player);
	if (undefined(_player)) exitWith {null};

	private["_holster_action", "_unholster_action"];
	
	_holster_action = _player addAction ["Holster pistol", "noscript.sqf", format['[%1] call holster_hide_weapon;', _player], 1, false, true,"", '_in_hands = (call holster_pistol_in_hands); _in_inv = (call holster_pistol_in_inventory); _in_hands && not(_in_inv)'];
	_unholster_action = _player addAction ["Unholster pistol", "noscript.sqf", format['[%1] call holster_show_weapon;', _player], 1, false, true,"", '_in_hands = (call holster_pistol_in_hands); _in_inv = (call holster_pistol_in_inventory); not(_in_hands) && _in_inv'];
	
	holster_actions = [_holster_action, _unholster_action];
};


holster_remove_actions = {
	ARGV(0,_player);
	
	{	
		private["_action_id"];
		_action_id = _x;
		_player removeAction _action_id;
	} forEach holster_actions;
};

holster_hide_weapon = {
	ARGV(0,_player);
	
	if (not(call holster_pistol_in_hands)) exitWith {
		player groupChat format["You have no pistol in your hands to holster"];
	};
	
	if ((call holster_pistol_in_inventory)) exitWith {
		player groupChat format["You already have a pistol in your inventory"];
	};
	
	INV_InventarPistol = currentWeapon(_player);
	player removeWeapon INV_InventarPistol;
	[_player, 'pistol', 1] call inventory_set_item_amount;
};


holster_show_weapon = {
	ARGV(0,_player);
	if (not(call holster_pistol_in_inventory)) exitWith {
		_player groupChat format["You have no pistol in your inventory"];
		INV_InventarPistol = null;
	};
	
	if (call holster_pistol_in_hands) exitWith {
		_player groupChat format["Cannot unholster inventory pistol, you already have a pistol in your hands"];
	};

	if (undefined(INV_InventarPistol)) exitWith {
		_player groupChat format["The type of pistol in your inventory is unknown, removing it"];
		[_player, 'pistol', 0] call inventory_set_item_amount;
	};
	
	_player addWeapon INV_InventarPistol;
	_player selectWeapon INV_InventarPistol;
	[_player, 'pistol', 0] call inventory_set_item_amount;
	INV_InventarPistol = null;
	_player action ["switchweapon", _player, _player, 0];
	
};


holster_functions_defined = false;