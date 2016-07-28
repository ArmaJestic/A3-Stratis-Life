// A_client_fnc_check_gang_area_actions

#include "..\..\includes\macro.h"


private["_player"];
_player = player;
private["_vehicle", "_in_vehicle"];
_vehicle = (vehicle _player);
_in_vehicle = (_vehicle != _player);

private["_gang_area"];
_gang_area = [_player, 5] call A_gang_fnc_area_player_near;
if (undefined(_gang_area) || not(INV_shortcuts) || _in_vehicle || not(alive _player)) exitWith {
	[_player] call A_gang_fnc_area_remove_actions;
};

[_player, _gang_area] call A_gang_fnc_area_add_actions;
