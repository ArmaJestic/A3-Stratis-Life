// A_vehicle_storage_fnc_put

#include "..\..\includes\macro.h"


//player groupChat format["A_vehicle_storage_fnc_put %1", _this];
ARGV(0,_id);
ARGV(1,_player);
ARGV(2,_vehicle);

if (not([_id] call A_vehicle_storage_fnc_exists)) exitWith {null};
if (not([_vehicle] call A_vehicle_fnc_exists)) exitWith {null};

private["_player_vehicle"];
_player_vehicle = [_vehicle, "isPlayerVehicle"] call A_object_fnc_getVariable;
_player_vehicle = if (undefined(_player_vehicle)) then {false} else {_player_vehicle};
_player_vehicle = if (typeName _player_vehicle != "BOOL") then {false} else {_player_vehicle};

if (not(_player_vehicle)) exitWith {null};

private["_vehicle_id", "_vehicle_class", "_player_uid"];
_vehicle_class = typeOf _vehicle;
_vehicle_id = str(_vehicle);
_player_uid = getPlayerUID _player;

private["_data"];
_data = [];
_data set [A_vehicle_storage_var_data_entry_id, _vehicle_id];
_data set [A_vehicle_storage_var_data_entry_class, _vehicle_class];
_data set [A_vehicle_storage_var_data_entry_uid, _player_uid];

[_id, _vehicle_id, _data] call A_list_fnc_put_value;
