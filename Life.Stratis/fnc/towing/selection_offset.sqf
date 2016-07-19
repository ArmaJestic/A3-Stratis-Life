// A_towing_fnc_selection_offset

#include "..\..\includes\constants.h"
#include "..\..\includes\macro.h"


ARGV(0,_object);
ARGV(1,_selection);
ARGV(2,_default);

private["_offset"];
_offset = _object selectionPosition _selection;
if (str(_offset) == "[0,0,0]") exitWith {_default};
_offset
