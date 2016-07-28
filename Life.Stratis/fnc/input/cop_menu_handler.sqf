// A_input_fnc_cop_menu_handler

#include "..\..\includes\macro.h"
#include "..\..\includes\dikcodes.h"


if(!INV_shortcuts) exitWith {false};
if(dialog) exitWith {closeDialog 0; false};
if (not(isblu)) exitWith {false};
if ([player] call A_player_fnc_get_dead) exitWith {null};

private["_inVehicle"];
_inVehicle = (vehicle player != player);

if (not(_inVehicle)) then {
	[] call A_police_menu_fnc_field_menu_create;
}
else {
	[] call A_police_menu_fnc_vehicle_menu_create;
};

true
