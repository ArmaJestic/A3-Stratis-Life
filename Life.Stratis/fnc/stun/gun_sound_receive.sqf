// A_stun_fnc_gun_sound_receive

#include "..\..\includes\macro.h"

 _this spawn {
ARGV(0,_unit);
if (undefined(_unit)) exitWith {};
private["_tazer_active"];
_tazer_active = _unit getVariable ["tazer_active", false];
if (_tazer_active) exitWith {};

_unit setVariable ["tazer_active", true];
_unit say3d "tazer";
sleep 1;
_unit setVariable ["tazer_active", false];
};
