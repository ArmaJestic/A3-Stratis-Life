// A_drug_fnc_cocaine_effects

#include "../../includes/dikcodes.h"
#include "../../includes/macro.h"

 _this spawn {
ARGV(0,_player);
ARGV(1,_duration);

private["_effect1", "_force"];
_effect1 = ppEffectCreate ["chromAberration", 200];
_effect1 ppEffectEnable true;


private["_timeout"];
_timeout = time + _duration;
waitUntil {
	_force = random 10;
	_effect1 ppEffectAdjust [_force / 24, _force / 24, false];
	_effect1 ppEffectCommit (0.3 + random 0.1);
	waituntil {ppEffectCommitted _effect1};
	(time > _timeout)
};

ppEffectDestroy _effect1;
};
