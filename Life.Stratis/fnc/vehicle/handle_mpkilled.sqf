// A_vehicle_fnc_handle_mpkilled

#include "../../includes/macro.h"

 _this spawn {
ARGV(0,_unit);
ARGV(1,_killer);
[_unit, 60] call A_vehicle_fnc_despawn;
};
