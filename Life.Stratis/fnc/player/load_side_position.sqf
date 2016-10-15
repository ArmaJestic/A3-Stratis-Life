// A_player_fnc_load_side_position

#include "header.h"


diag_log format['A_player_fnc_load_side_position %1: starting', _this];

ARGV(0,_player);
if (!([_player] call A_player_fnc_exists)) exitWith {diag_log format['A_player_fnc_load_side_position %1: exit1', _this]; false};

private["_side"];
_side = ([_player] call A_player_fnc_side);
_side = toLower(str(_side));

private["_position_atl", "_direction"];
_position_atl = [_player, format["position_atl_%1", _side]] call A_player_fnc_get_array;
_direction = [_player, format["direction_%1", _side]] call A_player_fnc_get_scalar;


if ((count _position_atl) != 3) exitWith {diag_log format['A_player_fnc_load_side_position %1: exit2', _this]; false};

// attached...somewhere?
detach _player;
_player setVelocity[0,0,0];
_player setPosATL _position_atl;
_player setDir _direction;


if ((_position_atl select 2) > 5000) exitWith {diag_log format['A_player_fnc_load_side_position %1: exit3', _this]; false};

diag_log format['A_player_fnc_load_side_position %1: ending true', _this];

true