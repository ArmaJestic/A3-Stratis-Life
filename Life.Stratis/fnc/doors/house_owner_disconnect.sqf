// A_doors_fnc_house_owner_disconnect

#include "..\..\includes\constants.h"
#include "..\..\includes\macro.h"
#include "..\..\includes\dikcodes.h"

 _this spawn {
ARGV(0,_object);
ARGV(1,_player_name);
if (undefined(_object)) exitWith {};
if (undefined(_player_name)) exitWith {};

private["_timeout"];
_timeout = 120;
sleep _timeout;
_object setVariable ["owner_uid", nil, true];
private["_message"];
_message = format["%1's house is now for sale", _player_name];
[[_message, A_interaction_var_CHAT_GLOBAL, server], "A_interaction_fnc_chat", true] call BIS_fnc_MP;
};
