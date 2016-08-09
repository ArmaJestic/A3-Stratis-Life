// A_client_fnc_check_armed_player

#include "..\..\includes\macro.h"


ARGV(0,_player);

if ((primaryWeapon _player) != "") exitWith {true};
if ((secondaryWeapon _player) != "") exitWith {true};

//check if player is gunner
private["_vehicle", "_in_vehicle", "_is_commander", "_is_driver", "_is_gunner"];
_vehicle = (vehicle _player);
_is_driver = (driver(_vehicle) == _player);
_in_vehicle = (_vehicle != _player);
_is_commander = (commander(_vehicle) == _player) && !(_is_driver);
_is_gunner = (gunner(_vehicle) == _player);
if (_in_vehicle && (_is_gunner || _is_commander))  exitWith { true };

//Check if player has a suicide vest or similar bomb
private["_armed_items"];
//Remote bomb, timed bomb, activated bomb (ied), speed bomb, suicide vest, A_item_fnc_lighter
_armed_items = ["fernzuenderbombe", "zeitzuenderbombe", "aktivierungsbombe", "geschwindigkeitsbombe", "selbstmordbombe", "A_item_fnc_lighter"];
if([_player, _armed_items] call A_inventory_fnc_has_item) exitWith { true };

//check if player has pistol
private["_weapon"];
_weapon = (currentWeapon _player);
if ([_weapon, "GrenadeLauncher"] call A_shop_menu_fnc_weapon_inherits_from) exitWith { true }; //Throw (Grenades), Put (IEDs)
if ([_weapon, "PistolCore"] call A_shop_menu_fnc_weapon_inherits_from) exitWith { true };
if (call A_holster_fnc_pistol_in_inventory) exitWith { true };
false;
