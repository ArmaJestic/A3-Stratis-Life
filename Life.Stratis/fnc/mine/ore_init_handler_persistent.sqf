// A_mine_fnc_ore_init_handler_persistent

#include "../../includes/constants.h"
#include "../../includes/macro.h"


ARGV(0,_object);
ARGV(1,_item);
if (undefined(_object)) exitWith {};
if (undefined(_item)) exitWith {};
if (typeName _object != "OBJECT") exitWith {};
if (typeName _item != "STRING") exitWith {};

[_object] call A_object_fnc_baptize;

private["_data"];
_data = ITEM_DATA(_item);
if (count(_data) == 0) exitWIth {};

if (ITEM_DATA_ORE(_data)) then {
	private["_texture"];
	_texture = ITEM_DATA_ORE_TEXTURE(_data);
	_object setObjectTexture [0, _texture];
	_object setObjectMaterial [0, "\a3\rocks_f\data\r2_boulder1.rvmat"]; 
};
