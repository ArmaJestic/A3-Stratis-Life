// A_weapon_fnc_slot_label_changed

#include "../../includes/macro.h"
#include "../../includes/constants.h"


//player groupChat format["weapon_muzzle_label_changed %1", _this];

private["_player"];
_player = player;

ARGV(0,_control);
ARGV(1,_index);
ARGV(2,_slot_id);

private["_item_id"];

_item_id = _control lbData _index;
_available = _control lbValue _index;

if (_available == 0 ) exitWith {
	private["_item_name"];
	_item_name = [_item_id] call A_weapon_fnc_display_name;
	player groupChat format["Attachment ""%1"" is not in your inventory", _item_name];
};

private["_weapon_id", "_current_item_id"];
_weapon_id = (currentWeapon _player);
_current_item_id = [_player, _weapon_id, _slot_id] call A_player_fnc_get_weapon_slot_item;

if (_current_item_id == _item_id) exitWith {null};

[_player, _weapon_id, _current_item_id, _item_id] call A_weapon_fnc_player_swap_weapon_items;
