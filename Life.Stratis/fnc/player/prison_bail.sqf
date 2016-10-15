// A_player_fnc_prison_bail

#include "header.h"


params["_player",["_percent",-1,[0]]];

if (UNDEFINED(_player)) exitWith {null};
if (_player != player) exitWith {null};
if (_percent <= 0) exitWith {null};

_percent = _percent / 100;

private _money =  [_player] call A_money_fnc_get_total_money;
private _bail = round(_percent * _money);
_bail = [_bail,100000] select (_bail <= 0);
[_player, _bail] call A_player_fnc_set_bail;

private _message = format["%1-%2 has a bail set at $%3", _player, (name _player), strM(_bail)];
[_message, INTERACT_INDEX_CHAT_GLOBAL, server] remoteExecCall ["A_interaction_fnc_chat",-2];

_bail