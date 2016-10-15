// A_interaction_fnc_disarm

#include "header.h"


params["_player","_target"];

if (!([_player] call A_player_fnc_human)) exitWith {};
if (!([_target] call A_player_fnc_human)) exitWith {};

if (_player != player) exitWith {};

private _interaction = "disarm";
if (!([_player, _target, _interaction] call A_interaction_fnc_check_distance)) exitWith {};
if (!([_player, _target, _interaction] call A_interaction_fnc_check_armed)) exitWith {};


if(!([_target] call A_player_fnc_vulnerable)) exitWith {
	player groupChat format["You cannot disarm %1-%2, he is not subdued", _target, (name _target)];
};

private _weapons = (weapons _target);
if (count _weapons == 0) exitWith {
	player groupChat format["%1-%2 is not armed!", _target, (name _target)];
};

private _message = format["%1-%2 disarmed %3-%4", _player, (name _player), _target, (name _target)];

[_message, INTERACT_INDEX_CHAT_GLOBAL, server] remoteExecCall ["A_interaction_fnc_chat",-2];
[_player,_target] remoteExecCall ["A_interaction_fnc_disarm_receive", _target];