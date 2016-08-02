// A_factory_fnc_add_actions

#include "..\..\includes\macro.h"
#include "..\..\includes\constants.h"


if (count A_factory_var_actions > 0) exitWith {null};
ARGV(0,_player);
ARGV(1,_factory_id);

if (not([_player] call A_player_fnc_human)) exitWith {null};
if (undefined(_factory_id)) exitWith {null};
if (typeName _factory_id != "STRING") exitWith {null};

private["_factory"];
_factory = [_factory_id] call A_factory_fnc_lookup_id;
if (undefined(_factory_id)) exitWith {null};

private["_factory_id", "_factory_cost", "_factory_storage", "_factory_name"];
_factory_name = _factory select factory_name;
_factory_cost = _factory select factory_cost;
_factory_storage = _factory select factory_storage;

if (_factory_id  in INV_FabrikOwner) then {
	private["_action_id"];
	_action_id = player addaction ["Storage", A_other_fnc_noscript, format['[%1, "%2"] call A_storage_menu_fnc_menu_factory_storage;', _player, _factory_storage]];
	A_factory_var_actions = A_factory_var_actions + [_action_id];
	
	_action_id = player addaction ["Manufacture", A_other_fnc_noscript, format['[%1, "%2"] call A_factory_fnc_production_menu;', _player, _factory_id]];
	A_factory_var_actions = A_factory_var_actions + [_action_id];
	
	_action_id = player addaction [format["Hire one worker ($%1)", strM(A_main_var_A_main_var_facworkercost)], A_other_fnc_noscript, format['[%1, "%2", %3, %4] call A_factory_fnc_hire_workers;', _player, _factory_id, 1, A_main_var_A_main_var_facworkercost]];
	A_factory_var_actions = A_factory_var_actions + [_action_id];
	
	_action_id = player addaction [format["Hire ten workers ($%1)", strM(10*A_main_var_A_main_var_facworkercost)], A_other_fnc_noscript, format['[%1, "%2", %3, %4] call A_factory_fnc_hire_workers;', _player, _factory_id, 10, A_main_var_A_main_var_facworkercost]];
	A_factory_var_actions = A_factory_var_actions + [_action_id];
}
else {
	private["_action_id"];
	_action_id = player addaction [format["Buy %1 ($%2)", _factory_name, strM(_factory_cost)], A_other_fnc_noscript, format['[%1, "%2"] call A_factory_fnc_buy;', _player, _factory_id]];
	A_factory_var_actions = A_factory_var_actions + [_action_id];
};
