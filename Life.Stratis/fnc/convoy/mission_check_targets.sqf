// A_convoy_fnc_mission_check_targets

#include "..\..\includes\macro.h"
#include "..\..\includes\constants.h"

#define CONVOY_MSG_SPAWN 1
#define CONVOY_MSG_DRIVER_DEAD 2
#define CONVOY_MSG_DAMAGED 3
#define CONVOY_MSG_COMPLETE 4


ARGV(0,_truck);
ARGV(1,_group);

{
	_target = _x;
	if (([_target] call A_player_fnc_human) && !([_target] call A_player_fnc_blufor) && (alive _target)) then {
		private["_message"];
		_message = "The Government is operating in this area! Turn back or you will be shot!";
		format['if (player == %1) then { titleText [toString(%2), "PLAIN"];};', _target, toArray(_message)] call A_broadcast_fnc_broadcast;
		
		if ([_target] call A_player_fnc_armed) then {
			{
				_x doTarget _target;			
				_x doFire _target;
			} foreach (units _group);
		};
	};
} foreach (nearestObjects [getPos _truck, ["Man"], 150]);
