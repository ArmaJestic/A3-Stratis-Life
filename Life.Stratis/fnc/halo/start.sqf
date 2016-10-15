// A_halo_fnc_start

#include "..\..\includes\macro.h"


sleep 1;
_unit = player;

if (!local _unit) exitWith {null};

//--- Init
_dir = ([[0,0,0],velocity _unit] call bis_fnc_dirto);
_unit setdir _dir;
_unit switchmove "HaloFreeFall_non";


_brightness = 0.99;
_pos = position player;
_parray = [
		["\Ca\Data\ParticleEffects\Universal\Universal", 16, 12, 13, 0],
		"",
		"Billboard",
		1,
		3,
		[0,0,-200],
		wind,
		0,
		1.275,
		1,
		0,
		[100],
		[
					[_brightness,_brightness,_brightness,0],
					[_brightness,_brightness,_brightness,0.01],
					[_brightness,_brightness,_brightness,0.10],
					[_brightness,_brightness,_brightness,0]
				],
		[1000],
		0,
		0,
		"",
		"",
		player
];
halo_clouds = "#particlesource" createVehicleLocal _pos;  
halo_clouds setParticleParams _parray;
halo_clouds setParticleRandom [0, [100, 100, 0], [0, 0, 0], 0, 0, [0, 0, 0, 0], 0, 1];
halo_clouds setParticleCircle [00, [00, 00, 00]];
halo_clouds setDropInterval (0.4 - (0.3 * overcast));


//--- Effects
halo_ppRadialBlur = ppeffectcreate ["RadialBlur",464];
halo_ppRadialBlur ppEffectAdjust [0.01,0.01,0.3,0.3];
halo_ppRadialBlur ppEffectCommit 0.01;
halo_ppRadialBlur ppEffectEnable true ; 
halo_soundLoop = time;
playsound "BIS_HALO_Flapping";


halo_action = _unit addaction ["Open Chute",A_actions_fnc_noscript,'[_this select 1] call A_halo_fnc_open_parachute;',1,false,true,"","true"];

halo_keydown = {
	ARGV(1,_key);
	ARGV(2,_shiftState); // boolean

	//--- Forward
	//if (_key in (actionkeys 'HeliForward')) then {
	if (_key in (actionkeys 'MoveForward')) then {
		if (halo_vel < +halo_velLimit) then {halo_vel = halo_vel + halo_velAdd};
		if (_shiftState) then {
			halo_accel = halo_accel + 0.1;
		};
	};

	//--- Backward
	//if (_key in (actionkeys 'HeliBack')) then {
	if (_key in (actionkeys 'MoveBack')) then {
		if (halo_vel > -halo_velLimit) then {halo_vel = halo_vel - halo_velAdd};
	};

	//--- Left
	//if (_key in (actionkeys 'HeliCyclicLeft')) then {
	if (_key in (actionkeys 'TurnLeft')) then {
		if (halo_dir > -halo_dirLimit) then {halo_dir = halo_dir - halo_dirAdd};
	};

	//--- Right
	//if (_key in (actionkeys 'HeliCyclicRight')) then {
	if (_key in (actionkeys 'TurnRight')) then {
		if (halo_dir < +halo_dirLimit) then {halo_dir = halo_dir + halo_dirAdd};
	};
	
};
halo_keydown_eh = (finddisplay 46) displayaddeventhandler ["keydown",{_this call halo_keydown;}];

//--- A_other_fnc_loop
halo_vel = 0;
halo_accel = 0;
halo_accelLimit = 3;
halo_velLimit = 0.2;
halo_velAdd = 0.03;
halo_dir = 0;
halo_dirLimit = 1;
halo_dirAdd = 0.06;

[] spawn {
	_time = time - 0.1;
	while {alive player && vehicle player == player && isnil {([player, "halo_terminate"] call A_object_fnc_getVariable)}} do {

		//--- FPS counter
		_fpsCoef = ((time - _time) * 60) / acctime; //Script is optimized for 60 FPS
		_time = time;

		halo_velLimit = 0.2 * _fpsCoef;
		halo_velAdd = 0.03 * _fpsCoef;
		halo_dirLimit = 1 * _fpsCoef;
		halo_dirAdd = 0.06 * _fpsCoef;
		
		
		if (halo_accel > 0) then {
			halo_accel = halo_accel - 0.1;
			if (halo_accel < 0) then {
				halo_accel = 0;
			};
			if (halo_accel > halo_accelLimit) then {
				halo_accel = halo_accelLimit; 
			};
		};

		//--- Dir
		halo_dir = halo_dir * 0.98;
		_dir = direction player + halo_dir;
		player setdir _dir;

		//--- Velocity
		_vel = velocity player;
		halo_vel = halo_vel * 0.96;
		player setvelocity [
			(_vel select 0) + (sin _dir * halo_vel),
			(_vel select 1) + (cos _dir * halo_vel),
			(_vel select 2) - halo_accel
		];

		//--- Animation system
		_anim = "HaloFreeFall_non";
		_v = halo_vel;
		_h = halo_dir;

		_vLimit = 0.1;
		_hLimit = 0.3;
		if ((abs _v) > _vLimit || (abs _h) > _hLimit) then {
			_vAnim = "";
			if (_v > +_vLimit) then {_vAnim = "F"};
			if (_v < -_vLimit) then {_vAnim = "B"};
			_hAnim = "";
			if (_h > +_hLimit) then {_hAnim = "R"};
			if (_h < -_hLimit) then {_hAnim = "L"};
			_anim = "HaloFreeFall_" + _vAnim + _hAnim;
		};

		player playmovenow _anim;

		//--- Sound
		if ((time - halo_soundLoop) > 4.5) then {
			playsound "BIS_HALO_Flapping";
			halo_soundLoop = time;
		};

		//--- Effects
		halo_ppRadialBlur ppEffectAdjust [0.02,0.02,0.3 - (halo_vel/7)/_fpsCoef,0.3 - (halo_vel/7)/_fpsCoef];
		halo_ppRadialBlur ppEffectCommit 0.01;
		sleep 0.01;
	};
	//--- End
	player removeaction halo_action;
	(finddisplay 46) displayremoveeventhandler ["keydown",halo_keydown_eh];
	ppeffectdestroy halo_ppRadialBlur;
	deletevehicle halo_clouds;

	halo_clouds = null;
	halo_vel = null;
	halo_velLimit = null;
	halo_velAdd = null;
	halo_dir = null;
	halo_dirLimit = null;
	halo_dirAdd = null;
	halo_action = null;
	halo_keydown = null;
	halo_keydown_eh = null;

	if (!alive player) then {
		player switchmove "adthppnemstpsraswrfldnon_1";
		player setvelocity [0,0,0];
	};
};
