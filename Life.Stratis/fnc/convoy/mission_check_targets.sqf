// A_convoy_fnc_mission_check_targets

#include "..\..\includes\macro.h"

#define Spawn_convoy 1
#define Driver_dead 2
#define Damaged_convoy 3
#define Cop_escort 4


ARGV(0,_truck);
ARGV(1,_group);

{
	_target = _x;
	if (([_target] call A_player_fnc_human) && not([_target] call A_player_fnc_blufor) && (alive _target)) then {
		private["_message"];
		_message = "The Government is operating in this area! Turn back or you will be shot!";
		format['if (player == %1) then { titleText [toString(%2), "PLAIN"];};', _target, toArray(_message)] call broadcast;
		
		if ([_target] call A_player_fnc_armed) then {
			{
				_x doTarget _target;			
				_x doFire _target;
			} foreach (units _group);
		};
	};
} foreach (nearestObjects [getPos _truck, ["Man"], 150]);
