// A_list_menu_fnc_remove

#include "..\..\includes\macro.h"
#include "..\..\includes\constants.h"


//player groupChat format["A_list_menu_fnc_remove %1", _this];
ARGV(0,_list_id);

if (UNDEFINED(_list_id)) exitWith {null};
if (typeName _list_id != "STRING") exitWith {null};

private["_index"];
_index = lbCurSel listMenu_itemsList_idc;

if (_index == -1) exitWith {
	player groupChat format["No item selected to remove"];
};

private["_item", "_text"];
_item = lbData [listMenu_itemsList_idc, _index];
_text = lbText [listMenu_itemsList_idc, _index];

if (!([_list_id, _item] call A_list_fnc_contains_key)) exitWith {
	player groupChat format["List does not contain ""%1""", _text];
};

lbSetColor [listMenu_itemsList_idc, _index, [1,0,0,1]];

player groupChat format["%1 was removed from the list", _text];

[_list_id, _item] call A_list_fnc_remove_key;
