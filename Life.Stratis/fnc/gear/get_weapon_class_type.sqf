// A_gear_fnc_get_weapon_class_type

#include "header.h"


ARGV(0,_class);
if (UNDEFINED(_class)) exitWith {-1};
if (typeName _class != "STRING") exitWith {-1};
if (_class == "") exitWith {-1};

private["_type"];
_type = getNumber(configFile >> "CfgWeapons" >> _class >> "type");

if (UNDEFINED(_type)) exitWith {-1};
if (typeName _type != "SCALAR") exitWith {-1};
_type
