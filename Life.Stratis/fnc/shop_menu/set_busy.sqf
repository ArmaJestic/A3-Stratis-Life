// A_shop_menu_fnc_set_busy

#include "..\..\includes\constants.h"
#include "..\..\includes\macro.h"


_this spawn {
	ARGV(0,_timeout);
	_timeout = if(undefined(_timeout)) then { 0 } else {_timeout};
	_timeout = if (typeName _timeout != "SCALAR") then { 0 } else { _timeout };
	if (A_shop_menu_var_busy) exitWith {null};
	A_shop_menu_var_busy = true;
	call A_shop_menu_fnc_update_buy_item;
	call A_shop_menu_fnc_update_sell_item;
	sleep _timeout;
	A_shop_menu_var_busy = false;
	call A_shop_menu_fnc_update_buy_item;
	call A_shop_menu_fnc_update_sell_item;
};	
