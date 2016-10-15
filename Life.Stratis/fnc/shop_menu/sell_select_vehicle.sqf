// A_shop_menu_fnc_sell_select_vehicle

#include "header.h"


ARGV(0,_vehicle_name);
if (UNDEFINED(_vehicle_name)) exitWith {null};
if (typeName _vehicle_name != "STRING") exitWith {null};

private["_vehicle"];
_vehicle = missionNamespace getVariable [_vehicle_name, null];
shop_sell_selected_vehicle = _vehicle;
closeDialog 0;
_vehicle
