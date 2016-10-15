// A_bases_fnc_init
// runs setup for all the bases

#include "header.h"


// airfield base
call A_bases_fnc_airfield;


// limbo base
[[3945.04,4400.83,8000],[0,0,0]] call A_bases_fnc_limbo; 
missionNamespace setVariable["A_bases_var_limbo",true,true];


// pythose base
call A_bases_fnc_pythos;

// 2 underwater bases (floating and underwater)
A_bases_var_underwater = [
	[[6638.99,6720.81,-35], "_submerged"],
	[[8150,50,1.5], "_floating"]
];
publicVariable "A_bases_var_underwater";

{
	_x call A_bases_fnc_underwater
} forEach A_bases_var_underwater;

respawn_east_proxy_floating setVariable["respawn",true,true];
respawn_east_proxy_floating setVariable["radius",5,true];
missionNamespace setVariable["respawn_east_proxy",respawn_east_proxy_floating,true];


// oil derricks
A_bases_var_oil_derrick_barrels = [];
A_bases_var_oil_derrick = [
	["oil1", [4164.67,3300.88,0.6],[250.826,-2.68511,5.76279]],
	["oil2", [2578.17,4910.64,0.607201],[334.668,1.85061,12.6592]]
];
publicVariable "A_bases_var_oil_derrick";

{
	_x call A_bases_fnc_oil_derrick
} forEach A_bases_var_oil_derrick;

[A_bases_fnc_oil_derrick_barrel_loop,30] call A_frame_fnc_perFrame;


// rig
[[7726.48,2745.52,-0.6]] call A_bases_fnc_rig;
respawn_guerrila_proxy setVariable["respawn",true,true];
respawn_guerrila_proxy setVariable["radius",5,true];


// bunker
["Civilian Bunker", [3060.91,6108.9,0.878565]] call A_bases_fnc_bunker_create;


// blue4 bunker
["Blue4 Bunker", [2446.85,5686.52,8000]] call A_bases_fnc_bunker_blf_create;
//	[west,"respawn_blue4"] call BIS_fnc_addRespawnPosition;
respawn_blue4_proxy setVariable["respawn",true,true];
respawn_blue4_proxy setVariable["radius",5,true];


// shoothouse
[[1763.11,5308.78,0.43],[91.997,0,0]] call A_bases_fnc_shoothouse;