// A_time_fnc_init_pre
// pre-init (A_init_fnc_pre)
// this whole time system has to go/be reworked
// setTimeMultiplier will do perfectly

#include "header.h"


QVAR_PV_RESET addPublicVariableEventHandler A_time_fnc_pv_reset;
if (isServer) then {	
	missionNamespace setVariable[QVAR_TIME_RISE_TO_SET_MINS,120,true];
	missionNamespace setVariable[QVAR_TIME_SET_TO_RISE_MINS,10,true];
	missionNamespace setVariable[QVAR_TIME_OFFSET,VAR_TIME_SET_TO_RISE_MINS,true];
}else{
	QVAR_TIME_RISE_TO_SET_MINS addPublicVariableEventHandler {VAR_TIME_RISE_TO_SET = (_this select 1) * 60; VAR_TIME_FULL_DAY = VAR_TIME_RISE_TO_SET + VAR_TIME_SET_TO_RISE;};
	QVAR_TIME_SET_TO_RISE_MINS addPublicVariableEventHandler {VAR_TIME_SET_TO_RISE = (_this select 1) * 60; VAR_TIME_FULL_DAY = VAR_TIME_RISE_TO_SET + VAR_TIME_SET_TO_RISE;};
//	QVAR_TIME_OFFSET addPublicVariableEventHandler {};
};