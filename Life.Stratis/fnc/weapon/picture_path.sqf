// A_weapon_fnc_picture_path

#include "..\..\includes\macro.h"
#include "..\..\includes\constants.h"


ARGV(0,_weapon_id);
if (undefined(_weapon_id)) exitWith {""};
if (typeName "_weapon_id" != "STRING") exitWith {""};
if (_weapon_id == "") exitWith {""};

if (!(isClass(configFile >> "CfgWeapons" >> _weapon_id))) exitWith {""};
(getText(configFile >> "CfgWeapons" >> _weapon_id >> "picture"))
