// A_trunk_fnc_in_use

#include "..\..\includes\macro.h"


ARGV(0,_vehicle);

private["_uuid", "_cuuid"];
_uuid = call A_trunk_fnc_get_uuid;
_cuuid = [_vehicle, "trunk_user_uuid"] call A_object_fnc_getVariable;

if (UNDEFINED(_cuuid)) exitWith { /* player groupChat format["_cuuid is nil"]; */ false };
if (typeName _cuuid != "STRING") exitWith { /* player groupChat format["_cuuid not STRIING"]; */ false };
if (_cuuid == "0") exitWith { /* player groupChat format["_cuuid = %1", _cuuid]; */ false };

/* player groupchat format["_cuuid = %1", _cuuid]; */

_in_use = (_cuuid != _uuid);
_in_use
