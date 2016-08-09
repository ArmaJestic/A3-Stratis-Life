// A_interaction_fnc_inventory_menu

#include "..\..\includes\macro.h"
#include "..\..\includes\constants.h"
#include "..\..\includes\dikcodes.h"


ARGV(0,_player);
if (!([_player] call A_player_fnc_human)) exitWith {null};
if (!(createDialog "inventory_menu")) exitWith {hint "Dialog Error!";};

[] call A_inventory_menu_fnc_setup;

//populate the inventory list
private["_i", "_inventory"];
_i = 0;
_inventory = [_player] call A_player_fnc_get_inventory;
while { _i < (count _inventory) } do {if (true) then {

	private["_entry"];
	_entry = (_inventory select _i);
	
	private ["_item", "_number"];
	_item = (_entry select 0);
	_number = [(_entry select 1)] call A_encoding_fnc_decode_number;
	
	private["_data", "_type", "_class"];
	_data = ITEM_DATA(_item);
	

	if (_number > 0 && count(_data) > 0) then {
		private["_lbl_name"];
		_lbl_name = (ITEM_DATA_NAME(_data));
		private["_index"];
		_index = lbAdd[inventory_items_list_idc, _lbl_name];
		lbSetData [inventory_items_list_idc, _index, _item];
		
		_type = ITEM_DATA_TYPE(_data);
		_class = ITEM_DATA_CLASS(_data);
	
		private["_picture"];
		_picture = [_item, _class, _type] call A_object_fnc_icon;
		lbSetPicture [inventory_items_list_idc, _index,  _picture];
		//player groupChat format["_picture = %1", _picture];
	};
	
	_i = _i + 1;
};};

lbSetCurSel [inventory_items_list_idc, 0];

//populate the player's list
private["_c"];
_c = 0;
while { _c < (count playerstringarray) } do {
	private["_player_variable_name", "_player_variable"];
	_player_variable_name = playerstringarray select _c;
	_player_variable = missionNamespace getVariable [_player_variable_name, null];
	
	if ([_player_variable] call A_player_fnc_human) then {
		private["_player_name"];
		_player_name = (name _player_variable);
		_index = lbAdd [inventory_player_list_idc, format ["%1 - (%2)", _player_variable_name, _player_name]];
		lbSetData [inventory_player_list_idc, _index, format["%1", _player_variable_name]];
	};
	_c = _c + 1;
};

lbSetCurSel [inventory_player_list_idc, 0];
