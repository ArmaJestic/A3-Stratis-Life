// A_speed_gun_fnc_hidden_check

#include "..\..\includes\macro.h"
#include "..\..\includes\constants.h"


if (!(A_inv_var_shortcuts) && !(A_speed_gun_var_hidden)) then {
	[] call A_speed_gun_fnc_hud_remove;
	A_speed_gun_var_hidden = true;
};

if (A_inv_var_shortcuts && A_speed_gun_var_hidden) then {
	[] call A_speed_gun_fnc_hud_setup;
	A_speed_gun_var_hidden = false;
};

true
