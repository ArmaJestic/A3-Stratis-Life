// A_home_fnc_setobject



_home = _this select 0;
_home_pos = _home select A_home_var_position;
_home_object = nearestObjects [[(_home_pos select 0), (_home_pos select 1), (_home_pos select 2)], ["House"], 5] select 0;
_home set [A_home_var_object, _A_home_var_object];
_home_object
