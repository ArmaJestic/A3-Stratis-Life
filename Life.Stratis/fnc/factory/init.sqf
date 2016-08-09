// A_factory_fnc_init

#include "..\..\includes\macro.h"
#include "..\..\includes\constants.h"


//player groupChat format["A_factory_fnc_init %1", _this];
ARGV(0,_player);
ARGV(1,_factory_id);

if (!([_player] call A_player_fnc_human)) exitWith {null};
if (undefined(_factory_id)) exitWith {null};
if (typeName _factory_id != "STRING") exitWith {null};

private["_factory"];
_factory = [_factory_id] call A_factory_fnc_lookup_id;
if (undefined(_factory)) exitWith {null};

//initialize the factory queue
private["_queue_name"];
_queue_name = _factory select factory_queue;
[_queue_name, []] call A_stats_fnc_init_variable;


//initialize the factory items
private["_items"];
_items = _factory select factory_items;

private["_workers_name", "_workers"];
_workers_name = format["%1workers", _queue_name];
[_workers_name, 0] call A_stats_fnc_init_variable;

{
	private["_item", "_prod_name", "_eta_name", "_pend_name", "_avail_name"];
	_item = _x;
	_avail_name = format["%1avail", _item];
	_pend_name = format["%1pend", _item];
	_eta_name = format["%1eta", _item];
	_prod_name = format["%1prod", _item];
	
	[_avail_name, 0] call A_stats_fnc_init_variable;
	missionNamespace setVariable [_pend_name, 0];
	missionNamespace setVariable [_eta_name, 0];
	missionNamespace setVariable [_prod_name, 0];
} forEach _items;

private["_queue"];
_queue = missionNamespace getVariable [_queue_name, []];
{
	private["_item", "_pend_name"];
	_item = _x;
	_pend_name = format["%1pend", _item];
	_pend = missionNamespace getVariable [_pend_name, 0];
	_pend = _pend + 1;
	missionNamespace setVariable [_pend_name, _pend]; 
} forEach _queue;
