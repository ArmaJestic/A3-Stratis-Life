// A_paint_fnc_t_r_all



private ["_cfg1", "_cfg2", "_x", "_n"];

_cfg1 = getArray (configFile >> "CfgVehicles" >> P_Preview_Class >> "hiddenselections");
_cfg2 = getArray (configFile >> "CfgVehicles" >> P_Preview_Class >> "hiddenselectionstextures");

_n = 0;
{
	P_Preview_Unit setObjectTexture [_n, _x];
	_n = _n + 1;
} foreach _cfg2;

A_paint_var_t_p = [];
P_T_Change = false;
