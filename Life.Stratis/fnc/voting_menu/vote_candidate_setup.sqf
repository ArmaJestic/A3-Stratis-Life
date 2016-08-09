// A_voting_menu_fnc_vote_candidate_setup

#include "..\..\includes\constants.h"
#include "..\..\includes\macro.h"


if (!(isServer)) exitWith {};
voting_vote_candidate_request_buffer =  " ";
publicVariableServer "voting_vote_candidate_request_buffer";
"voting_vote_candidate_request_buffer" addPublicVariableEventHandler { _this call A_voting_menu_fnc_vote_candidate_request_receive;};
