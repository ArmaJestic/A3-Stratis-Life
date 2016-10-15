// A_speed_gun_fnc_driver_check

#include "..\..\includes\macro.h"
#include "..\..\includes\constants.h"


private["_vehicle", "_isDriver"];
_vehicle = vehicle player;
_isDriver = (_vehicle != player) && (driver _vehicle == player);
_isDriver
