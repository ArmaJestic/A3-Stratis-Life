// A_weapon_fnc_attachments_base

#include "header.h"


ARGV(0,_weapon_id);
if (UNDEFINED(_weapon_id)) exitWith {""};
if (typeName _weapon_id != "STRING") exitWith {""};

private["_config"];
_config = (configFile >> "CfgWeapons" >> _weapon_id);

if (!(isClass(_config))) exitWith {""};

if (isClass(_config >> "LinkedItems")) exitWith {
	([configName(inheritsFrom(_config))] call A_weapon_fnc_attachments_base)
};

(_weapon_id)
