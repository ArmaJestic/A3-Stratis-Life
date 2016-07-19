// A_player_fnc_weapons

#include "../../includes/macro.h"


ARGV(0,_player);
if (not([_player] call A_player_fnc_exists)) exitWith {null};

private["_currentWeapon", "_primaryWeapon", "_secondaryWeapon", "_handgunWeapon"];

_currentWeapon = currentWeapon _player;
_primaryWeapon = primaryWeapon _player;
_secondaryWeapon = secondaryWeapon _player;
_handgunWeapon = handgunWeapon _player;

_currentWeapon = if (undefined(_currentWeapon)) then {""} else {_currentWeapon};
_primaryWeapon = if (undefined(_primaryWeapon)) then {""} else { _primaryWeapon};
_secondaryWeapon = if (undefined(_secondaryWeapon)) then {""} else {_secondaryWeapon};
_handgunWeapon = if (undefined(_handgunWeapon)) then {""} else {_handgunWeapon};

private["_data"];
_data = [];
_data set [A_player_var_current_weapon, _currentWeapon];
_data set [A_player_var_primary_weapon, _primaryWeapon];
_data set [A_player_var_secondary_weapon, _secondaryWeapon];
_data set [A_player_var_handgun_weapon, _handgunWeapon];

(_data)
