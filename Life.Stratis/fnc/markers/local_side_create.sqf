// A_markers_fnc_local_side_create

#include "..\..\includes\macro.h"


ARGV(0,_name);
ARGV(1,_location);
ARGV(2,_text);

private["_shape", "_type", "_color", "_size"];
_shape = "ICON";
_type = "mil_dot";
_color = "ColorBlue";
_size = [1.2, 1.2];
([_name, _location, _shape, _type, _color, _size, _text] call A_markers_fnc_local_create)
