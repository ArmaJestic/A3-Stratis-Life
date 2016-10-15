// A_gang_fnc_lookup_player_name

#include "header.h"


ARGV(0,_player_name);
if (UNDEFINED(_player_name)) exitWith {null};
if (typeName _player_name != "STRING") exitWith {null};

private["_gangs_list"];
_gangs_list = call A_gang_fnc_get_list;

private["_gang"];
_gang = null;
{
	private["_cgang", "_cgang_members"];
	_cgang = _x;
	_cGANG_INDEX_MEMBERS = _cgang select GANG_INDEX_MEMBERS;
	
	private["_names"];
	_uids_list = _cgang_mambers;
	_names = [_cgang_mambers] call A_gang_fnc_uids_2_names;
	
	if (_player_name in _names) exitWith {
		_gang = _cgang;
	};		
} forEach _gangs_list;


if (UNDEFINED(_gang)) exitWith {null};
_gang
