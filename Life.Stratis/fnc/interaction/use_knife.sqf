// A_interaction_fnc_use_knife

#include "../../includes/macro.h"
#include "../../includes/constants.h"
#include "../../includes/dikcodes.h"

 _this spawn {
if (dialog) exitWith {};
ARGV(0,_this);
ARGV(0,_player);
ARGV(1,_object);
if (not([_player] call A_player_fnc_human)) exitWith {false};
if (undefined(_object)) exitWith {false};

if (A_interaction_var_interact_use_knife_active) exitWith {};
A_interaction_var_interact_use_knife_active = true;
player groupChat format["A_interaction_fnc_use_knife %1", _this];

private["_exit_clean"];
_exit_clean = {
	sleep 0.8;
	A_interaction_var_interact_use_knife_active = false;
};

_player playActionNow "PutDown";
sleep 0.2;

private["_target"];
_target = nearCursorTarget;

if (isNull _target) exitWith { call _exit_clean;};
if (not(_target isKindOf "Animal" || _target isKindOf "Man")) exitWith { call _exit_clean;};
if (_target == _player) exitWith { call _exit_clean;};
private["_distance"];
player grouPChat format["_target = %1", _target];

private["_position"];
_position = getPos _target;
if (_target isKindOf "Man") then {
	_position = _target modelToWorld (_target selectionPosition "spine3");
	
};
_distance = (_position distance _object);
player groupChat format["_distance = %1", _distance];

if (_distance > 1)  exitWith { call _exit_clean;};


if (not(alive _target)) exitWith {
	player groupChat format["The knife target is not alive."];
	 call _exit_clean;
};

_target = [_target] call A_object_fnc_nonNetwork_convert;
if (underwater _target) then {
	[[_target, 10], "A_object_fnc_underwater_bleed", true, false] call BIS_fnc_MP;
};

private["_damage"];	
_damage = damage _target;
_damage = _damage + 0.5;
_target setDamage _damage;

if (_target isKindOf "Man" && not(_target isKindOf "Animal")) then {
	playSound3D [format["a3\sounds_f\characters\human-sfx\Person0\P0_hit_0%1.wss", (floor(random 8) + 1)], _target];
};

call _exit_clean;
};
