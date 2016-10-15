// A_mobile_menu_fnc_text_focus

#include "..\..\includes\macro.h"
#include "..\..\includes\constants.h"


player groupChat format["A_mobile_menu_fnc_text_focus %1", _this];
ARGV(0,_control);
private["_text", "_len"];
_text = ctrlText _control;

if (_text == A_mobile_menu_var_default_text) then {
	_control ctrlSetText "";
	_control ctrlCommit 0;
};

if (_len > A_mobile_menu_var_max_text) then {
	_text = [_text, 0, A_mobile_menu_var_max_text - 1] call A_misc_fnc_substr;
	_control ctrlSetText _text;
};
