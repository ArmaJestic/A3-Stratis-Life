// A_weapon_fnc_display_name

#include "header.h"


ARGV(0,_weapon_id);
if (UNDEFINED(_weapon_id)) exitWith {""};
if (typeName "_weapon_id" != "STRING") exitWith {""};
if (_weapon_id == "") exitWith {""};
if (!(isClass(configFile >> "CfgWeapons" >> _weapon_id))) exitWith {""};

(getText(configFile >> "CfgWeapons" >> _weapon_id >> "displayName"))
