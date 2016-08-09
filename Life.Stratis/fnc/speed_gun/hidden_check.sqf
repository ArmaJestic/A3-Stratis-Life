// A_speed_gun_fnc_hidden_check

#include "..\..\includes\constants.h"
#include "..\..\includes\macro.h"


if (!(INV_shortcuts) && !(A_speed_gun_var_hidden)) then {
	[] call A_speed_gun_fnc_hud_remove;
	A_speed_gun_var_hidden = true;
};

if (INV_shortcuts && A_speed_gun_var_hidden) then {
	[] call A_speed_gun_fnc_hud_setup;
	A_speed_gun_var_hidden = false;
};

true
