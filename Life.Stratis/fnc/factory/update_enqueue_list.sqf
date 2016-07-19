// A_factory_fnc_update_enqueue_list

#include "../../includes/macro.h"
#include "../../includes/constants.h"

 
if (undefined(A_factory_var_selected)) exitWith {null};
private["_factory"];
_factory = A_factory_var_selected;

private["_queue_name", "_queue", "_items", "_workers_name", "_workers"];
_queue_name = _factory select factory_queue;
_queue = missionNamespace getVariable _queue_name;
_items = _factory select factory_items;
_workers_name = format["%1workers", _queue_name];
_workers = missionNamespace getVariable _workers_name;

lbClear factory_enqueue_list_idc;

{
	if (!dialog) exitWith {null};
	
	private["_index", "_item", "_eta", "_item_name", "_minutes"];
	_item = _x;
	_eta = [_item, _workers] call A_factory_fnc_calculate_production_time;
	_minutes = _eta / 60;
	_minutes = (floor(_minutes * 10)/10); //truncate to leave only 1 decimal digit
	_item_name = (MASTER_ARRAY_ITEM_NAME(_item));
	_index = lbAdd [factory_enqueue_list_idc, format["%1 (%2 min/s)", _item_name, _minutes]];
	lbSetData [factory_enqueue_list_idc, _index, _x];
} forEach _items;
	
call A_factory_fnc_update_enqueue_item;
