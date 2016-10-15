// A_convoy_fnc_mission_check_state

#include "header.h"



ARGV(0,_truck);
ARGV(1,_group);


if (convoy_units_exited) exitWith {null};

if (!(alive driver(_truck))) then { 
	format['[CONVOY_DRIVER_DEAD] call A_convoy_fnc_side_msg;'] call A_broadcast_fnc_broadcast;
	[_truck, _group] call A_convoy_fnc_units_exit;
	convoy_units_exited = true;
}else{ if (!(canMove _truck)) then {
	format['[CONVOY_DAMAGED] call A_convoy_fnc_side_msg;'] call A_broadcast_fnc_broadcast;
	[_truck, _group] call A_convoy_fnc_units_exit;
	convoy_units_exited = true;				
};};
