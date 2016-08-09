// A_legislation_menu_fnc_view_menu_create

#include "..\..\includes\constants.h"
#include "..\..\includes\macro.h"


ARGV(0,_title);
ARGV(0,_player);

if (!([_player] call A_player_fnc_exists)) exitWith {};

[false] call A_legislation_menu_fnc_menu_setup;
[] call A_legislation_menu_fnc_menu_update_list;

buttonSetAction [legislation_menu_select_button_idc, '[' + str(_player) + ', ([(lbData [legislation_menu_list_idc, (lbCurSel legislation_menu_list_idc)])] call A_misc_fnc_parse_number)] call A_legislation_menu_fnc_view_law_menu_create;'];
