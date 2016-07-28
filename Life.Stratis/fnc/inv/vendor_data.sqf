// A_inv_fnc_vendor_data

#include "..\..\includes\macro.h"


private["_vendor_object"];
_vendor_object = _this select 0;
if (undefined(_vendor_object)) exitWith {null};
if (typeName _vendor_object != "OBJECT") exitWith {null};

if (not(_vendor_object in A_inv_var_vendors_list)) exitWith {null};

private["_index"];
_index = A_inv_var_vendors_list find _vendor_object;

if (_index < 0) exitWith {null};

(A_inv_var_vendors_array select _index)
