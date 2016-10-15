// A_init_fnc_gamecheck
// checks if game is
// multiplayer
// server & dedicated
// client

#include "header.h"


if (isMultiplayer) then {
	// Is multiplayer game
	if (isServer) then {
		if (isDedicated) then {
			// Is dedicated server
			"A INIT: is dedicated server" call A_err_fnc_logd;
		}else{
			// Not dedicated server
			"A INIT ERROR: GAME SERVER NOT DEDICATED" call A_err_fnc_end;
		};
	}else{
		// Not server
		if (hasInterface) then {
			// is player
			"A INIT: is player" call A_err_fnc_logd;
		}else{
			// is headless client
			"A INIT: is headless client" call A_err_fnc_logd;
		};
	};
}else{
	// Not a multiplayer game
	"A INIT ERROR: NOT RUNNING IN MULTIPLAYER" call A_err_fnc_end;
};