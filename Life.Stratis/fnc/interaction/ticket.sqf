// A_interaction_fnc_ticket

#include "header.h"


params["_player","_target","_amount"];

if (!([_player] call A_player_fnc_human)) exitWith {};
if (!([_target] call A_player_fnc_human)) exitWith {};
if (_amount <= 0) exitWith {};
if (_player != player) exitWith {};

_amount = round(_amount);

private _interaction = "ticket";
if (!([_player, _target, _interaction] call A_interaction_fnc_check_distance)) exitWith {};
if (!([_player, _target, _interaction] call A_interaction_fnc_check_armed)) exitWith {};

private _message = format["%1-%2 gave a %3-%4 a ticket of $%5", _player, (name _player), _target, (name _target), strM(_amount)];
[[_message, INTERACT_INDEX_CHAT_GLOBAL, server], "A_interaction_fnc_chat", true] call BIS_fnc_MP;

[_player,_target,_amount] remoteExecCall ["A_interaction_fnc_ticket_receive", _target];