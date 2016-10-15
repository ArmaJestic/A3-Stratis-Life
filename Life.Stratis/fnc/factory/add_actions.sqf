// A_factory_fnc_add_actions

#include "header.h"


if (count A_factory_var_actions > 0) exitWith {null};
params["_player",["_factory_id",null,[""]]];

if (!([_player] call A_player_fnc_human)) exitWith {null};
if (UNDEFINED(_factory_id)) exitWith {null};

private _factory = [_factory_id] call A_factory_fnc_lookup_id;
if (UNDEFINED(_factory_id)) exitWith {null};

private _factory_name = _factory select INDEX_NAME;
private _factory_cost = _factory select INDEX_COST;
private _factory_storage = _factory select INDEX_STORAGE;

if (_factory_id  in INV_FabrikOwner) then {
	{
		A_factory_var_actions pushBack (player addaction _x);
	}forEach [
		["Storage", A_actions_fnc_noscript, format['[%1, "%2"] call A_storage_menu_fnc_menu_factory_storage;', _player, _factory_storage]],
		["Manufacture", A_actions_fnc_noscript, format['[%1, "%2"] call A_factory_fnc_production_menu;', _player, _factory_id]],
		[format["Hire one worker ($%1)", strM(A_main_var_facworkercost)], A_actions_fnc_noscript, format['[%1, "%2", %3, %4] call A_factory_fnc_hire_workers;', _player, _factory_id, 1, A_main_var_facworkercost]],
		[format["Hire ten workers ($%1)", strM(10*A_main_var_facworkercost)], A_actions_fnc_noscript, format['[%1, "%2", %3, %4] call A_factory_fnc_hire_workers;', _player, _factory_id, 10, A_main_var_facworkercost]]
	];
}else{
	A_factory_var_actions pushBack (player addaction [format["Buy %1 ($%2)", _factory_name, strM(_factory_cost)], A_actions_fnc_noscript, format['[%1, "%2"] call A_factory_fnc_buy;', _player, _factory_id]]);
};