// A_isse_str_fnc_isinteger

#include "..\..\includes\macro.h"


private["_num"];
_num = _this call A_isse_str_fnc_getinteger;
(  (_num select 0) and ((_num select 1) == (round (_num select 1)))  )
