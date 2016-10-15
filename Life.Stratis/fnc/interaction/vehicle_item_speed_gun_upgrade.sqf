// A_interaction_fnc_vehicle_item_speed_gun_upgrade

#include "header.h"

 _this spawn {
player groupChat format["A_interaction_fnc_vehicle_item_speed_gun_upgrade %1", _this];
ARGV(0,_player);
ARGV(1,_item);
ARGV(2,_amount);

if (!([_player] call A_player_fnc_human)) exitWith {};
if (UNDEFINED(_item)) exitWith {};
if (typeName _item != "STRING") exitWith {};
if (UNDEFINED(_amount)) exitWith {};
if (_amount <= 0) exitWith {};

private["_vehicle"];
_vehicle = (vehicle _player);

if (_player == _vehicle) exitWith {
	player groupChat format["You must the inside a vehicle"];
};

if(!(_vehicle isKindOf "LandVehicle"))exitWith {
	player groupChat "You cannot install a speed gun on this vehicle."
};

[_player, _item, -1] call A_inventory_fnc_add_item;

player groupchat "Installing speed gun on vehicle ..."; 
sleep 5; 
[_vehicle, "speedgun", true, true] call A_object_fnc_setVariable; 
player groupchat "Installation complete. Use Control + G to activate the speed gun!";
};
