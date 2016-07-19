// A_player_fnc_reset_items

#include "..\..\includes\macro.h"


ARGV(0,_player);
if (not([_player] call A_player_fnc_exists)) exitWith {null};

private["_headgear", "_goggles"];

_headgear = [_player] call A_player_fnc_headgear;
_goggles = [_player] call A_player_fnc_goggles;

{ [_player, _x] call A_bis_expected_fnc_removePlayerInventoryItem; } forEach (assignedItems _player);
{ [_player, _x] call A_bis_expected_fnc_removePlayerInventoryItem; } forEach (vestItems _player);
{ [_player, _x] call A_bis_expected_fnc_removePlayerInventoryItem; } forEach (uniformItems _player);
{ [_player, _x] call A_bis_expected_fnc_removePlayerInventoryItem; } forEach (backpackItems _player);

if (not(_headgear == "")) then { 
	_player addHeadgear _headgear;
};

if (not(_goggles == "")) then {
	_player addGoggles _goggles;
};

//these are free items everyone gets
_player linkItem "ItemMap";
_player linkItem "ItemRadio";
_player linkItem "ItemCompass";
_player linkItem "ItemWatch";
