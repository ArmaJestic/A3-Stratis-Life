// A_object_fnc_underwater_bleed

#include "../../includes/macro.h"

 _this spawn {
ARGV(0,_object);
ARGV(1,_duration);

if (undefined(_object)) exitWith {};
if (undefined(_duration)) exitWith {};


private["_timeout"];
_timeout = time + _duration;
waitUntil {
	drop[["\A3\data_f\ParticleEffects\Universal\Universal", 16, 12, 9, 0], "", "Billboard", 0, 10, [random 0.1,random 0.1, random 0.1],[0,0,0], random 2, 12.75, 10.025, 0, [0.2, (random 1.5) + 0.5],  [[0.2,0,0,0.5],[0.2,0,0,0.4],[0.2,0,0,0.3],[0.2,0,0,0.22],[0.2,0,0,0.16],[0.2,0,0,0.08],[0.2,0,0,0.01]],[0.4,0.1], 0, 3, "", "", _object];
	sleep 0.05;
	(time > _timeout)
}
};
