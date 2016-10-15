// A_shop_menu_fnc_open

#include "header.h"


ARGV(0,_shop_id);
if (UNDEFINED(_shop_id)) exitWith {null};
if (typeName _shop_id != "SCALAR") exitWith {null};

private ["_shop_cache"];
_shop_cache = [_shop_id] call A_shop_menu_fnc_lookup;
if (UNDEFINED(_shop_cache)) exitWith {null};

_indicator = [_shop_cache, "indicator"] call A_object_fnc_getVariable;
if (!(UNDEFINED(_indicator))) then {
	//_indicator hideObject true;
	//detach _indicator;
	deleteVehicle _indicator;
};

[_shop_cache, "open", true] call A_object_fnc_setVariable;
