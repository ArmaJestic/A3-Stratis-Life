// A_retributions_fnc_get_retribution_selection

#include "header.h"

#define kvlist 5003 

_selected_index = lbCurSel kvlist;
if (UNDEFINED(_selected_index) || typeName _selected_index != "SCALAR" || _selected_index < 0) exitWith {null};
_selection = (call compile lbData [kvlist, _selected_index]);
_selection
