// A_interaction_fnc_generic_storage

#include "header.h"


ARGV(0,_player);
ARGV(1,_storage);
ARGV(2,_item);
ARGV(3,_amount);

if (!([_player] call A_player_fnc_exists)) exitWith {null};

if (UNDEFINED(_storage)) exitWith {null};
if (UNDEFINED(_item)) exitWith {null};
if (UNDEFINED(_amount)) exitWith {null};
if (typeName _storage != "STRING") exitWith {null};
if (typeName _item != "STRING") exitWith {null};
if (typeName _amount != "SCALAR") exitWith {null};

if (_amount == 0) exitWith {null};

//player groupChat format["A_interaction_fnc_generic_storage %1", _this];

private["_item_kind"];
_item_kind = _item call A_inventory_fnc_get_item_kind;

private["_info", "_g_storage", "_p_storage"];
_info = _item call A_inventory_fnc_get_item_array;
_g_storage = _storage;
_p_storage = [_player] call A_player_fnc_inventory_name;

private["_g_max_weight", "_g_cur_weight", "_items_weight", "_p_cur_weight", "_p_max_weight", "_g_items_amount", "_p_items_amount"];
_g_cur_weight = [_player, _g_storage] call A_inventory_fnc_get_storage_weight;
_g_max_weight = -1; //factories ulimited weight
_p_max_weight = A_inventory_var_INV_CarryingCapacity;
_p_cur_weight = (call A_inventory_fnc_get_own_weight);
_items_weight = ITEM_DATA_WEIGHT(_info) * abs(_amount);

_g_items_amount = ([_player, _item, _g_storage] call A_inventory_fnc_get_storage_amount);
_p_items_amount = ([_player, _item, _p_storage] call A_inventory_fnc_get_storage_amount);

private["_valid"];
_valid = false;
if (_amount > 0) then {
	//adding items to the storage
	if (_amount > _p_items_amount) exitWith {
		player groupChat format["You do not have that many items in your inventory"];
	};
	
	if (_g_max_weight > 0 && ((_items_weight + _g_cur_weight) > _g_max_weight)) exitWith {
		player groupChat format["The total weight of the items exceed the storage's capacity"];
	};
	
	_valid = true;	
}else{
	//removing items from the storage
	if (abs(_amount) > _g_items_amount) exitWith {
		player groupChat format["The storage does not have that many item(s)"];
	};
	
	if (_p_max_weight > 0 && (_items_weight + _p_cur_weight) > _p_max_weight) exitWith {
		player groupChat format["The total weight of the items exceed the your carrying capacity"];
	};
	_valid = true;
};

if (!(_valid)) exitWith {null};
[_player, _item, (_amount), _g_storage] call A_inventory_fnc_storage_add_item;
[_player, _item, -(_amount), _p_storage] call A_inventory_fnc_storage_add_item;
[_g_storage, ([_player, _g_storage] call A_object_fnc_getVariable)] call A_stats_fnc_client_save;
closeDialog 0;
call A_shop_menu_fnc_play_animation;
