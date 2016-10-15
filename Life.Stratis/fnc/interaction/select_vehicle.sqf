// A_interaction_fnc_select_vehicle

#include "header.h"


ARGV(0,_vehicle_name);
if (UNDEFINED(_vehicle_name)) exitWith {null};
if (typeName _vehicle_name != "STRING") exitWith {null};

interact_selected_vehicle = _vehicle_name;
closeDialog 0;
_vehicle_name
