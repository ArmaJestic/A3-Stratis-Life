#include "macro.h"

if (not(undefined(bis_expected_functions_defined))) exitWith {null};

uniformSpaceFor = {
	ARGV(0,_player);
	ARGV(1,_item_id);
	
	if (not([_player] call player_human)) exitWith {false};
	if (not([_item_id] call class_item)) exitWith {false};
	
	private["_item_mass", "_uniform_load", "_uniform_max_load", "_uniform_id"];
	_uniform_id = [_player] call player_uniform;
	
	if (_uniform_id == "") exitWith {false};
	_item_mass = [_item_id] call class_item_mass;
	_uniform_max_load = [_uniform_id] call class_item_max_load;
	_uniform_load =  [_player] call realLoadUniform;
	
	((_uniform_load + _item_mass) <= _uniform_max_load)
};

vestSpaceFor = {
	ARGV(0,_player);
	ARGV(1,_item_id);
	
	if (not([_player] call player_human)) exitWith {false};
	if (not([_item_id] call class_item)) exitWith {false};
	
	private["_item_mass", "_vest_load", "_vest_max_load", "_vest_id"];
	_vest_id = [_player] call player_uniform;
	
	if (_vest_id == "") exitWith {false};
	_item_mass = [_item_id] call class_item_mass;
	_vest_max_load = [_vest_id] call class_item_max_load;
	_vest_load =  [_player] call realLoadVest;
	
	((_vest_load + _item_mass) <= _vest_max_load)
};

//adds a weapon attachment to the player's inventory, and puts it on whatver first gun it finds compatible
addWeaponItem = {
	//player groupChat format["addWeaponItem %1", _this];
	ARGV(0,_player);
	ARGV(1,_item_id);
	if (not([_player] call player_human)) exitWith {false};
	if (not([_item_id] call class_item)) exitWith {false};
	
	private["_compatible_weapons", "_i"];
	
	_compatible_weapons = [_player, _item_id] call player_weapons_compatible_with_attachment;
	//player groupChat format["_compatible_weapons = %1", _compatible_weapons];
	_i = 0;
	//add the item to the first compatible weapon
	while { _i < count(_compatible_weapons)} do {
		private["_weapon_id"];
		_weapon_id = _compatible_weapons select _i;
		if (_weapon_id != "") exitWith {
			[_player, _weapon_id, _item_id] call player_add_weapon_item;
		};
		_i = _i + 1;
	};
};

//removes a weapon attachment from the player's inventory (from the first gun it finds that has it)
removeWeaponItem = {
	//player groupChat format["removeWeaponItem %1", _this];
	ARGV(0,_player);
	ARGV(1,_item_id);
	if (not([_player] call player_human)) exitWith {false};
	if (not([_item_id] call class_item)) exitWith {false};
	
	private["_weapons", "_i"];
	_weapons = [_player] call player_weapons;
	_weapons = _weapons - [""];
	
	_i = 0;
	while { _i < count(_weapons) } do {
		private["_weapon_id"];
		_weapon_id = _weapons select _i;
		
		private["_weapon_items"];
		_weapon_items = [_player, _weapon_id] call player_weapon_attachments;
		
		if (toLower(_item_id) in _weapon_items) exitWith {
			[_player, _weapon_id, _item_id] call player_remove_weapon_item;
		};
		_i = _i + 1;
	};
};

removeItemFromHandgun = {
	//player groupChat format["removeItemFromHandgun %1", _this];
	ARGV(0,_player);
	ARGV(1,_item_id);
	
	private["_weapon_id"];
	_weapon_id = handgunWeapon _player;
	
	if (_weapon_id == "") exitWith {false};
	
	private["_weapon_items"];
	_weapon_items = [(handGunItems _player)] call toLowerArray;

	_player removeWeapon _weapon_id;
	_weapon_items = _weapon_items - [_item_id];
	_weapon_id = [_weapon_id] call weapon_attachments_base;
	_player addWeapon _weapon_id;
	
	{
		_player addHandgunItem _x;
	} forEach _weapon_items;
	
	_player selectWeapon _weapon_id;
	
	true
};


removeItemFromSecondaryWeapon = {
	ARGV(0,_player);
	ARGV(1,_item_id);
	
	private["_weapon_id"];
	_weapon_id = handgunWeapon _player;
	
	if (_weapon_id == "") exitWith {false};
	
	private["_weapon_items"];
	_weapon_items = handGunItems _player;
	
	_player removeWeapon _weapon_id;
	_weapon_items = _weapon_items - [_item_id];
	_weapon_id = [_weapon_id] call weapon_attachments_base;
	_player addWeapon _weapon_id;
	
	{
		_player addSecondaryWeaponItem _x;
	} forEach _weapon_items;
	
	_player selectWeapon _weapon_id;
	true
};

realLoadUniform = {
	ARGV(0,_player);
	if (not([_player] call player_human)) exitWith {false};
	
	private["_uniform_id"];
	_uniform_id = [_player] call player_uniform;
	if (_uniform_id == "") exitWith {0};
	
	private["_uniform_max_load"];
	_uniform_max_load = [_uniform_id] call class_item_max_load;
	(_uniform_max_load * (loadUniform _player))
};

realLoadVest = {
	ARGV(0,_player);
	if (not([_player] call player_human)) exitWith {false};
	
	private["_vest_id"];
	_vest_id = [_player] call player_vest;
	if (_vest_id == "") exitWith {0};
	
	private["_vest_max_load"];
	_vest_max_load = [_vest_id] call class_item_max_load;
	(_vest_max_load * (loadVest _player))
};

removeItemFromCargo = {
	ARGV(0,_container);
	ARGV(1,_item_id);
	
	private["_item_cargo", "_i"];
	_item_cargo = itemCargo _container;
	
	_i = 0;
	while {_i < count(_item_cargo)} do {
		private["_citem_id"];
		_citem_id = _item_cargo select _i;
		if (_citem_id == _item_id) exitWith {
			_item_cargo set [_i, ""];
		};
		_i = _i + 1;
	};
	
	_item_cargo = _item_cargo - [""];
	
	clearItemCargoGlobal _container;
	
	{ _container addItemCargoGlobal _x;} forEach _item_cargo;
};

removeItemFromCargoGlobal = {
	ARGV(0,_container);
	ARGV(1,_item_id);
	
	if (undefined(_container)) exitWith {false};
	if (undefined(_item_id)) exitWith {false};
	if (typeName _item_id != "STRING") exitWith {false};
	
	private["_item_cargo", "_i"];
	_item_cargo = itemCargo _container;
	
	_i = 0;
	while {_i < count(_item_cargo)} do {
		private["_citem_id"];
		_citem_id = _item_cargo select _i;
		if (toLower(_citem_id) == toLower(_item_id)) exitWith {
			_item_cargo set [_i, ""];
		};
		_i = _i + 1;
	};
	
	_item_cargo = _item_cargo - [""];
	
	clearItemCargoGlobal _container;
	{ _container addItemCargoGlobal [_x, 1]} forEach _item_cargo;
	true
};


addPlayerInventoryItem = {
	ARGV(0,_player);
	ARGV(1,_item_id);
	if(not([_player] call player_human)) exitWith {null};
	if (undefined(_item_id)) exitWith {null};
	if (typeName _item_id != "STRING") exitWith {null};
	
	if ([_item_id] call class_magazine) exitWith {
		_player addMagazine _item_id;
	};
	
	_player addItem _item_id;
};

//makes a best effort to remove an item from the player's inventory
removePlayerInventoryItem = {
	//player groupChat format["removePlayerInventoryItem %1", _this];
	
	diag_log format["removePlayerInventoryItem %1", _this];
	
	ARGV(0,_player);
	ARGV(1,_item_id);
	
	if(not([_player] call player_human)) exitWith {null};
	
	if (undefined(_item_id)) exitWith {null};
	if (typeName _item_id != "STRING") exitWith {null};
	
	//check if it's a vest
	if (([_player] call player_vest) == _item_id) exitWith {
		removeVest _player;
		true
	};
	
	//check if it's a uniform
	if (([_player] call player_uniform) == _item_id) exitWith {
		removeUniform _player;
		true
	};
	


	//check if it's headgear item
	if (toLower(headgear _player) == toLower(_item_id)) exitWith {
		removeHeadgear _player;
		true
	};
	
	//check if it's goggles item
	if (toLower(goggles _player)  == toLower(_item_id)) exitWith {
		removeGoggles _player;
		true
	};
	
	//check if it's a weapon attachment
	if (toLower(_item_id) in ([_player] call player_all_weapon_attachments)) exitWith {
		[_player, _item_id] call removeWeaponItem;
		true
	};
	
	
	
	//check if it's inside a backpack 
	if (toLower(_item_id) in ([(backpackItems _player)] call toLowerArray)) exitWith {
		private["_backpack"];
		_backpack = unitBackpack _player;
		([_backpack, _item_id] call removeItemFromCargoGlobal)
	};
	
	
	if (_item_id == "itemradio") exitWith {};
	
	//check if it's an assigned item
	if (toLower(_item_id) in ([(assignedItems _player)] call toLowerArray)) exitWith {
		_player unassignItem _item_id;
		_player removeItem _item_id;
		true
	};
	
	
	//if all else fail's try to remove it form inventory
	
	_player unassignItem _item_id;
	_player removeItem _item_id;
	false
};


unitDelete = { _this spawn {
	ARGV(0,_unit);
	if (not([_unit] call player_exists)) exitWith {null};
	_unit setPosATL [-1, -1, 0];
	_unit setDamage 1;
	
	private["_i"];
	_i = 0;
	while { _i < 10 } do {
		hideBody _unit;
		_i = _i + 1;
	};
	deleteVehicle _unit;
};};

addItem2 = {
	ARGV(0,_player);
	ARGV(1,_item);
};

bis_expected_functions_defined = true;