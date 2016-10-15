// A_inventory_fnc_get_shop_item_number

#include "header.h"


ARGV(0,_item);
ARGV(1,_shopinv);

if (UNDEFINED(_item)) exitWith {null};
if (UNDEFINED(_shopinv)) exitWith {null};

private ["_shopitemnum"];
_shopitemnum = [];
if ((typeName _item) == "STRING") then {
	private["_i"];
	_i = 0;
	while { _i < (count _shopinv) } do {
		if ((_shopinv select _i) == _item) then {
			_shopitemnum = _i;
		};
		_i = _i + 1;
	};
};
_shopitemnum
