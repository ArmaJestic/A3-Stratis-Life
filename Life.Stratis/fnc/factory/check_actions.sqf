// A_factory_fnc_check_actions

#include "header.h"


private _player = player;
private _vehicle = (vehicle _player);
private _in_vehicle = (_vehicle != _player);

private _factory = [_player, 5] call A_factory_fnc_player_near;
if (UNDEFINED(_factory) || {!A_inv_var_shortcuts} || {_in_vehicle} || {!(alive _player)}) exitWith {
	[_player] call A_factory_fnc_remove_actions;
};

private _factory_id = _factory select INDEX_ID;

[_player, _factory_id] call A_factory_fnc_add_actions;