// A_arrest_menu_fnc_bail_slider_changed

#include "..\..\includes\macro.h"
#include "..\..\includes\constants.h"


ARGV(0,_control);

private["_position"];
_position = sliderPosition (ctrlIDC _control);
_position = round(_position);

ctrlSetText [arrest_menu_bail_field_idc, format["%1%2",_position, "%"]];
