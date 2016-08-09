// A_client_fnc_check_vehicle_outside_actions

#include "..\..\includes\macro.h"


//player groupChat format["A_client_fnc_check_vehicle_outside_actions"];
private["_player"];
_player = player;
private["_vehicle", "_in_vehicle"];
_vehicle = (vehicle _player);
_in_vehicle = (_vehicle != _player);

private["_vehicle"];
_target_vehicle = [_player, 3.5] call A_vehicle_fnc_outside_player_near;
//player groupChat format["_target_vehicle = %1",_target_vehicle];
if (undefined(_target_vehicle) || !(INV_shortcuts) || _in_vehicle || !(alive _player)) exitWith {
	[_player] call A_vehicle_fnc_outside_remove_actions;
};

[_player, _target_vehicle] call A_vehicle_fnc_outside_add_actions;
