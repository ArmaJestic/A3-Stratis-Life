// A_voting_menu_fnc_menu_list_changed

#include "header.h"


//player groupChat format["A_voting_menu_fnc_menu_list_changed %1", _this];
ARGV(0,_control);
ARGV(1,_index);
ARGV(2,_election_id);
ARGV(3,_voter);

private["_candidate_uid"];
_candidate_uid = _control lnbData [_index, 0];

[_election_id, _voter, _candidate_uid] call A_voting_menu_fnc_vote_candidate;
