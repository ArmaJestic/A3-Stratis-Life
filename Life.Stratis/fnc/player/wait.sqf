// A_player_fnc_wait

#include "../../includes/macro.h"


ARGV(0,_flag_name);
if (undefined(_flag_name)) exitWith {null};
if (typeName _flag_name != "STRING") exitWith {null};
private["_flag_variable"];
_flag_variable = missionNamespace getVariable _flag_name;
if (undefined(_flag_variable)) exitWith {null};
waitUntil { (missionNamespace getVariable _flag_name)};
