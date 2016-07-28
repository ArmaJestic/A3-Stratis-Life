// A_interaction_fnc_factory_storage

#include "..\..\includes\macro.h"
#include "..\..\includes\constants.h"
#include "..\..\includes\dikcodes.h"


ARGV(0,_player);
ARGV(1,_factory);
ARGV(2,_item);
ARGV(3,_amount);

if (not([_player] call A_player_fnc_exists)) exitWith {null};

if (undefined(_factory)) exitWith {null};
if (undefined(_item)) exitWith {null};
if (undefined(_amount)) exitWith {null};
if (typeName _factory != "STRING") exitWith {null};
if (typeName _item != "STRING") exitWith {null};
if (typeName _amount != "SCALAR") exitWith {null};

if (_amount == 0) exitWith {null};

private["_item_kind"];
_item_kind = _item call A_inventory_fnc_get_item_kind;

if (not(_item_kind in ["ressource", "ore", "drug", "money"]) && _amount > 0) exitWith {
	player groupChat format ["You can only store money, A_item_fnc_drugs, and ressources in factories"];
};

private["_info", "_f_storage", "_p_storage"];
_info = _item call A_inventory_fnc_get_item_array;
_f_storage = _factory;
_p_storage = [_player] call A_player_fnc_inventory_name;

private["_f_max_weight", "_f_cur_weight", "_items_weight", "_p_cur_weight", "_p_max_weight", "_f_items_amount", "_p_items_amount"];
_f_cur_weight = [_player, _f_storage] call A_inventory_fnc_get_storage_weight;
_f_max_weight = -1; //factories ulimited
_p_max_weight = A_inventory_var_INV_CarryingCapacity;
_p_cur_weight = (call A_inventory_fnc_get_own_weight);
_items_weight = ITEM_DATA_WEIGHT(_info) * abs(_amount);

_f_items_amount = ([_player, _item, _f_storage] call A_inventory_fnc_get_storage_amount);
_p_items_amount = ([_player, _item, _p_storage] call A_inventory_fnc_get_storage_amount);

private["_valid"];
_valid = false;
if (_amount > 0) then {
	//adding items to the factory

	if (_amount > _p_items_amount) exitWith {
		player groupChat format["You do not have that many items in your inventory"];
	};
	
	if (_f_max_weight > 0 && (_items_weight + _f_cur_weight) > _f_max_weight) exitWith {
		player groupChat format["The total weight of the items exceed the factory's capacity"];
	};
	_valid =  true;
}
else {
	//removing items from the factory
	if (abs(_amount) > _f_items_amount) exitWith {
		player groupChat format["The factory does not have that many item"];
	};
	
	if (_p_max_weight > 0 && (_items_weight + _p_cur_weight) > _p_max_weight) exitWith {
		player groupChat format["The total weight of the items exceed the your carrying capacity"];
	};
	_valid =  true;		
};

if (not(_valid)) exitWith {null};

[_player, _item, _amount, _f_storage] call A_inventory_fnc_storage_add_item;
[_player, _item, -(_amount), _p_storage] call A_inventory_fnc_storage_add_item;
[_f_storage, ([_player, _f_storage] call A_object_fnc_getVariable)] call A_stats_fnc_client_save;

closeDialog 0;
call A_shop_menu_fnc_play_animation;
