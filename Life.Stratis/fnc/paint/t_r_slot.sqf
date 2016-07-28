// A_paint_fnc_t_r_slot



private ["_c", "_x", "_cfg1", "_cfg2"];

_cfg1 = getArray (configFile >> "CfgVehicles" >> P_Preview_Class >> "hiddenselections");
_cfg2 = getArray (configFile >> "CfgVehicles" >> P_Preview_Class >> "hiddenselectionstextures");

P_T_SSlot = parseNumber (lbData [1502, (lbCurSel 1502)]);

P_Preview_Unit setObjectTexture [P_T_SSlot, _cfg2 select P_T_SSlot];
