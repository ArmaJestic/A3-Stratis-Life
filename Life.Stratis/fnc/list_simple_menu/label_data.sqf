// A_list_simple_menu_fnc_label_data

#include "..\..\includes\constants.h"
#include "..\..\includes\macro.h"


private["_index"];
_index = lbCurSel (list_simple_menu_list_idc);
if (_index < 0) exitWith {null};

private["_data"];
_data = (lbData [list_simple_menu_list_idc, _index]);
if (undefined(_data)) exitWith {null};
_data
