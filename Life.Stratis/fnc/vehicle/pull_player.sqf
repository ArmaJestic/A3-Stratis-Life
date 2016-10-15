// A_vehicle_fnc_pull_player

#include "header.h"


ARGV(0,_this);
ARGV(0,_player);
ARGV(1,_vehicle);
ARGV(2,_target);
player groupChat format["A_vehicle_fnc_pull_player %1", _this];

if (!([_player, _vehicle, _target] call A_vehicle_fnc_pull_player_available)) exitWith {};
[_target, _vehicle, false] call A_player_fnc_exit_vehicle;
