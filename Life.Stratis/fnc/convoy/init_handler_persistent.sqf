// A_convoy_fnc_init_handler_persistent

#include "..\..\includes\macro.h"
#include "..\..\includes\constants.h"

#define CONVOY_MSG_SPAWN 1
#define CONVOY_MSG_DRIVER_DEAD 2
#define CONVOY_MSG_DAMAGED 3
#define CONVOY_MSG_COMPLETE 4


ARGV(0,_truck);
ARGV(1,_truck_name);

if (undefined(_truck)) exitWith {};
if (typeName _truck != "OBJECT") exitWith {};
if (isNull _truck) exitWith {};
if (undefined(_truck_name)) exitWith {};
if (typeName _truck_name != "STRING") exitWith {};

_truck setVehicleVarName _truck_name; 
missionNamespace setVariable [_truck_name, _truck_name];
_truck setAmmoCargo 0; 
clearweaponcargo _truck;
clearmagazinecargo _truck;
