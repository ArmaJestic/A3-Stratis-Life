// A_main_menu_fnc_handle_economy

#include "../../includes/macro.h"
#include "../../includes/constants.h"


ARGV(0,_title);
private["_list"];
_list = [toUpper(_title), 0.14, 0.14, 0.6, 0.7] call A_main_menu_fnc_right_setup;

{
	private["_tax_data", "_tax_name", "_tax_value"];
	_tax_data = _x;
	_tax_name = _tax_data select A_economy_menu_var_tax_name;
	_tax_value = _tax_data select A_economy_menu_var_tax_value;
	
	_list lbAdd format["%1 Tax: %2%3", _tax_name, _tax_value, "%"];
} foreach economy_tax_data;

_list lbAdd format["Oil demand: %1 barrel/s", strN(call A_shop_menu_fnc_get_oil_barrel_demand)];
_list lbAdd format["Fuel price: $%1 per liter", (call A_shop_menu_fnc_get_fuel_price)];
_list lbAdd _trennlinie;
