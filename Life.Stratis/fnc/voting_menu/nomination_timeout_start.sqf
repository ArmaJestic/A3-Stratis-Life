// A_voting_menu_fnc_nomination_timeout_start

#include "..\..\includes\constants.h"
#include "..\..\includes\macro.h"

_this spawn {
//player groupChat format["A_voting_menu_fnc_nomination_timeout_start %1", _this];
ARGV(0,_election_data);

if (undefined(_election_data)) exitWith {};

private["_election_id", "_election_role", "_nomination_period"];
_election_id = _election_data select A_voting_menu_var_election_data_id;
_election_role = _election_data select A_voting_menu_var_election_data_role;
_nomination_period = _election_data select A_voting_menu_var_election_data_nomination_period;

private["_value"];
_value = [_election_id] call A_voting_menu_fnc_nomination_timeout_value;

//if the timeout is greater than 0 it means are already in nominations period
if (_value > 0) exitWith {};

[_election_id, 0] call A_voting_menu_fnc_set_nomination_version;
private["_i"];
_i = _nomination_period;
while {_i >= 0} do {
	[_election_id, _i] call A_voting_menu_fnc_nomination_timeout_update;
	sleep 1;
	_i = _i - 1;
};
[_election_id, nil] call A_voting_menu_fnc_nomination_timeout_update;

//setup the candidate's list, from the nominations list

private["_nominations"];
_nominations = [_election_id] call A_voting_menu_fnc_get_nominations;

private["_nominations_index", "_nominations_data"];
_nominations_index =  _nominations select A_voting_menu_var_election_nominations_index;
_nominations_data = _nominations select A_voting_menu_var_election_nominations_data;

//auto nominate the incumbent
private["_incumbent_candidate_data"];
_incumbent_candidate_data = [_election_id] call A_voting_menu_fnc_get_incumbent_candidate;

if (not(undefined(_incumbent_candidate_data))) then {
	[_election_id, _incumbent_candidate_data] call A_voting_menu_fnc_add_candidate;
};


{
	private["_nomination_cdata", "_nomination_entry_uid", "_nomination_entry_name"];
	_nomination_cdata = _nominations_data select _forEachIndex;
	_nomination_entry_uid = _nomination_cdata select A_voting_menu_var_election_nominations_data_entry_uid;
	_nomination_entry_name = _nomination_cdata select A_voting_menu_var_election_nominations_data_entry_name;
	
	private["_candidate_data"];

	
	_candidate_data = [];
	_candidate_data set [A_voting_menu_var_election_candidates_data_entry_uid, _nomination_entry_uid];
	_candidate_data set [A_voting_menu_var_election_candidates_data_entry_name, _nomination_entry_name];
	_candidate_data set [A_voting_menu_var_election_candidates_data_entry_vote_data, []];
	
	
	[_election_id, _candidate_data] call A_voting_menu_fnc_add_candidate;
} forEach _nominations_data;

[_election_id, 0] call A_voting_menu_fnc_set_election_version;
[_election_id] call A_voting_menu_fnc_clear_nominations;

[[_election_data], "A_voting_menu_fnc_election_start", true] call BIS_fnc_MP;
[_election_data] call A_voting_menu_fnc_election_timeout_start;
};
