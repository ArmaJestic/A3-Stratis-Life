// A_time_fnc_pv_reset

#include "header.h"


if (isServer) then {
	params[["_var_name",null,[""]],"_args"];
	_args params[["_sunrise",null,[0]],["_sunset",null,[0]]];

	if (UNDEFINED(_sunrise)) exitWith {};
	if (UNDEFINED(_sunset)) exitWith {};

	missionNamespace setVariable[QVAR_TIME_RISE_TO_SET_MINS,_sunrise,true];
	missionNamespace setVariable[QVAR_TIME_SET_TO_RISE_MINS,_sunset,true];
	
	publicVariable QVAR_PV_RESET;
}else{
	[true] call A_time_fnc_loop;
};