// A_markers_fnc_local_create

#include "../../includes/macro.h"


ARGV(0,_name);
ARGV(1,_location);
ARGV(2,_shape);
ARGV(3,_type);
ARGV(4,_color);
ARGV(5,_size);
ARGV(6,_text);

if (undefined(_name)) exitWith {""};
if (undefined(_location)) exitWith {""};
if (undefined(_shape)) exitWith {""};
if (undefined(_type)) exitWith {""};
if (undefined(_type)) exitWith {""};
if (undefined(_color)) exitWith {""};
if (undefined(_text)) exitWith {""};

if (typeName _name != "STRING") exitWIth {""};
if (typeName _location != "ARRAY") exitWith {""};
if (typeName _shape != "STRING") exitWith {""};
if (typeName _type != "STRING") exitWIth {""};
if (typeName _color != "STRING") exitWith {""};
if (typeName _size != "ARRAY") exitWith {""};
if (typeName _text != "STRING") exitWith {""};

private["_marker"];
_marker = createMarkerLocal [_name, _location]; 

_marker setMarkerShapeLocal _shape;
_marker setMarkerTypeLocal _type;
_marker setMarkerColorLocal _color;
_marker setMarkerSizeLocal _size;
_marker setMarkerTextLocal _text;
(_marker)