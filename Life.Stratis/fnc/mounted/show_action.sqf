// A_mounted_fnc_show_action

#include "..\..\includes\macro.h"
#include "..\..\includes\dikcodes.h"


ARGV(0,_player);
ARGV(1,_target);
ARGV(2,_slot_id);
ARGV(3,_requires_weapon);

if (!([_target] call A_mounted_fnc_vehicle_unlocked)) exitWith {false};
if (!([_target, _slot_id] call A_mounted_fnc_slot_open)) exitWith {false};
if ([_player, _target] call A_mounted_fnc_player_inside) exitWith {false};

private["_has_weapon_hands"];

//some of the slots requrie that the player have either a primary or hand-gun weapon in his hands (otherwise they can't get into the needed stance)
private["_current_weapon"];
_current_weapon = currentWeapon _player;
_has_weapon_hands = ((_current_weapon != "") && {_current_weapon == (primaryWeapon player) || {_current_weapon == (handgunWeapon player)}});
if (_requires_weapon && !(_has_weapon_hands)) exitWith {false};
true
