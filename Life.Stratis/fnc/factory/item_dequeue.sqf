// A_factory_fnc_item_dequeue

#include "header.h"


params["_player",["_factory_id",null,[""]],["_item",null,[""]],["_index",-1,[0]]];

if (!([_player] call A_player_fnc_human)) exitWith {};
if (UNDEFINED(_factory_id)) exitWith {};
if (UNDEFINED(_item)) exitWith {};
if (_index < 0) exitWith {};


private _factory = [_factory_id] call A_factory_fnc_lookup_id;
if (UNDEFINED(_factory)) exitWith {null};


private _factory_name = _factory select INDEX_NAME;
private _factory_storage = _factory select INDEX_STORAGE;
private _queue_name = _factory select INDEX_QUEUE;

private _info = (_item call A_inventory_fnc_get_item_array);
private _item_type = _item call A_inventory_fnc_get_item_type;
private _item_name = (MASTER_ARRAY_ITEM_NAME(_item));

private _eta_name = format["%1eta", _item];
private _pend_name = format["%1pend", _item];

private _queue = missionNamespace getVariable _queue_name;
private _eta = missionNamespace getVariable _eta_name;

private _minimum_time = 5; 
if ((_index == 0) && {_eta < _minimum_time}) exitWith {
	player groupChat format["%1-%2, you are not allowed to cancel when production time is less than %3 seconds", _player, (name _player), _minimum_time];
};


private _pend_name = format["%1pend", _item];
private _pend = missionNamespace getVariable _pend_name;
private _prod_name = format["%1prod", _item];
private _prod = missionNamespace getVariable _prod_name;

//simple case, item is not being produced yet
if (!(_prod > 0 || _pend > 0)) exitWith {
	player groupChat format["%1-%2, you do not have any %3 in production, or pending", _player, (name _player), _item_name];
};

//update the production and pending values
if ((_index == 0) && {_prod > 0}) then {
	_prod = _prod - 1;
	_prod = (_prod) max (0);
	//player groupChat format["%1-%2, your %3 was in production, it has been canceled", _player, (name _player), _item_name];
}else{
	if (_pend > 0) then {
		_pend = _pend - 1;
		_pend = (_pend) max (0);
		//player groupChat format["%1-%2, you had a %3 pending production, it has been canceled", _player, (name _player), _item_name];
	};
};
	

//look for the item in the queue
{
	if (_x == _item) exitwith {
		__queue deleteAt _forEachIndex;
	};
} forEach _queue;


//reimburse the player for the production cost
private _production_cost = [_item] call A_factory_fnc_calculate_production_cost;
[_player, "money", _production_cost, _factory_storage] call A_inventory_fnc_storage_add_item;
[_factory_storage, ([_player, _factory_storage] call A_object_fnc_getVariable)] call A_stats_fnc_client_save;

//player groupChat format["%1-%2, you have been reimbursed $%3 for %4", _player, (name _player), _production_cost, _item_name];
//player groupChat format["_queue = %1", _queue];
missionNamespace setVariable[_queue_name, _queue];
missionNamespace setVariable[_pend_name, _pend];
missionNamespace setVariable[_prod_name, _prod];
[_prod_name, _prod] spawn A_stats_fnc_client_save;
[_queue_name, _queue] spawn A_stats_fnc_client_save;
call A_factory_fnc_update_queue_list;