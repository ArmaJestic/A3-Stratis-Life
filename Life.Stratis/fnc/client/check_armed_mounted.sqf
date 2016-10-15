// A_client_fnc_check_armed_mounted

#include "..\..\includes\macro.h"


ARGV(0,_vehicle);

//check if the vehicle has a mounted player with a weapon
private["_occupants"];
_occupants = [_vehicle] call A_mounted_fnc_get_occupants;
//player groupChat format["_occupants = %1", _occupants];
private["_armed_occupant"];
_armed_occupant = null;

{
	private["_occupant"];
	_occupant = _x;
	if (([_occupant] call A_client_fnc_check_armed_player)) exitWith {
		_armed_occupant = _occupant;
	};
} forEach _occupants;

!(UNDEFINED(_armed_occupant))
