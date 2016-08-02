// A_convoy_fnc_get_current_state

#include "..\..\includes\macro.h"
#include "..\..\includes\constants.h"

#define CONVOY_MSG_SPAWN 1
#define CONVOY_MSG_DRIVER_DEAD 2
#define CONVOY_MSG_DAMAGED 3
#define CONVOY_MSG_COMPLETE 4


ARGV(0,_truck);
ARGV(1,_time);

private["_cur_pos", "_las_pos"];
_cur_pos = getPos _truck;
_last_pos = [_truck, "last_pos"] call A_object_fnc_getVariable;
_last_pos = if (undefined(_last_pos)) then {_cur_pos} else {_last_pos};

private["_prev_state", "_cur_state"];
_prev_state = [_truck] call A_convoy_fnc_get_state;
_cur_state = if ((_cur_pos distance _last_pos) > 3 ) then {CONVOY_ST_MOVING} else {CONVOY_ST_STUCK};

if (_prev_state == CONVOY_ST_UNKNOWN) then {
	[_truck, "last_pos", _cur_pos] call A_object_fnc_setVariable;
	_cur_state = CONVOY_ST_INITIAL;
};

if ((_time % 20) == 0) then {
	[_truck, "last_pos", _cur_pos] call A_object_fnc_setVariable;
};

_cur_state
