// A_interaction_fnc_gang_join

#include "../../includes/macro.h"
#include "../../includes/constants.h"
#include "../../includes/dikcodes.h"


//player groupChat format["A_interaction_fnc_gang_join %1", _this];
ARGV(0,_player);
ARGV(1,_gang_id);

if (not([_player] call A_player_fnc_human)) exitWith {null};
if (undefined(_gang_id)) exitWith {null};
if (typeName _gang_id != "STRING") exitWith {null};

if (_gang_id == "") exitWith {
	player groupChat format["%1-%2, you have not selected any gang to join", _player, (name _player)];
};

private["_gang"];
_gang = [_gang_id] call A_gang_fnc_lookup_id;
if (undefined(_gang)) exitWith {
	player groupChat format["%1-%2, the selected gang does not exist",  _player, (name _player)];
};

private["_cgang", "_player_uid"];
_player_uid = [_player] call A_gang_fnc_player_uid;
//player groupChat format["_player_uid = %1", _player_uid];
_cgang = [_player_uid] call A_gang_fnc_lookup_player_uid;
//player groupChat format["_cgang = %1", _cgang];

if (not(undefined(_cgang))) exitWith {
	private["_cgang_name"];
	_cA_gang_var_name = _cgang select A_gang_var_name;
	player groupChat format["%1-%2, you are already in gang %3", _player, (name _player), _cgang_name];
};

private["_gang_name"];
_A_gang_var_name = _gang select A_gang_var_name;
	
private["_recruiting"];
_recruiting = _gang select A_gang_var_open;

if (not(_recruiting)) exitWith {
	player groupChat format["%1-%2, gang %3 is not recruiting at the moment", _player, (name _player), _gang_name];
};

player groupChat format["%1-%2, you have joined gang %3", _player, (name _player), _gang_name];
format['["%1", %2] call A_gang_fnc_add_member;', _gang_id, _player] call broadcast;
