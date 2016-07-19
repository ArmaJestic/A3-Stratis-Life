// A_stats_fnc_client_wait_uid

#include "..\..\includes\macro.h"

private["_uid"];

//work-around cannot do waitUtil in preloading screen
waitUntil {
	_uid = [player] call A_stats_fnc_get_uid;
	if (_uid != "") exitWith {true};
	false
};

_uid
