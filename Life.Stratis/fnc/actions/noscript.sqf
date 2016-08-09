// A_other_fnc_noscript
// Used to execute code from actions
// Useless now, addAction supports calling code instead of just scripts

#include "..\..\includes\macro.h"


//_target = _this select 0;
//_caller = _this select 1;
//_id = _this select 2;
//_com = _this select 3;

//private _err = params[["_target", null], ["_caller", null], ["_id", null, [0]], ["_com", null]];
//EXT_ERR(_err, A_other_fnc_noscript)

//PARAM_EXIT(A_other_fnc_noscript, [["_target", null], ["_caller", null], ["_id", null, [0]], ["_com", null]])
if !(params [["_target", null], ["_caller", null], ["_id", null, [0]], ["_com", null]]) exitwith {LOGE_EP(A_other_fnc_noscript)};

// call compile with strings from majority of the actions is a security risk
if ((typeName _com) == "ARRAY") then {
	{[_target, _caller, _id] call compile format [ "%1", _x];} forEach _com;
}else{
	[_target, _caller, _id] call compile format [ "%1", _com];
	
};
