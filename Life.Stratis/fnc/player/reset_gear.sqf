// A_player_fnc_reset_gear

#include "header.h"


diag_log format['A_player_fnc_reset_gear %1: start', _this];

params["_players",["_resetAssigned",true]];
if (!([_player] call A_player_fnc_exists)) exitWith {diag_log format['A_player_fnc_reset_gear %1: exit1', _this];};

// todo: organize out the reset functions
// [_player] call A_player_fnc_reset_weapons;
// [_player] call A_player_fnc_reset_items;


// remove headgear, goggles
removeHeadgear _player;
removeGoggles _player;

// remove uniform/vest/backpack
//removeUniform _player;
//removeVest _player;
// removeBackpack on client unit is local to
// removeBackpackGlobal for anywhere
//removeBackpackGlobal _player;
// removes all containers (uniform/vest/backpack)
removeAllContainers _player;

// remove weapons
removeAllWeapons _player;

// no magazines left (no storage), don't need to worry

// remove (unlink) assigneditems
// unassigns/deletes
removeAllAssignedItems _player;

if (_resetAssigned) then {
	diag_log format['A_player_fnc_reset_gear %1: reset linked items', _this];
	{_player linkItem _x} forEach [
		"ItemMap",
		"ItemCompass",
		"ItemWatch",
		"ItemRadio"
	];
};

diag_log format['A_player_fnc_reset_gear %1: end', _this];