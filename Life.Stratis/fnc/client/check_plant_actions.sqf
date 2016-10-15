// A_client_fnc_check_plant_actions

#include "..\..\includes\macro.h"


//player groupChat format["A_client_fnc_check_plant_actions"];
private["_player"];
_player = player;
private["_vehicle", "_in_vehicle"];
_vehicle = (vehicle _player);
_in_vehicle = (_vehicle != _player);

private["_plant_netid"];
_plant_netid = [_player, 5] call A_plant_fnc_player_near;
if (UNDEFINED(_plant_netid) || !(A_inv_var_shortcuts) || _in_vehicle || !(alive _player)) exitWith {
	[_player] call A_plant_fnc_remove_actions;
};
[_player, _plant_netid] call A_plant_fnc_add_actions;
