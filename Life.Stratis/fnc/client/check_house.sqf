// A_client_fnc_check_house

#include "..\..\includes\macro.h"


private["_player"];
_player = player;

private["_house"];
_house = [_player] call A_doors_fnc_house_player_near;
if (undefined(_house) || {!(INV_shortcuts) || {!(alive _player)}}) exitWith {
	[_player] call A_doors_fnc_house_remove_actions;
};

[_player,_house] call A_doors_fnc_house_doors_disable;
[_player, _house] call A_doors_fnc_house_add_actions;
