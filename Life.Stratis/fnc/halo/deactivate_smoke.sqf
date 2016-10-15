// A_halo_fnc_deactivate_smoke

#include "..\..\includes\macro.h"


ARGV(0,_unit);
_old_smoke_object = [_unit, "halo_smoke_object"] call A_object_fnc_getVariable;
//player groupChat format["Removing old smoke object %1", _old_smoke_object];
if (!UNDEFINED(_old_smoke_object)) then {
	deleteVehicle _old_smoke_object;
};