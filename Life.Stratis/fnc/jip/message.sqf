// A_jip_fnc_message

#include "../../includes/macro.h"
#include "../../includes/constants.h"

ARGV(0,_message);
if (undefined(_message)) exitWith {};
diag_log _message;
//player globalChat _message;
