// A_interaction_fnc_stone_hit

#include "..\..\includes\macro.h"
#include "..\..\includes\constants.h"
#include "..\..\includes\dikcodes.h"


//player groupChat format["A_interaction_fnc_stone_hit %1", _this];
ARGV(0,_player);
ARGV(1,_object);
ARGV(2,_stone);


sleep 0.4;
private["_sound", "_axe_sounds"];
_axe_sounds = [
	"sounds\pickaxe1.ogg",
	"sounds\pickaxe2.ogg",
	"sounds\pickaxe3.ogg",
	"sounds\pickaxe4.ogg"
];
_sound = MISSION_ROOT + (_axe_sounds select (floor random (count(_axe_sounds))));
playSound3d [_sound, _player, true];

private["_position"];
_position = getPos _stone;

//check if we are near a mine
private["_near_mine"];
 _near_mine = [_stone] call A_mine_fnc_player_near;
 if (undefined(_near_mine)) exitWith {};
 

 	A_interaction_var_A_interaction_var_interact_stone_hits = A_interaction_var_A_interaction_var_interact_stone_hits + 1;
//player groupChat format["A_interaction_var_A_interaction_var_interact_stone_hits = %1", A_interaction_var_A_interaction_var_interact_stone_hits];
if (A_interaction_var_interact_stone_hits < 10) exitWith {};
A_interaction_var_interact_stone_hits = 0;

 //spawn the ore 
 private["_item", "_data", "_item_max"];
 _item = _near_mine select A_mine_var_data_item_id;
 _item_max = _near_mine select A_mine_var_data_item_max;
 
 _data = ITEM_DATA(_item);
 if (count(_data) == 0) exitWith {};
 if (!(ITEM_DATA_ORE(_data))) exitWith {};
 
[_item, ceil(random _item_max), (getPos _stone), 0.1] call A_mine_fnc_ore_spawn;
