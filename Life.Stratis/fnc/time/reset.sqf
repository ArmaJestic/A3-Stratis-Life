// A_time_fnc_reset

#include "header.h"


params[["_sunrise",null,[0]],["_sunset",null,[0]]];

if (UNDEFINED(_sunrise)) exitWith {};
if (UNDEFINED(_sunset)) exitWith {};

if (isServer) then {
	["",[_sunrise,_sunset]] call A_time_fnc_pv_reset;
}else{
	VAR_PV_RESET = [_sunrise,_sunset];
	publicVariableServer QVAR_PV_RESET;
};