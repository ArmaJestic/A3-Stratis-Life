// A_main_menu_fnc_handle_bank

#include "../../includes/macro.h"
#include "../../includes/constants.h"


ARGV(0,_title);
private["_list"];
_list = [toUpper(_title), 0.14, 0.14, 0.6, 0.7] call A_main_menu_fnc_right_setup;
lbClear (ctrlIDC _list);
_list lbAdd (format ["Est. total funds in the main bank safe's: $%1", strM(robpoolsafe1 + robpoolsafe2 + robpoolsafe3)]);
