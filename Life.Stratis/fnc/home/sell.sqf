// A_home_fnc_sell



//hint format["%1", _this];
_home = _this select 0;
_owner_name = name player;

_home set [A_home_var_owner_uid, ""];
_home set [A_home_var_owner_name, ""];
_home set [A_home_var_locked, false];
player groupChat format["You sold this house for $%1", _home select A_home_var_selling_price];

[_home] call A_home_fnc_updateactions;

A_home_var_msg = [_owner_name, "all", "update_home", _home];
publicVariable "A_home_var_msg";
