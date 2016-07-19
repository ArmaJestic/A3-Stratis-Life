// A_drug_fnc_marijuana_effects

#include "..\..\includes\dikcodes.h"
#include "..\..\includes\macro.h"

 _this spawn {
ARGV(0,_player);
ARGV(1,_duration);

private["_shell"];
_shell = "SmokeShellGreen" createVehicle position player;
_shell attachTo [(vehicle _player),[0,0,0]];



private["_effect1", "_effect2"];
_effect1 = ppEffectCreate ["colorCorrections", 1501];
_effect1 ppEffectEnable true;

_effect2 = ppEffectCreate ["chromAberration", 200];
_effect2 ppEffectEnable true;


private["_timeout"];
_timeout = time + _duration;
waitUntil {
	_effect1 ppEffectAdjust [1, 1, 0, [0,0,0,0.5], [random 5 - random 5,random 5 - random 5,random 5 - random 5,random 1], [random 5 - random 5,random 5 - random 5,random 5 - random 5, random 1]];
	_effect1 ppEffectCommit 1;
	
	_effect2 ppEffectAdjust [0.01,0.01,true];
	_effect2 ppEffectCommit 1;
	sleep 3;
	(time > _timeout)
};

ppEffectDestroy _effect1;
ppEffectDestroy _effect2;
};
