// A_interaction_fnc_check_distance

#include "..\..\includes\macro.h"
#include "..\..\includes\constants.h"
#include "..\..\includes\dikcodes.h"


ARGV(0,_player);
ARGV(1,_target);
ARGV(2,_interaction);

if (not([_player] call A_player_fnc_human)) exitWith {null};
if (not([_target] call A_player_fnc_human)) exitWith {null};
if (undefined(_interaction)) exitWith {null};
if (typeName _interaction != "STRING") exitWith {null};

private["_distance"];
_distance = _player distance _target;

if ((_distance > 5)) exitWIth {
	player groupChat format["You cannot %1 %2-%3, you are too far", _interaction, _target, (name _target)];
	false
};

if (not(alive _target)) exitWith {
	player groupChat format["You cannot %1 %2-%3, he is dead", _interaction, _target, (name _target)];
	false
};

true	
