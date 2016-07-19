// A_police_menu_fnc_menu_satellite_camera_handler

#include "../../includes/constants.h"
#include "../../includes/macro.h"


player groupChat format["A_police_menu_fnc_menu_satellite_camera_handler %1", _this];
ARGV(0,_title);
ARGV(1,_player);

[_player, [(getPosATL _player select 0), (getPosATL _player select 1), 200]] call A_interaction_fnc_satellite_camera;
