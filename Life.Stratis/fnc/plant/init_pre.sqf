// A_plant_fnc_init_pre

#include "header.h"


A_plant_var_seed_data = [
	["coca_seedling", "coca", "\a3\plants_f\bush\b_NeriumO2s_white_F.p3d",  300, [1,1], "Unprocessed_Cocaine", ["cocafield"], 15],
	["marijuana_seedling", "marijuana", "\a3\plants_f\bush\b_NeriumO2s_F.p3d",  300, [1,1], "Unprocessed_Marijuana", ["marifield"], 15],
	["poppy_seedling",  "poppy", "\a3\plants_f\bush\b_NeriumO2d_F", 300, [1,1], "Unprocessed_Heroin", ["heroinfield"], 15]
];

if (!isServer) then {
	A_plant_var_actions_netid = "";
	A_plant_var_actions = [];
	A_plant_var_harvest_yield_active = false;
};