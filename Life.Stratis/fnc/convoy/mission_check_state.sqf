// A_convoy_fnc_mission_check_state

#include "..\..\includes\macro.h"

#define Spawn_convoy 1
#define Driver_dead 2
#define Damaged_convoy 3
#define Cop_escort 4


ARGV(0,_truck);
ARGV(1,_group);


if (convoy_units_exited) exitWith {null};

if (not(alive driver(_truck))) then { 
	format['[Driver_dead] call A_convoy_fnc_side_msg;'] call A_broadcast_fnc_broadcast;
	[_truck, _group] call A_convoy_fnc_units_exit;
	convoy_units_exited = true;
}
else { if (not(canMove _truck)) then {
	format['[Damaged_convoy] call A_convoy_fnc_side_msg;'] call A_broadcast_fnc_broadcast;
	[_truck, _group] call A_convoy_fnc_units_exit;
	convoy_units_exited = true;				
};};
