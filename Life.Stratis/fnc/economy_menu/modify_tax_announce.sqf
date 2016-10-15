// A_economy_menu_fnc_modify_tax_announce

#include "header.h"


params["_player"];
private _tax_str = "";
{
	private _tax_data = _x;
	private _tax_name = _tax_data select DLG_ECON_TAX_INDEX_NAME;
	private _tax_value = _tax_data select DLG_ECON_TAX_INDEX_VALUE;
	_tax_str = _tax_str + format["%1 tax: %2%3\n", _tax_name, _tax_value, "%"];
} forEach economy_tax_data;
hint (format["%1-%2 has changed the taxes.\n", _player, (name _player)] + _tax_str);