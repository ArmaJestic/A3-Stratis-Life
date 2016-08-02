// A_bombs_fnc_init2

#include "..\..\includes\macro.h"


//if (isServer) then {["server"] spawn A_SCRIPT_BOMBS;};
//["client"] spawn A_SCRIPT_BOMBS;

if (isServer) then {
	[] spawn A_bombs_fnc_server;
}else{
	A_bombs_var_getarr = true;
	publicVariable "A_bombs_var_getarr";
	[] spawn A_bombs_fnc_client;
};
