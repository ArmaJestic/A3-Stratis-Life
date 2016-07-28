// A_halo_fnc_jump_add_actions

#include "..\..\includes\macro.h"


ARGV(0,_vehicle);

private ["_has_halo_actions"];

_has_halo_actions = [_vehicle, "has_halo_actions"] call A_object_fnc_getVariable;
if (undefined(_has_halo_actions)) then { _has_halo_actions = false;}; 
if (_has_halo_actions) exitWith {null};

//player groupChat "Adding A_other_fnc_halo Jump A_actions_fnc_actions";

_vehicle addaction ["A_other_fnc_halo Jump","noscript.sqf",'[_this select 0, _this select 1] call A_halo_fnc_jump;',1,false,true,"","[_target] call A_halo_fnc_jump_allowed"];

_has_halo_actions = true;
[_vehicle, "has_halo_actions", _has_halo_actions] call A_object_fnc_setVariable;
