// A_doors_fnc_house_owner_disconnect

#include "header.h"

 
params["_object","_player_name"];

if (UNDEFINED(_object)) exitWith {};
if (UNDEFINED(_player_name)) exitWith {};

private _timeout = 120;
sleep _timeout;
_object setVariable["owner_uid", nil, true];

private _message = format["%1's house is now for sale", _player_name];

[_message, INTERACT_INDEX_CHAT_GLOBAL, server] remoteExecCall ["A_interaction_fnc_chat",-2];