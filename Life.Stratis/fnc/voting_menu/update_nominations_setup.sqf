// A_voting_menu_fnc_update_nominations_setup

#include "header.h"


if (!(isServer)) exitWith {};
voting_update_nominations_request_buffer =  " ";
publicVariableServer "voting_update_nominations_request_buffer";
"voting_update_nominations_request_buffer" addPublicVariableEventHandler { _this call A_voting_menu_fnc_update_nominations_request_receive;};
