// A_convoy_fnc_mission_iteration

#include "header.h"


params["_convoy_truck","_convoy_group","_convoy_marker","_destination"];

[_convoy_truck, _convoy_group] call A_convoy_fnc_mission_check_targets;
[_convoy_truck, _convoy_group] call A_convoy_fnc_mission_check_state;
[_convoy_truck, _convoy_group] call A_convoy_fnc_mission_check_damage;

convoy_complete = [_convoy_truck, _convoy_group, convoy_running_time] call A_convoy_fnc_mission_check_complete;
if (!convoy_complete) then {
	[_convoy_truck, _convoy_group, _destination, convoy_running_time] call A_convoy_fnc_mission_check_position;
	
	//update the convoy marker position
	_convoy_marker setMarkerPos (getPos _convoy_truck);
};