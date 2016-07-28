// A_retributions_fnc_remove_vehicle_licenses

#include "..\..\includes\macro.h"


private["_player"];
_player = _this select 0;
if (undefined(_player)) exitWith {null};

if (_player != player) exitWith {null};

player groupchat "You have lost your vehicle licenses for reckless driving!";
[_player, ["car","truck"]] call A_player_fnc_remove_licenses;

A_main_var_demerits = 0;
