// A_camera_fnc_mouseMoving_handler

#include "..\..\includes\dikcodes.h"
#include "..\..\includes\macro.h"


//player groupChat format["A_camera_fnc_mouseMoving_handler %1", _this];	

ARGV(0,_this);
ARGV(1,_xc);
ARGV(2,_yc);


private["_player"];
_player = camera_unit;

if (dialog) exitWith {false};
if ([_player, _xc,_yc, 0] call A_camera_fnc_update_left_click_target) exitWith {false};


if ([_player] call A_camera_fnc_get_map_open) exitWith {false};


[_player, _xc, _yc] call A_camera_fnc_update_heading;
false
