// A_server_fnc_stationrob_loop

#include "header.h"


if (A_main_var_station1money < A_main_var_maxstationmoney) then {
	private _randomamount = ceil ((random 250) + 250);
	missionNamespace setVariable["A_main_var_station1money",((A_main_var_maxstationmoney) min (A_main_var_station1money + _randomamount)),true];
};