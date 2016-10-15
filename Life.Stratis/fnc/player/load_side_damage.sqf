// A_player_fnc_load_side_damage

#include "header.h"


ARGV(0,_player);
if (!([_player] call A_player_fnc_exists)) exitWith {null};

private["_side"];
_side = ([_player] call A_player_fnc_side);
_side = toLower(str(_side));

private["_damage"];
_damage = [_player, format["damage_%1", _side]] call A_player_fnc_get_scalar;

if (_damage < 0 ||  _damage > 1) exitWith {null};

_player setDamage _damage;
