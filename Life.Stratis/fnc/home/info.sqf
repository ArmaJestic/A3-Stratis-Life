// A_home_fnc_info



_home = _this select 0;

_A_home_var_owner_name = _home select A_home_var_owner_name;

if (_home_owner_name == "") then {
	hint format["This house is for sale", _home select A_home_var_buying_price];
}else{
	hint format["This house belongs to %1", _home_owner_name];
};
