// A_player_fnc_backpack

#include "../../includes/macro.h"


ARGV(0,_player);
if (not([_player] call A_player_fnc_exists)) exitWith {""};

private["_backpack"];
_backpack = unitBackpack _player;
if (undefined(_backpack)) exitWith {""};

(typeOf _backpack)
