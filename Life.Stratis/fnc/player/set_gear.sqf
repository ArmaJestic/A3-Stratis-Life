// A_player_fnc_set_gear

#include "..\..\includes\macro.h"


diag_log format["A_player_fnc_set_gear %1", _this];
ARGV(0,_player);
ARGV(1,_gear);
if (!([_player] call A_player_fnc_exists)) exitWith {null};
if (undefined(_gear)) exitWith {null};
if (typeName _gear != "ARRAY") exitWith {null};

private["_backpack", "_backpack_weapons", "_backpack_magazines",
		"_primary_items", "_secondary_items", "_handgun_items",
		"_uniform_items", "_vest_items", "_backpack_items", "_assigned_items",
		"_uniform", "_vest", "_headgear", "_goggles",
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

if (undefined(_backpack)) exitWith {null};
if (undefined(_backpack_weapons)) exitWith {null};
if (undefined(_backpack_magazines)) exitWith {null};
if (undefined(_primary_items)) exitWith {null};
if (undefined(_secondary_items)) exitWith {null};
if (undefined(_handgun_items)) exitWith {null};
if (undefined(_uniform_items)) exitWith {null};
if (undefined(_vest_items)) exitWith {null};
if (undefined(_backpack_items)) exitWith {null};
if (undefined(_assigned_items)) exitWith {null};
if (undefined(_uniform)) exitWith {null};
if (undefined(_vest)) exitWith {null};
if (undefined(_headgear)) exitWith {null};
if (undefined(_goggles)) exitWith {null};
if (undefined(_primary_weapon)) exitWith {null};
if (undefined(_secondary_weapon)) exitWith {null};
if (undefined(_tertiary_weapon)) exitWith{null};
if (undefined(_primary_magazine)) exitWith {null};
if (undefined(_secondary_magazine)) exitWith {null};
if (undefined(_tertiary_magazine)) exitWith{null};

if (typeName _backpack != "STRING") exitWith {null};
if (typeName _backpack_weapons != "ARRAY") exitWith {null};
if (typeName _backpack_magazines != "ARRAY") exitWith {null};
if (typeName _primary_items != "ARRAY") exitWith {null};
if (typename _secondary_items != "ARRAY") exitWith {null};
if (typeName _handgun_items != "ARRAY") exitWith {null};
if (typeName _uniform_items != "ARRAY") exitWith {null};
if (typeName _vest_items != "ARRAY") exitWith {null}; 
if (typeName _backpack_items != "ARRAY") exitWith {null};
if (typeName _assigned_items != "ARRAY") exitWith {null};
if (typeName _uniform != "STRING") exitWith {null};
if (typeName _vest != "STRING") exitWith {null}; 
if (typeName _headgear != "STRING") exitWith {null};
if (typeName _goggles != "STRING") exitWith {null};
if (typeName _primary_weapon != "STRING") exitWith {null};
if (typeName _secondary_weapon != "STRING") exitWith {null};
if (typeName _tertiary_weapon != "STRING") exitWith {null};
if (typeName _primary_magazine != "ARRAY") exitWith {null};
if (typeName _secondary_magazine != "ARRAY") exitWith {null};
if (typeName _tertiary_magazine != "ARRAY") exitWith {null};

//it is important to restore first the gear containers in correct order (backpack, vest, uniform)
removeUniform _player;
removeVest _player;
removeHeadgear _player;
removeGoggles _player;

//clear up all magazines, weapons, and items
{_player removeMagazine _x} forEach (magazines _player);
removeAllWeapons _player;
{ [_player, _x] call A_bis_expected_fnc_removePlayerInventoryItem; } forEach ([_player] call A_player_fnc_get_all_items);

if (([_player] call A_player_fnc_blufor)) then {
	_handgun_items = A_player_var_CopStartGear_HandGun_items;
};

//HACK: create a temporary container so to hold the magazines for each weapon
private["_pack", "_pack_class"];
_pack_class = "B_AssaultPack_khk";
_player addBackpack _pack_class; 
_pack = unitBackpack _player;

//restore primary weapon
if (_primary_weapon != "") then {
	//HACK: clear the temporary container to hold the magazines
	clearWeaponCargoGlobal _pack;
	clearMagazineCargoGlobal _pack;
	
	{
		_pack addMagazineCargoGlobal [_x, 1];
	} forEach _primary_magazine;
	_player addWeapon _primary_weapon; 
	
	//restore primary weapon items
	{
		_player addPrimaryWeaponItem _x;
	} forEach (_primary_items);
	
	_player selectWeapon _primary_weapon;	
	_player action ["switchWeapon", _player, _player, 0];
	reload _player;
};

//restore secondary weapon
if (_secondary_weapon != "") then {
	//HACK: clear the temporary container to hold the magazines
	clearWeaponCargoGlobal _pack;
	clearMagazineCargoGlobal _pack;
	
	{
		_pack addMagazineCargoGlobal [_x, 1];
	} forEach _secondary_magazine;
	_player addWeapon _secondary_weapon;
	
	//restore secondary weapon items
	{
		_player addSecondaryWeaponItem _x;
	} forEach (_secondary_items);
};

//restore tertiary weapon
if (_tertiary_weapon != "") then {
	//HACK: clear the temporary container to hold the magazines
	clearWeaponCargoGlobal _pack;
	clearMagazineCargoGlobal _pack;
	
	{
		_pack addMagazineCargoGlobal [_x, 1];
	} forEach _tertiary_magazine;
	_player addWeapon _tertiary_weapon;
		
	//retore tertiary weapon items
	{
		_player addHandgunItem _x;
	} forEach (_handgun_items);
	
};

//HACK: once each weapon has magazines loaded, remove the temporary container
removeBackpack _player;
	

//restore the backpack
if (!(_backpack == "" || _backpack == "none")) then {
	removeBackpack _player;
	_player addBackpack _backpack;
	
	private["_pack"];
	_pack = unitBackpack _player;
		
	clearWeaponCargoGlobal _pack;
	clearMagazineCargoGlobal _pack;
	
	private["_pack_weapons_class", "_pack_weapons_count", "_pack_magazines_class", "_pack_magazines_count"];
	_pack_weapons_class  = _backpack_weapons select 0;
	_pack_weapons_count	= _backpack_weapons select 1;
	_pack_magazines_class = _backpack_magazines select 0;
	_pack_magazines_count= _backpack_magazines select 1;
		
	private["_i"];
	
	_i = 0;
	while { _i < (count _pack_weapons_class) } do {
		private["_weapon_class", "_weapon_count"];
		_weapon_class = _pack_weapons_class select _i;
		_weapon_count = _pack_weapons_count select _i;
		_pack addWeaponCargoGlobal [_weapon_class, _weapon_count];
		_i = _i + 1;
	};
		
	_i = 0;
	while { _i < (count _pack_magazines_class) } do { 
		private["_magazine_class", "_magazine_count"];
		_magazine_class = _pack_magazines_class select _i;
		_magazine_count = _pack_magazines_count select _i;
		_pack addMagazineCargoGlobal [_magazine_class, _magazine_count];
		_i = _i + 1;
	};
	
	//restore back-pack items 
	_i = 0;
	while {_i < (count _backpack_items) } do {
		private["_item_class"];
		_item_class = _backpack_items select _i;
		_pack addItemCargoGlobal [_item_class, 1];
		_i = _i + 1;
	};

};

//fill up the vest first 
if (_vest != "") then {
	diag_log format["A_player_fnc_set_gear: _vest = %1, _player = %2", _vest, _player];
	_player addVest _vest;
	{
		[_player, _x] call A_bis_expected_fnc_addPlayerInventoryItem;
	} forEach (_vest_items);
};

//fill up the uniform second
if (_uniform != "") then {
	diag_log format["A_player_fnc_set_gear: _vest = %1, _player = %2", _uniform, _player];
	_player addUniform _uniform;
	{
		[_player, _x] call A_bis_expected_fnc_addPlayerInventoryItem;
	} forEach (_uniform_items);
};

//restore linked items
{
	_player linkItem _x;
} forEach (_assigned_items);


//restore headgear
_player addHeadgear _headgear;

//restore goggles
_player addGoggles _goggles;
