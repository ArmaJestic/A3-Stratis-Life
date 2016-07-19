// A_shop_menu_fnc_set_status_message

#include "../../includes/constants.h"
#include "../../includes/macro.h"


ARGV(0,_text);
_quiet = if (count _this > 1) then { _this select 1 } else { false };
if (_quiet) exitWith {null};

ctrlSetText [buy_sell_status_label_idc, _text];
