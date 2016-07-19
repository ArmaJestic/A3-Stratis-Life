// A_interaction_fnc_rob_timeout

#include "..\..\includes\macro.h"
#include "..\..\includes\constants.h"
#include "..\..\includes\dikcodes.h"

 _this spawn {
ARGV(0,_target);
ARGV(1,_timeout);

if (not([_target] call A_player_fnc_exists)) exitWith {};
if (_target != player) exitWith {};
if (undefined(_timeout)) exitWith {};
if (typeName _timeout != "SCALAR") exitWith {};


private["_recently_robbed"];
_recently_robbed = [_target, "recently_robbed", false] call A_object_fnc_getVariable;
if (_recently_robbed) exitWith {};

[_target, "recently_robbed", true, true] call A_object_fnc_setVariable;
sleep _timeout;
[_target, "recently_robbed", false, true] call A_object_fnc_setVariable;
};
