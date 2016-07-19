// A_economy_menu_fnc_modify_tax_announce

#include "..\..\includes\constants.h"
#include "..\..\includes\macro.h"


ARGV(0,_player);

private["_tax_str"];
_tax_str = "";

{
	private["_tax_data", "_tax_name", "_tax_value"];
	_tax_data = _x;
	_tax_name = _tax_data select A_economy_menu_var_tax_name;
	_tax_value = _tax_data select A_economy_menu_var_tax_value;
	_tax_str = _tax_str + format["%1 tax: %2%3\n", _tax_name, _tax_value, "%"];
} forEach economy_tax_data;
hint (format["%1-%2 has changed the taxes.\n", _player, (name _player)] + _tax_str);
