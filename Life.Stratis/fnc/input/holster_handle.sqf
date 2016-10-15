// A_input_fnc_holster_handle

#include "..\..\includes\macro.h"
#include "..\..\includes\dikcodes.h"


if(!A_inv_var_shortcuts) exitWith {
	systemChat "A_input_fnc_holster_handle: !A_inv_var_shortcuts";
	false
};
if (A_main_var_keyblock) exitWith {
	player groupChat "WARNING: This action is temporarily blocked";
	true
};

if((vehicle player) != player) exitWith {
	systemChat "A_input_fnc_holster_handle: (vehicle player) != player";
	false
};
A_main_var_keyblock = true; 
[] spawn {
	sleep 2; 
	A_main_var_keyblock = false;
};

if (currentWeapon player != "") then{
	systemChat "A_input_fnc_holster_handle: switching";
	player action ["SwitchWeapon", player, player, -1];
}else{
	systemChat "A_input_fnc_holster_handle: not switching";
};
true