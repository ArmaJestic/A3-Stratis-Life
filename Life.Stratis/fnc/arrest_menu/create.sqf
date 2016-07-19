// A_arrest_menu_fnc_create

#include "../../includes/constants.h"
#include "../../includes/macro.h"


ARGV(0,_player);
ARGV(1,_target);
[toUpper("Arrest Menu"), [1,25], 5, [1,100], 1] call A_arrest_menu_fnc_setup;

buttonSetAction [arrest_menu_submit_button_idc, '[' + str(_player) + ',' + str(_target) + ', ([(sliderPosition arrest_menu_time_slider_idc)] call A_misc_fnc_parse_number), ([(sliderPosition arrest_menu_bail_slider_idc)] call A_misc_fnc_parse_number)] call A_interaction_fnc_arrest_player;'];
