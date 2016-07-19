// A_interaction_fnc_stranded_check

#include "../../includes/macro.h"
#include "../../includes/constants.h"
#include "../../includes/dikcodes.h"


ARGV(0,_player);
if ([_player] call A_player_fnc_get_dead) exitWith {};
if (not([_player] call A_player_fnc_stranded)) exitWith {};


stranded_menu_response = false;
private["_message"];
_message = format["Hey there, looks like you are stranded. Do you want to quickly respawn? Note that as a penalty, you will lose your gear, and inventory."];
[toUpper("Stranded Confirmation"), "Yes", "No", _message, 0.14, 0.14, 0.40, 0.25] call A_yes_no_menu_fnc_setup;
buttonSetAction [yes_no_menu_yes_button_idc, "stranded_menu_response = true; closeDialog 0;"];
buttonSetAction [yes_no_menu_no_button_idc, "stranded_menu_response = false; closeDialog 0;"];
waitUntil{(not(ctrlVisible yes_no_menu_yes_button_idc))};

if (stranded_menu_response) then {
	titleText ["", "BLACK OUT", 1];
	sleep 1;
	
	//[_player] call A_player_fnc_teleport_spawn;
	[5] call A_player_fnc_rejoin_choice;
	
	[_player] call A_player_fnc_reset_gear;
	[_player] call A_player_fnc_reset_side_inventory;

	titleText ["", "BLACK IN", 1];
}
else {
	player groupChat "Good luck, may the force be with you!";
};