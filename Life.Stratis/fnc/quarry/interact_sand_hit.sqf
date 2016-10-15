// A_quarry_fnc_interact_sand_hit

#include "header.h"


//player groupChat format["A_interaction_fnc_stone_hit %1", _this];
ARGV(0,_player);
ARGV(1,_object);


sleep 0.4;
private["_sound", "_axe_sounds"];
_axe_sounds = [
	"sounds\shovel1.ogg",
	"sounds\shovel2.ogg",
	"sounds\shovel3.ogg",
	"sounds\shovel4.ogg"
];
_sound = MISSION_ROOT+(_axe_sounds select (floor random (count(_axe_sounds))));
playSound3d [_sound, _player, true];


//check if we are near a quarry
private["_near_quarry"];
_near_quarry = [_object] call A_quarry_fnc_player_near;
if (UNDEFINED(_near_quarry)) exitWith {}; 

A_quarry_var_interact_sand_hits = A_quarry_var_interact_sand_hits + 1;
if (A_quarry_var_interact_sand_hits < 10) exitWith {};
A_quarry_var_interact_sand_hits = 0;

//spawn the ore 
private["_item", "_data", "_item_max"];
_item = _near_quarry select INDEX_ITEM_ID;
_item_max = _near_quarry select INDEX_ITEM_MAX;

_data = ITEM_DATA(_item);
player groupChat format["_item = %1, _data = %2", _item, _data];
if (count(_data) == 0) exitWith {};

[_item, ceil(random _item_max), (getPos _object), 0.05] call A_quarry_fnc_sand_spawn;