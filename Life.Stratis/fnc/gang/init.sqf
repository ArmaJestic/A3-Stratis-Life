// A_gang_fnc_init

#include "header.h"


if (isServer) then {
	[] call A_gang_fnc_area_poles_setup;
}else{
	A_gang_var_area_actions = [];
	[] call A_gang_fnc_loop;
	[player] call A_gang_fnc_area_actions_setup;
};