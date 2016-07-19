// A_mounted_fnc_slot_open

#include "..\..\includes\macro.h"
#include "..\..\includes\dikcodes.h"


//player groupChat format["_this = %1", _this];
ARGV(0,_vehicle);
ARGV(1,_slot_id);

private["_slot_occupant", "_result"];
_slot_occupant = [_vehicle, _slot_id] call A_mounted_fnc_get_slot_occupant;
//player groupChat format["_slot_occupant = %1", _slot_occupant];
_result = (undefined(_slot_occupant));
_result
