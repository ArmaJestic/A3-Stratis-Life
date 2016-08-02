// A_actions_fnc_add_refuel_action

#include "..\..\includes\macro.h"


private["_liter_price", "_refuel_cost", "_liters_missing",  "_vehicle"];

_vehicle  = vehicle player;
_liter_price = call A_shop_menu_fnc_get_fuel_price;
_liters_missing = round((1 - (fuel _vehicle)) * 100);
_refuel_cost = round(_liters_missing *  _liter_price);

if (_refuel_cost <= 0) exitWith {null};
if (([_vehicle] call A_actions_fnc_get_refueling)) exitWith {null};


_refuel_action = _vehicle addAction [format["Fill gas tank for $%1", _refuel_cost], A_other_fnc_noscript, format["[%1] call A_actions_fnc_refuel_tank", _liter_price], 1];

[_vehicle, _refuel_action] call A_actions_fnc_set_refuel_action;
