// A_factory_fnc_validate_enqueue_item

#include "..\..\includes\macro.h"
#include "..\..\includes\constants.h"


//player groupChat format["A_factory_fnc_validate_enqueue_item"];
ctrlEnable[factory_enqueue_button_idc, false];
ctrlEnable[factory_create_button_idc, false];

if (undefined(A_factory_var_selected)) exitWith {[]};
private["_factory"];
_factory = A_factory_var_selected;

	
private["_player", "_item", "_index"];	
_player = player;
_index = (lbCurSel factory_enqueue_list_idc);

if (_index < 0 ) exitWith {
	(["You have not selected any item to produce or create", ""])
};

_item = (lbData [factory_enqueue_list_idc, _index]);

private["_message1", "_message2"];
_message1 = "";
_message2 = "";

private["_amount", "_amount_str"];
_amount_str = (ctrlText factory_amount_field_idc);

_amount = if (_amount_str == "") then { 0 } else {[_amount_str] call A_misc_fnc_parse_number };
_amount = if (_amount < 0 ) then { ctrlSetText [factory_amount_field_idc, "1"]; 1 } else {_amount};
_amount = if (_amount > 100) then { ctrlSetText [factory_amount_field_idc, "100"]; 100 } else { _amount };



if (_amount == 0) exitWith {
	["The value entered in the amount field is not valid", ""]
};

private["_factory_queue", "_workers_name", "_workers"];
_factory_queue = _factory select factory_queue;
_workers_name = format["%1workers", _factory_queue];
_workers = missionNamespace getVariable _workers_name;
	

private["_avail_name", "_avail"];
_avail_name = format["%1avail", _item];
_avail = missionNamespace getVariable _avail_name;

private["_factory_storage", "_factory_money", "_production_cost"];
_factory_storage = _factory select factory_storage;
_factory_money = [_player, "money", _factory_storage] call A_inventory_fnc_get_storage_amount;
_production_cost = ([_item] call A_factory_fnc_calculate_production_cost) * _amount;

private["_created_allowed", "_enqueue_allowed"];
_create_allowed = true;
_enqueue_allowed = true;



if (_amount > _avail) then {
	_message1 = "The amount of items create is higher than the amount of items produced";
	_create_allowed = false;
};

if (_production_cost > _factory_money) then {
	_message2 = "There is not enough money in the factory storage to produce this item";
	_enqueue_allowed = false;
};

if (not(_workers > 0)) then {
	_message2 = "Production cannot start because you have not hired any workers";
	_enqueue_allowed = false;
};


ctrlEnable[factory_create_button_idc, _create_allowed];
ctrlEnable[factory_enqueue_button_idc, _enqueue_allowed];

([_message1, _message2])
