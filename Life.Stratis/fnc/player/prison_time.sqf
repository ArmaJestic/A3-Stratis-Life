// A_player_fnc_prison_time

#include "header.h"


params["_player",["_minutes",-1,[0]]];

if (UNDEFINED(_player)) exitWith {null};
if (_player != player) exitWith {null};
if (_minutes <= 0) exitWith {null};

private _seconds = round(_minutes) * 60;
[_player, "jailtimeleft", _seconds] call A_player_fnc_set_scalar;

private _message = format["%1-%2 was sent to prison for %3 minutes", _player, (name _player), strM(round(_seconds/60))];
[_message, INTERACT_INDEX_CHAT_GLOBAL, server] remoteExecCall ["A_interaction_fnc_chat",-2];

_seconds