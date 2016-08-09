// A_bis_expected_fnc_addPlayerInventoryItem

#include "..\..\includes\macro.h"


ARGV(0,_player);
ARGV(1,_item_id);
if(!([_player] call A_player_fnc_human)) exitWith {null};
if (undefined(_item_id)) exitWith {null};
if (typeName _item_id != "STRING") exitWith {null};

if ([_item_id] call A_config_fnc_class_magazine) exitWith {
	_player addMagazine _item_id;
};

_player addItem _item_id;
