// A_interaction_fnc_item_give

#include "..\..\includes\macro.h"
#include "..\..\includes\constants.h"
#include "..\..\includes\dikcodes.h"

 _this spawn {
//player groupChat format["A_interaction_fnc_item_give %1", _this];
ARGV(0,_player);
ARGV(1,_item);
ARGV(2,_amount);
ARGV(3,_target);

if (not([_player] call A_player_fnc_human)) exitWith {null};
if (undefined(_item)) exitWith {null};
if (undefined(_amount)) exitWith {null};
if (typeName _item != "STRING") exitWith {null};
if (typeName _amount != "SCALAR") exitWith {null};
if (not([_target] call A_player_fnc_human)) exitWith {null};
if (_amount <= 0) exitWith {null};

if (not(_item == "keychain")) then {
	[] call A_interaction_fnc_play_pickup_animation;
};

if (_amount > ([_player, _item] call A_inventory_fnc_get_item_amount)) exitWith {
	player groupChat format["You do not have that many items to give"];
};

private["_space_available"];
_space_available = [_target, _item, _amount] call A_interaction_fnc_player_inventory_space;
if (_space_available <= 0) exitWith {
	player groupChat format["The target player does not have enough inventory space to receive the items"];
};

if (_amount > _space_available) then {
	_amount = _space_available;
};

if (not([_player] call A_interaction_fnc_inventory_actions_allowed)) then {
	player groupChat "You cannot use your inventory now";
};

if (not(_item call A_inventory_fnc_iventory_get_item_giveable)) exitWith {
	player groupChat format["You are not allowed to give this type of item to other players"];
};

if (_player == _target) exitWith {
	player groupChat format["You cannot give an item to yourself"];
};

private["_item_name"];
_item_name = (MASTER_ARRAY_ITEM_NAME(_item));

private["_near_players", "_minimum_distance"];
_minimum_distance = 20;
_near_players = nearestObjects [getPos _player, ["LandVehicle", "Air", "Man"], _minimum_distance];

if (not(_target in _near_players) and (_player distance _target > _minimum_distance)) exitWith {
	player groupChat format["You have to be within at least %1 meters from the selected player", _minimum_distance];
};

if (_item == "keychain") then {
	//special processing for keys
	private["_vehicles_name_list"];
	_vehicles_name_list = [_player] call A_vehicle_fnc_list;
	
	private["_vehicle_name"];
	_vehicle_name = [_vehicles_name_list] call A_interaction_fnc_select_vehicle_wait;
	if (undefined(_vehicles_name_list)) exitWith {null};
	
	private["_vehicle"];
	_vehicle = missionNamespace getVariable [_vehicle_name, null];
	if (undefined(_vehicle)) exitWith {
		player groupChat format["%1-%2, you cannot give keys to a vehicle that does not exist", (_player), (name _player), _vehicle_name];
	};
	
	player groupChat format["You gave %1-%2 a copy of the key for %3", _target, (name _target), _vehicle];
	format["[%1, %2, %3] call A_interaction_fnc_keychain_give_receive;", _player, _target, _vehicle] call A_broadcast_fnc_broadcast;
}
else {
	//generic processing for all other items
	[_player, _item, -(_amount)] call A_inventory_fnc_add_item;
	player groupChat format["You gave %1-%2 %3 units of %4", _target, (name _target), strN(_amount), _item_name];
	format["[%1, %2, ""%3"", %4] call A_interaction_fnc_item_give_receive;", _player, _target, _item, strN(_amount)] call A_broadcast_fnc_broadcast;
};
};
