// A_loading_fnc_start

#include "..\..\includes\macro.h"


if (isServer) exitwith {
	LOGED(A_loading_fnc_start, call on server)
};

LOGED(A_loading_fnc_start)

A_loading_var_active = true;
startLoadingScreen["" , "customLoadingScreen"];

if (!isServer) {
	uiSleep 1;
};