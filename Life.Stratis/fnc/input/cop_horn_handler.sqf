// A_input_fnc_cop_horn_handler

#include "..\..\includes\macro.h"
#include "..\..\includes\dikcodes.h"


if(!INV_shortcuts) exitWith {false};
private["_isDriver"];
_isDriver = (driver(vehicle player) == player);
if (not(_isDriver)) exitWith { false };
[0,0,0,["activate"]] execVM "Awesome\Scripts\A_other_fnc_policehorn.sqf";
true
