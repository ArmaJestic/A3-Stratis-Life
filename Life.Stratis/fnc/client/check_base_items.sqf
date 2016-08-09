// A_client_fnc_check_base_items

#include "..\..\includes\macro.h"


private["_player"];
_player = player;
if (!(alive _player)) exitWith {};

private["_assigned_items", "_item"];
_assigned_items = assignedItems _player;
if (undefined(_assigned_items)) exitWith {};

_item = "ItemRadio";
if (!(_item in _assigned_items)) then {
	_player linkItem _item;
};

_item = "ItemMap";
if (!(_item in _assigned_items)) then {
	_player linkItem _item;
};

_item = "ItemCompass";
if (!(_item in _assigned_items)) then {
	_player linkItem _item;
};
