// A_interaction_fnc_check_armed

#include "header.h"


ARGV(0,_player);
ARGV(1,_target);
ARGV(2,_interaction);

if (!([_player] call A_player_fnc_human)) exitWith {null};
if (!([_target] call A_player_fnc_human)) exitWith {null};
if (UNDEFINED(_interaction)) exitWith {null};
if (typeName _interaction != "STRING") exitWith {null};


if (!([player] call A_client_fnc_check_armed_player)) exitWith {
	player groupChat format["You cannot %1 %2-%3, you are not armed", _interaction, _target, (name _target)];
	false
};

true
