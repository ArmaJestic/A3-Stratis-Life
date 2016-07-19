// A_gang_fnc_lookup_player_name

#include "..\..\includes\macro.h"


ARGV(0,_player_name);
if (undefined(_player_name)) exitWith {null};
if (typeName _player_name != "STRING") exitWith {null};

private["_gangs_list"];
_gangs_list = call A_gang_fnc_get_list;

private["_gang"];
_gang = null;
{
	private["_cgang", "_cgang_members"];
	_cgang = _x;
	_cA_gang_var_members = _cgang select A_gang_var_members;
	
	private["_names"];
	_uids_list = _cgang_mambers;
	_names = [_cgang_mambers] call A_gang_fnc_uids_2_names;
	
	if (_player_name in _names) exitWith {
		_gang = _cgang;
	};		
} forEach _gangs_list;


if (undefined(_gang)) exitWith {null};
_gang
