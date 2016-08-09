// A_interaction_fnc_human

#include "..\..\includes\macro.h"
#include "..\..\includes\constants.h"
#include "..\..\includes\dikcodes.h"


ARGV(0,_player);
ARGV(1,_target);

if (!([_player] call A_player_fnc_human)) exitWith {false};
if (!([_target] call A_player_fnc_human)) exitWith {false};

if (([_player] call A_player_fnc_blufor) && (!([_target] call A_player_fnc_blufor) || ([_player] call A_player_fnc_chief))) exitWith {
	[_player, _target] call A_interaction_fnc_police_menu;
	true;
};

if (([_player] call A_player_fnc_civilian) || ([_player] call A_player_fnc_opfor)  || ([_player] call A_player_fnc_independent)) exitWith {
	[_player, _target] call A_interaction_fnc_civilian_menu;
	true
};
false
