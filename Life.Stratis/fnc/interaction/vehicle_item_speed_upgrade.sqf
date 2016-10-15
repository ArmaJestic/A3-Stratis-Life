// A_interaction_fnc_vehicle_item_speed_upgrade

#include "header.h"

 _this spawn {
player groupChat format["interact_vehicle_speed_upgrade %1", _this];
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

if(!(_vehicle isKindOf "car"))exitWith {
	player groupChat "You cannot tune this vehicle."
};

[_player, _item, -1] call A_inventory_fnc_add_item;

private["_level"];
_level = 0;
_level = if (_item == "supgrade1") then {0.12} else {_level};
_level = if (_item == "supgrade2") then {0.14} else {_level};
_level = if (_item == "supgrade3") then {0.16} else {_level};
_level = if (_item == "supgrade4") then {0.18} else {_level};
_level = if (_item == "supgrade5") then {0.20} else {_level};

if (_level <= 0) exitWith {};

player groupchat "Tuning vehicle ..."; 
_vehicle setfuel 0; 
sleep (5 + _level); 
_vehicle setfuel 1; 

[_vehicle, "tuning", _level, true] call A_object_fnc_setVariable; 
player groupchat "Vehicle tuned!";

};
