// A_quarry_fnc_init_pre

#include "header.h"


A_quarry_var_data = [
    [["quarry1",50],"sand",10],
    [["quarry2",50],"sand",10]
];

if (!isServer) then {
	A_quarry_var_interact_use_shovel_active = false;
	A_quarry_var_interact_sand_hits = 0;
};