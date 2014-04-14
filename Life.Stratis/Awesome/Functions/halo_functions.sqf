#include "macro.h"

if (!undefined(halo_functions_defined)) exitWith {null};
//player groupchat "defining halo functions!";


halo_jump = {
	//player groupchat "halo jump with delay!";
	ARGV(0,_vehicle);
	ARGV(1,_unit);
	
	//_unit action ["getOut", _vehicle];
	moveOut _unit;
	_pos = getPosATL _unit;
	_unit setvelocity [0,0,0];
	_unit setPosATL [(_pos select 0), (_pos select 1) - 5, (_pos select 2)];
		
	_height = _pos select 2;
	
	[] spawn {
	    private[ "_anim", "_canim"];
		_time_end = time + 10;
		_anim = "HaloFreeFall_non";
		format[' if (%1 != player) then { %1 switchMove "%2";};', player, _anim] call broadcast;
		while { _time_end > time } do {
			_canim = animationState player;
			if ( _canim != _anim ) then {
				player switchMove _anim;
			};
			if (_canim == _anim) exitWith {
				[] spawn halo_start;
			};
		};
		format[' if (%1 != player) then { %1 switchMove "%2";};', player, _anim] call broadcast;
	};
	
	
	[_height, _unit] spawn {
		ARGV(0,_height);
		ARGV(1,_unit);
		
		private ["_near", "_obj"];
		_near = nearestObject [_unit, "ParachuteBase"];
		[_unit] call halo_add_smoke_actions;
		while { _height > 1 } do {
			_obj = _unit;
			if (format["%1", _near] == "<NULL-object>") then {
				_near = nearestObject [_unit, "ParachuteBase"];
			}
			else {
				_obj = _near;
			};	
			
			hintSilent format["Altitude\n %1 meters\n Grid Reference \n %2\n Horizontal Speed \n %3 \n Vertical Speed\n %4", round(_height),  mapGridPosition _obj,round(speed _obj), round((velocity _obj) select 2)];
			_height = (getPosATL _unit) select 2;
		};
		[_unit] call halo_remove_all_smoke_actions;
		[_unit] call halo_deactivate_smoke;
		sleep 3;
		if (alive _unit) then {
			hint "Sucessful landing";
			_canim = (animationState player);
			_anim_list = ["halofreefall_non", "halofreefall_f", "halofreefall_b", "halofreefall_fr", "halofreefall_br", "halofreefall_fl", "halofreefall_bl"];
			//player groupChat format["_canim = %1", _canim];
			 
			if (_canim in _anim_list ) then {
				player groupChat "You have landed alive without parachute, miracle!";
				player switchMove "aidlpercmstpsraswrfldnon_idlesteady01n";
				[player, "halo_terminate", true] call object_setVariable;
			};
		} 
		else {
			hint "Fail landing";
		};	
	};
};

halo_activate_smoke = {
	ARGV(0,_unit);
	ARGV(1,_smoke_class);
	
	[_unit] call halo_deactivate_smoke;

	private ["_smoke_object"];
	_smoke_object = createVehicle [_smoke_class, (getPosATL _unit), [], 0, "NONE"];
	
	_smoke_object setPosATL (getPosATL _unit);
	_smoke_object attachTo [_unit,[-0.22,-0.05,0.2]];
	[_unit, "halo_smoke_object", _smoke_object] call object_setVariable;	
	
	

	[_unit, _smoke_class] call halo_remove_smoke_action;
};

halo_deactivate_smoke = {
	ARGV(0,_unit);
	_old_smoke_object = [_unit, "halo_smoke_object"] call object_getVariable;
	//player groupChat format["Removing old smoke object %1", _old_smoke_object];
	if (!undefined(_old_smoke_object)) then {
		deleteVehicle _old_smoke_object;
	};
};


halo_add_smoke_actions = {
	ARGV(0,_unit);
	
	private ["_actions"];
	//player groupChat "Adding smoke actions";
	_smokes = [ ["Smoke White", "SmokeShell"],
	          ["Smoke Red", "SmokeShellRed"],
			  ["Smoke Green", "SmokeShellGreen"],
			  ["Smoke Yellow", "SmokeShellYellow"],
			  ["Smoke Orange", "SmokeShellOrange"],
			  ["Smoke Purple", "SmokeShellPurple"],
			  ["Smoke Blue", "SmokeShellBlue"]
			 ];
			 
	_actions = [];
    {
	
		_smoke_name = _x select 0;
		_smoke_class = _x select 1;
		_action_id = _unit addaction [format["Activate %1", _smoke_name],"noscript.sqf",format['[_this select 1, "%1"] call halo_activate_smoke;', _smoke_class],1,false,true,"","true"];
		_actions = _actions + [[_action_id,_smoke_class]];
	} foreach _smokes;
	
	_action_id = _unit addaction [format["Deactivate smoke"],"noscript.sqf",format['[_this select 1] call halo_deactivate_smoke;'],1,false,true,"","true"];
	_actions = _actions + [[_action_id, "SmokeDeactivate"]];
	[_unit, "halo_smoke_actions", _actions] call object_setVariable;
	_actions
};


halo_remove_smoke_action =  {
	ARGV(0,_unit);
	ARGV(1,_smoke_class);
	_actions = [_unit, "halo_smoke_actions"] call object_getVariable;
	if (undefined(_actions)) exitWith {null};
	if (typeName _actions != "ARRAY") exitWith {null};
	
	{
		_smoke_struct = _x;
		_smoke_action = _x select 0;
		_smoke_cclass = _x select 1;
		if (_smoke_class == _smoke_cclass) exitWith {
			_unit removeAction _smoke_action;
		};
	} foreach _actions;
};

halo_remove_all_smoke_actions = {
	ARGV(0,_unit);
	_actions = [_unit, "halo_smoke_actions"] call object_getVariable;
	if (undefined(_actions)) exitWith {null};
	if (typeName _actions != "ARRAY") exitWith {null};
	
	{
		_smoke_struct = _x;
		_smoke_action = _x select 0;
		_smoke_class = _x select 1;
		_unit removeAction _smoke_action;
	} foreach _actions;
};


halo_jump_allowed = {
	ARGV(0,_vehicle);
	_is_in_vehicle = (_vehicle == vehicle(player));
	if (!_is_in_vehicle) exitWith { false };
	
	_is_air_vehicle = (_vehicle isKindOf "Air");
	if (!_is_air_vehicle) exitWith { false };
	
	_vehicle_position = getPosATL _vehicle;
	_is_above_100m = ((_vehicle_position select 2) > 100);
	if (!_is_above_100m) exitWith { false };
	if ((locked _vehicle) == 2) exitwith { false };
	
	true
};

halo_jump_add_actions =  {
	ARGV(0,_vehicle);
	
	private ["_has_halo_actions"];
	
	_has_halo_actions = [_vehicle, "has_halo_actions"] call object_getVariable;
	if (undefined(_has_halo_actions)) then { _has_halo_actions = false;}; 
	if (_has_halo_actions) exitWith {null};
	
	//player groupChat "Adding Halo Jump Actions";
	
	_vehicle addaction ["Halo Jump","noscript.sqf",'[_this select 0, _this select 1] call halo_jump;',1,false,true,"","[_target] call halo_jump_allowed"];
	
	_has_halo_actions = true;
	[_vehicle, "has_halo_actions", _has_halo_actions] call object_setVariable;
};



halo_start = {
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

	
	halo_action = _unit addaction ["Open Chute","noscript.sqf",'[_this select 1] call halo_open_parachute;',1,false,true,"","true"];

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
	halo_keydown_eh = (finddisplay 46) displayaddeventhandler ["keydown","_this call halo_keydown;"];

	//--- Loop
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
		while {alive player && vehicle player == player && isnil {([player, "halo_terminate"] call object_getVariable)}} do {

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

};

halo_open_parachute = {
	ARGV(0,_unit);
	if (!local _unit) exitWith {null};

	_para = "ParachuteC" createVehicle position _unit;
	//_para = "BIS_Steerable_Parachute" createVehicle position _unit;
	_para setpos position _unit;
	_para setdir direction _unit;
	_vel = velocity _unit;
	_unit moveindriver _para;
	//_unit moveingunner _para;
	_para lock false;

	halo_para_dirAbs = direction _para;

	//--- Key controls
	if (_unit == player) then {
		_para setvelocity [(_vel select 0),(_vel select 1),(_vel select 2)*1];

		halo_DynamicBlur = ppeffectcreate ["DynamicBlur",464];
		halo_DynamicBlur ppEffectEnable true;
		halo_DynamicBlur ppEffectAdjust [8.0];
		halo_DynamicBlur ppEffectCommit 0;
		halo_DynamicBlur ppEffectAdjust [0.0];
		halo_DynamicBlur ppEffectCommit 1;

		halo_para_vel = 0;
		halo_para_velLimit = 0.5;
		halo_para_velAdd = 0.01;
		halo_para_dir = 0;
		halo_para_dirLimit = 1.5;
		halo_para_dirAdd = 0.03;

		halo_para_keydown = {
			ARGV(1,_key);

			//--- Forward
			if (_key in (actionkeys 'MoveForward')) then {
				if (halo_para_vel < +halo_para_velLimit) then {halo_para_vel = halo_para_vel + halo_para_velAdd};
			};

			//--- Backward
			if (_key in (actionkeys 'MoveBack')) then {
				if (halo_para_vel > -halo_para_velLimit*0) then {halo_para_vel = halo_para_vel - halo_para_velAdd};
			};

			//--- Left
			if (_key in (actionkeys 'TurnLeft')) then {
				if (halo_para_dir > -halo_para_dirLimit) then {halo_para_dir = halo_para_dir - halo_para_dirAdd};
			};

			//--- Right
			if (_key in (actionkeys 'TurnRight')) then {
				if (halo_para_dir < +halo_para_dirLimit) then {halo_para_dir = halo_para_dir + halo_para_dirAdd};
			};
		};
		halo_para_loop_time = time - 0.1;
		halo_para_velZ = velocity _para select 2;
		halo_para_loop = {
				if (!isnil {([player, "halo_terminate"] call object_getVariable)}) exitWith {null};
				if (time == halo_para_loop_time) exitWith {null}; //--- FPS too high

				_para = vehicle player;

				//--- FPS counter
				_fpsCoef = ((time - halo_para_loop_time) * 20) / acctime; //Script is optimized for 20 FPS
				halo_para_loop_time = time;

				//_fpsCoef = _fpsCoef / 3;
				halo_para_velLimit = 0.3 * _fpsCoef;
				halo_para_velAdd = 0.002 * _fpsCoef;
				halo_para_dirLimit = 1.5 * _fpsCoef;
				halo_para_dirAdd = 0.03 * _fpsCoef;

				//--- Dir
				halo_para_dir = halo_para_dir * 0.98;
				halo_para_dirAbs = halo_para_dirAbs + halo_para_dir;
				_para setdir halo_para_dirAbs;
				_dir = direction _para;

				//--- Crash
				_velZ = velocity _para select 2;
				if ((_velZ - halo_para_velZ) > 7 && (getposatl _para select 2) < 100) then {player setdamage 1;debuglog ["Log::::::::::::::",(_velZ - halo_para_velZ)];};
				halo_para_velZ = _velZ;

				//--- Pos
				_para setposasl [
					(getposasl _para select 0) + (sin _dir * (0.1 + halo_para_vel)),
					(getposasl _para select 1) + (cos _dir * (0.1 + halo_para_vel)),
					(getposasl _para select 2) - 0.01 - 0.1 * abs halo_para_vel
				];

				[
					_para,
					(-halo_para_vel * 75) + 0.5*(sin (time * 180)),
					(+halo_para_dir * 25) + 0.5*(cos (time * 180))
				] call bis_fnc_setpitchbank;
		};

		halo_para_mousemoving_eh = (finddisplay 46) displayaddeventhandler ["mousemoving","_this call halo_para_loop;"];
		halo_para_mouseholding_eh = (finddisplay 46) displayaddeventhandler ["mouseholding","_this call halo_para_loop;"];

		sleep 4;

		ppeffectdestroy halo_DynamicBlur;
		halo_para_keydown_eh = (finddisplay 46) displayaddeventhandler ["keydown","_this call halo_para_keydown;"];

		//--- End
		//waituntil {vehicle player == player};
		[player, "halo_terminate",null] call object_setVariable;
		waituntil {(position vehicle player select 2) < 2 || !isnil {([player, "halo_terminate"] call object_getVariable)}};
		(finddisplay 46) displayremoveeventhandler ["keydown",halo_para_keydown_eh];
		(finddisplay 46) displayremoveeventhandler ["mousemoving",halo_para_mousemoving_eh];
		(finddisplay 46) displayremoveeventhandler ["mouseholding",halo_para_mouseholding_eh];

		halo_para_vel = null;
		halo_para_velLimit = null;
		halo_para_velAdd = null;
		halo_para_dir = null;
		halo_para_dirLimit = null;
		halo_para_dirAdd = null;
		halo_para_keydown = null;
		halo_para_loop = null;
		halo_para_keydown_eh = null;
		halo_para_mousemoving_eh = null;
		halo_para_mouseholding_eh = null;
	};
};

halo_functions_defined = true;
