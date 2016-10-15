// A_broadcast_fnc_broadcast

#include "header.h"


params[["_code",null,["",{}]]];
if UNDEFINED(_code) exitWith {};
_code = [_code, (compile _code)] select ((typename _code)=="STRING");
if (_code isEqualTo {}) exitWith {};

missionNamespace setVariable[player_broadcast_buffer,_code,true];
call _code;