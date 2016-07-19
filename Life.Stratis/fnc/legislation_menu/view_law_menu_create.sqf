// A_legislation_menu_fnc_view_law_menu_create

#include "../../includes/constants.h"
#include "../../includes/macro.h"


ARGV(0,_player);
ARGV(1,_law_index);

if (not([_player] call A_player_fnc_exists)) exitWith {};
if (undefined(_law_index)) exitWith {};
if (typeName _law_index != "SCALAR") exitWith {};
if (_law_index >= (count legislation_laws)) exitWith {};

_field = [toUpper(format["Law #%1", (_law_index + 1)]), false] call A_legislation_menu_fnc_modify_law_menu_setup;

private["_law_text"];
_law_text = legislation_laws select _law_index;
_field ctrlSetText _law_text;
