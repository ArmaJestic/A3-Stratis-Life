// A_home_fnc_unlock



_home = _this select 0;
_owner_name = name player;

_home set [A_home_var_locked, false];
player groupChat "House is now unlocked";

[_home] call A_home_fnc_updateactions;    

A_home_var_msg = [_owner_name, "all", "update_home", _home];
publicVariable "A_home_var_msg";
