// A_player_fnc_load_side_gear

#include "../../includes/macro.h"


//player groupChat format["A_player_fnc_load_side_gear %1", _this];
diag_log format["A_player_fnc_load_side_gear = %1", _this];
ARGV(0,_player);
if (not([_player] call A_player_fnc_human)) exitWith {null};

[_player] call A_player_fnc_reset_gear;
private["_side"];
_side = ([_player] call A_player_fnc_side);
_side = toLower(str(_side));

private["_backpack", "_backpack_weapons", "_backpack_magazines",
		"_primary_items", "_secondary_items", "_handgun_items", "_vest_items", "_uniform_items",
		"_vest", "_uniform", "_headgear", "_goggles",
		"_primary_weapon", "_secondary_weapon", "_tertiary_weapon",
		"_primary_magazine", "_secondary_magazine", "_tertiary_magazine"];

_backpack = [_player, format["backpack_%1", _side]] call A_player_fnc_get_string;
_backpack_weapons = [_player, format["backpack_weapons_%1", _side]] call A_player_fnc_get_array;
_backpack_magazines = [_player, format["backpack_magazines_%1", _side]] call A_player_fnc_get_array;
_primary_items = [_player, format["primary_items_%1", _side]] call A_player_fnc_get_array;
_secondary_items = [_player, format["secondary_items_%1", _side]] call A_player_fnc_get_array;
_handgun_items = [_player, format["handgun_items_%1", _side]] call A_player_fnc_get_array;
_uniform_items = [_player, format["uniform_items_%1", _side]] call A_player_fnc_get_array;
_vest_items = [_player, format["vest_items_%1", _side]] call A_player_fnc_get_array;
_backpack_items = [_player, format["backpack_items_%1", _side]] call A_player_fnc_get_array;
_assigned_items = [_player, format["assigned_items_%1", _side]] call A_player_fnc_get_array;
_uniform = [_player, format["uniform_%1", _side]] call A_player_fnc_get_string;
_vest = [_player, format["vest_%1", _side]] call A_player_fnc_get_string;
_headgear = [_player, format["headgear_%1", _side]] call A_player_fnc_get_string;
_goggles = [_player, format["goggles_%1", _side]] call A_player_fnc_get_string;
_primary_weapon = [_player, format["primary_weapon_%1", _side]] call A_player_fnc_get_string;
_secondary_weapon = [_player, format["secondary_weapon_%1", _side]] call A_player_fnc_get_string;
_tertiary_weapon = [_player, format["tertiary_weapon_%1", _side]] call A_player_fnc_get_string;
_primary_magazine = [_player, format["primary_magazine_%1", _side]] call A_player_fnc_get_array;
_secondary_magazine = [_player, format["secondary_magazine_%1", _side]] call A_player_fnc_get_array;
_tertiary_magazine = [_player, format["tertiary_magazine_%1", _side]] call A_player_fnc_get_array;


private["_gear"];
_gear = [];
_gear set [A_player_var_gear_backpack, _backpack];
_gear set [A_player_var_gear_backpack_weapons, _backpack_weapons];
_gear set [A_player_var_gear_backpack_magazines, _backpack_magazines];
_gear set [A_player_var_gear_primary_weapon_items, _primary_items];
_gear set [A_player_var_gear_secondary_weapon_items, _secondary_items];
_gear set [A_player_var_gear_handgun_weapon_items, _handgun_items];
_gear set [A_player_var_gear_uniform_items, _uniform_items];
_gear set [A_player_var_gear_vest_items, _vest_items];
_gear set [A_player_var_gear_backpack_items, _backpack_items];
_gear set [A_player_var_gear_assigned_items, _assigned_items];
_gear set [A_player_var_gear_uniform, _uniform];
_gear set [A_player_var_gear_vest, _vest];
_gear set [A_player_var_gear_headgear, _headgear];
_gear set [A_player_var_gear_goggles, _goggles];
_gear set [A_player_var_gear_primary_weapon, _primary_weapon];
_gear set [A_player_var_gear_secondary_weapon, _secondary_weapon];
_gear set [A_player_var_gear_tertiary_weapon, _tertiary_weapon];
_gear set [A_player_var_gear_primary_magazine, _primary_magazine];
_gear set [A_player_var_gear_secondary_magazine, _secondary_magazine];
_gear set [A_player_var_gear_tertiary_magazine, _tertiary_magazine];

diag_log format["A_player_fnc_load_side_gear _gear = %1", _gear];

[_player, _gear] call A_player_fnc_set_gear;


private["_primary_weapon"];
_primary_weapon = (primaryWeapon _player);

if (_primary_weapon != "") then {
	_player selectWeapon _primary_weapon;
};

_player action ["switchweapon", _player, _player, 0];
