// A_player_fnc_load_side_vehicle

#include "..\..\includes\macro.h"


//player groupChat format["A_player_fnc_load_side_vehicle %1", _this];
ARGV(0,_player);
if (not([_player] call A_player_fnc_exists)) exitWith {false};

private["_side"];
_side = ([_player] call A_player_fnc_side);
_side = toLower(str(_side));

private["_vehicle_name"];
_vehicle_name = [_player, format["vehicle_driven_name_%1", _side]] call A_player_fnc_get_string;
if (_vehicle_name == "") exitWith {false};

private["_vehicle_class"];
_vehicle_class = [_player, format["vehicle_driven_class_%1", _side]] call A_player_fnc_get_string;
if (_vehicle_class == "") exitWith {false};

//player groupChat format["_vehicle_name = %1, _vehicle_class = %2", _vehicle_name, _vehicle_class];

private["_vehicle"];
_vehicle = [_vehicle_name, _vehicle_class] call A_vehicle_fnc_recreate;
if (undefined(_vehicle)) exitWith {false};

private["_active_driver_uid", "_saved_driver_uid", "_player_uid", "_distance"];
_player_uid = [_player] call A_stats_fnc_get_uid;
_saved_driver_uid = [_vehicle, "saved_driver_uid"] call A_vehicle_fnc_get_string;
_active_driver_uid = [_vehicle, "active_driver_uid"] call A_vehicle_fnc_get_string;

//player groupChat format["_player_uid = %1", _player_uid];
//player groupChat format["_saved_driver_uid = %1", _saved_driver_uid];
//player groupChat format["_active_driver_uid = %1", _active_driver_uid];

if (not((_active_driver_uid in ["", _saved_driver_uid]) && (_saved_driver_uid == _player_uid))) exitWith {
	player groupChat "Your vehicle has been stolen, destroyed, or moved while you were away!";
	false
};

[_player, _vehicle, false] call A_player_fnc_enter_vehicle;
[_player, _vehicle] call A_vehicle_fnc_add;
//player groupChat format["Vehicle recreated!"];
true
