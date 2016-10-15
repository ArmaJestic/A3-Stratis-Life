// A_drag_fnc_object_label

#include "header.h"


params["_object"];
if (UNDEFINED(_object)) exitWith {""};

if (!(isNull _object) && {isPlayer _object}) exitWith {name _object};
(_object getVariable ["label", "item"])