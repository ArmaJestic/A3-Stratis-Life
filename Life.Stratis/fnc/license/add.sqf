// A_license_fnc_add

#include "header.h"

diag_log format["A_license_fnc_add: %1", _this];

ARGV(0,_player);
ARGV(1,_license_id);
if (!([_player] call A_player_fnc_human)) exitWith {diag_log "A_license_fnc_add: exit1"; null};
if (UNDEFINED(_license_id)) exitWith {diag_log "A_license_fnc_add: exit2"; null};
if (typeName _license_id != "STRING") exitWith {diag_log "A_license_fnc_add: exit3"; null};
if (_license_id == "") exitWith {diag_log "A_license_fnc_add: exit4"; null};

private["_denied", "_denied_message"];
_denied = false;
_denied_message = "";
if ([_license_id] call A_license_fnc_pmc) then {
	if (!([_player] call A_player_fnc_civilian)) then {
		_denied = true; 
		_denied_message = "You cannot access PMC Licenses, you are not a civilian";
	}else{ if (!([player] call A_player_fnc_pmc))  then {
		_denied = false; 
		_denied_message = "You cannot access PMC Licenses, the police chief has not added you to the whitelist";
	};};
};

if (_denied) exitWith {
	player groupChat _denied_message;
};

[_player, [_license_id]] call A_player_fnc_add_licenses;