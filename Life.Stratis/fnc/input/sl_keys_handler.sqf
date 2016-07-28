// A_input_fnc_sl_keys_handler

#include "..\..\includes\macro.h"
#include "..\..\includes\dikcodes.h"


private["_key_spam"];
_key_spam = false;
if (undefined(handling_sl_toggle)) then {
	handling_sl_toggle = true;
}
else { if ( handling_sl_toggle) then {
	_key_spam = true;
};};
if (_key_spam) exitWith {null};

if (INV_shortcuts) then {
	titletext["SL keys off", "PLAIN DOWN"];
	call A_main_var_a_actionsremove;
	INV_shortcuts = false;
}
else {
	titletext["SL keys on", "PLAIN DOWN"];
	call A_main_var_a_actions;
	INV_shortcuts = true; 
};

handling_sl_toggle = false;
true
