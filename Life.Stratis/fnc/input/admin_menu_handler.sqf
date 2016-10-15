// A_input_fnc_admin_menu_handler

#include "..\..\includes\macro.h"
#include "..\..\includes\dikcodes.h"


diag_log 'A_input_fnc_admin_menu_handler: start';

if(!A_inv_var_shortcuts) exitWith {diag_log 'A_input_fnc_admin_menu_handler: exit1'; false};
if(dialog) exitWith {diag_log 'A_input_fnc_admin_menu_handler: exit2'; closeDialog 0; true};
if (!([player] call A_player_fnc_admin)) exitWith {diag_log 'A_input_fnc_admin_menu_handler: exit3'; false};

diag_log 'A_input_fnc_admin_menu_handler: creating menu';
[player] call A_interaction_fnc_admin_menu;
true