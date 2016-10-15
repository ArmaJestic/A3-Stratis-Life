// A_plant_fnc_harvest_yield

#include "header.h"



if (A_plant_var_harvest_yield_active) exitWith {
	player groupChat format["WARNING: A_plant_fnc_harvest_yield already active"];
};
A_plant_var_harvest_yield_active = true;

[] call A_interaction_fnc_play_pickup_animation;


params["_args"];
_args params["_player",["_plant",null,[objNull]]];

private _exit_method = {
	A_plant_var_harvest_yield_active = false;
};

if (!([_player] call A_player_fnc_exists)) exitWith {call _exit_method};
if (UNDEFINED(_plant)) exitWith {call _exit_method};
if (!([_plant, "isPlant", false] call A_object_fnc_getVariable)) exitWith {call _exit_method};


private _item = [_plant, "item", ""] call A_object_fnc_getVariable;
private _seed_data = [_item] call A_plant_fnc_seed_lookup_id;

private _yield_item = _seed_data select INDEX_YIELD_ITEM;
private _yield_amount = [_plant, "amount", 0] call A_object_fnc_getVariable;

private _yield_item_data = ITEM_DATA(_yield_item);
private _yield_item_name = ITEM_DATA_NAME(_yield_item_data);

//check if plant can be harvested
if (_yield_amount == 0) exitWith {
	player groupChat format["This plant has not yield any %1 yet", _yield_item_name];
	call _exit_method
};

//calculate the amount to harvest
private _harvest_amount = [_player, _yield_item, _yield_amount] call A_interaction_fnc_player_inventory_space;
if (_harvest_amount <= 0) exitWith {
	player groupChat format["You cannot carry any more %1 in your inventory", _yield_item_name];
	call _exit_method
};

//update the plant yield
private _remain_amount = _yield_amount - _harvest_amount;	
[_plant, _remain_amount] call A_plant_fnc_update_yield;

//update the player's inventory
player groupChat format["You harvested %1 of %2", _harvest_amount, _yield_item_name];
[_player, _yield_item, _harvest_amount] call A_inventory_fnc_add_item;

call _exit_method