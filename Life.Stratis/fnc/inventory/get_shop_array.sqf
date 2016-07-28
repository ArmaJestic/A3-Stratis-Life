// A_inventory_fnc_get_shop_array

#include "..\..\includes\constants.h"
#include "..\..\includes\macro.h"


private ["_c", "_Fshoparray"];
_Fshoparray = [];
if ((typeName _this) == "OBJECT") then {
	for "_c" from 0 to (count A_inv_var_itemshops - 1) do {
		if (((A_inv_var_itemshops select _c) select 0) == _this) then {
			_Fshoparray = A_inv_var_itemshops select _c;
		};
	};
};
if ((typeName _this) == "ARRAY") then {
	_Fshoparray = _this;
};
_Fshoparray
