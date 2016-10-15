// A_player_fnc_add_licenses

#include "header.h"

diag_log format["A_player_fnc_add_licenses: %1", _this];

ARGV(0,_player);
ARGV(1,_licenses);
if (!([_player] call A_player_fnc_human)) exitWith {diag_log "A_player_fnc_add_licenses: exit1"; null};
if (UNDEFINED(_licenses)) exitWith {diag_log "A_player_fnc_add_licenses: exit2"; null};
if (typeName _licenses != "ARRAY") exitWith {diag_log "A_player_fnc_add_licenses: exit3"; null};

private["_current_licenses"];
_current_licenses = [_player, "INV_LicenseOwner"] call A_player_fnc_get_array;

{
	private["_license"];
	_license = _x;
	if (UNDEFINED(_license)) exitWith {null};
	if (typeName _license != "STRING") exitWith {null};
	if (_license in _current_licenses) exitWith {null};
	
	_current_licenses pushBack _license;
} forEach _licenses;

[_player, "INV_LicenseOwner", _current_licenses] call A_player_fnc_set_array;