// A_input_fnc_keys_handler

#include "..\..\includes\macro.h"
#include "..\..\includes\dikcodes.h"


private["_key_spam"];
_key_spam = false;
if (UNDEFINED(handling_sl_toggle)) then {
	handling_sl_toggle = true;
}else{ if ( handling_sl_toggle) then {
	_key_spam = true;
};};
if (_key_spam) exitWith {null};

if (A_inv_var_shortcuts) then {
	cutText["SL keys off", "PLAIN DOWN"];
	[] call A_actions_fnc_actions_remove;
	A_inv_var_shortcuts = false;
}else{
	cutText["SL keys on", "PLAIN DOWN"];
	[] call A_actions_fnc_actions;
	A_inv_var_shortcuts = true; 
};

handling_sl_toggle = false;
true
