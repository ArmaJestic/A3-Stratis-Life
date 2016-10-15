// A_player_fnc_backpack

#include "header.h"


ARGV(0,_player);
if (!([_player] call A_player_fnc_exists)) exitWith {""};

private["_backpack"];
_backpack = unitBackpack _player;
if (UNDEFINED(_backpack)) exitWith {""};

(typeOf _backpack)
