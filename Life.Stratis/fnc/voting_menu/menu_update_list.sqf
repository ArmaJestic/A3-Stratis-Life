// A_voting_menu_fnc_menu_update_list

#include "header.h"

 _this spawn {
disableSerialization;
ARGV(0,_election_data);
ARGV(1,_list);

if (UNDEFINED(_election_data)) exitWith {};
if (UNDEFINED(_list)) exitWith {};

private["_election_id"];
_election_id = _election_data select INDEX_DATA_ELEC_ID;

private["_candidates", "_version"];
_version = [_election_id] call A_voting_menu_fnc_get_election_version;

[_election_id] call A_voting_menu_fnc_menu_update_list_reload;


waitUntil {
	private["_new_version"];
	_new_version = [_election_id] call A_voting_menu_fnc_get_election_version;
	if (_new_version != _version) then {
		_version = _new_version;
		[_election_id] call A_voting_menu_fnc_menu_update_list_reload;
	};
	!(ctrlShown _list)
};
};
