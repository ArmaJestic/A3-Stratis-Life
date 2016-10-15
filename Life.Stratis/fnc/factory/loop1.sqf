// A_factory_fnc_loop1

#include "header.h"


params[["_factory",null,[[]]]];
if (UNDEFINED(_factory)) exitWith {};

private _queue_name = _factory select INDEX_QUEUE;

call A_factory_fnc_update_queue_list;
call A_factory_fnc_update_dequeue_item;
call A_factory_fnc_update_enqueue_item;

//wait for an item to be put on queue
waitUntil {(count(missionNamespace getVariable [_queue_name,[]]) > 0)};

//item on queue, production started
private _queue = missionNamespace getVariable [_queue_name, []];
private _item = _queue select 0;

private _prod_name = format["%1prod", _item];
private _pend_name = format["%1pend", _item];
private _avail_name = format["%1avail", _item];

private _prod = missionNamespace getVariable [_prod_name, 0];
private _pend = missionNamespace getVariable [_pend_name, 0];
private _avail = missionNamespace getVariable [_avail_name, 0];

//update the production, and pending value
_prod = (_prod + 1) max (0);
_pend = (_pend - 1) max (0);

[_prod_name, _prod] spawn A_stats_fnc_client_save;
[_pend_name, _pend] spawn A_stats_fnc_client_save;

missionNamespace setVariable[_prod_name, _prod];
missionNamespace setVariable[_pend_name, _pend];

private _workers_name = format["%1workers", _queue_name];

//wait for workers
waitUntil {(missionNamespace getVariable _workers_name) > 0};

private _workers = missionNamespace getVariable _workers_name;

//calculate the manufacture time
private _item_cost = (_item call A_inventory_fnc_get_item_buy_cost);
private _eta = [_item, _workers] call A_factory_fnc_calculate_production_time;

private _factory_name = (_factory select INDEX_NAME);
private _item_name = (MASTER_ARRAY_ITEM_NAME(_item));

player groupChat format["Production of %1 started at your %2, it will take %3 seconds(s) to complete", _item_name, _factory_name, _eta];

//countdown the manufacture time
private _production_canceled = false;
private _original_production = missionNamespace getVariable _prod_name;
private _eta_name = format["%1eta", _item];
while {_eta > 0} do {
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
		missionNamespace setVariable[_eta_name, _eta];
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

missionNamespace setVariable[_prod_name, _prod];
missionNamespace setVariable[_avail_name, _avail];

_queue = missionNamespace getVariable _queue_name;
_queue set [0,0];
_queue = _queue - [0];
missionNamespace setVariable[_queue_name, _queue];

player groupChat format["A %1 was produced at your %2", _item_name, _factory_name];

//update the stats
[_prod_name, _prod] spawn A_stats_fnc_client_save;
[_avail_name, _avail] spawn A_stats_fnc_client_save;
[_queue_name, _queue] spawn A_stats_fnc_client_save;

sleep 1;
_this spawn A_factory_fnc_loop;