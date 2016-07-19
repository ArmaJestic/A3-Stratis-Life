// A_interaction_fnc_select_vehicle

#include "..\..\includes\macro.h"
#include "..\..\includes\constants.h"
#include "..\..\includes\dikcodes.h"


ARGV(0,_vehicle_name);
if (undefined(_vehicle_name)) exitWith {null};
if (typeName _vehicle_name != "STRING") exitWith {null};

interact_selected_vehicle = _vehicle_name;
closeDialog 0;
_vehicle_name
