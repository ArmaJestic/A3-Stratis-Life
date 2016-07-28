// A_actions_fnc_remove_refuel_action

#include "..\..\includes\macro.h"


	private["_vehicle"];
	

	_vehicle = call A_actions_fnc_get_refuel_vehicle;
	if (undefined(_vehicle)) exitWith {null};
	_refuel_action = call A_actions_fnc_get_refuel_action;
	if (_refuel_action < 0) exitWith {null};
	
	_vehicle removeAction _refuel_action;
	[_vehicle, -1] call A_actions_fnc_set_refuel_action;
