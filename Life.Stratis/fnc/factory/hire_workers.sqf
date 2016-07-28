// A_factory_fnc_hire_workers

#include "..\..\includes\macro.h"
#include "..\..\includes\constants.h"


ARGV(0,_player);
ARGV(1,_factory_id);
ARGV(2,_workers_count);
ARGV(3,_workers_cost);

if (not([_player] call A_player_fnc_human)) exitWith {null};
if (undefined(_factory_id)) exitWith {null};
if (undefined(_workers_count)) exitWith {null};
if (undefined(_workers_cost)) exitWith {null};
if (typeName _factory_id != "STRING") exitWith {null};
if (typeName _workers_count != "SCALAR") exitWith {null};
if (typeName _workers_cost != "SCALAR") exitWith {null};


private["_factory", "_queue_name", "_factory_name"];
_factory = [_factory_id] call A_factory_fnc_lookup_id;
if (undefined(_factory)) exitWith {null};

_queue_name = _factory select factory_queue;
_factory_name = _factory select factory_name;

private["_workers_name", "_workers"];
_workers_name = format["%1workers", _queue_name];
_workers = missionNamespace getVariable _workers_name;

private["_max"];
_max = A_main_var_maxfacworkers;
if (_workers >= _max) exitWith {
	player groupChat format["%1-%2, your %3 has already reached maximum of %4 workers", _player, (name _player), _factory_name, _max];
};

private["_money", "_total_cost"];
_money = [_player, "money"] call A_inventory_fnc_get_item_amount;
_total_cost = (_workers_count * _workers_cost);

if (_money < _total_cost) exitWith {
	player groupChat format["%1-%2, you do not have enough money in your inventory to hire %3 workers for your %4", _player, (name _player), _workers_count, _factory_name];
};

[player, "money", -(_total_cost)] call A_inventory_fnc_add_item;

_workers = _workers + _workers_count;
player groupChat format["%1-%2, you have hired %3 workers for your %4", _player, (name _player), _workers_count, _factory_name];
missionNamespace setVariable [_workers_name, _workers];
[_workers_name, _workers] call A_stats_fnc_client_save;


//adjust the ETA for the current item in queue
private["_queue"];
_queue = missionNamespace getVariable _queue_name;
if (count _queue > 0) then {
	private["_eta", "_eta_name"];
	_eta_name = format["%1eta", _queue_name];
	_eta = missionNamespace getVariable _eta_name;
	_eta =  _eta - ((_eta / A_main_var_maxfacworkers) * _workers_count);
	_eta = _eta max 0;
	missionNamespace setVariable [_eta_name, _eta];
};
