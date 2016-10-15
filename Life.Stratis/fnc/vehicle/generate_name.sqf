// A_vehicle_fnc_generate_name

#include "header.h"


private _restart_count = server getVariable ["restart_count",0];
_vehicle_name = format["vehicle_%1_%2_%3", player, _restart_count, round(time)];
_vehicle_name