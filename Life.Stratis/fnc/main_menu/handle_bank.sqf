// A_main_menu_fnc_handle_bank

#include "header.h"


ARGV(0,_title);
private["_list"];
_list = [toUpper(_title), 0.14, 0.14, 0.6, 0.7] call A_main_menu_fnc_right_setup;
lbClear (ctrlIDC _list);
_list lbAdd (format ["Est. total funds in the main bank safe's: $%1", strM(A_main_var_robpoolsafe1 + A_main_var_robpoolsafe2 + A_main_var_robpoolsafe3)]);
