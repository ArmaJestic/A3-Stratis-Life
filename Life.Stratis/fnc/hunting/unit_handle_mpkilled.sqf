// A_hunting_fnc_unit_handle_mpkilled

#include "../../includes/macro.h"

 _this spawn {
//player groupChat format["A_hunting_fnc_unit_handle_mpkilled %1", _this];
if (not(isServer)) exitWith {null};
ARGV(0,_unit);
ARGV(1,_killer);

[_unit, 60] spawn A_hunting_fnc_unit_despawn;
};
