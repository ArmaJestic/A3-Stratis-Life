// A_player_fnc_remove_licenses

#include "header.h"


ARGV(0,_player);
ARGV(1,_licenses);
if (!([_player] call A_player_fnc_human)) exitWith {null};
if (UNDEFINED(_licenses)) exitWith {null};
if (typeName _licenses != "ARRAY") exitWith {null};

private["_current_licenses"];
_current_licenses = [_player, "INV_LicenseOwner"] call A_player_fnc_get_array;

{if (true) then {
	private["_license"];
	_license = _x;
	if (UNDEFINED(_license)) exitWith {null};
	if (typeName _license != "STRING") exitWith {null};
	if (!(_license in _current_licenses)) exitWith {null};
	_current_licenses = _current_licenses - [_license];
}} forEach _licenses;

[_player, "INV_LicenseOwner", _current_licenses] call A_player_fnc_set_array;
