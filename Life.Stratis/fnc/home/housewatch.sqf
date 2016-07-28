// A_home_fnc_housewatch



while {true} do {
	{
		_home = _x;
		_A_home_var_name = _home select A_home_var_name;
		_c_home = server getVariable [_home_name, ""];

		if (!([_c_home] call A_home_fnc_isforsale)) then {
			if (!([_c_home] call A_home_fnc_isownerconnected)) then {
				[_c_home] call A_home_fnc_setforsale;
			};
		};
	} forEach homes_list;
	sleep 1;
};
