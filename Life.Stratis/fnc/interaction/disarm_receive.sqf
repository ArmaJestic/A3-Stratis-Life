// A_interaction_fnc_disarm_receive

#include "..\..\includes\macro.h"
#include "..\..\includes\constants.h"
#include "..\..\includes\dikcodes.h"


ARGV(0,_player);
ARGV(1,_target);

if (not([_player] call A_player_fnc_human)) exitWith {null};
if (not([_target] call A_player_fnc_human)) exitWith {null};

if (_target != player) exitWith {null};

private["_weapons"];
_weapons = (weapons _target) - A_main_var_nonlethalweapons;
if (count _weapons > 0) then {
	{_target removeWeapon _x} forEach _weapons;
};

[_target] call A_inventory_fnc_remove_illegal;
