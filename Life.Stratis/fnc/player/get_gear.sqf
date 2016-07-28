// A_player_fnc_get_gear

#include "..\..\includes\macro.h"


ARGV(0,_player);
if (not([_player] call A_player_fnc_exists)) exitWith {null};
if ([_player] call A_player_fnc_ghost) exitWith {[_player, "A_client_var_cached_gear"] call A_object_fnc_getVariable};

private["_backpack", "_backpack_weapons", "_backpack_magazines", "_backpack_type"];
_backpack = unitBackpack _player;
_backpack_type = typeOf _backpack;

private["_primary_items", "_secondary_items", "_handgun_items", "_uniform_items",
		"_vest_items", "_backpack_items", "_assigned_items"];
_primary_items = [(primaryWeaponItems _player)] call A_misc_fnc_toLowerArray;
_secondary_items = [(secondaryWeaponItems _player)] call A_misc_fnc_toLowerArray;
_handgun_items = [(handgunItems _player)] call A_misc_fnc_toLowerArray;
_uniform_items = [(uniformItems _player)] call A_misc_fnc_toLowerArray;
_vest_items = [(vestItems _player)] call A_misc_fnc_toLowerArray;
_backpack_items = [(backpackItems _player)] call A_misc_fnc_toLowerArray;
_assigned_items = [(assignedItems _player)] call A_misc_fnc_toLowerArray;

private["_uniform", "_vest", "_headgear", "_goggles", "_primary_weapon", "_secondary_weapon", "_tertiary_weapon",
        "_primary_magazine", "_secondary_magazine", "_tertiary_magazine"];
		
_uniform = [_player] call A_player_fnc_uniform;
_vest = [_player] call A_player_fnc_vest;
_headgear = [_player] call A_player_fnc_headgear;
_goggles = [_player] call A_player_fnc_goggles;
_primary_weapon = primaryWeapon _player;
_secondary_weapon = secondaryWeapon _player;
_tertiary_weapon = handgunWeapon _player;
_primary_magazine = primaryWeaponMagazine _player;
_secondary_magazine = secondaryWeaponMagazine _player;
_tertiary_magazine = handgunMagazine _player;


if (_backpack_type == "") then {
	_backpack_type = "none";
	_backpack_weapons =  [];
	_backpack_magazines = [];
}
else {
	_backpack_weapons =  getWeaponCargo _backpack;
	_backpack_magazines = getMagazineCargo _backpack;
};

private["_gear"];
_gear = [];
_gear set [A_player_var_gear_backpack, _backpack_type];
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

_gear
