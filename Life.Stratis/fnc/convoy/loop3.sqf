// A_convoy_fnc_loop3

#include "header.h"


//Gets position to spawn
private _spawn = call A_convoy_fnc_get_spawn;
private _location = getPosATL _spawn;

private _convoy_truck = [_location] call A_convoy_fnc_create_truck;
private _convoy_marker = [_location] call A_convoy_fnc_create_marker;
private _convoy_group = [_convoy_truck, _location] call A_convoy_fnc_create_units;

[CONVOY_SPAWN] remoteExecCall ["A_convoy_fnc_side_msg",-2];

//init convoy globals
convoy_complete = false;
convoy_cash = true;
convoy_complete_side = sideUnknown;
convoy_running_time = 0;
convoy_units_exited = false;

publicVariable "convoy_cash";

//start the convoy A_other_fnc_loop, and wait for it to complete
[_convoy_truck, _convoy_group, _convoy_marker, copbase1] spawn A_convoy_fnc_mission_loop;