// A_shop_menu_fnc_set_fuel_consumed

#include "header.h"


ARGV(0,_fuel_consumed);
if (UNDEFINED(_fuel_consumed)) exitWith {null};
if (typeName _fuel_consumed != "SCALAR") exitWith {null};

server setVariable["fuel_consumed", _fuel_consumed, true];
