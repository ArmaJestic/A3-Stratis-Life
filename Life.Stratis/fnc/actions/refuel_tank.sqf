// A_actions_fnc_refuel_tank

#include "..\..\includes\macro.h"


private ["_fuel", "_fuelstartposition", "_liter_price"];

_liter_price = _this select 0;
if (undefined(_liter_price)) exitWith {null};
if (typeName _liter_price != "SCALAR") exitWith {null};

_fuel = fuel (vehicle player);
_fuelstartposition = getpos(vehicle player);

private["_liters_consumed", "_refuel_cost", "_vehicle"];
_liters_consumed = 0;
_refuel_cost = 0;
_vehicle = vehicle player;

[_vehicle, true] call A_actions_fnc_set_refueling;
call A_actions_fnc_remove_refuel_action;

while {((fuel _vehicle) < 0.99)} do {
	private["_cvehicle", "_next_cost", "_player_money"];
	_next_cost = round((_liters_consumed + A_main_var_fuel_pump_rate) * _liter_price);
	_player_money = ([player, 'money'] call A_inventory_fnc_get_item_amount);
	if (_player_money < _next_cost ) exitWith {
		player groupChat "You don't have enough money to refuel the vehicle completely.";
	};

	_cvehicle = vehicle player;

	if (_vehicle != _cvehicle) exitWith {
		player groupChat "Stay inside the car while you are refueling it";
	};

	if (_vehicle distance _fuelstartposition > 3) exitWith {
		player groupChat "You cancelled the refuel-action by moving your vehicle";
	};
	
	private["_i"];
	_i = 0;
	while { _i < A_main_var_fuel_pump_rate && ((fuel _vehicle) < 0.99)} do {
		_vehicle setFuel ((fuel _vehicle) + 0.01);
		_liters_consumed = _liters_consumed + 1;
		_i = _i + 1;
	};
	
	titleText [ format["Refueling %1%2 ...", round(fuel _vehicle * 100), "%"], "PLAIN DOWN"];
	sleep 1;
};

call A_actions_fnc_remove_refuel_action;
[_vehicle, false] call A_actions_fnc_set_refueling;

if (_liters_consumed > 0) then {
	
	_refuel_cost = round((_liters_consumed * _liter_price));
	_percent_refueled =  round(fuel _vehicle * 100);
	titleText[format["Your total refueling cost was $%1, your vehicle is now %2%3 full.", _refuel_cost, _percent_refueled, "%"], "PLAIN DOWN"];
	[_liters_consumed] call A_shop_menu_fnc_update_fuel_consumed;
	[player, 'money', -(_refuel_cost)] call A_inventory_fnc_add_item;
};
