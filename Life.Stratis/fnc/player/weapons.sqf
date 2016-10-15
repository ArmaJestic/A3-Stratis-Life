// A_player_fnc_weapons

#include "header.h"


ARGV(0,_player);
if (!([_player] call A_player_fnc_exists)) exitWith {null};

private["_currentWeapon", "_primaryWeapon", "_secondaryWeapon", "_handgunWeapon"];

_currentWeapon = currentWeapon _player;
_primaryWeapon = primaryWeapon _player;
_secondaryWeapon = secondaryWeapon _player;
_handgunWeapon = handgunWeapon _player;

_currentWeapon = if (UNDEFINED(_currentWeapon)) then {""} else {_currentWeapon};
_primaryWeapon = if (UNDEFINED(_primaryWeapon)) then {""} else { _primaryWeapon};
_secondaryWeapon = if (UNDEFINED(_secondaryWeapon)) then {""} else {_secondaryWeapon};
_handgunWeapon = if (UNDEFINED(_handgunWeapon)) then {""} else {_handgunWeapon};

private["_data"];
_data = [];
_data set [INDEX_WEAPON_CURRENT, _currentWeapon];
_data set [INDEX_WEAPON_PRIMARY, _primaryWeapon];
_data set [INDEX_WEAPON_SECONDARY, _secondaryWeapon];
_data set [INDEX_WEAPON_HANDGUN, _handgunWeapon];

(_data)
