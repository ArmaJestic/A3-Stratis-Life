// A_stats_fnc_client_server_setup_wait

#include "..\..\includes\macro.h"

private["_complete"];
	
waitUntil {
	_complete = server getVariable "stats_server_setup_complete";
	_complete = if (undefined(_complete)) then {false} else { _complete};
	_complete = if (typeName _complete != "BOOL") then {false} else { _complete };
	if (_complete) exitWith {true};
	false
};
_complete
