// A_settings_fnc_init2

#include "..\..\includes\macro.h"

if (!isServer) then {
	setViewDistance A_settings_var_gfx_armaviewdistance;
	setTerrainGrid (A_settings_var_gfx_armaterraingrids select A_settings_var_gfx_armaterraingridsSel);
};
