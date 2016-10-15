// A_inv_fnc_vendor_data

#include "header.h"


params[["_vendor_object",null,[objNull]]];
if (UNDEFINED(_vendor_object)) exitWith {null};

if !(_vendor_object in A_inv_var_vendors_list) exitWith {null};

private _index = A_inv_var_vendors_list find _vendor_object;

if (_index < 0) exitWith {null};
(A_inv_var_vendors_array select _index)