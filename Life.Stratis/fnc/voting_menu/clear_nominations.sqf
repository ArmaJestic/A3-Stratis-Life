// A_voting_menu_fnc_clear_nominations

#include "header.h"


ARGV(0,_election_id);
[_election_id, [[],[]]] call  A_voting_menu_fnc_set_nominations;
([_election_id] call A_voting_menu_fnc_update_nomination_version)
