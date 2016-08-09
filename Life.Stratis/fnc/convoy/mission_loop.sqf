// A_convoy_fnc_mission_loop

#include "..\..\includes\macro.h"
#include "..\..\includes\constants.h"

#define CONVOY_MSG_SPAWN 1
#define CONVOY_MSG_DRIVER_DEAD 2
#define CONVOY_MSG_DAMAGED 3
#define CONVOY_MSG_COMPLETE 4


format["A_convoy_fnc_mission_loop %1", _this] call A_convoy_fnc_debug;
while {!(convoy_complete)} do {
	 _this call A_convoy_fnc_mission_iteration;
	convoy_running_time = convoy_running_time + 1;
	sleep 1;
};

if (convoy_complete) exitWith {null};
_this spawn A_convoy_fnc_mission_loop;
