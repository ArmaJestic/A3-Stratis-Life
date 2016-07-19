// A_main_menu_fnc_handle_statistics

#include "..\..\includes\macro.h"
#include "..\..\includes\constants.h"


ARGV(0,_title);
private["_list"];
_list = [toUpper(_title), 0.14, 0.14, 0.6, 0.7] call A_main_menu_fnc_right_setup;
lbClear (ctrlIDC _list);

_list lbAdd format ["Date: %3.%2.%1", (date select 0), (date select 1), (date select 2)];
_list lbAdd format ["Runtime: %1 minutes", (round(time/60))];
_list lbAdd format ["%1: %2/%3", "Weight", (call A_inventory_fnc_get_own_weight), A_inventory_var_INV_CarryingCapacity];
_list lbAdd format ["%1: %2",    "Cops killed", ([player, "copskilled"] call A_player_fnc_get_scalar)];
_list lbAdd format ["%1: %2",    "Civilians killed", ([player, "civskilled"] call A_player_fnc_get_scalar)];
_list lbAdd format ["%1: %2",    "Arrests Made", ([player, "arrestsmade"] call A_player_fnc_get_scalar)];
_list lbAdd format ["%1: %2",    "Suicides", ([player, "selfkilled"] call A_player_fnc_get_scalar)];
_list lbAdd format ["%1: %2",    "Deaths", ([player, "deadtime"] call A_player_fnc_get_scalar)];
_list lbAdd format ["%1: %2 seconds", "Respawn time", round(_dead_wait_time)];
