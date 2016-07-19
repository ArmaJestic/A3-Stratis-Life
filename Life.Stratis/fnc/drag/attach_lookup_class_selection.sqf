// A_drag_fnc_attach_lookup_class_selection

#include "../../includes/constants.h"
#include "../../includes/macro.h"


ARGV(0,_class);
ARGV(1,_selection);

if (undefined(_class)) exitWith {null};
if (undefined(_selection)) exitWith {null};

private["_entry"];
_entry = [_class] call A_drag_fnc_attach_lookup_class;

if (undefined(_entry)) exitWith {null};
private["_points"];
_points =  _entry select A_drag_var_attach_points;

private["_point"];
_point = null;
{
	private["_cselection", "_cpoint"];
	_cpoint = _x;
	_cselection = _cpoint select A_drag_var_attach_point_selection_id;
	if (_cselection == _selection) exitWith {
		_point = _cpoint;
	};
} forEach _points;
_point
