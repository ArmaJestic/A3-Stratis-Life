// A_convoy_fnc_calculate_half_waypoint

#include "..\..\includes\macro.h"
#include "..\..\includes\constants.h"

#define CONVOY_MSG_SPAWN 1
#define CONVOY_MSG_DRIVER_DEAD 2
#define CONVOY_MSG_DAMAGED 3
#define CONVOY_MSG_COMPLETE 4


//format["A_convoy_fnc_calculate_half_waypoint %1", _this] call A_convoy_fnc_debug;
ARGV(0,_point_a);
ARGV(1,_point_b);

([((_point_b select 0)+(_point_a select 0))/ 2, ((_point_a select 1)+(_point_b select 1))/ 2, 0])
