// A_interaction_fnc_item_take_inventory

#include "../../includes/macro.h"
#include "../../includes/constants.h"
#include "../../includes/dikcodes.h"

 _this spawn {
//player groupChat format["A_interaction_fnc_item_take_inventory %1", _this];
ARGV(0,_player);
ARGV(1,_item);
ARGV(2,_amount);

if (not([_player] call A_player_fnc_human)) exitWith {null};
if (undefined(_item)) exitWith {null};
if (undefined(_amount)) exitWith {null};
if (typeName _item != "STRING") exitWith {null};
if (typeName _amount != "SCALAR") exitWith {null};

if (_amount <= 0) exitWith {null};


private["_inside_vehicle"];
_inside_vehicle = ((vehicle player) != player);
if (_inside_vehicle) exitWith {
	player groupChat format["You cannot take items while inside a vehicle"];
};


if (([_player] call A_drag_fnc_object_active)) exitWith {
	player groupChat format["You already have another item in your hands"];
};

//[] call A_interaction_fnc_play_pickup_animation;

if (_amount > ([_player, _item] call A_inventory_fnc_get_item_amount)) exitWith {
	player groupChat format["You do not have that many items to take"];
};

if (not([_player] call A_interaction_fnc_inventory_actions_allowed)) then {
	player groupChat "You cannot take from your inventory now.";
};

if (not(_item call A_inventory_fnc_get_item_droppable)) exitWith {
	player groupChat format["You are not allowed to take this item."];
};

if (_item == "keychain") then {
	//special processing for keys
	private["_vehicles_name_list"];
	_vehicles_name_list = [_player] call A_vehicle_fnc_list;
			
	private["_vehicle_name"];
	_vehicle_name = [_vehicles_name_list] call A_interaction_fnc_select_vehicle_wait;
	if (undefined(_vehicle_name)) exitWith {null};
	
	[_player, _vehicle_name] call A_vehicle_fnc_remove_name;
	private["_object"];
	_object = [_player, _item, 1, [_vehicle_name]] call A_player_fnc_drop_item;
	if (undefined(_object)) exitWith {};
	[_player, _object] spawn A_drag_fnc_take_object;
	player groupChat format["You took the key for %1", _vehicle_name];
	
}
else {
	//regular processing for other items
	[_player, _item, -(_amount)] call A_inventory_fnc_add_item;
	
	private["_object"];
	_object = [_player, _item, _amount] call A_player_fnc_drop_item;
	if (undefined(_object)) exitWith {};
	[_player, _object] spawn A_drag_fnc_take_object;
	player groupChat format["You took %1 %2(s)", strM(_amount), (MASTER_ARRAY_ITEM_NAME(_item))];
};
};
