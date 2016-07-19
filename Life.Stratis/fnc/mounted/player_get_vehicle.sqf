// A_mounted_fnc_player_get_vehicle

#include "../../includes/macro.h"
#include "../../includes/dikcodes.h"


ARGV(0,_player);

private["_vehicle"];
_vehicle = [_player, "mountedVehicle"] call A_object_fnc_getVariable;

if (typeName _vehicle == "OBJECT") then {
	_vehicle = if (isNull _vehicle) then { nil } else { _vehicle };
};
_vehicle
