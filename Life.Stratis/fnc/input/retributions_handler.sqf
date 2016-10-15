// A_input_fnc_retributions_handler

#include "..\..\includes\macro.h"
#include "..\..\includes\dikcodes.h"


if(!A_inv_var_shortcuts) exitWith {false};
if(dialog) exitWith {closeDialog 0; false};
["open"] spawn A_retributions_fnc_retributions_main;
true
