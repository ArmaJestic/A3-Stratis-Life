// A_convoy_fnc_create_truck

#include "header.h"


params[["_location",null,[[]],3]];
if UNDEFINED(_location) exitwith {objNull};

private _class = ["B_Hunter_F"] call BIS_fnc_selectRandom;
private _truck = createVehicle [_class, _location, [], 0, "NONE"];

private _truck_name = "convoy_truck";

[[_truck, _truck_name], "A_convoy_fnc_init_handler_persistent", _truck] call A_jip_fnc_register;
[_truck, "tuning", 5, true] call A_object_fnc_setVariable;

_truck