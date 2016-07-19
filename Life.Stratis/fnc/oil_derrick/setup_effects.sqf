// A_oil_derrick_fnc_setup_effects

#include "../../includes/dikcodes.h"
#include "../../includes/macro.h"


player groupChat format["A_oil_derrick_fnc_setup_effects %1", _this];
ARGV(0,_id);

private["_gusher", "_pump"];
_gusher = missionNamespace getVariable ["gusher_" + _id, objNull];
_pump = missionNamespace getVariable ["pump_" + _id, objNull];
if (isNull _gusher || {isNull _pump}) exitWith {};

private["_ps1"];
_ps1 = "#particlesource" createVehicle getPos _gusher;
_ps1 setParticleCircle [0, [0, 0, 0]];
_ps1 setParticleRandom [0, [0.05, 0.05, 0], [0.2, 0.2, 3], 1,  1, [0, 0, 0, 0], 0, 0];
_ps1 setParticleParams [["\A3\data_f\ParticleEffects\Universal\Universal", 16, 14, 1, 0], "", "Billboard", 1, 1.5, [0, 0, 0], [0, 0, 0], 1, 2, 1, 0.2, [0.12, 0.12], [[0.168, 0.125, 0.054 ,1], [0.168, 0.125, 0.054 ,0.5], [0.168, 0.125, 0.054 ,0.3]], [1000], 1, 0, "", "", _gusher];
_ps1 setDropInterval 0.001;


private["_ps2"];
_ps2 = "#particlesource" createVehicle getPos _gusher;
_ps2 setParticleCircle [0, [0, 0, 0]];
_ps2 setParticleRandom [0, [0.05, 0.05, 0], [0.07, 0.07, 2], 1,  1.5, [0, 0, 0, 0], 0, 0];
_ps2 setParticleParams [["\A3\data_f\ParticleEffects\Universal\Universal", 16, 7, 2, 0], "", "Billboard", 1, 0.4, [0, 0, 0], [0, 0, 0], 1, 2, 1, 0.2, [0.05, 0.05], [[0.168, 0.125, 0.054 ,1], [0.168, 0.125, 0.054 ,0.5], [0.168, 0.125, 0.054 ,0.3]], [1000], 1, 0, "", "", _gusher];
_ps2 setDropInterval 0.001;

[_pump] spawn A_oil_derrick_fnc_sound_loop;
