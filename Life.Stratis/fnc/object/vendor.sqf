// A_object_fnc_vendor

#include "..\..\includes\macro.h"


private["_object"];
_object = _this select 0;
if (UNDEFINED(_object)) exitWith {false};
if (typeName _object != "OBJECT") exitWith {false};
if (isNull _object) exitWith {false};
	
(_object in A_inv_var_vendors_list)
