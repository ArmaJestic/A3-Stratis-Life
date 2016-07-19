// A_camera_menu_fnc_camera_modify_offset

#include "../../includes/macro.h"
#include "../../includes/constants.h"


ARGV(0,_object);
ARGV(1,_axis);
ARGV(2,_operation);
ARGV(3,_value);

private["_heading", "_offset"];
_heading = [_object, "heading", [(getDir _object),0,0]] call A_object_fnc_getVariable;
_offset = [_object, "offset", (_object modelToWorld [0,0,0])] call A_object_fnc_getVariable;

if (_operation == OFFSET_OP_ADD) then {
	_offset set [_axis, ((_offset select _axis) + _value)];
}
else {
	_offset set [_axis, _value];
};

[_object, _offset, _heading] call A_camera_menu_fnc_camera_set_offset_heading;