// A_convoy_fnc_init_handler_persistent

#include "header.h"


params[["_truck",objNull,[objNull]],["_truck_name",null,[""]]];

if (isNull _truck) exitWith {};
if UNDEFINED(_truck_name) exitWith {};

_truck setVehicleVarName _truck_name; 
missionNamespace setVariable[_truck_name,_truck];

_truck setAmmoCargo 0; 
clearweaponcargo _truck;
clearmagazinecargo _truck;