// A_client_fnc_check_static_weapons

#include "..\..\includes\macro.h"


private["_vehicle","_isStatic"];
_vehicle = (vehicle player);
_isStatic = (_vehicle isKindOf "StaticWeapon");
if (!(_isStatic)) exitWith {null};

_vehicle lock false;
