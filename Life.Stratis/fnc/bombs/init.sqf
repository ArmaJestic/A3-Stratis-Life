// A_bombs_fnc_init

#include "..\..\includes\macro.h"


if (isServer) then {
	[] call A_bombs_fnc_server;
}else{
	[] call A_bombs_fnc_client;
};