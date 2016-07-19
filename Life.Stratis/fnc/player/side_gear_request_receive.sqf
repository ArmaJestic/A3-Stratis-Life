// A_player_fnc_side_gear_request_receive

#include "../../includes/macro.h"


//player groupChat format["A_player_fnc_side_gear_request_receive %1", _this];
diag_log format["A_player_fnc_side_gear_request_receive %1", _this];
ARGV(0,_variable);
ARGV(1,_request);

if (undefined(_request)) exitWith {null};
if (typeName _request != "ARRAY") exitWith {null};

private["_player", "_gear"]; 
_player = _request select 0;
_gear = _request select 1;
if (not([_player] call A_player_fnc_exists)) exitWith {null};

diag_log format["A_player_fnc_side_gear_request_receive: _player = %1", _player];

if (undefined(_gear)) then {
	_gear = [_player] call A_player_fnc_get_gear;
};

if (undefined(_gear)) exitWith {null};

diag_log format["A_player_fnc_side_gear_request_receive: _gear = %1", _gear];


private["_side"];
_side = ([_player] call A_player_fnc_side);
_side = toLower(str(_side));

private["_backpack", "_backpack_weapons", "_backpack_magazines",
		"_primary_items", "_secondary_items", "_handgun_items", "_uniform_items",
		"_vest_items", "_backpack_items", "_assigned_items", "_uniform", "_vest", "_headgear", "_goggles",
		"_primary_weapon", "_secondary_weapon", "_tertiary_weapon",
		"_primary_magazine", "_secondary_magazine", "_tertiary_magazine"];


_backpack = _gear select A_player_var_gear_backpack;
_backpack_weapons = _gear select A_player_var_gear_backpack_weapons;
_backpack_magazines = _gear select A_player_var_gear_backpack_magazines;
_primary_items = _gear select A_player_var_gear_primary_weapon_items;
_secondary_items = _gear select A_player_var_gear_secondary_weapon_items;
_handgun_items = _gear select A_player_var_gear_handgun_weapon_items;
_uniform_items = _gear select A_player_var_gear_uniform_items;
_vest_items = _gear select A_player_var_gear_vest_items;
_backpack_items = _gear select A_player_var_gear_backpack_items;
_assigned_items = _gear select A_player_var_gear_assigned_items;
_uniform = _gear select A_player_var_gear_uniform;
_vest = _gear select A_player_var_gear_vest;
_headgear = _gear select A_player_var_gear_headgear;
_goggles = _gear select A_player_var_gear_goggles;
_primary_weapon = _gear select A_player_var_gear_primary_weapon;
_secondary_weapon = _gear select A_player_var_gear_secondary_weapon;
_tertiary_weapon = _gear select A_player_var_gear_tertiary_weapon;
_primary_magazine = _gear select A_player_var_gear_primary_magazine;
_secondary_magazine = _gear select A_player_var_gear_secondary_magazine;
_tertiary_magazine = _gear select A_player_var_gear_tertiary_magazine;

[_player, format["backpack_%1", _side], _backpack] call A_player_fnc_set_string;
[_player, format["backpack_weapons_%1", _side], _backpack_weapons] call A_player_fnc_set_array;
[_player, format["backpack_magazines_%1", _side], _backpack_magazines] call A_player_fnc_set_array;
[_player, format["primary_items_%1", _side], _primary_items] call A_player_fnc_set_array;
[_player, format["secondary_items_%1", _side], _secondary_items] call A_player_fnc_set_array;
[_player, format["handgun_items_%1", _side], _handgun_items] call A_player_fnc_set_array;
[_player, format["uniform_items_%1", _side], _uniform_items] call A_player_fnc_set_array;
[_player, format["vest_items_%1", _side], _vest_items] call A_player_fnc_set_array;
[_player, format["backpack_items_%1", _side], _backpack_items] call A_player_fnc_set_array;
[_player, format["assigned_items_%1", _side], _assigned_items] call A_player_fnc_set_array;
[_player, format["uniform_%1", _side], _uniform] call A_player_fnc_set_string;
[_player, format["vest_%1", _side], _vest] call A_player_fnc_set_string;
[_player, format["headgear_%1", _side], _headgear] call A_player_fnc_set_string;
[_player, format["goggles_%1", _side], _goggles] call A_player_fnc_set_string;
[_player, format["primary_weapon_%1", _side], _primary_weapon] call A_player_fnc_set_string;
[_player, format["secondary_weapon_%1", _side], _secondary_weapon] call A_player_fnc_set_string;
[_player, format["tertiary_weapon_%1", _side], _tertiary_weapon] call A_player_fnc_set_string;
[_player, format["primary_magazine_%1", _side], _primary_magazine] call A_player_fnc_set_array;
[_player, format["secondary_magazine_%1", _side], _secondary_magazine] call A_player_fnc_set_array;
[_player, format["tertiary_magazine_%1", _side], _tertiary_magazine] call A_player_fnc_set_array;
