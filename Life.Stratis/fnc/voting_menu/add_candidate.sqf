// A_voting_menu_fnc_add_candidate

#include "header.h"


ARGV(0,_election_id);
ARGV(1,_candidate_data);

if (UNDEFINED(_election_id)) exitWith {};
if (UNDEFINED(_candidate_data)) exitWith {};

private["_candidates"];
_candidates = [_election_id] call A_voting_menu_fnc_get_candidates;
if (UNDEFINED(_candidates)) exitWith {};

private["_canidates_index", "_candidates_data"];
_candidates_index = _candidates select INDEX_DATA_ELEC_CAND_INDEX;
_candidates_data = _candidates select INDEX_DATA_ELEC_CAND_DATA;

private["_candidate_uid"];
_candidate_uid = _candidate_data select INDEX_DATA_ELEC_CAND_DATA_ENTRY_UID;

_candidates_index set [count(_candidates_index), _candidate_uid];
_candidates_data set [count(_candidates_data), _candidate_data];
[_election_id, _candidates] call A_voting_menu_fnc_set_candidates;
