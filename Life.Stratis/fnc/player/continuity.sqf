// A_player_fnc_continuity

#include "../../includes/macro.h"

 
if (not(isClient)) exitWith {null};

while {true} do {
	private["_complete"];
	_complete = ([player] call A_player_fnc_human);
	if (_complete) exitWith {null};
};

private["_player"];
_player = player;
[_player] call A_vehicle_fnc_load;
[_player] call A_player_fnc_reset_clothes;
[_player] call A_player_fnc_reset_gear;

server setVariable [(getPlayerUID _player), _player, true];

if ([_player] call A_player_fnc_get_dead) then {
	[] call A_player_fnc_rejoin_suicide;
}
else {
	_player allowDamage false;
	[_player] call A_player_fnc_load_side_gear;
	[_player] call A_player_fnc_load_side_damage;
	
	if (not([_player] call A_player_fnc_load_side_vehicle)) then {
		if (not([_player] call A_player_fnc_load_side_position)) then {
			[10] spawn A_player_fnc_rejoin_choice;
		};
	};
	_player allowDamage true;
};

titleText ["", "BLACK IN", 5];
5 fadeSound 1;
[_player, false] call A_player_fnc_set_dead;
