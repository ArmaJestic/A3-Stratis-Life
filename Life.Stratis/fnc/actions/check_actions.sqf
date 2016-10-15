// A_actions_fnc_check_actions

#include "..\..\includes\macro.h"


private _vehicle  = vehicle player;
private _station = [16] call A_actions_fnc_get_nearest_station;
private _isDriver = (_vehicle != player) && ((driver _vehicle) == player);
private _isNearStation = (_isDriver && DEFINED(_station));
private _refuel_action = call A_actions_fnc_get_refuel_action;

if (_isNearStation && _refuel_action < 0 ) then {
	call A_actions_fnc_add_refuel_action;
}else{ 
	if (!_isNearStation && (_refuel_action >= 0)) then {
		call A_actions_fnc_remove_refuel_action;
	};
};