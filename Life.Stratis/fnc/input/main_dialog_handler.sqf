// A_input_fnc_main_dialog_handler

#include "..\..\includes\macro.h"
#include "..\..\includes\dikcodes.h"


if(!INV_shortcuts) exitWith {false};
if(dialog) exitWith {closeDialog 0; false };
[] call A_main_menu_fnc_create;
true
