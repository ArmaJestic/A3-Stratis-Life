// A_player_fnc_load_side_gear

#include "header.h"



diag_log format['A_player_fnc_load_side_gear %1: start', _this];

ARGV(0,_player);
if (!([_player] call A_player_fnc_human)) exitWith {diag_log format['A_player_fnc_load_side_gear %1: exit1', _this]; null};

[_player] call A_player_fnc_reset_gear;
private["_side"];
_side = ([_player] call A_player_fnc_side);
_side = toLower(str(_side));


private["_gear","_i"];
_gear = [];

_gear pushBack ([_player, format["primary_arr_%1", _side]] call A_player_fnc_get_array);
_gear pushBack ([_player, format["secondary_arr_%1", _side]] call A_player_fnc_get_array);
_gear pushBack ([_player, format["handgun_arr_%1", _side]] call A_player_fnc_get_array);
_gear pushBack ([_player, format["uniform_arr_%1", _side]] call A_player_fnc_get_array);
_gear pushBack ([_player, format["vest_arr_%1", _side]] call A_player_fnc_get_array);
_gear pushBack ([_player, format["backpack_arr_%1", _side]] call A_player_fnc_get_array);
_gear pushBack ([_player, format["helmet_str_%1", _side]] call A_player_fnc_get_string);
_gear pushBack ([_player, format["goggles_str_%1", _side]] call A_player_fnc_get_string);
_gear pushBack ([_player, format["binocs_arr_%1", _side]] call A_player_fnc_get_array);
_gear pushBack ([_player, format["assigned_arr_%1", _side]] call A_player_fnc_get_array);

[_player, _gear] call A_player_fnc_set_gear;

private["_primary_weapon"];
_primary_weapon = (primaryWeapon _player);

if (_primary_weapon != "") then {
	_player selectWeapon _primary_weapon;
};

_player action ["switchweapon", _player, _player, 0];


diag_log format['A_player_fnc_load_side_gear %1: end', _this];
