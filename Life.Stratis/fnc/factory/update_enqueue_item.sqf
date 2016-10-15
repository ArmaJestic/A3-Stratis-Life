// A_factory_fnc_update_enqueue_item

#include "header.h"


private _index = (lbCurSel factory_enqueue_list_idc);
private _production_cost = 0;
private _avail = 0;

if (_index > 0) then {
	private _item = (lbData [factory_enqueue_list_idc, _index ]);
	
	if (UNDEFINED(_item)) exitWith {};
	if (typeName _item != "STRING") exitWith {};
	
	private _info = (_item call A_inventory_fnc_get_item_array);
	private _item_name = (MASTER_ARRAY_ITEM_NAME(_info));
	private _avail_name =  format["%1avail", _item];
	_avail = missionNamespace getVariable _avail_name;
	
	private _amount = (ctrlText factory_amount_field_idc);
	_amount = [_amount] call A_misc_fnc_parse_number;
	
	_production_cost = ([_item] call A_factory_fnc_calculate_production_cost) * _amount;
};

ctrlSetText [factory_item_cost_field_idc, format["$%1", strM(_production_cost)]];
ctrlSetText [factory_item_produced_field_idc, str(_avail)];

private _messages = call A_factory_fnc_validate_enqueue_item;
[_messages] call A_factory_fnc_update_status_fields;