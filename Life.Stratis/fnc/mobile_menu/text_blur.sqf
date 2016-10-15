// A_mobile_menu_fnc_text_blur

#include "..\..\includes\macro.h"
#include "..\..\includes\constants.h"


player grouPChat format["A_mobile_menu_fnc_text_blur %1", _this];
ARGV(0,_control);
private["_text", "_len"];
_text = ctrlText _control;
_len = [_text] call A_misc_fnc_strlen;
if (_len == 0) then {
	_control ctrlSetText A_mobile_menu_var_default_text;
	_control ctrlCommit 0;
};

if (_len > A_mobile_menu_var_max_text) then {
	_text = [_text, 0, A_mobile_menu_var_max_text -1] call A_misc_fnc_substr;
	_control ctrlSetText _text;
};
