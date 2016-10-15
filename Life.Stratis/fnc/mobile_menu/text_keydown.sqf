// A_mobile_menu_fnc_text_keydown

#include "..\..\includes\macro.h"
#include "..\..\includes\constants.h"


ARGV(0,_control);
ARGV(1,_key);

private["_text", "_len"];
_text = ctrlText _control;
_len = [_text] call A_misc_fnc_strlen;
private["_menu"];
_menu = (uiNamespace getVariable 'MOBILE_MENU');
if (_len > A_mobile_menu_var_max_text && (_key != DIK_BACKSPACE)) exitWith {
	ctrlSetFocus (_menu displayCtrl mobile_menu_overflow_field_idc);
};

private["_count_field"];
_count_field = (_menu displayCtrl mobile_characters_field_idc);
_count_field ctrlSetText str(_len);
