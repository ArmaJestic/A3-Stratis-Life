// A_player_fnc_remove_weapon_item

#include "..\..\includes\macro.h"


//player groupChat format["A_player_fnc_remove_weapon_item %1", _this];	
ARGV(0,_player);
ARGV(1,_weapon_id);
ARGV(2,_item_id);

if (not([_player] call A_player_fnc_exists)) exitWith {false};
if (undefined(_weapon_id)) exitWith {false};
if (typeName _weapon_id != "STRING") exitWith {false};
if (undefined(_item_id)) exitWith {false};
if (typeName _item_id != "STRING") exitWith {false};

private["_weapon_type"];
_weapon_type = [_player, _weapon_id] call A_player_fnc_determine_weapon_type;

if (_weapon_type == A_player_var_primary_weapon) exitWith {
	_player removePrimaryWeaponItem _item_id;
	true
};

if (_weapon_type == A_player_var_secondary_weapon) exitWith {
	[_player, _item_id] call A_bis_expected_fnc_removeItemFromSecondaryWeapon;
	true
};

if (_weapon_type == A_player_var_handgun_weapon) exitWith {
	[_player, _item_id] call A_bis_expected_fnc_removeItemFromHandgun;
	true
};

false
