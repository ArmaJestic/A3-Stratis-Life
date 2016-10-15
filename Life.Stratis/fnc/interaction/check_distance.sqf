// A_interaction_fnc_check_distance

#include "header.h"


ARGV(0,_player);
ARGV(1,_target);
ARGV(2,_interaction);

if (!([_player] call A_player_fnc_human)) exitWith {null};
if (!([_target] call A_player_fnc_human)) exitWith {null};
if (UNDEFINED(_interaction)) exitWith {null};
if (typeName _interaction != "STRING") exitWith {null};

private["_distance"];
_distance = _player distance _target;

if ((_distance > 5)) exitWIth {
	player groupChat format["You cannot %1 %2-%3, you are too far", _interaction, _target, (name _target)];
	false
};

if (!(alive _target)) exitWith {
	player groupChat format["You cannot %1 %2-%3, he is dead", _interaction, _target, (name _target)];
	false
};

true	
