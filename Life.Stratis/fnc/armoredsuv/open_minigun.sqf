// A_armoredsuv_fnc_open_minigun

#include "..\..\includes\macro.h"


ARGV(0,_vehicle);
_vehicle animate["HideGun_01",0];
_vehicle animate["HideGun_02",0];
_vehicle animate["HideGun_03",0];
_vehicle animate["HideGun_04",0];
_vehicle animate["CloseCover1",0];
_vehicle animate["CloseCover2",0];
[_vehicle, "minigun_open", true, true] call A_object_fnc_setVariable;
