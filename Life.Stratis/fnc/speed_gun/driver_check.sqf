// A_speed_gun_fnc_driver_check

#include "..\..\includes\constants.h"
#include "..\..\includes\macro.h"


private["_vehicle", "_isDriver"];
_vehicle = vehicle player;
_isDriver = (_vehicle != player) && (driver _vehicle == player);
_isDriver
