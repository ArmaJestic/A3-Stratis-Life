// A_player_fnc_load_side_position

#include "../../includes/macro.h"


player groupChat format["A_player_fnc_load_side_position %1", _this];
ARGV(0,_player);
if (not([_player] call A_player_fnc_exists)) exitWith {false};

private["_side"];
_side = ([_player] call A_player_fnc_side);
_side = toLower(str(_side));

private["_position_atl", "_direction"];
_position_atl = [_player, format["position_atl_%1", _side]] call A_player_fnc_get_array;
_direction = [_player, format["direction_%1", _side]] call A_player_fnc_get_scalar;


if (not((count _position_atl) == 3)) exitWith {false};
detach _player;
_player setPosATL _position_atl;
_player setDir _direction;

player grouPChat format["_position_atl = %1", _position_atl];

if ((_position_atl select 2) > 5000) exitWith {false};
true
