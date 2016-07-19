// A_interaction_fnc_disarm

#include "..\..\includes\macro.h"
#include "..\..\includes\constants.h"
#include "..\..\includes\dikcodes.h"


ARGV(0,_player);
ARGV(1,_target);

if (not([_player] call A_player_fnc_human)) exitWith {null};
if (not([_target] call A_player_fnc_human)) exitWith {null};

if (_player != player) exitWith {null};

private["_interaction"];
_interaction = "disarm";
if (not([_player, _target, _interaction] call A_interaction_fnc_check_distance)) exitWith {null};
if (not([_player, _target, _interaction] call A_interaction_fnc_check_armed)) exitWith {null};


if(not([_target] call A_player_fnc_vulnerable)) exitWith {
	player groupChat format["You cannot disarm %1-%2, he is not subdued", _target, (name _target)];
};

private["_weapons"];
_weapons = (weapons _target);
if (count _weapons == 0) exitWith {
	player groupChat format["%1-%2 is not armed!", _target, (name _target)];
};

private["_message"];
_message = format["%1-%2 disarmed %3-%4", _player, (name _player), _target, (name _target)];
[[_message, A_interaction_var_CHAT_GLOBAL, server], "A_interaction_fnc_chat", true] call BIS_fnc_MP;
[[_player,_target], "A_interaction_fnc_disarm_receive", _target] call BIS_fnc_MP;
