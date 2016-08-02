// init2

#include "..\..\includes\constants.h"
#include "..\..\includes\macro.h"

{
	private["_entry", "_class"];
	_entry = _x;
	_class = _entry select A_drag_var_attach_class;
	A_drag_var_attach_index set [_forEachIndex, _class];
} forEach A_drag_var_attach_data;