// A_interaction_fnc_ticket_receive2
// 2nd part of A_interaction_fnc_ticket_receive after waitUntil

#include "header.h"


params["_player","_target","_amount"];

if (!ticket_menu_response) exitWith {
	private _message = format["%1-%2 did not agree to pay %3-%4's ticket of $%5", _target, (name _target), _player, (name _player), strM(_amount)];
	[_message, INTERACT_INDEX_CHAT_GLOBAL, server] remoteExecCall ["A_interaction_fnc_chat",-2];
};

private _player_money = [_target] call A_money_fnc_get_total_money;
	
if (_amount > _player_money ) exitWith {
	private _message = format["%1-%2 did not have enough money to pay %3-%4's ticket of $%5", _target, (name _target), _player, (name _player), strM(_amount)];
	[_message, INTERACT_INDEX_CHAT_GLOBAL, server] remoteExecCall ["A_interaction_fnc_chat",-2];
};

[_target, _amount] call A_money_fnc_lose_money;
[_player,_target,_amount] call remoteExecCall ["A_interaction_fnc_ticket_distribute",-2];