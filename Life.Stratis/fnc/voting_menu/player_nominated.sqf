// A_voting_menu_fnc_player_nominated

#include "..\..\includes\constants.h"
#include "..\..\includes\macro.h"


ARGV(0,_election_id);
ARGV(1,_nominee);

if (undefined(_election_id)) exitWith {false};
if (typeName _election_id != "STRING") exitWith {false};
if (not([_nominee] call A_player_fnc_exists)) exitWith {false};

private["_nominations"];
_nominations = [_election_id] call A_voting_menu_fnc_get_nominations;
if (undefined(_nominations)) exitWith {false};

private["_nomintions_index"];
_nominations_index = _nominations select A_voting_menu_var_election_nominations_index;

private["_uid"];
_uid = getPlayerUID _nominee;

//auto nominate the incumbent
private["_incumbent_candidate_data", "_incumbent_candidate_uid"];
_incumbent_candidate_data = [_election_id] call A_voting_menu_fnc_get_incumbent_candidate;
_incumbent_candidate_uid = if (undefined(_incumbent_candidate_data)) then {""} else {_incumbent_candidate_data select A_voting_menu_var_election_candidates_data_entry_uid};

(((_nominations_index find _uid) >= 0) || (_uid == _incumbent_candidate_uid))
