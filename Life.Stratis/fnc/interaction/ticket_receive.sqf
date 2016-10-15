// A_interaction_fnc_ticket_receive

#include "header.h"


params["_player","_target","_amount"];

if (!([_player] call A_player_fnc_human)) exitWith {};
if (!([_target] call A_player_fnc_human)) exitWith {};
if (_amount <= 0) exitWith {};

if (_target != player) exitWith {};

_amount = round(_amount);

ticket_menu_response = false;

private _message = format["%1-%2 gave you a ticket for $%3. Do you agree to pay?", _player, (name _player), strM(_amount)];
[toUpper("Ticket Confirmation"), "Yes", "No", _message, 0.14, 0.14, 0.40, 0.20] call A_yes_no_menu_fnc_setup;
buttonSetAction[yes_no_menu_yes_button_idc, "ticket_menu_response = true; closeDialog 0;"];
buttonSetAction[yes_no_menu_no_button_idc, "ticket_menu_response = false; closeDialog 0;"];

[[_player,_target,_amount],{!(ctrlVisible yes_no_menu_yes_button_idc)},A_interaction_fnc_ticket_receive2] call A_frame_fnc_waitUntil;