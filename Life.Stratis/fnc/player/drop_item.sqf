// A_player_fnc_drop_item

#include "../../includes/macro.h"


ARGV(0,_player);
ARGV(1,_item);
ARGV(2,_amount);
ARGV(3,_data);
if (not([_player] call A_player_fnc_human)) exitWith {null};
if (undefined(_item)) exitWith {null};
if (undefined(_amount)) exitWith {null};
if (typeName _item != "STRING") exitWith {null};
if (typeName _amount != "SCALAR") exitWith {null};
if (_item == "handy") exitWith {null};

private["_class", "_object"];
_class = [_item] call A_inventory_fnc_item2class;
if (undefined(_class)) exitWith {null};


private["_data"];
_data = _item call A_inventory_fnc_get_item_array;

if (ITEM_DATA_ANIMAL(_data)) then {
	private["_spawn_location"];
	_spawn_location = if (ITEM_DATA_ANIMAL_SEA(_data)) then {[0,0,0]} else {[3000,3000,50]};
	_object = createAgent [_class, _spawn_location, [], 0, "CAN_COLLIDE"];
	_object setDamage 1;
	sleep 0.5; //give some time for the dead animation to play
	_object setPos (position _player);
}
else {
	_object = _class createVehicle (position _player);
};

private["_in_water"];
_in_water = [_player] call A_object_fnc_in_water;

if (alive _player && not(_in_water)) then {
	_object setPosASL (ATLtoASL(_player modeltoWorld [0,0.5,0]));
	//_object setposASL getposASL _player;
};

if (alive _player && _in_water) then {
	_object attachTo [_player, [0,0.5,0], "RightHand"];
	detach _object;
};


//give a name to the object
private["_object_name"];
_object_name = format["%1_%2_%3_%4", _class, (getPlayerUID _player), round(time), round(random(time))];
//[[_object, _object_name], "A_player_fnc_drop_item_init_handler_persistent", true, true] spawn BIS_fnc_MP;
[[_object, _item, _object_name], "A_player_fnc_drop_item_init_handler_persistent", true, true, _object] spawn A_jip_fnc_register;
waitUntil {not(isNil _object_name)};


//set the droppable item meta-data
[_object, _item, _amount, _data] call A_object_fnc_item_set_data;
_object
