// A_retributions_fnc_remove_weapon_licenses

#include "..\..\includes\macro.h"


private["_player"];
_player = _this select 0;
if (undefined(_player)) exitWith {null};
if (_player != player) exitWith {null};

player groupchat "You are now wanted, and lost your gun licenses!";
[_player, ["pistollicense","riflelicense","automatic"]] call A_player_fnc_remove_licenses;
