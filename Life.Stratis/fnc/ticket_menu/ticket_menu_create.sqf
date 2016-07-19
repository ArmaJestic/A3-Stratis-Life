// A_ticket_menu_fnc_ticket_menu_create

#include "..\..\includes\constants.h"
#include "..\..\includes\macro.h"


ARGV(0,_player);
ARGV(1,_target);

if (not([_player] call A_player_fnc_exists)) exitWith {};
if (not([_target] call A_player_fnc_exists)) exitWith {};

[] call A_ticket_menu_fnc_ticket_menu_setup;
buttonSetAction [ticket_menu_submit_button_idc, '[' + str(_player) + ',' + str(_target) + ', ([(ctrlText ticket_menu_price_field_idc)] call A_misc_fnc_parse_number)] call A_interaction_fnc_ticket; closeDialog 0;'];
