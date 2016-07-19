// A_convoy_fnc_mission_loop

#include "../../includes/macro.h"

#define Spawn_convoy 1
#define Driver_dead 2
#define Damaged_convoy 3
#define Cop_escort 4


format["A_convoy_fnc_mission_loop %1", _this] call A_convoy_fnc_debug;
while {not(convoy_complete)} do {
	 _this call A_convoy_fnc_mission_iteration;
	convoy_running_time = convoy_running_time + 1;
	sleep 1;
};

if (convoy_complete) exitWith {null};
_this spawn A_convoy_fnc_mission_loop;
