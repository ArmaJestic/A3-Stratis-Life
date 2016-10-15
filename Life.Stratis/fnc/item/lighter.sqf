// A_item_fnc_lighter

#include "..\..\includes\macro.h"


_mode = _this select 0;
if (_mode == "use") then {
	private["_item", "_amount", "_bounty", "_vehicle"];
	_item   = _this select 1;
	_amount = _this select 2;
	if (player == vehicle player)  exitWith {
		player groupChat localize "STRS_inv_items_ignite_ignite_notincar";
	};

	if ((damage vehicle player) == 1) exitWith {
		player groupChat localize "STRS_inv_items_repair_notneeded";
	};																							   
	
	_vehicle = vehicle player;
	
	//Distance checks for spawn areas
	if ([player] call A_player_fnc_in_safe_zone) exitwith {
		player groupChat "You cannot use the lighter in spawn areas";
	};
	
	vehicle player setDamage 0.95;
	player groupchat localize "STRS_inv_items_ignite_ignite";
	[player, _item, -1] call A_inventory_fnc_add_item;
	
	// Set the player criminal IF someone else is around and may saw it
	if (([player, 40] call A_player_fnc_near_cops) || ([player, 40] call A_player_fnc_near_civilians)) then {
		// Get the price of the burned vehicle
		[player, "Setting a vehicle on fire", 20000] call A_player_fnc_update_warrants;
	};
	
	
};
