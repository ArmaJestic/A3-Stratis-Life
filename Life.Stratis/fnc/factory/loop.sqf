// A_factory_fnc_loop

#include "..\..\includes\macro.h"
#include "..\..\includes\constants.h"


//player groupChat format["A_factory_fnc_loop %1", _this];
ARGV(0,_factory_id);

private["_player"];
_player = player;

if (not([_player] call A_player_fnc_human)) exitWith {
	player groupChat "Error (A_factory_fnc_loop): Not a player";
};

if (undefined(_factory_id)) exitWith {
	player groupChat "Error (A_factory_fnc_loop): No factory";
	_this spawn A_factory_fnc_loop;
};

if (typeName _factory_id != "STRING") exitWith {
	player groupChat "Error (A_factory_fnc_loop): Invalid factory id";
	_this spawn A_factory_fnc_loop;
};

private["_factory", "_queue_name"];
_factory = [_factory_id] call A_factory_fnc_lookup_id;
if (undefined(_factory)) exitWith {
	player groupChat "Error (A_factory_fnc_loop): Invalid factory";
	_this spawn A_factory_fnc_loop;
};

_queue_name = _factory select factory_queue;

call A_factory_fnc_update_queue_list;
call A_factory_fnc_update_dequeue_item;
call A_factory_fnc_update_enqueue_item;

//wait for an item to be put on queue
//player groupChat format["Waiting for queue item at %1", _factory_id];
waitUntil { (count(missionNamespace getVariable [_queue_name,[]]) > 0)};
//player groupChat format["Queue item %1 received at %2",((missionNamespace getVariable _queue_name) select 0), _factory_id];

//item on queue, production started
private["_queue", "_item"];
_queue = missionNamespace getVariable [_queue_name, []];
_item = _queue select 0;

private["_prod", "_pend", "_avail", "_prod_name", "_pend_name", "_avail_name"];

_prod_name = format["%1prod", _item];
_pend_name = format["%1pend", _item];
_avail_name = format["%1avail", _item];

_prod = missionNamespace getVariable [_prod_name, 0];
_pend = missionNamespace getVariable [_pend_name, 0];
_avail = missionNamespace getVariable [_avail_name, 0];

//update the production, and pending value
_prod = (_prod + 1) max (0);
_pend = (_pend - 1) max (0);

[_prod_name, _prod] spawn A_stats_fnc_client_save;
[_pend_name, _pend] spawn A_stats_fnc_client_save;

missionNamespace setVariable [_prod_name, _prod];
missionNamespace setVariable [_pend_name, _pend];

private["_workers_name"];
_workers_name = format["%1workers", _queue_name];

//wait for workers
//player groupChat format["Waiting for workers at %1", _factory_id];
waitUntil { (missionNamespace getVariable _workers_name) > 0 };
//player groupChat format["Workers recieved at %1", _factory_id];

private["_workers"];
_workers = missionNamespace getVariable _workers_name;

//calculate the manufacture time
private["_eta", "_item_cost"];
_item_cost = (_item call A_inventory_fnc_get_item_buy_cost);
_eta = [_item, _workers] call A_factory_fnc_calculate_production_time;

private["_item_name", "_factory_name"];
_factory_name = (_factory select factory_name);
_item_name = (MASTER_ARRAY_ITEM_NAME(_item));

player groupChat format["Production of %1 started at your %2, it will take %3 seconds(s) to complete", _item_name, _factory_name, _eta];

//countdown the manufacture time
private["_eta_name", "_original_production", "_production_canceled"];

_production_canceled = false;
_original_production = missionNamespace getVariable _prod_name;
_eta_name = format["%1eta", _item];
while { _eta > 0 } do {
	sleep 1;
	
	// For debug:
	//player groupChat format["_eta = %1, _item = %2, _workers = %3", _eta, _item, _workers];

	private["_current_production"];
	_current_production = missionNamespace getVariable _prod_name;
	
	if ((_current_production < _original_production) ) exitWith {
		[_prod_name, _current_production] spawn A_stats_fnc_client_save;
		_production_canceled = true;
	};
	
	_workers = missionNamespace getVariable _workers_name;
	if (_workers > 0) then {
		_eta = _eta - 1;
		missionNamespace setVariable [_eta_name, _eta];
		call A_factory_fnc_update_production_stats;
	};
	
};

if (_production_canceled) exitWith {
	//player canceled the production of the item
	sleep 1;
	_this spawn A_factory_fnc_loop;
};

_prod = missionNamespace getVariable _prod_name;
_avail = missionNamespace getVariable _avail_name;

//production complete, update the values
_prod = (_prod - 1) max (0);
_avail = _avail + 1;

missionNamespace setVariable [_prod_name, _prod];
missionNamespace setVariable [_avail_name, _avail];

_queue = missionNamespace getVariable _queue_name;
_queue set [0,0];
_queue = _queue - [0];
missionNamespace setVariable [_queue_name, _queue];

player groupChat format["A %1 was produced at your %2", _item_name, _factory_name];

//update the stats
[_prod_name, _prod] spawn A_stats_fnc_client_save;
[_avail_name, _avail] spawn A_stats_fnc_client_save;
[_queue_name, _queue] spawn A_stats_fnc_client_save;

sleep 1;
_this spawn A_factory_fnc_loop;
