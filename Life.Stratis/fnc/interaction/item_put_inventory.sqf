// A_interaction_fnc_item_put_inventory

#include "..\..\includes\macro.h"
#include "..\..\includes\constants.h"
#include "..\..\includes\dikcodes.h"


//player groupChat format["A_interaction_fnc_item_put_inventory %1", _this];
ARGV(0,_player);
ARGV(1,_item);
ARGV(2,_amount);
ARGV(3,_data);

if (not([_player] call A_player_fnc_human)) exitWith {null};
if (undefined(_item))exitWith {null};
if (undefined(_amount)) exitWith {null};

if (typeName _item != "STRING") exitWith {null};
if (typeName _amount != "SCALAR") exitWith {null};

if (_amount <= 0) exitWith {null};

if (A_interaction_var_interact_item_put_active) exitWith {
	player groupChat format["WARNING: A_interaction_fnc_item_put_inventory already active"];
};
A_interaction_var_interact_item_put_active = true;

private["_pickup_amount"];
_pickup_amount = [_player, _item, _amount] call A_interaction_fnc_player_inventory_space;

if (_pickup_amount <= 0) exitWith {
	A_interaction_var_interact_item_put_active = false;
	player groupChat "Max weight reached, you cannot take any more items";
	null
};

private["_item_name"];
_item_name = (MASTER_ARRAY_ITEM_NAME(_item));

if (_item == "keychain") then {
	if (isNil "_data" || {typeName _data != "ARRAY"}) exitWith {};
	private["_vehicle_name"];
	_vehicle_name = _data select 0;
	[_player, _vehicle_name] call A_vehicle_fnc_add_name;
	player groupChat format["You put the key for %1 in your inventory ", _vehicle_name];
}
else {
	[_player, _item, _pickup_amount, ([player] call A_player_fnc_inventory_name)] call INV_CreateItem;
	player groupchat format["You put %1 %2(s) in your inventory", strM(_pickup_amount), _item_name];
};

A_interaction_var_interact_item_put_active = false;
(_amount - _pickup_amount)
