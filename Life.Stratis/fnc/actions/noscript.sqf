// A_actions_fnc_noscript
// Used to execute code from actions
// Useless now, addAction supports calling code instead of just scripts

#include "..\..\includes\macro.h"

diag_log format['A_actions_fnc_noscript start: %1', _this];
if !(params [["_target", null], ["_caller", null], ["_id", null, [0]], ["_com", null]]) exitwith {LOGE_EP(A_actions_fnc_noscript)};

// call compile with strings from majority of the actions is a security risk
if ((typeName _com) == "ARRAY") exitwith {
	{[_target, _caller, _id] call compile format ["%1", _x];} forEach _com;
};
if ((typeName _com) == "STRING") exitwith {
	[_target, _caller, _id] call compile format ["%1", _com];
};
if ((typeName _com) == "CODE") exitwith {
	[_target, _caller, _id] call _com;
};