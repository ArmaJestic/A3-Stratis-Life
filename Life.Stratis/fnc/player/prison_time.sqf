// A_player_fnc_prison_time

#include "../../includes/macro.h"


ARGV(0,_player);
ARGV(1,_minutes);

if (undefined(_player)) exitWith {null};
if (_player != player) exitWith {null};

if (undefined(_minutes)) exitWith {null};
if (typeName _minutes != "SCALAR") exitWith {null};
if (_minutes <= 0) exitWith {null};

private["_seconds"];
_seconds = round(_minutes) * 60;
[_player, "jailtimeleft", _seconds] call A_player_fnc_set_scalar;
private["_message"];
_message = format["%1-%2 was sent to prison for %3 minutes", _player, (name _player), strM(round(_seconds/60))];
[[_message, A_interaction_var_CHAT_GLOBAL, server], "A_interaction_fnc_chat", true] call BIS_fnc_MP;
_seconds
