// A_voting_menu_fnc_vote_candidate

#include "../../includes/constants.h"
#include "../../includes/macro.h"


voting_vote_candidate_request_buffer = _this;
if (isServer) then {
	["", voting_vote_candidate_request_buffer] call A_voting_menu_fnc_vote_candidate_request_receive;
}
else {
	publicVariable "voting_vote_candidate_request_buffer";
};
