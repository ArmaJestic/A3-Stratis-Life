// A_player_fnc_reset_weapons

#include "../../includes/macro.h"


ARGV(0,_player);
if (not([_player] call A_player_fnc_exists)) exitWith {null};

removeAllWeapons _player;
{player removeMagazine _x} forEach (magazines _player);

//remove the weapons from the player's backpack as well
private["_backpack"];
_backpack = unitBackpack _player;
if (not(undefined(_backpack))) then {
	clearMagazineCargoGlobal _backpack;
	clearWeaponCargoGlobal _backpack;
};
