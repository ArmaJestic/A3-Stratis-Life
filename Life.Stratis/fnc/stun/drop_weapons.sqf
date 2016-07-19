// A_stun_fnc_drop_weapons

#include "../../includes/macro.h"


 ARGV(0,_unit);
 if (undefined(_unit)) exitWith {};
 
 private ["_weapons"];
 _weapons = weapons _unit;
 _weapons = _weapons - nonlethalweapons;
 
if ((count _weapons) == 0) exitWith {};

private["_holder", "_position"];
_holder = createVehicle ["GroundWeaponHolder", (getPosATL _unit), [], 0, "NONE"];
_position = [ (getPosATL _unit) select 0, (getPosATL _unit) select 1, ((getPosATL _unit) select 2) + 0.05 ];
_holder setPosATL _position;

{
	_unit removeWeapon _x;
	_holder addWeaponCargoGlobal [_x, 1];
} forEach _weapons;
