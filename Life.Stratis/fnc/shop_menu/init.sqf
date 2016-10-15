// A_shop_menu_fnc_init

#include "header.h"


// useless?
A_shop_menu_var_spawn_cleanup_queue = [];

A_shop_menu_var_sell_active = false;
A_shop_menu_var_busy = false;

[A_inv_var_itemshops] spawn A_shop_menu_fnc_setup;