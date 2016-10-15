// A_drag_fnc_attach_lookup_class_selection

#include "header.h"


params["_class","_selection"];

if (UNDEFINED(_class)) exitWith {null};
if (UNDEFINED(_selection)) exitWith {null};

private _entry = [_class] call A_drag_fnc_attach_lookup_class;

if (UNDEFINED(_entry)) exitWith {null};

private _points =  _entry select INDEX_ATTACH_POINTS;
private _point = null;
{
	private["_cselection", "_cpoint"];
	_cpoint = _x;
	_cselection = _cpoint select INDEX_POINT_SELECTION_ID;
	if (_cselection == _selection) exitWith {
		_point = _cpoint;
	};
} forEach _points;
_point