// A_shop_menu_fnc_toggle_sell_cb

#include "../../includes/constants.h"
#include "../../includes/macro.h"


private["_control", "_element", "_state", "_shop_id", "_current_state"];
_shop_id = call A_shop_menu_fnc_get_current_shop_id;
_current_state = [_shop_id] call A_shop_menu_fnc_get_sell_cb;
[_shop_id, not(_current_state)] call A_shop_menu_fnc_set_sell_cb;
[_shop_id] call A_shop_menu_fnc_refresh_sell_cb;
