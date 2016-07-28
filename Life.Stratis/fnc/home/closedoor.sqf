// A_home_fnc_closedoor



_home = _this select 0;
_A_home_var_object = _home select A_home_var_object;

{_home_object animate [format ["%1", _x], 0]} foreach A_home_var_doors_zeroes;
{_home_object animate [format ["%1", _x], 1]} foreach A_home_var_doors_ones;
