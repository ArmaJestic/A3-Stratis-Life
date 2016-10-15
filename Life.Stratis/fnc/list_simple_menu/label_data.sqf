// A_list_simple_menu_fnc_label_data

#include "header.h"


private _index = lbCurSel (list_simple_menu_list_idc);
if (_index < 0) exitWith {null};

private _data = (lbData [list_simple_menu_list_idc, _index]);
if (UNDEFINED(_data)) exitWith {null};
_data