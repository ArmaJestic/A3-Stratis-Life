// A_home_fnc_isdooropening



_home = _this select 0;
_A_home_var_object = _home select A_home_var_object;

_opening = false;

{
	if((_home_object animationPhase format ["%1", _x]) > 0)exitWith { _opening = true;};
} foreach A_home_var_doors_zeroes;

{
	if((_home_object animationPhase format ["%1", _x]) < 1)exitWith { _opening = true;};
} foreach A_home_var_doors_ones;

_opening
