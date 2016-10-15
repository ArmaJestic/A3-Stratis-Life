// A_voting_menu_fnc_count_candidate_votes

#include "header.h"


ARGV(0,_candidate_data);

if (UNDEFINED(_candidate_data)) exitWith {0};

private["_candidate_votes"];

_candidate_votes = _candidate_data select INDEX_DATA_ELEC_CAND_DATA_ENTRY_VOTE_DATA;

(count (_candidate_votes))
