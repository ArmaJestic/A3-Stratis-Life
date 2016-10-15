// A_vehicle_storage_fnc_put

#include "header.h"


params["_id","_player","_vehicle"];

if (!([_id] call A_vehicle_storage_fnc_exists)) exitWith {null};
if (!([_vehicle] call A_vehicle_fnc_exists)) exitWith {null};

private _player_vehicle = [_vehicle, "isPlayerVehicle"] call A_object_fnc_getVariable;
_player_vehicle = if (UNDEFINED(_player_vehicle)) then {false} else {_player_vehicle};
_player_vehicle = if (typeName _player_vehicle != "BOOL") then {false} else {_player_vehicle};

if (!(_player_vehicle)) exitWith {null};

private _vehicle_class = typeOf _vehicle;
private _vehicle_id = str(_vehicle);
private _player_uid = getPlayerUID _player;

private _data = [];
_data set [VEH_STR_INDEX_DATA_ID, _vehicle_id];
_data set [VEH_STR_INDEX_DATA_CLASS, _vehicle_class];
_data set [VEH_STR_INDEX_DATA_UID, _player_uid];

[_id, _vehicle_id, _data] call A_list_fnc_put_value;