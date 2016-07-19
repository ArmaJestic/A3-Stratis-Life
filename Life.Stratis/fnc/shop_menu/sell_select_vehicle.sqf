// A_shop_menu_fnc_sell_select_vehicle

#include "..\..\includes\constants.h"
#include "..\..\includes\macro.h"


ARGV(0,_vehicle_name);
if (undefined(_vehicle_name)) exitWith {null};
if (typeName _vehicle_name != "STRING") exitWith {null};

private["_vehicle"];
_vehicle = missionNamespace getVariable [_vehicle_name, null];
shop_sell_selected_vehicle = _vehicle;
closeDialog 0;
_vehicle
