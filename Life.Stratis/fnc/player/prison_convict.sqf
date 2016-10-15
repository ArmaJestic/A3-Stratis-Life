// A_player_fnc_prison_convict

#include "header.h"


player groupChat format["A_player_fnc_prison_convict %1", _this];
ARGV(0,_player);

if (UNDEFINED(_player)) exitWith {null};
if (_player != player) exitWith {null};
if (!([_player] call A_player_fnc_human)) exitWith {null};

private["_time_left", "_bail_left"];
_time_left = round([_player, "jailtimeleft"] call A_player_fnc_get_scalar);
_bail_left = [_player] call A_player_fnc_get_bail;
if (!(_time_left > 0 && _bail_left > 0)) exitWith {null};

[_player] call A_player_fnc_prison_strip;
[_player, _time_left, _bail_left] call A_player_fnc_prison_loop;
