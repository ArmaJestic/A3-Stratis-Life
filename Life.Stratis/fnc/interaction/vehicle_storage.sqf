// A_interaction_fnc_vehicle_storage

#include "../../includes/macro.h"
#include "../../includes/constants.h"
#include "../../includes/dikcodes.h"


ARGV(0,_vehicle);
ARGV(1,_item);
ARGV(2,_amount);

if (not([_vehicle] call A_vehicle_fnc_exists)) exitWith {null};

if (undefined(_item)) exitWith {null};
if (undefined(_amount)) exitWith {null};
if (typeName _item != "STRING") exitWith {null};
if (typeName _amount != "SCALAR") exitWith {null};

if (_amount == 0) exitWith {null};

private["_class"];
_class = typeOf _vehicle;

private["_player", "_info", "_v_storage", "_p_storage"];
_player = player;
_info = _item call A_inventory_fnc_get_item_array;
_v_storage = [_vehicle] call A_vehicle_fnc_storage_name;
_p_storage = [_player] call A_player_fnc_inventory_name;

private["_v_max_weight", "_v_cur_weight", "_own_weight", "_items_weight", "_p_cur_weight", "_p_max_weight", "_v_items_amount", "_p_items_amount" ];
_v_max_weight = _class call A_inventory_fnc_get_vehicle_max_kg;
_v_cur_weight = [_vehicle, _v_storage] call A_inventory_fnc_get_storage_weight;
_p_max_weight = A_inventory_var_INV_CarryingCapacity;
_p_cur_weight = (call A_inventory_fnc_get_own_weight);
_items_weight =  ITEM_DATA_WEIGHT(_info) * abs(_amount);

_v_items_amount = ([_vehicle, _item, _v_storage] call A_inventory_fnc_get_storage_amount);
_p_items_amount = ([_player, _item, _p_storage] call A_inventory_fnc_get_storage_amount);

private["_valid"];
_valid = false;
if (_amount > 0) then {
	//adding items to the vehicle
	if (_amount > _p_items_amount) exitWith {
		player groupChat format["You do not have that many items in your inventory"];
	};
	
	if (_v_max_weight > 0 && (_items_weight + _v_cur_weight) > _v_max_weight) exitWith {
		player groupChat format["The total weight of the items exceed the vehicle's capacity"];
	};
	player groupChat format["You put %1 item(s) into the vehicle", strM(_amount)];
	_valid = true;
}
else {
	//removing items from the vehicle
	if (abs(_amount) > _v_items_amount) exitWith {
		player groupChat format["The vehicle does not have that many items"];
	};
	
	if (_p_max_weight> 0 && (_items_weight + _p_cur_weight) > _p_max_weight) exitWith {
		player groupChat format["The total weight of the items exceed the your carrying capacity"];
	};
	
	player groupChat format["You took %1 item(s) out of the vehicle", strM(abs(_amount))];
	_valid = true;		
};

if (not(_valid)) exitWith {null};

[_vehicle, _item, (_amount), _v_storage] call A_inventory_fnc_storage_add_item;
[_player, _item, -(_amount), _p_storage] call A_inventory_fnc_storage_add_item;

closeDialog 0;
call A_shop_menu_fnc_play_animation;
