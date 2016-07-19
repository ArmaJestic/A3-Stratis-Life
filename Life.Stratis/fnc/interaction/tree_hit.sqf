// A_interaction_fnc_tree_hit

#include "..\..\includes\macro.h"
#include "..\..\includes\constants.h"
#include "..\..\includes\dikcodes.h"


//player groupChat format["A_interaction_fnc_tree_hit %1", _this];
ARGV(0,_player);
ARGV(1,_object);
ARGV(2,_tree);

sleep 0.4;
private["_sound", "_slash_sounds"];
_slash_sounds = [
	"a3\sounds_f\vehicles\soft\noises\crash_mix_wood_01.wss",
	"a3\sounds_f\vehicles\soft\noises\crash_mix_wood_02.wss",
	"a3\sounds_f\vehicles\soft\noises\crash_mix_wood_03.wss",
	"a3\sounds_f\vehicles\soft\noises\crash_mix_wood_05.wss",
	"a3\sounds_f\vehicles\soft\noises\crash_mix_wood_06.wss"
];
_sound = _slash_sounds select (floor random (count(_slash_sounds)));
playSound3d [_sound, _player, true];

if (not(alive _tree)) exitWith {
	player groupChat format["This tree is already down"];
};

private["_damage"];
_damage = damage _tree;
_damage = _damage + 0.1;

if (_damage >= 1) then {
	playSound3d ["a3\sounds_f\vehicles\soft\noises\crash_mix_wood_04.wss", _player, true];

	private["_tree_id"];
	_tree_id = netId _tree;
	[_tree_id] call A_tree_fnc_register;
	[_tree, true] call A_tree_fnc_hide;
	
	last_tree = _tree;
	[getPos _player] call A_tree_fnc_create_item;
	[getPos _player] call A_tree_fnc_create_item;
	[getPos _player] call A_tree_fnc_create_item;
}
else {
	_tree setDamage _damage;
};


player groupChat format["_damage = %1", _damage];
