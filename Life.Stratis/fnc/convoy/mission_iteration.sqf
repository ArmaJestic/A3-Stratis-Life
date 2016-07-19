// A_convoy_fnc_mission_iteration

#include "..\..\includes\macro.h"

#define Spawn_convoy 1
#define Driver_dead 2
#define Damaged_convoy 3
#define Cop_escort 4


//format["A_convoy_fnc_mission_iteration %1, %2", _this, convoy_running_time] call A_convoy_fnc_debug;
ARGV(0,_convoy_truck);
ARGV(1,_convoy_group);
ARGV(2,_convoy_marker);
ARGV(3,_destination);

[_convoy_truck, _convoy_group] call A_convoy_fnc_mission_check_targets;
[_convoy_truck, _convoy_group] call A_convoy_fnc_mission_check_state;
[_convoy_truck, _convoy_group] call A_convoy_fnc_mission_check_damage;

convoy_complete = [_convoy_truck, _convoy_group, convoy_running_time] call A_convoy_fnc_mission_check_complete;
if (convoy_complete) exitWith {null};

[_convoy_truck, _convoy_group, _destination, convoy_running_time] call A_convoy_fnc_mission_check_position;

//update the convoy marker position
_convoy_marker setMarkerPos (getPos _convoy_truck);
