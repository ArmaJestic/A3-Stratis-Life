// A_voting_menu_fnc_update_nominations

#include "..\..\includes\constants.h"
#include "..\..\includes\macro.h"


voting_update_nominations_request_buffer = _this;
if (isServer) then {
	["", voting_update_nominations_request_buffer] call A_voting_menu_fnc_update_nominations_request_receive;
}
else {
	publicVariable "voting_update_nominations_request_buffer";
};
