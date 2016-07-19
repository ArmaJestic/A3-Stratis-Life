// A_object_fnc_shop

#include "..\..\includes\macro.h"


private["_object"];
_object = _this select 0;
if (undefined(_object)) exitWith {false};
if (typeName _object != "OBJECT") exitWith {false};
if (isNull _object) exitWith {false};

(_object in A_farming_var_shopusearray)
