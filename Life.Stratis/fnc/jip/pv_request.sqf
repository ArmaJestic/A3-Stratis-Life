// A_jip_fnc_pv_request
#include "header.h"


params[["_variable",null,[""]],["_params",null,[[]]]];
if UNDEFINED(_params) exitWith {};

_params params[["_args",null,[]],["_fnc",null,[""]],["_condition",null,[0,objNull]],["_jip",true,[false]]];
diag_log format['A_jip_fnc_pv_request(%1): fnc(%2)%3, arguments(%4)%5',_this,(typeName _fnc),_fnc,(typeName _args),_args];
if UNDEFINED(_fnc) exitwith {diag_log format['A_jip_fnc_pv_request(%1): exit1',_this];};


private _jip_id = null;

if DEFINED(_condition) then {	
	private _typeName = typeName _condition;
	
	// game will handle removal when given object goes null
	if (_typeName == "OBJECT") exitwith {
		_jip_id = _args remoteExecCall[_fnc,0,_condition];
	};
	
	// after delay, remove jip
	// has to be run on the server
	if (_typeName == "SCALAR") exitwith {
		_jip_id = _args remoteExecCall[_fnc,0,_jip];
		
		// remove JIP after delay
		// is this correct format for JIP override?
		[_condition,[_jip_id],{remoteExecCall["",(_this select 0)];}] call A_frame_fnc_wait;
	};
}else{
	_jip_id = _args remoteExecCall[_fnc,0,_jip];
};

// if nil return, error occured
// or was never called
if UNDEFINED(_jip_id) then {diag_log format['A_jip_fnc_register(%1): remoteExecCall failed (nil _jip_id), %2(%3),%4',_this,_fnc,_args,_condition];};