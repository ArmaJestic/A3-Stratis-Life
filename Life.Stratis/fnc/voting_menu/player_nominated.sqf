// A_voting_menu_fnc_player_nominated

#include "header.h"


ARGV(0,_election_id);
ARGV(1,_nominee);

if (UNDEFINED(_election_id)) exitWith {false};
if (typeName _election_id != "STRING") exitWith {false};
if (!([_nominee] call A_player_fnc_exists)) exitWith {false};

private["_nominations"];
_nominations = [_election_id] call A_voting_menu_fnc_get_nominations;
if (UNDEFINED(_nominations)) exitWith {false};

private["_nomintions_index"];
_nominations_index = _nominations select INDEX_ELEC_NOMI_INDEX;

private["_uid"];
_uid = getPlayerUID _nominee;

//auto nominate the incumbent
private["_incumbent_candidate_data", "_incumbent_candidate_uid"];
_incumbent_candidate_data = [_election_id] call A_voting_menu_fnc_get_incumbent_candidate;
_incumbent_candidate_uid = if (UNDEFINED(_incumbent_candidate_data)) then {""} else {_incumbent_candidate_data select INDEX_DATA_ELEC_CAND_DATA_ENTRY_UID};

(((_nominations_index find _uid) >= 0) || (_uid == _incumbent_candidate_uid))
