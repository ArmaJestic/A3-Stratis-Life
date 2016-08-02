// A_convoy_fnc_mission_check_position

#include "..\..\includes\macro.h"
#include "..\..\includes\constants.h"

#define CONVOY_MSG_SPAWN 1
#define CONVOY_MSG_DRIVER_DEAD 2
#define CONVOY_MSG_DAMAGED 3
#define CONVOY_MSG_COMPLETE 4


//format["A_convoy_fnc_mission_check_position %1", _this] call A_convoy_fnc_debug;
ARGV(0,_truck);
ARGV(1,_group);
ARGV(2,_destination);
ARGV(3,_time);

private["_dst_pos", "_cur_pos"];
_dst_pos = getPos _destination;
_cur_pos = getPos _truck;

private["_prev_state", "_cur_state"];

_prev_state = [_truck] call A_convoy_fnc_get_state;
_cur_state = [_truck, _time] call A_convoy_fnc_get_current_state;

if (_prev_state == CONVOY_ST_UNKNOWN && _cur_state == CONVOY_ST_INITIAL) then {
	//send initial move command
	format["sending initial move command %1", _dst_pos] call A_convoy_fnc_debug;
	(driver _truck) commandMove _dst_pos;
	[_truck, "next_pos", _dst_pos] call A_object_fnc_setVariable;
}
else { if ( (_prev_state == CONVOY_ST_INITIAL && _cur_state == CONVOY_ST_STUCK) ||
			(_prev_state == CONVOY_ST_MOVING && _cur_state == CONVOY_ST_STUCK) ||
			(_prev_state == CONVOY_ST_STUCK && _cur_state == CONVOY_ST_STUCK && (_time % 20) == 0)) then {
	//calculate the halfway point between the current, and the next position
	private["_next_pos", "_half_pos"];
	_next_pos = [_truck, "next_pos"] call A_object_fnc_getVariable;
	_half_pos = [_cur_pos, _next_pos] call A_convoy_fnc_calculate_half_waypoint;
	format["sending half-way move command %1", _half_pos] call A_convoy_fnc_debug;
	[_truck, "next_pos", _half_pos, true] call A_object_fnc_setVariable;
	(driver _truck) commandMove _half_pos;
}
else { if ((_prev_state == CONVOY_ST_STUCK && _cur_state == CONVOY_ST_MOVING)) then {
	//reset the waypoint for the final destination
	format["sending reset move command %1", _dst_pos] call A_convoy_fnc_debug;
	[_truck, "next_pos", _dst_pos] call A_object_fnc_setVariable;
	(driver _truck) commandMove _dst_pos;
};};};

[_truck, _cur_state] call A_convoy_fnc_set_state;
