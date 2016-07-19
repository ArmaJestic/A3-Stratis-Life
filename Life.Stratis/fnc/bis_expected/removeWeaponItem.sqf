// A_bis_expected_fnc_removeWeaponItem

#include "..\..\includes\macro.h"


//player groupChat format["A_bis_expected_fnc_removeWeaponItem %1", _this];
ARGV(0,_player);
ARGV(1,_item_id);
if (not([_player] call A_player_fnc_human)) exitWith {false};
if (not([_item_id] call A_config_fnc_class_item)) exitWith {false};

private["_weapons", "_i"];
_weapons = [_player] call A_player_fnc_weapons;
_weapons = _weapons - [""];

_i = 0;
while { _i < count(_weapons) } do {
	private["_weapon_id"];
	_weapon_id = _weapons select _i;
	
	private["_weapon_items"];
	_weapon_items = [_player, _weapon_id] call A_player_fnc_weapon_attachments;
	
	if (toLower(_item_id) in _weapon_items) exitWith {
		[_player, _weapon_id, _item_id] call A_player_fnc_remove_weapon_item;
	};
	_i = _i + 1;
};
