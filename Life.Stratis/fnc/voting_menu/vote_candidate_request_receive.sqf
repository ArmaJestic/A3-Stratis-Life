// A_voting_menu_fnc_vote_candidate_request_receive

#include "..\..\includes\constants.h"
#include "..\..\includes\macro.h"


player groupChat format["A_voting_menu_fnc_vote_candidate_request_receive %1", _this];
ARGV(1,_this);
ARGV(0,_election_id);
ARGV(1,_voter);
ARGV(2,_candidate_uid);

if (undefined(_election_id)) exitWith {};
if (not([_voter] call A_player_fnc_exists)) exitWith {};
if (undefined(_candidate_uid)) exitWith {};
if (typeName _election_id != "STRING") exitWith {};
if (typeName _candidate_uid != "STRING") exitWith {};

private["_candidates"];
_candidates = [_election_id] call A_voting_menu_fnc_get_candidates;
if (undefined(_candidates)) exitWith {};

private["_candidates_index", "_candidates_data"];
_candidates_index = _candidates select A_voting_menu_var_election_candidates_index;
_candidates_data = _candidates select A_voting_menu_var_election_candidates_data;

private["_candidate_index"];
_candidate_index = _candidates_index find _candidate_uid;
if (not(_candidate_index >=0)) exitWith {};

	
private["_voter_uid"];
_voter_uid = getPlayerUID _voter;

private["_voter_found"];
_voter_found = false;


{
	private["_candidate_cdata", "_candidate_cuid", "_candidate_vote_data"];
	_candidate_cdata = _candidates_data select _forEachIndex;
	_candidate_cuid = _candidate_cdata select A_voting_menu_var_election_candidates_data_entry_uid;
	_candidate_vote_data = _candidate_cdata select A_voting_menu_var_election_candidates_data_entry_vote_data;

	private["_voter_found_index"];
	_voter_found_index = -1;
	{
		private["_vote_data_entry", "_vote_data_cuid"];
		_vote_data_entry = _x;
		_vote_data_cuid = _vote_data_entry select A_voting_menu_var_election_candidates_data_entry_vote_data_entry_uid;
		if (_vote_data_cuid == _voter_uid) then {
			_voter_found = true;
			_voter_found_index = _forEachIndex;
		};
	} forEach _candidate_vote_data;
	
	//remove the existing vote
	if (_voter_found_index >= 0) then {
		_candidate_vote_data set [_voter_found_index, objNull];
		_candidate_vote_data = _candidate_vote_data - [objNull];
		_candidate_cdata set [A_voting_menu_var_election_candidates_data_entry_vote_data, _candidate_vote_data];
	};
} forEach _candidates_index;


private["_candidate_data"];
_candidate_data = _candidates_data select _candidate_index;
if (undefined(_candidate_data)) exitWith {};

private["_candidate_votes"];
_candidate_votes = _candidate_data select A_voting_menu_var_election_candidates_data_entry_vote_data;
if (undefined(_candidate_votes)) exitWith {};

private["_vote"];
_vote = [];
_vote set [A_voting_menu_var_election_candidates_data_entry_vote_data_entry_uid, _voter_uid];
_candidate_votes set [(count _candidate_votes), _vote];

[_election_id, _candidates] call A_voting_menu_fnc_set_candidates;
[_election_id] call A_voting_menu_fnc_update_election_version;
