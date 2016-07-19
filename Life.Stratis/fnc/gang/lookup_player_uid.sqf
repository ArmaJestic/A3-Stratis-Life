// A_gang_fnc_lookup_player_uid

#include "..\..\includes\macro.h"


ARGV(0,_player_uid);
if (undefined(_player_uid)) exitWith {null};
if (typeName _player_uid != "STRING") exitWith {null};

private["_gangs_list"];
_gangs_list = call A_gang_fnc_get_list;

private["_gang"];
_gang = null;
{
	private["_cgang", "_cgang_members"];
	_cgang = _x;
	_cA_gang_var_members = _cgang select A_gang_var_members;
	
	private["_uids_list"];
	_uids_list = _cgang_members;
	
	if (_player_uid in _uids_list) exitWith {
		_gang = _cgang;
	};
} forEach _gangs_list;

if (undefined(_gang)) exitWith {null};
_gang
