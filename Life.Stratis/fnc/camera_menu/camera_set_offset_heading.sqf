// A_camera_menu_fnc_camera_set_offset_heading

#include "..\..\includes\macro.h"
#include "..\..\includes\constants.h"


ARGV(0,_object);
ARGV(1,_offset);
ARGV(2,_heading);

[_object, _offset, _heading] call A_camera_fnc_fake_setPos;
[_object, "offset", _offset] call A_object_fnc_setVariable;
[_object, "heading", _heading] call A_object_fnc_setVariable;
