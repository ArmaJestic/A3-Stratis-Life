// A_interaction_fnc_hint

#include "../../includes/macro.h"
#include "../../includes/constants.h"
#include "../../includes/dikcodes.h"


ARGV(0,_message);
if (undefined(_message)) exitWith {};
hint _message;
