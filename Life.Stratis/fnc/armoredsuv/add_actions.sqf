// A_armoredsuv_fnc_add_actions

#include "..\..\includes\macro.h"


ARGV(0,_vehicle);

private ["_has_suv_actions"];

_has_suv_actions =  [_vehicle, "has_suv_actions"] call A_object_fnc_getVariable;
if (undefined(_has_suv_actions)) then { _has_suv_actions = false;}; 
if (_has_suv_actions) exitWith {null};

player groupChat format["Adding SUV actions"];
_vehicle addaction ["Open Minigun",A_other_fnc_noscript,'[_this select 0] call A_armoredsuv_fnc_open_minigun;',1,false,true,"","([player, _target] call A_vehicle_fnc_owner) && !([_target] call A_armoredsuv_fnc_is_minigun_open)"];
_vehicle addaction ["Close Minigun",A_other_fnc_noscript,'[_this select 0] call A_armoredsuv_fnc_close_minigun;',1,false,true,"","([player, _target] call A_vehicle_fnc_owner) && ([_target] call A_armoredsuv_fnc_is_minigun_open)"];

_has_suv_actions = true;
[_vehicle, "has_suv_actions", _has_suv_actions] call A_object_fnc_setVariable;
