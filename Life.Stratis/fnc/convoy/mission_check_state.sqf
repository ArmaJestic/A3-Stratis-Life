// A_convoy_fnc_mission_check_state

#include "..\..\includes\macro.h"
#include "..\..\includes\constants.h"

#define CONVOY_MSG_SPAWN 1
#define CONVOY_MSG_DRIVER_DEAD 2
#define CONVOY_MSG_DAMAGED 3
#define CONVOY_MSG_COMPLETE 4


ARGV(0,_truck);
ARGV(1,_group);


if (convoy_units_exited) exitWith {null};

if (not(alive driver(_truck))) then { 
	format['[CONVOY_MSG_DRIVER_DEAD] call A_convoy_fnc_side_msg;'] call A_broadcast_fnc_broadcast;
	[_truck, _group] call A_convoy_fnc_units_exit;
	convoy_units_exited = true;
}
else { if (not(canMove _truck)) then {
	format['[CONVOY_MSG_DAMAGED] call A_convoy_fnc_side_msg;'] call A_broadcast_fnc_broadcast;
	[_truck, _group] call A_convoy_fnc_units_exit;
	convoy_units_exited = true;				
};};
