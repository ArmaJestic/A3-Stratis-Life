// A_broadcast_fnc_receive

#include "..\..\includes\macro.h"


private["_value"];
_code = _this select 1;
if (undefined(_code)) exitWith {null};
if (typeName _code != "STRING") exitWith {null};
call compile _code;
