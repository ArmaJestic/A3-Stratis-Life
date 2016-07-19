// A_mine_fnc_explosive_wait_despawn

#include "..\..\includes\constants.h"
#include "..\..\includes\macro.h"

_this spawn {
//player groupChat format["A_mine_fnc_explosive_wait_despawn %1", _this];
ARGV(0,_object);
if (undefined(_object)) exitWith {};
if (isNull _object) exitWith {};

private["_position"];
_position = getPos _object;

//check if we are near a mine
private["_near_mine"];
 _near_mine = [_object] call A_mine_fnc_player_near;
 if (undefined(_near_mine)) exitWith {};

//check if we are near a stone
private["_stone"];
_stone = [_position, "stone", 3] call A_object_fnc_nearest_strstr;
if (undefined(_stone)) exitWith {};

//wait until the explosive detonates
waitUntil { isNull _object };
 
//check for the presence of a crater near
private["_crater"];
_crater =  [_position, ": krater", 3] call A_object_fnc_nearest_strstr;
 if (undefined(_crater)) exitWith {};
 _crater setPos [0,0,0];

 
 //spawn the ore 
 private["_item", "_data", "_item_max"];
 _item = _near_mine select A_mine_var_data_item_id;
 _item_max = _near_mine select A_mine_var_data_item_max;
 
 _data = ITEM_DATA(_item);
 if (count(_data) == 0) exitWith {};
 if (not(ITEM_DATA_ORE(_data))) exitWith {};
 
private["_ore_count", "_i"];
_ore_count = ceil(3);
_i = 0;
while {_i < _ore_count} do {
	[_item, ceil(random _item_max), _position, 1.5] call A_mine_fnc_ore_spawn;
	_i = _i + 1;
};
};
