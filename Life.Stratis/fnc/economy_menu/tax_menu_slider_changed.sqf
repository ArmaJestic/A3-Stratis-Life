// A_economy_menu_fnc_tax_menu_slider_changed

#include "header.h"


ARGV(0,_control);

private["_position"];
_position = sliderPosition (ctrlIDC _control);
_position = round(_position);

ctrlSetText [economy_tax_menu_info_field_idc, format["%1%2",_position, "%"]];
