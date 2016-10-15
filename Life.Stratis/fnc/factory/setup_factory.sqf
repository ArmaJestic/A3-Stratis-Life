// A_factory_fnc_setup_factory

#include "header.h"


params["_player",["_factory_id",null,[""]]];

if (UNDEFINED(_factory_id)) exitWith {};
if !([_player] call A_player_fnc_human) exitWith {};

private _factory = [_factory_id] call A_factory_fnc_lookup_id;
if (UNDEFINED(_factory)) exitWith {};

//initialize the factory queue
private _queue_name = _factory select INDEX_QUEUE;
[_queue_name, []] call A_stats_fnc_init_variable;

//initialize the factory items
private _items = _factory select INDEX_ITEMS;

private _workers_name = format["%1workers", _queue_name];
[_workers_name, 0] call A_stats_fnc_init_variable;

{
	private _item = _x;
	private _avail_name = format["%1avail", _item];
	private _pend_name = format["%1pend", _item];
	private _eta_name = format["%1eta", _item];
	private _prod_name = format["%1prod", _item];
	
	[_avail_name, 0] call A_stats_fnc_init_variable;
	missionNamespace setVariable[_pend_name, 0];
	missionNamespace setVariable[_eta_name, 0];
	missionNamespace setVariable[_prod_name, 0];
} forEach _items;

private _queue = missionNamespace getVariable[_queue_name,[]];
{
	private _item = _x;
	private _pend_name = format["%1pend", _item];
	
	private _pend = missionNamespace getVariable[_pend_name,0];
	missionNamespace setVariable[_pend_name, (_pend+1)]; 
} forEach _queue;

// unfuck the factory scripts before doing these loops
//[_factory_id] call A_factory_fnc_loop;