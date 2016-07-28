// A_home_fnc_setforsale



_home = _this select 0;

_home set [A_home_var_owner_name, ""];
_home set [A_home_var_owner_uid, ""];
_home set [A_home_var_locked, false];

if (!isDedicated) then {
	[_home] call A_home_fnc_updateactions;
};


A_home_var_msg = ["server", "all", "update_home", _home];
publicVariable "A_home_var_msg";
