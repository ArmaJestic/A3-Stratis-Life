// A_police_menu_fnc_menu_prison_camera_handler

#include "../../includes/constants.h"
#include "../../includes/macro.h"


player groupChat format["A_police_menu_fnc_menu_prison_camera_handler %1", _this];
ARGV(0,_title);
ARGV(1,_player);

[_player, prison_logic] call A_interaction_fnc_simple_camera;
