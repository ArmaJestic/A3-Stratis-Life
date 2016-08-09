// A_client_fnc_check_towed

#include "..\..\includes\macro.h"


private["_player"];
_player = player;

private["_towed"];
_towed = [_player] call A_towing_fnc_towed_player_near;

if (undefined(_towed) || {!(INV_shortcuts) || {!(alive _player)}}) exitWith {
	[_player] call A_towing_fnc_towed_remove_actions;
};

[_player, _towed] call A_towing_fnc_towed_add_actions;
