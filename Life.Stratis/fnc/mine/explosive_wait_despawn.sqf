// A_mine_fnc_explosive_wait_despawn

#include "..\..\includes\macro.h"
#include "..\..\includes\constants.h"


params[["_object",objNull,[objNull]]];
if (isNull _object) exitWith {};

private _position = getPos _object;

//check if we are near a mine
private _near_mine = [_object] call A_mine_fnc_player_near;
if (UNDEFINED(_near_mine)) exitWith {};

//check if we are near a stone
private _stone = [_position, "stone", 3] call A_object_fnc_nearest_strstr;
if (UNDEFINED(_stone)) exitWith {};

//wait until the explosive detonates
waitUntil {isNull _object};
 
//check for the presence of a crater near
private _crater = [_position, ": krater", 3] call A_object_fnc_nearest_strstr;
 if (UNDEFINED(_crater)) exitWith {};
 _crater setPos [0,0,0];

 
//spawn the ore 
private _item = _near_mine select MINE_INDEX_ITEM_ID;
private _item_max = _near_mine select MINE_INDEX_ITEM_MAX;
private _data = ITEM_DATA(_item);

if (count(_data) == 0) exitWith {};
if (!(ITEM_DATA_ORE(_data))) exitWith {};
 
private _ore_count = ceil(3);
for "_i" from 0 to _ore_count do {
	[_item, ceil(random _item_max), _position, 1.5] call A_mine_fnc_ore_spawn;
};