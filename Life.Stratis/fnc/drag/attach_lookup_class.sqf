// A_drag_fnc_attach_lookup_class

#include "header.h"


params[["_class",null,[""]]];
if (UNDEFINED(_class)) exitWith {null};

private _entry_index = (A_drag_var_attach_index find _class);
if (_entry_index == -1) exitWith {null};

private _entry = A_drag_var_attach_data select _entry_index;
_entry