// A_bis_expected_fnc_removePlayerInventoryItem

#include "..\..\includes\macro.h"


//player groupChat format["A_bis_expected_fnc_removePlayerInventoryItem %1", _this];

diag_log format["A_bis_expected_fnc_removePlayerInventoryItem %1", _this];

ARGV(0,_player);
ARGV(1,_item_id);

if(!([_player] call A_player_fnc_human)) exitWith {null};

if (undefined(_item_id)) exitWith {null};
if (typeName _item_id != "STRING") exitWith {null};

//check if it's a vest
if (([_player] call A_player_fnc_vest) == _item_id) exitWith {
	removeVest _player;
	true
};

//check if it's a uniform
if (([_player] call A_player_fnc_uniform) == _item_id) exitWith {
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
if (toLower(_item_id) in ([_player] call A_player_fnc_all_weapon_attachments)) exitWith {
	[_player, _item_id] call A_bis_expected_fnc_removeWeaponItem;
	true
};



//check if it's inside a backpack 
if (toLower(_item_id) in ([(backpackItems _player)] call A_misc_fnc_toLowerArray)) exitWith {
	private["_backpack"];
	_backpack = unitBackpack _player;
	([_backpack, _item_id] call A_bis_expected_fnc_removeItemFromCargoGlobal)
};


if (_item_id == "itemradio") exitWith {};

//check if it's an assigned item
if (toLower(_item_id) in ([(assignedItems _player)] call A_misc_fnc_toLowerArray)) exitWith {
	_player unassignItem _item_id;
	_player removeItem _item_id;
	true
};


//if all else fail's try to remove it from inventory

_player unassignItem _item_id;
_player removeItem _item_id;
false
