// A_inv_fnc_createitem

#include "header.h"


private["_object", "_class", "_amount", "_storage"];
_object = _this select 0;
_class = _this select 1;
_amount = _this select 2;
_storage = _this select 3;
[_object, _class, _amount, _storage] call A_inventory_fnc_storage_add_item;
