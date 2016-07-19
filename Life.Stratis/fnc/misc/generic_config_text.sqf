// A_misc_fnc_generic_config_text

#include "../../includes/macro.h"

ARGV(0,_id);
ARGV(1,_field);
if (undefined(_id)) exitWith {""};
if (typeName "_id" != "STRING") exitWith {""};
if (_id == "") exitWith {""};

if (isClass(configFile >> "CfgWeapons" >> _id)) exitWith {
	(getText(configFile >> "CfgWeapons" >> _id >> _field))
};

if (isClass(configFile >> "CfgVehicles" >> _id)) exitWith {
	(getText(configFile >> "CfgVehicles" >> _id >> _field))
};

if (isClass(configFile >> "CfgMagazines" >> _id)) exitWith {
	(getText(configFile >> "CfgMagazines" >> _id >> _field))
};

if (isClass(configFile >> "CfgAmmos" >> _id)) exitWith {
	(getText(configFile >> "CfgAmmos" >> _id >> _field))
};

if (isClass(configFile >> "CfgGlasses" >> _id)) exitWith {
	(getText(configFile >> "CfgGlasses" >> _id >> _field))
};

""
