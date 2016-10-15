// A_err_fnc_end
// used to end the mission, for failure in loading generally
// receives a string for a message to display

#include "header.h"


// may be bad to verify the arguments to the end call
// todo: make useless after a certain time period, abusable

params [["_str","null",[""]]];

format["A_err_fnc_end: %1", _str] call A_err_fnc_log;
endMission "LOSER";