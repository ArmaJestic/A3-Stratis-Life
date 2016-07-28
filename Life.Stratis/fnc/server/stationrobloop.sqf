// A_server_fnc_stationrobloop

#include "..\..\includes\macro.h"

// server keeps track of cash in gas stations, and makes the variable public
while {true} do {
	_randomamount = ceil ((random 250) + 250);
	if (station1money < A_main_var_maxstationmoney) then {
		station1money = station1money + _randomamount;
		if (station1money > A_main_var_A_main_var_maxstationmoney) then {station1money = A_main_var_A_main_var_maxstationmoney;};
	};
	publicvariable "station1money";

	sleep 30;
};
