// A_drag_fnc_attach_lookup_class

#include "..\..\includes\constants.h"
#include "..\..\includes\macro.h"


ARGV(0,_class);
if (undefined(_class)) exitWith {null};
if (typeName _class != "STRING") exitWith {null};

private["_entry_index"];
_entry_index = (A_drag_var_attach_index find _class);
if (_entry_index == -1) exitWith {null};

private["_entry"];
_entry = A_drag_var_attach_data select _entry_index;
_entry
