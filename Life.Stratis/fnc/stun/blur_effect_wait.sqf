// A_stun_fnc_blur_effect_wait

#include "..\..\includes\macro.h"


player grouPChat format["A_stun_fnc_blur_effect_wait %1", _this];
ARGV(0,_unit);
ARGV(1,_time);

if (defined(A_stun_var_A_stun_var_blur_time_remaining) && {A_stun_var_A_stun_var_blur_time_remaining > 0}) exitWith {
	A_stun_var_A_stun_var_blur_time_remaining = A_stun_var_A_stun_var_blur_time_remaining +  _time;
};

if (undefined(_unit)) exitWith {};
if (undefined(_time)) exitWith {};


A_stun_var_blur_time_remaining = _time;

if ([_unit, "restrained", false] call A_player_fnc_get_bool) then {
	[_unit, "restrained", false] call A_player_fnc_set_bool
};

[_unit, "stunned", true] call A_player_fnc_set_bool;

private["_camera"];
_camera = [_unit] call A_player_fnc_camera_create;
_camera camSetTarget _unit;
_camera camSetRelPos [1,1,1];
_camera cameraEffect ["external", "back"];
_camera camCommit 0;


[_unit] spawn A_stun_fnc_agony;

waitUntil {
	"dynamicBlur" ppEffectEnable true;
	"dynamicBlur" ppEffectAdjust [10];
	"dynamicBlur" ppEffectCommit 0;

	A_stun_var_A_stun_var_blur_time_remaining = A_stun_var_A_stun_var_blur_time_remaining - 1;
	A_stun_var_A_stun_var_blur_time_remaining = A_stun_var_A_stun_var_blur_time_remaining min A_main_var_maxstuntime;
	
	
	waitUntil {ppEffectCommitted "dynamicBlur"};
	"dynamicBlur" ppEffectEnable true;
	"dynamicBlur" ppEffectAdjust [0];
	"dynamicBlur" ppEffectCommit 1.5;
	playSound3d ["a3\sounds_f\characters\human-sfx\05_heart_1.wss", _unit, true];
	sleep 1;
	if ([_unit, "restrained", false] call A_player_fnc_get_bool) exitWith {true};
	if (!(alive _unit)) exitWith {true};
	(A_stun_var_blur_time_remaining <= 0)
};

A_stun_var_blur_time_remaining = 0;
[_unit] call A_player_fnc_camera_destroy;
[_unit, "stunned", false] call A_player_fnc_set_bool;
if (!([_unit, "restrained", false] call A_player_fnc_get_bool)) then {
	_unit playMoveNow "AmovPpneMstpSnonWnonDnon";
};
