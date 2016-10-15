// A_player_fnc_has_license

#include "header.h"


ARGV(0,_player);
ARGV(1,_license);
if (!([_player] call A_player_fnc_human)) exitWith {false};
if (UNDEFINED(_license)) exitWith {false};
if (typeName _license != "STRING") exitWith {false};
if (_license == "") exitWith {true};

private["_licenses"];
_licenses = [_player, "INV_LicenseOwner"] call A_player_fnc_get_array;
(_license in _licenses)
