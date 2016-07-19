// A_drug_fnc_lsd_effects

#include "..\..\includes\dikcodes.h"
#include "..\..\includes\macro.h"

 _this spawn {
ARGV(0,_player);
ARGV(1,_duration);

private["_effect1", "_effect2"];
_effect1 = ppEffectCreate ["WetDistortion", 300];
_effect1 ppEffectEnable true;
_effect1 ppEffectAdjust [0.5, 1, 1, 4.1, 3.7, 2.5, 1.85, 0.0051, 0.0051, 0.0051, 0.0051, 0.5, 0.3, 10, 6.0];
_effect1 ppEffectCommit 5;

_effect2 = ppEffectCreate ["chromAberration", 200];
_effect2 ppEffectEnable true;
_effect2 ppEffectAdjust [0.2,0.2,true];
_effect2 ppEffectCommit 1;
	

_duration = _duration/2;
private["_timeout"];
_timeout = time + _duration;
waitUntil {
	private["_position", "_weite"];
	_position = getPos _player;
	_weite = 100;
	
	private["_x", "_y", "_z"];
	_x = _position select 0;
	_y = _position select 1;
	_z = _position select 2;
	
	private["_w1", "_w2", "_w3"];
	_w1 = (random _weite) - (random _weite);
	_w2 = (random _weite) - (random _weite);
	_w3 = random 7;
	
	private["_f1", "_f2", "_f3"];
	_f1 = random 1;
	_f2 = random 1;
	_f3 = random 1;
	
	private["_g1", "_g2", "_g3"];
	_g1 = random 5;
	_g2 = random 10;
	_g3 = random 5;
		
	private["_v1", "_v2", "_v3"];
	_v1 = random 0.05;
	_v2 = random 0.05;
	_v3 = 0.1 - random 0.075;
	private["_index"];
	_index = [1,6,7,8,13] select floor(random 5);
	drop [["\A3\data_f\ParticleEffects\Universal\Universal", 16, 12, _index, 0],  "", "Billboard", 1, _duration, [_x + _w1, _y + _w2, _z + _w3], [_v1, _v2, _v3], 1, 1.275, 1, 0, [_g1, _g2, _g3], [ [_f1, _f2, _f3, 1], [_f2, _f1, _f3, 1], [_f3, _f2, _f1, 1] ], [1000], 3, 0.2, "", "", ""];
	
	sleep 0.05;
	(time > _timeout)
};

sleep _duration;
ppEffectDestroy _effect1;
ppEffectDestroy _effect2;
};
