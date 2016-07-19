// A_shop_menu_fnc_refresh_put_gear_cb

#include "..\..\includes\constants.h"
#include "..\..\includes\macro.h"


ARGV(0,_shop_id);

private["_state", "_new_state_str"];
_state = [_shop_id] call A_shop_menu_fnc_get_put_gear_cb;
_new_state_str = if (_state) then { "[x]" } else { "[ ]" };
CtrlSettext [buy_put_gear_label_idc, format["%1 - Put weapon in hands", _new_state_str]];
