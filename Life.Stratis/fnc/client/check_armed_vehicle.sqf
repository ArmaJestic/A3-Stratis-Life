// A_client_fnc_check_armed_vehicle

#include "..\..\includes\macro.h"


ARGV(0,_player);

private["_in_vehicle", "_horns", "_vehicle"];
_vehicle = (vehicle _player);
_in_vehicle = (_vehicle != _player);

if (not(_in_vehicle)) then {
	_vehicle = [_player] call A_mounted_fnc_player_get_vehicle;
};

if (undefined(_vehicle)) exitWith {false};

//check if the vehicle has a weapon
private["_weapon"];
_weapon = currentWeapon _vehicle;
if ([(currentWeapon _vehicle), "CarHorn"] call A_shop_menu_fnc_weapon_inherits_from) exitWith { false };

([_vehicle] call A_client_fnc_check_armed_mounted)
