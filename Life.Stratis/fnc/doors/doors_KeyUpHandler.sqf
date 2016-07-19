// A_doors_fnc_doors_KeyUpHandler

#include "../../includes/constants.h"
#include "../../includes/macro.h"
#include "../../includes/dikcodes.h"


ARGV(0,_event);
ARGV(1,_data);

private["_key"];
_key = _event select 1;
if (_key == DIK_LSHIFT && A_doors_var_doors_lcontrol_state) then {
	A_doors_var_doors_lcontrol_state = false;
};
