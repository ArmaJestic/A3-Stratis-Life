// A_factory_fnc_update_queue_list

#include "..\..\includes\macro.h"
#include "..\..\includes\constants.h"

 
if (undefined(A_factory_var_selected)) exitWith {null};
private["_factory"];
_factory = A_factory_var_selected;

private["_queue_name", "_queue"];
_queue_name = _factory select factory_queue;
_queue = missionNamespace getVariable _queue_name;

private["_index"];
_index = (lbCurSel factory_dequeue_list_idc);

lbClear factory_dequeue_list_idc;

private["_i"];
_i = 0;
private["_previous_item", "_previous_item_count", "_logical_index"];
_previous_item = "";
_previous_item_count = -1;
_logical_index = 0;

//build the merged list 
private["_list"];
_list = [];
while { _i < (count _queue) } do {
	private["_citem", "_citem_info", "_citem_name", "_index"];
	_citem = _queue select _i;
	_citem_info = (_citem call A_inventory_fnc_get_item_array);
	_citem_name = (MASTER_ARRAY_ITEM_NAME(_citem_info));
	
	if (_citem == _previous_item) then {
		_previous_item_count = _previous_item_count + 1;
		_previous_item = _citem;
		_list set [((count _list) - 1), [format["%1. %2 (%3 item)",_logical_index, _citem_name, _previous_item_count], _citem]];
	}
	else {
		_logical_index = _logical_index + 1;
		_previous_item_count = 1;
		_previous_item = _citem;
		_list set [(count _list), [format["%1. %2 (%3 item)",_logical_index, _citem_name, 1], _citem]];
	};
	_i = _i + 1;
};

//player groupChat format["_list = %1", _list];
_i = 0;
while { _i < (count _list) } do {
	private["_entry", "_text", "_item", "_index"];
	_entry = _list select _i;
	_text = _entry select 0;
	_item = _entry select 1;
	
	//player groupChat format["Adding %1, %2", _text, _item];
	_index = lbAdd [factory_dequeue_list_idc, _text];
	lbSetData [factory_dequeue_list_idc, _index, _item];
	_i = _i + 1;
};

lbSetCurSel [factory_dequeue_list_idc, _index];
call A_factory_fnc_update_dequeue_item; 
