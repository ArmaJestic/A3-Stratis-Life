// A_drag_fnc_object_label

#include "..\..\includes\constants.h"
#include "..\..\includes\macro.h"


ARGV(0,_object);
if (undefined(_object)) exitWith {""};

if (not(isNull _object) && {isPlayer _object}) exitWith {name _object};
(_object getVariable ["label", "item"])
