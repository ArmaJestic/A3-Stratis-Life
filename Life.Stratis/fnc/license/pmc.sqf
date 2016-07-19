// A_license_fnc_pmc

#include "..\..\includes\constants.h"
#include "..\..\includes\macro.h"


ARGV(0,_license_id);
if (undefined(_license_id)) exitWith {false};
if (typeName _license_id != "STRING") exitWith {false};

(_license_id in ["pmc_license_journeyman", "pmc_defense", "pmc_license_air"])
