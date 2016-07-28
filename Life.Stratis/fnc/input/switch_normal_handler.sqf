// A_input_fnc_switch_normal_handler

#include "..\..\includes\macro.h"
#include "..\..\includes\dikcodes.h"


if(!INV_shortcuts) exitWith {false};	
if(A_main_var_keyblock) exitWith {false};
A_main_var_keyblock=true; 
[] spawn {
	sleep 2; 
	A_main_var_keyblock=false;
};
format ["%1 switchmove ""%2"";", player, "normal"] call A_broadcast_fnc_broadcast;
true
