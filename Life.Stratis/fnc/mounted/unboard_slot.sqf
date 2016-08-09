// A_mounted_fnc_unboard_slot

#include "..\..\includes\macro.h"
#include "..\..\includes\dikcodes.h"


ARGV(0,_player);
ARGV(1,_vehicle);
ARGV(2,_slot_id);

private["_unlocked"];
_unlocked = [_vehicle] call A_mounted_fnc_vehicle_unlocked;

if (!(_unlocked)) exitWith {
	player groupChat format["This vehicle is locked"];
};

[_player, "inMountedSlot", false, true] call A_object_fnc_setVariable;
[_player, "mountedVehicle", nil, true] call A_object_fnc_setVariable;
