// A_convoy_fnc_calculate_half_waypoint

#include "header.h"


//format["A_convoy_fnc_calculate_half_waypoint %1", _this] call A_convoy_fnc_debug;
ARGV(0,_point_a);
ARGV(1,_point_b);

([((_point_b select 0)+(_point_a select 0))/ 2, ((_point_a select 1)+(_point_b select 1))/ 2, 0])
