// A_inventory_fnc_get_item_array

#include "..\..\includes\constants.h"
#include "..\..\includes\macro.h"


private ["_c", "_Fobjarray"];
_Fobjarray = [];
if ((typeName _this) == "STRING") then {
	_Nname = format["A_MS_%1", _this];
	_Fobjarray = missionNamespace getVariable [_Nname,[]];
};

if ((typeName _this) == "ARRAY") then {
	_Fobjarray = _this;
};

if (count(_Fobjarray) == 0) then {
	diag_log format["WARNING: could not find '%1' in master array", _this];
};

_Fobjarray
