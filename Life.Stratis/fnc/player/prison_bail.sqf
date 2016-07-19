// A_player_fnc_prison_bail

#include "..\..\includes\macro.h"


ARGV(0,_player);
ARGV(1,_percent);

if (undefined(_player)) exitWith {null};
if (_player != player) exitWith {null};

if (undefined(_percent)) exitWith {null};
if (typeName _percent != "SCALAR") exitWith {null};
if (_percent <= 0) exitWith {null};

_percent = _percent / 100;

private["_bail", "_money"];
_money =  [_player] call A_money_fnc_get_total_money;
_bail = round(_percent * _money);
_bail = if (_bail <= 0) then { 100000 } else { _bail };
[_player, _bail] call A_player_fnc_set_bail;
private["_message"];
_message = format["%1-%2 has a bail set at $%3", _player, (name _player), strM(_bail)];
[[_message, A_interaction_var_CHAT_GLOBAL, server], "A_interaction_fnc_chat", true] call BIS_fnc_MP;

_bail
