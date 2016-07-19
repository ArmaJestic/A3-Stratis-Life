// A_voting_menu_fnc_add_candidate

#include "..\..\includes\constants.h"
#include "..\..\includes\macro.h"


ARGV(0,_election_id);
ARGV(1,_candidate_data);

if (undefined(_election_id)) exitWith {};
if (undefined(_candidate_data)) exitWith {};

private["_candidates"];
_candidates = [_election_id] call A_voting_menu_fnc_get_candidates;
if (undefined(_candidates)) exitWith {};

private["_canidates_index", "_candidates_data"];
_candidates_index = _candidates select A_voting_menu_var_election_candidates_index;
_candidates_data = _candidates select A_voting_menu_var_election_candidates_data;

private["_candidate_uid"];
_candidate_uid = _candidate_data select A_voting_menu_var_election_candidates_data_entry_uid;

_candidates_index set [count(_candidates_index), _candidate_uid];
_candidates_data set [count(_candidates_data), _candidate_data];
[_election_id, _candidates] call A_voting_menu_fnc_set_candidates;
