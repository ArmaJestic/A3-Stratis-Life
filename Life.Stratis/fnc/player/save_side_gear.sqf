// A_player_fnc_save_side_gear
// why the hell is this serverside

#include "header.h"


params["_player"];
if (!([_player] call A_player_fnc_exists)) exitWith {};

if (isServer) then {
	["", [_player]] call A_player_fnc_side_gear_request_receive;
}else{
	VAR_PV_SIDE_GEAR_REQUEST = [_player];
	publicVariableServer QVAR_PV_SIDE_GEAR_REQUEST;
};