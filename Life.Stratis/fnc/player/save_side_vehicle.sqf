// A_player_fnc_save_side_vehicle

#include "../../includes/macro.h"


ARGV(0,_player);
if (not([_player] call A_player_fnc_exists)) exitWith {null};

private["_side"];
_side = ([_player] call A_player_fnc_side);
_side = toLower(str(_side));

private["_vehicle", "_driver", "_vehicle_name", "_vehicle_class"];
_vehicle = (vehicle _player);
_driver = driver _vehicle;
_vehicle_name = "";
_vehicle_class = "";

if (not(_vehicle == _player) && driver(_vehicle) == _player) then {
	_vehicle_name = vehicleVarName _vehicle;
	_vehicle_class = typeOf _vehicle;
};

[_player, format["vehicle_driven_name_%1", _side], _vehicle_name] call A_player_fnc_set_string;
[_player, format["vehicle_driven_class_%1", _side], _vehicle_class] call A_player_fnc_set_string;
