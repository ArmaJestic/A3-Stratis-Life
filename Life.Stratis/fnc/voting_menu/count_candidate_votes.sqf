// A_voting_menu_fnc_count_candidate_votes

#include "../../includes/constants.h"
#include "../../includes/macro.h"


ARGV(0,_candidate_data);

if (undefined(_candidate_data)) exitWith {0};

private["_candidate_votes"];

_candidate_votes = _candidate_data select A_voting_menu_var_election_candidates_data_entry_vote_data;

(count (_candidate_votes))
