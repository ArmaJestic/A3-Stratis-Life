// A_actions_fnc_check_actions

#include "..\..\includes\macro.h"


private["_vehicle", "_station", "_refuel_action"];

_vehicle  = vehicle player;
_station = [16] call A_actions_fnc_get_nearest_station;
_isDriver = (_vehicle != player) && ((driver _vehicle) == player);
_isNearStation = (_isDriver && defined(_station));

_refuel_action = call A_actions_fnc_get_refuel_action;

if (_isNearStation && _refuel_action < 0 ) then {
	call A_actions_fnc_add_refuel_action;
} 
else { if (!(_isNearStation) && _refuel_action >= 0) then {
	call A_actions_fnc_remove_refuel_action;
};};
