// A_rig_fnc_init2

#include "..\..\includes\constants.h"
#include "..\..\includes\macro.h"

if (isServer) then {
	[[7726.48,2745.52,-0.6]] call A_rig_fnc_setup;
};

if (isClient) then {
/*	waitUntil {(not(isNil "rig_setup_complete") && {rig_setup_complete})};
	player groupChat format["insatm = %1", insatm];
	player grouPChat format["insclothes = %1", insclothesbox];
*/

	waitUntil {missionNamespace getVariable ["rig_setup_complete", false]};
	player groupChat format["insatm = %1", missionNamespace getVariable ["insatm", "Error"]];
	player grouPChat format["insclothes = %1", missionNamespace getVariable ["insclothesbox", "Error"]];
	
	respawn_guerrila_proxy setVariable ["respawn", true, true];
	respawn_guerrila_proxy setVariable ["radius", 5, true];
};