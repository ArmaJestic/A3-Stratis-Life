// A_factory_fnc_update_queue_list

#include "header.h"

 
if (UNDEFINED(A_factory_var_selected)) exitWith {null};
private _factory = A_factory_var_selected;

private _queue_name = _factory select INDEX_QUEUE;
private _queue = missionNamespace getVariable _queue_name;
private _index = (lbCurSel factory_dequeue_list_idc);

lbClear factory_dequeue_list_idc;

private _i = 0;
private _previous_item = "";
private _previous_item_count = -1;
private _logical_index = 0;

//build the merged list 
private _list = [];
{
	private _citem = _x;
	private _citem_info = (_citem call A_inventory_fnc_get_item_array);
	private _citem_name = (MASTER_ARRAY_ITEM_NAME(_citem_info));
	
	if (_citem == _previous_item) then {
		_previous_item_count = _previous_item_count + 1;
		_previous_item = _citem;
		_list set [((count _list) - 1), [format["%1. %2 (%3 item)",_logical_index, _citem_name, _previous_item_count], _citem]];
	}else{
		_logical_index = _logical_index + 1;
		_previous_item_count = 1;
		_previous_item = _citem;
		_list set [(count _list), [format["%1. %2 (%3 item)",_logical_index, _citem_name, 1], _citem]];
	};
} forEach _queue;

{
	private _entry = _x;
	private _text = _entry select 0;
	private _item = _entry select 1;
	
	_index = lbAdd [factory_dequeue_list_idc, _text];
	lbSetData [factory_dequeue_list_idc, _index, _item];
} forEach _list;

lbSetCurSel [factory_dequeue_list_idc, _index];
call A_factory_fnc_update_dequeue_item; 