// A_economy_menu_fnc_menu_handle_tax

#include "../../includes/constants.h"
#include "../../includes/macro.h"


ARGV(0,_title);
ARGV(1,_player);
ARGV(2,_this);

ARGV(0,_tax_type);
	
private["_tax_data"];
_tax_data = [_tax_type] call A_economy_menu_fnc_lookup_tax_type;
if (undefined(_tax_data)) exitWith {};

private["_tax_name", "_tax_value", "_tax_range"];
_tax_name = _tax_data select A_economy_menu_var_tax_name;
_tax_value = _tax_data select A_economy_menu_var_tax_value;
_tax_range = _tax_data select A_economy_menu_var_tax_range;

[toUpper(format["%1 Tax", _tax_name]), _tax_range, _tax_value] call A_economy_menu_fnc_tax_menu_setup;

buttonSetAction [economy_tax_menu_submit_button_idc, '[' + str(_player) + ', ' + str(_tax_type) + ', round(sliderPosition economy_tax_menu_info_slider_idc)] call A_economy_menu_fnc_modify_tax'];
