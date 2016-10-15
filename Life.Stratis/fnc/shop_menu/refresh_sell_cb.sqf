// A_shop_menu_fnc_refresh_sell_cb

#include "header.h"


ARGV(0,_shop_id);

private["_state", "_new_state_str"];
_state = [_shop_id] call A_shop_menu_fnc_get_sell_cb;
_new_state_str = if (_state) then { "[x]" } else { "[ ]" };
CtrlSettext [sell_show_all_items_label_idc, format["%1 - Hide unsellable items", _new_state_str]];
