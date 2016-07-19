// A_interaction_fnc_ticket_receive

#include "..\..\includes\macro.h"
#include "..\..\includes\constants.h"
#include "..\..\includes\dikcodes.h"

 _this spawn {
ARGV(0,_player);
ARGV(1,_target);
ARGV(2,_amount);

if (not([_player] call A_player_fnc_human)) exitWith {null};
if (not([_target] call A_player_fnc_human)) exitWith {null};
if (_amount <= 0) exitWith {null};

if (_target != player) exitWith {null};

_amount = round(_amount);

ticket_menu_response = false;
private["_message"];
_message = format["%1-%2 gave you a ticket for $%3. Do you agree to pay?", _player, (name _player), strM(_amount)];
[toUpper("Ticket Confirmation"), "Yes", "No", _message, 0.14, 0.14, 0.40, 0.20] call A_yes_no_menu_fnc_setup;
buttonSetAction [yes_no_menu_yes_button_idc, "ticket_menu_response = true; closeDialog 0;"];
buttonSetAction [yes_no_menu_no_button_idc, "ticket_menu_response = false; closeDialog 0;"];
waitUntil{(not(ctrlVisible yes_no_menu_yes_button_idc))};

if (not(ticket_menu_response)) exitWith {
	private["_message"];
	_message = format["%1-%2 did not agree to pay %3-%4's ticket of $%5", _target, (name _target), _player, (name _player), strM(_amount)];
	[[_message, A_interaction_var_CHAT_GLOBAL, server], "A_interaction_fnc_chat", true] call BIS_fnc_MP;
};

private ["_player_money"];
_player_money = [_target] call A_money_fnc_get_total_money;
	
if (_amount > _player_money ) exitWith {
	private["_message"];
	_message = format["%1-%2 did not have enough money to pay %3-%4's ticket of $%5", _target, (name _target), _player, (name _player), strM(_amount)];
	[[_message, A_interaction_var_CHAT_GLOBAL, server], "A_interaction_fnc_chat", true] call BIS_fnc_MP;
};

[_target, _amount] call A_money_fnc_lose_money;
[[_player,_target,_amount], "A_interaction_fnc_ticket_distribute", true] call BIS_fnc_MP;
};
