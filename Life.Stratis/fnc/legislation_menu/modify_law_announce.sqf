// A_legislation_menu_fnc_modify_law_announce

#include "../../includes/constants.h"
#include "../../includes/macro.h"


ARGV(0,_law_index);
ARGV(1,_law_text);

private["_message"];
_message = format["Law #%1 has changed.\n%2", (_law_index + 1), _law_text];	
hint _message;
