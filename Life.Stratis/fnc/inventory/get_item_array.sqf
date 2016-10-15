// A_inventory_fnc_get_item_array

#include "header.h"


private ["_c", "_Fobjarray"];
_Fobjarray = [];
if ((typeName _this) == "STRING") then {
//	diag_log format["A_inventory_fnc_get_item_array string: %1", _this];
	
	_Nname = format["A_MS_%1", _this];
	_Fobjarray = missionNamespace getVariable [_Nname,[]];
}else{
	if ((typeName _this) == "ARRAY") then {
	//	diag_log format["A_inventory_fnc_get_item_array array: %1", (_this select 0)];

		_Fobjarray = _this;
	};
};

if (count(_Fobjarray) == 0) then {
	diag_log format["A_inventory_fnc_get_item_array: could not find '%1' in master array", _this];
};

_Fobjarray