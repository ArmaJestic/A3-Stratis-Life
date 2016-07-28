// A_broadcast_fnc_broadcast

#include "..\..\includes\macro.h"


private["_code"];
_code = _this;
if (undefined(_code)) exitWith {null};
if (typeName _code != "STRING") exitWith {null};

missionNamespace setVariable [player_broadcast_buffer, _code];
publicVariable player_broadcast_buffer;
call compile _code;
