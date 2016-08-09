// A_client_fnc_check_factory_actions

#include "..\..\includes\macro.h"


//player groupChat format["A_client_fnc_check_factory_actions"];
private["_player"];
_player = player;
private["_vehicle", "_in_vehicle"];
_vehicle = (vehicle _player);
_in_vehicle = (_vehicle != _player);

private["_factory"];
_factory = [_player, 5] call A_factory_fnc_player_near;
//player groupChat format["_factory = %1",_factory];
if (undefined(_factory) || !(INV_shortcuts) || _in_vehicle || !(alive _player)) exitWith {
	[_player] call A_factory_fnc_remove_actions;
};

private["_factory_id"];
_factory_id = _factory select factory_id;

[_player, _factory_id] call A_factory_fnc_add_actions;
