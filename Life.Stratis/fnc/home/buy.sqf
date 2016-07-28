// A_home_fnc_buy



_home = _this select 0;
_owner_name = name player;
_owner_uid = getPlayerUID player;

_home set [A_home_var_owner_uid, _owner_uid];
_home set [A_home_var_owner_name, _owner_name];
_home set [A_home_var_locked, false];
player groupChat format["You bought this house for $%1", _home select A_home_var_buying_price];

[_home] call A_home_fnc_updateactions;    

A_home_var_msg = [_owner_name, "all", "update_home", _home];
publicVariable "A_home_var_msg";
