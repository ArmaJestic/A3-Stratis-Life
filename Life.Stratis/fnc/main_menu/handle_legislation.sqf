// A_main_menu_fnc_handle_legislation

#include "../../includes/macro.h"
#include "../../includes/constants.h"


ARGV(0,_title);
ARGV(1,_player);

[_player] call A_legislation_menu_fnc_view_menu_create;
