// A_shop_menu_fnc_close

#include "../../includes/constants.h"
#include "../../includes/macro.h"


ARGV(0,_shop_id);
if (undefined(_shop_id)) exitWith {null};
if (typeName _shop_id != "SCALAR") exitWith {null};

private ["_shop_cache"];
_shop_cache = [_shop_id] call A_shop_menu_fnc_lookup;
if (undefined(_shop_cache)) exitWith {null};

_indicator = [_shop_cache, "indicator"] call A_object_fnc_getVariable;

if (undefined(_indicator)) then {
	private ["_pos", "_indicator", "_model_pos", "_center", "_max_z"];
	_indicator = "Sign_Sphere25cm_F" createVehicleLocal [0,0,0];
	[_shop_cache, "indicator", _indicator] call A_object_fnc_setVariable;
	_max_z = ((boundingBox _shop_cache) select 1) select 2;
	_indicator attachTo [_shop_cache, [0,0,_max_z+0.1]];
};

//_indicator hideObject false;
[_shop_cache, "open", false] call A_object_fnc_setVariable;
