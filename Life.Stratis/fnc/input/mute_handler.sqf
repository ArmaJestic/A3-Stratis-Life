// A_input_fnc_remove_mousebuttondown

#include "..\..\includes\macro.h"
#include "..\..\includes\dikcodes.h"


if (!A_inv_var_shortcuts) exitWith {false};
// todo: replace to use soundVolume command
// add slider to settings for mute percentage
if (A_input_var_mute) then {
	1 fadeSound 1;
	cutText["Mute off", "PLAIN DOWN"];
}else{
	1 fadeSound 0.3;
	cutText["Mute on", "PLAIN DOWN"];
};
A_input_var_mute = !A_input_var_mute;

true