// A_shop_menu_fnc_update_fuel_consumed

#include "..\..\includes\constants.h"
#include "..\..\includes\macro.h"


ARGV(0,_consumed);
if (undefined(_consumed)) exitWith {null};
if (typeName _consumed != "SCALAR") exitWith {null};

private["_total_consumed"];
_total_consumed = call A_shop_menu_fnc_get_fuel_consumed;
_total_consumed = _total_consumed + _consumed;

if (_total_consumed < 0) then {
	_total_consumed = 0;
};

if (_total_consumed > A_main_var_fuel_max_reserve) then {
	_total_consumed = A_main_var_fuel_max_reserve;
};

[_total_consumed] call A_shop_menu_fnc_set_fuel_consumed;
