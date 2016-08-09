// A_client_fnc_check_actions

#include "..\..\includes\macro.h"


private["_vehicle"];
_vehicle = (vehicle player);
_in_vehicle = (_vehicle != player);
if (!(_in_vehicle)) exitWith {null};
	
