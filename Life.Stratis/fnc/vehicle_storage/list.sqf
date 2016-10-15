// A_vehicle_storage_fnc_list

#include "header.h"


//player groupChat format["A_vehicle_storage_fnc_list %1", _this];
ARGV(0,_id);
ARGV(1,_player);

if (!([_player] call A_player_fnc_exists)) exitWith {[]};

private["_uid"];
_uid = getPlayerUID _player;

private["_data"];
_data = [_id] call A_vehicle_storage_fnc_data;
if (UNDEFINED(_data)) exitWith {[]};

private["_data_values", "_result"];
_result = [];
_data_values = _data select A_vehicle_storage_fnc_data;

{
	private["_vehicle_data", "_player_uid"];
	_vehicle_data = _x;
	_player_uid = _vehicle_data select VEH_STR_INDEX_DATA_UID;
	if (_player_uid == _uid) then {
		_result set [count(_result), _vehicle_data];
	};
} forEach _data_value;

(_result)
