// A_home_fnc_main



if (isServer) then {
	_homes_count = count homes_list;

	for [{_i = 0}, {_i < _homes_count}, {_i=_i+1}] do {    
		_home = homes_list select _i;
		_home_object = [_home] call A_home_fnc_setobject;
		_A_home_var_name = _home select A_home_var_name;
		server setVariable [_home_name, _home];

		[_home] spawn A_home_fnc_homelogic;

		if (!isDedicated) then {
			server setVariable [_home_name, [_home] call A_home_fnc_updateactions];
		};
	};

	[] spawn A_home_fnc_housewatch;
}else{
	A_home_var_msg = [name player, "server", "request_homes",""];
	publicVariable "A_home_var_msg";
};
