// A_mounted_fnc_set_slot_occupant

#include "header.h"


//player groupChat format["_this = %1", _this];
ARGV(0,_vehicle);
ARGV(1,_slot_id);
ARGV(2,_occupant);

if (UNDEFINED(_slot_id)) exitWith {null};
if (typeName _slot_id != "STRING") exitWith {null};
if (UNDEFINED(_vehicle)) exitWith {null};

private["_occupant"];
//player groupChat format["typeName _occupant = %1", (typeName _occupant)];
if (typeName _occupant == "OBJECT") then {
	_occupant = if (isNull _occupant) then { nil } else { _occupant };
};

//player groupChat format["_vehicle = %1, _slot_id = %2, _occupant = %3", _vehicle, _slot_id, _occupant];
[_vehicle, _slot_id, _occupant, true] call A_object_fnc_setVariable;
