// A_halo_fnc_open_parachute

#include "../../includes/macro.h"


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
			if (!isnil {([player, "halo_terminate"] call A_object_fnc_getVariable)}) exitWith {null};
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
	[player, "halo_terminate",null] call A_object_fnc_setVariable;
	waituntil {(position vehicle player select 2) < 2 || !isnil {([player, "halo_terminate"] call A_object_fnc_getVariable)}};
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
