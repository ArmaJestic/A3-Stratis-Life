// A_armoredsuv_fnc_close_minigun

#include "../../includes/macro.h"


ARGV(0,_vehicle);
_vehicle animate["HideGun_01",1];
_vehicle animate["HideGun_02",1];
_vehicle animate["HideGun_03",1];
_vehicle animate["HideGun_04",1];
_vehicle animate["CloseCover1",1];
_vehicle animate["CloseCover2",1];
[_vehicle, "minigun_open", false, true] call A_object_fnc_setVariable;
