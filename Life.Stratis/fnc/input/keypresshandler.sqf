// A_input_fnc_keypresshandler

#include "..\..\includes\macro.h"
#include "..\..\includes\dikcodes.h"


private ["_ctrl", "_zeichennummer", "_ctrlid"];
_ctrl          = ((_this select 0) select 0);
_zeichennummer = ((_this select 0) select 1);
_ctrlid        = (_this select 1);
if (A_isse_str_var_const_validinput find _zeichennummer < 0) then {
	closedialog 0;
	player groupChat format[localize "STRS_wrong_input", _zeichennummer];
};