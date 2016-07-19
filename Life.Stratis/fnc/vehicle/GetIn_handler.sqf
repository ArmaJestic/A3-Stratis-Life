// A_vehicle_fnc_GetIn_handler

#include "../../includes/macro.h"


ARGV(0,_vehicle);
ARGV(1,_position);
ARGV(2,_player);

if (_player != player) exitWith {null};

if (_position == "driver") then {
	[_player] call A_player_fnc_save_side_vehicle;
	private["_entred_driver_uid"];
	_entred_driver_uid = ([_player] call A_stats_fnc_get_uid);
	[_vehicle, "active_driver_uid", _entred_driver_uid, true] call A_object_fnc_setVariable;
	
	private["_saved_driver_uid"];
	_saved_driver_uid = [_vehicle, "saved_driver_uid"] call A_vehicle_fnc_get_string;
	
	if (_saved_driver_uid == _entred_driver_uid) then {
		[_vehicle, "saved_driver_uid", ""] call A_vehicle_fnc_set_string;
		[_vehicle] call A_vehicle_fnc_stop_track;
	}
	else {
		[_vehicle] call A_vehicle_fnc_track;
	};
	
	
};
