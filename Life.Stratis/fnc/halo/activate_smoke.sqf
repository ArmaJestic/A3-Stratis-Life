// A_halo_fnc_activate_smoke

#include "..\..\includes\macro.h"


ARGV(0,_unit);
ARGV(1,_smoke_class);

[_unit] call A_halo_fnc_deactivate_smoke;

private ["_smoke_object"];
_smoke_object = createVehicle [_smoke_class, (getPosATL _unit), [], 0, "NONE"];

_smoke_object setPosATL (getPosATL _unit);
_smoke_object attachTo [_unit,[-0.22,-0.05,0.2]];
[_unit, "halo_smoke_object", _smoke_object] call A_object_fnc_setVariable;	



[_unit, _smoke_class] call A_halo_fnc_remove_smoke_action;
