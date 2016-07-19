// A_player_fnc_spawn

#include "../../includes/macro.h"

 _this spawn {
ARGV(0,_player);
ARGV(1,_first_time);

if (not([_player] call A_player_fnc_exists)) exitWith {null};
if (undefined(_first_time)) exitWith {null};
if (typeName _first_time != "BOOL") exitWith {null};

waitUntil { alive _player };

[_player] call A_object_fnc_attachStorage;
server setVariable [(getPlayerUID _player), _player, true];

if (not(_first_time)) then {
	[_player] call A_player_fnc_reset_gear; //start from clean slate
	[_player] call A_player_fnc_reset_clothes;
	[_player] call A_player_fnc_load_side_gear;
	
	//only cops get to keep their full gear
	if (not([_player] call A_player_fnc_blufor)) then {
		[_player] call A_player_fnc_reset_gear;
	};
};

if (_first_time) then {
	[_player] call A_player_fnc_intro_text;
};


[_player] call A_player_fnc_reset_prison;
//call respawn_retribution;
[_player] call A_player_fnc_init_stats;

//mark the player alive when we are done with the dead camera
[_player, false] call A_player_fnc_set_dead;
};
