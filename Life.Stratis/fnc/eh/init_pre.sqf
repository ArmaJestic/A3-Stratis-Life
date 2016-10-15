// A_eh_fnc_init_pre
// pre-init, for mission event handler setting
// called from A_init_fnc_pre

#include "..\..\includes\macro.h"

if (isServer) then {
	addMissionEventHandler["PlayerConnected",A_eh_fnc_player_connected];
	addMissionEventHandler["PlayerDisconnected",A_eh_fnc_player_disconnected];
}else{
	
};