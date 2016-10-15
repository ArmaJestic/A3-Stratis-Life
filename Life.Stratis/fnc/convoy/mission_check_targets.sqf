// A_convoy_fnc_mission_check_targets

#include "header.h"


params["_truck","_group"];

{
	_target = _x;
	if (([_target] call A_player_fnc_human) && !([_target] call A_player_fnc_blufor) && (alive _target)) then {
		private["_message"];
		_message = "The Government is operating in this area! Turn back or you will be shot!";
		format['if (player == %1) then {cutText[toString(%2),"PLAIN"];};', _target, toArray(_message)] call A_broadcast_fnc_broadcast;
		
		if ([_target] call A_player_fnc_armed) then {
			{
				_x doTarget _target;			
				_x doFire _target;
			} foreach (units _group);
		};
	};
} foreach (nearestObjects [getPos _truck, ["Man"], 150]);