// A_bis_expected_fnc_removeItemFromCargoGlobal

#include "..\..\includes\macro.h"


ARGV(0,_container);
ARGV(1,_item_id);

if (undefined(_container)) exitWith {false};
if (undefined(_item_id)) exitWith {false};
if (typeName _item_id != "STRING") exitWith {false};

private["_item_cargo", "_i"];
_item_cargo = itemCargo _container;

_i = 0;
while {_i < count(_item_cargo)} do {
	private["_citem_id"];
	_citem_id = _item_cargo select _i;
	if (toLower(_citem_id) == toLower(_item_id)) exitWith {
		_item_cargo set [_i, ""];
	};
	_i = _i + 1;
};

_item_cargo = _item_cargo - [""];

clearItemCargoGlobal _container;
{ _container addItemCargoGlobal [_x, 1]} forEach _item_cargo;
true
