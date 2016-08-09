// A_player_fnc_add_item

#include "..\..\includes\macro.h"


player groupChat format["A_player_fnc_add_item %1", _this];
ARGV(0,_player);
ARGV(1,_item_id);

if (!([_player] call A_player_fnc_human)) exitWith {false};
if (!([_item_id] call A_config_fnc_class_item)) exitWith {false};

private["_load_before", "_load_after"];
_load_before = load _player;
_player addItem _item_id;
_load_after = load _player;


// drop the item in the ground
if (_load_after <= _load_before) exitWith {
	_holder = createVehicle ["GroundWeaponHolder", (getPos _player), [], 0, "CAN_COLLIDE"];
	_holder addItemCargoGlobal [_item_id, 1];
	false
};

true
