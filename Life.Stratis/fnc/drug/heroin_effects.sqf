// A_drug_fnc_heroin_effects

#include "..\..\includes\dikcodes.h"
#include "..\..\includes\macro.h"

 _this spawn {
ARGV(0,_player);
ARGV(1,_duration);


private["_effect1", "_effect2"];
_effect1 = ppEffectCreate ["RadialBlur", 100];
_effect1 ppEffectEnable true;

_effect2 = ppEffectCreate ["chromAberration", 200];
_effect2 ppEffectEnable true;


private["_timeout"];
_timeout = time + _duration;
waitUntil {
	_effect1 ppEffectAdjust [1,1,0,0];
	_effect1 ppEffectCommit 1;
	
	_effect2 ppEffectAdjust [random 0.1,random 0.1,true];
	_effect2 ppEffectCommit 3;
	
	3 setFog (random 1);
	waituntil {
		addCamShake [random 10, random 1, random 25];
		ppEffectCommitted _effect2
	};
	(time > _timeout)
};

3 setFog 0;
ppEffectDestroy _effect1;
ppEffectDestroy _effect2;
};
