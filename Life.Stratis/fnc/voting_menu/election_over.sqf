// A_voting_menu_fnc_election_over

#include "../../includes/constants.h"
#include "../../includes/macro.h"


//player groupChat format["A_voting_menu_fnc_election_over %1", _this];
ARGV(0,_election_data);
	
private["_election_id", "_election_over_callback"];
_election_id = _election_data select A_voting_menu_var_election_data_id;
_election_over_callback = _election_data select A_voting_menu_var_election_data_over_callback;

private["_candidates"];
_candidates = [_election_id] call A_voting_menu_fnc_get_candidates;
if (undefined(_candidates)) exitWith {};

private["_candidates_data"];
_candidates_data = _candidates select A_voting_menu_var_election_candidates_data;

_max_votes_value = 0;
_max_votes_uid = "";
private["_ballots_data"];
_ballots_data = [];

{
	private["_candidate_data", "_candidate_uid", "_candidate_votes"];
	_candidate_data = _candidates_data select _forEachIndex;
	_candidate_uid = _candidate_data select A_voting_menu_var_election_candidates_data_entry_uid;
	_candidate_votes = [_candidate_data] call A_voting_menu_fnc_count_candidate_votes;
	
	private["_ballot"];
	_ballot = [];
	_ballot set [A_quicksort_v_sort_key,_candidate_votes];
	_ballot set [A_quicksort_v_sort_data,_candidate_data];
	_ballots_data set [count(_ballots_data), _ballot];
} forEach _candidates_data;

_ballots_data call A_quicksort_fnc_quicksort;

private["_first_place_data", "_first_place_votes"];
_first_place_data = (_ballots_data select ((count _ballots_data) - 1)) select A_quicksort_v_sort_data;
_first_place_votes = (_ballots_data select ((count _ballots_data) - 1)) select A_quicksort_v_sort_key;

private["_tie"];
_tie = false;
if (count(_ballots_data) > 1) then {
	private["_second_place_votes"];
	_second_place_votes = (_ballots_data select ((count _ballots_data) - 2)) select A_quicksort_v_sort_key;
	_tie = (_first_place_votes == _second_place_votes);
};

if (_first_place_votes > 0 && not(_tie)) then {
	[_election_id, _first_place_data] call A_voting_menu_fnc_set_incumbent_candidate;
};

[_election_id] call A_voting_menu_fnc_clear_candidates;
[[_election_data,_first_place_votes, _first_place_data,_tie], _election_over_callback, true] call BIS_fnc_MP;
