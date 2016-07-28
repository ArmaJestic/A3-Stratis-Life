// A_client_fnc_check_towing

#include "..\..\includes\macro.h"


private["_player"];
_player = player;

private["_towing"];
_towing = [_player] call A_towing_fnc_player_near;

if (undefined(_towing) || {not(INV_shortcuts) || {not(alive _player)}}) exitWith {
	[_player] call A_towing_fnc_remove_actions;
};

[_player, _towing] call A_towing_fnc_add_actions;
