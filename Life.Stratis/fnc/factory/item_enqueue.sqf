// A_factory_fnc_item_enqueue

#include "..\..\includes\macro.h"
#include "..\..\includes\constants.h"


//player groupChat format["A_factory_fnc_item_enqueue %1", _this];	
ARGV(0,_player);
ARGV(1,_factory_id);
ARGV(2,_item);
ARGV(3,_amount);

factory_enqueue_active = if(undefined(factory_enqueue_active)) then {false} else {factory_enqueue_active};
if (factory_enqueue_active) exitWith {null};

if (not([_player] call A_player_fnc_human)) exitWith {null};
if(undefined(_factory_id)) exitWith {null};
if (typeName _factory_id != "STRING") exitWith {null};
if (undefined(_item)) exitWith {null};
if (typeName _item != "STRING") exitWith {null};
if (undefined(_amount)) exitWith {null};
if (typeName _amount != "SCAlAR") exitWith {null};

if (_amount == 0) exitWith {null};
factory_enqueue_active = true;


private["_factory", "_factory_storage", "_factory_queue", "_factory_name", "_factory_money", "_starttime"];
_factory = [_factory_id] call A_factory_fnc_lookup_id;
if (undefined(_factory)) exitWith {factory_enqueue_active = false;};

_factory_storage = _factory select factory_storage;
_factory_queue = _factory select factory_queue;
_factory_name = _factory select factory_name;
_factory_money = [_player, "money", _factory_storage] call A_inventory_fnc_get_storage_amount;

private["_info", "_item_type", "_item_name", "_production_cost"];
_info = (_item call A_inventory_fnc_get_item_array);
_item_type = _item call A_inventory_fnc_get_item_type;
_item_name = (MASTER_ARRAY_ITEM_NAME(_item));

private["_workers_name", "_workers"];
_workers_name = format["%1workers", _factory_queue];
_workers = missionNamespace getVariable _workers_name;

if (_workers <= 0) exitWith {
	factory_enqueue_active = false;
	player groupChat format["%1-%2, you cannot start production at your %3, because you have not hired any workers", _player, (name _player), _factory_name];
};

_production_cost = [_item, _workers] call A_factory_fnc_calculate_production_cost;

private["_total_due"];
_total_due = (_amount * _production_cost);

if (_factory_money < _total_due) exitWith {
	factory_enqueue_active = false;
	player groupChat format["%1-%2, you do not have enough money in your %3 storage to produce %4 %5", _player, (name _player), _factory_name, _amount, _item_name];
};


[_player, "money", -(_total_due), _factory_storage] call A_inventory_fnc_storage_add_item;
[_factory_storage, ([_player, _factory_storage] call A_object_fnc_getVariable)] call A_stats_fnc_client_save;


player groupChat format["%1-%2, you have added %3 %4 to the production queue of your %5", _player, (name _player), _amount, _item_name, _factory_name];

private["_pend_name", "_pend", "_queue"];
_pend_name = format["%1pend", _item];	

while { _amount > 0 } do {
	_queue = missionNamespace getVariable _factory_queue;
	_pend = missionNamespace getVariable _pend_name;
	
	_queue = _queue + [_item];
	_pend = _pend + 1;

	missionNamespace setVariable [_pend_name, _pend];
	missionNamespace setVariable [_factory_queue, _queue];
	
	[_pend_name, _pend] call A_stats_fnc_client_save;
	[_factory_queue, _queue] call A_stats_fnc_client_save;
	_amount = _amount - 1;
};

call A_factory_fnc_update_queue_list;
factory_enqueue_active = false;
