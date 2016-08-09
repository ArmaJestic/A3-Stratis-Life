// A_bis_expected_fnc_addWeaponItem

#include "..\..\includes\macro.h"


//player groupChat format["A_bis_expected_fnc_addWeaponItem %1", _this];
ARGV(0,_player);
ARGV(1,_item_id);
if (!([_player] call A_player_fnc_human)) exitWith {false};
if (!([_item_id] call A_config_fnc_class_item)) exitWith {false};

private["_compatible_weapons", "_i"];

_compatible_weapons = [_player, _item_id] call A_player_fnc_weapons_compatible_with_attachment;
//player groupChat format["_compatible_weapons = %1", _compatible_weapons];
_i = 0;
//add the item to the first compatible weapon
while { _i < count(_compatible_weapons)} do {
	private["_weapon_id"];
	_weapon_id = _compatible_weapons select _i;
	if (_weapon_id != "") exitWith {
		[_player, _weapon_id, _item_id] call A_player_fnc_add_weapon_item;
	};
	_i = _i + 1;
};
