// init2

#include "..\..\includes\dikcodes.h"
#include "..\..\includes\macro.h"

if (isServer) then {
	["oil1", [4164.67,3300.88,0.6],[250.826,-2.68511,5.76279]] call A_oil_derrick_fnc_setup_structure;
	["oil2", [2578.17,4910.64,0.607201],[334.668,1.85061,12.6592]] call A_oil_derrick_fnc_setup_structure;
	[] spawn A_oil_derrick_fnc_barrel_loop;
	
	oil_derrick_setup_complete = true;
	publicVariable "oil_derrick_setup_complete";
};

if (!isServer) then {
	waitUntil {(!(isNil "oil_derrick_setup_complete") && {oil_derrick_setup_complete})};
	
	["oil1"] call A_oil_derrick_fnc_setup_effects;
	["oil2"] call A_oil_derrick_fnc_setup_effects;
};