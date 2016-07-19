// A_factory_fnc_update_production_stats

#include "..\..\includes\macro.h"
#include "..\..\includes\constants.h"


if (undefined(A_factory_var_selected)) exitWith {null};
private["_factory"];
_factory = A_factory_var_selected;

private["_item", "_index"];	
_index = (lbCurSel factory_dequeue_list_idc);
_item = (lbData [factory_dequeue_list_idc, _index]);

if (undefined(_item)) exitWith {null};
if (typeName _item != "STRING") exitWith {null};
if (_item == "") exitWith {null};

private["_info", "_item_name"];
_info = (_item call A_inventory_fnc_get_item_array);
_item_name = (MASTER_ARRAY_ITEM_NAME(_info));
	
private["_eta"];
_eta = 0;
if (_index < 0) then {
	_eta = 0;
	_item_name = "(none)";
}
else { if (_index == 0) then {
	private["_eta_name"];
	_eta_name = format["%1eta", _item];
	_eta = missionNamespace getVariable _eta_name;
}
else {
	private["_queue_name", "_workers_name", "_workers"];
	_queue_name = _factory select factory_queue;
	_workers_name = format["%1workers", _queue_name];
	_workers = missionNamespace getVariable _workers_name;
	private["_production_time"];
	_eta = [_item, _workers] call A_factory_fnc_calculate_production_time;
};};


ctrlSetText [factory_production_field_idc, _item_name];
ctrlSetText [factory_production_eta_field_idc, format["%1 seconds", _eta]];
