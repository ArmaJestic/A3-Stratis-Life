// A_broadcast_fnc_make_key

#include "..\..\includes\macro.h"


private["_id"];
_id = _this select 0;
if (undefined(_id)) exitWith {null};
if (typeName _id != "SCALAR") exitWith {null};
format["ISSE_pub_Pstr_%1",_id];
