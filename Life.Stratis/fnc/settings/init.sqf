// A_settings_fnc_init

#include "..\..\includes\macro.h"


A_settings_var_gfx_armaviewdistance = 2000;
A_settings_var_gfx_armaterraingrids = [25, 12.5, 6.25];
A_settings_var_gfx_armaterraingridssel = 1;

setViewDistance A_settings_var_gfx_armaviewdistance;
setTerrainGrid (A_settings_var_gfx_armaterraingrids select A_settings_var_gfx_armaterraingridsSel);