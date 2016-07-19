// A_inventory_fnc_get_shop_number

#include "..\..\includes\constants.h"
#include "..\..\includes\macro.h"


private ["_object"];
_object = _this;

if ((typeName _object) != "OBJECT") exitWith {null};

private["_shop_id", "_i"];
_shop_id = null;
_i = 0;
while { _i < (count INV_ItemShops) } do {
	private["_cobject"];
	_cobject = ((INV_ItemShops select _i) select 0);
	if (_cobject == _object) exitWith {
		_shop_id = _i;
	};
	_i = _i + 1;
};
_shop_id
