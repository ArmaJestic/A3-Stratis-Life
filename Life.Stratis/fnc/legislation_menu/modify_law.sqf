// A_legislation_menu_fnc_modify_law

#include "..\..\includes\constants.h"
#include "..\..\includes\macro.h"


ARGV(0,_player);
ARGV(1,_law_index);
ARGV(2,_law_text);


private["_law_length", "_max_law_length"];
_law_length = [_text] call A_misc_fnc_strlen;
_max_law_length = 120;
if (_law_length > _max_law_length) exitWith {
	player groupChat format["The text for this law is too long. It must must be %1 characters or less.", _max_law_length];
};

legislation_laws set [_law_index, _law_text]; 
publicVariable "legislation_laws";

[[_law_index, _law_text],  "A_legislation_menu_fnc_modify_law_announce", true] call BIS_fnc_MP;
closeDialog 0;
[] spawn {
	waitUntil {ctrlVisible legislation_menu_header_idc};
	[] call A_legislation_menu_fnc_menu_update_list;
};
