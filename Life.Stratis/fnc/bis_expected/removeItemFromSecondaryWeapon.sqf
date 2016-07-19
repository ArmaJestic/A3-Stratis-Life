// A_bis_expected_fnc_removeItemFromSecondaryWeapon

#include "..\..\includes\macro.h"


ARGV(0,_player);
ARGV(1,_item_id);

private["_weapon_id"];
_weapon_id = handgunWeapon _player;

if (_weapon_id == "") exitWith {false};

private["_weapon_items"];
_weapon_items = handGunItems _player;

_player removeWeapon _weapon_id;
_weapon_items = _weapon_items - [_item_id];
_weapon_id = [_weapon_id] call A_weapon_fnc_attachments_base;
_player addWeapon _weapon_id;

{
	_player addSecondaryWeaponItem _x;
} forEach _weapon_items;

_player selectWeapon _weapon_id;
true
