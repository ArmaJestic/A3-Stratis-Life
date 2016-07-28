// A_halo_fnc_deactivate_smoke

#include "..\..\includes\macro.h"


ARGV(0,_unit);
_old_smoke_object = [_unit, "halo_smoke_object"] call A_object_fnc_getVariable;
//player groupChat format["Removing old A_other_fnc_smoke object %1", _old_A_other_fnc_smoke_object];
if (!undefined(_old_smoke_object)) then {
	deleteVehicle _old_smoke_object;
};
