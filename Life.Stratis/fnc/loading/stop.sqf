// A_loading_fnc_stop

#include "..\..\includes\macro.h"


LOGED(A_loading_fnc_stop)

// sleep may not be needed
if (!isServer) then { 
	uiSleep 1;
};

endLoadingScreen;
A_loading_var_active = false;

// only for the server, broadcasts to all clients when done
if (isServer) then {
	missionNamespace setVariable[A_loading_var_name_server_done, true, true];
};
