// A_home_fnc_getkey



_home = _this select 0;
_owner = _home select A_home_var_owner_name;
_uid = _home select A_home_var_owner_uid;

if (_owner == "" or _uid == "") exitWIth {"";};

format["%1_%2", _owner, _uid]
