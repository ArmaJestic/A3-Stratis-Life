// A_input_fnc_cop_horn_handler

#include "..\..\includes\macro.h"
#include "..\..\includes\dikcodes.h"


if(!A_inv_var_shortcuts) exitWith {false};
private["_isDriver"];
_isDriver = (driver(vehicle player) == player);
if (!(_isDriver)) exitWith { false };
[0,0,0,["activate"]] spawn A_other_fnc_policehorn;
true