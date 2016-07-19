// A_vehicle_fnc_interact_view_trunk

#include "../../includes/macro.h"


ARGV(0,_this);
ARGV(0,_player);
ARGV(1,_vehicle);

if (not([_player, _vehicle] call A_vehicle_fnc_view_trunk_available)) exitWith {};

private["_storage_name"];
_storage_name = ([_vehicle] call A_vehicle_fnc_storage_name);

private["_title", "_list"];
_title = format["Vehicle Trunk Storage", (name _player)];
_list = [_title, 0.14, 0.14, 0.6, 0.7] call A_main_menu_fnc_right_setup;

lbClear (ctrlIDC _list);

player groupChat format["_storage_name = %1", _storage_name];
private["_i","_inventory"];
_inventory = [_vehicle, _storage_name] call A_object_fnc_getVariable;
player groupChat format["_inventory = %1", _inventory];
_i = 0;
while {_i < (count _inventory)} do {
	private["_object", "_object_name", "_amount"];
	_object = ((_inventory select _i) select 0);
	_object_name = (MASTER_ARRAY_ITEM_NAME(_object));
	_amount = [((_inventory select _i) select 1)] call A_encoding_fnc_decode_number;
	if (_amount > 0) then {
		if (_object == "money") then {
			_list lbAdd format ["%1: $%2", _object_name, strM(_amount)];
		 }
		 else {
			_list lbAdd format ["%1: %2", _object_name, _amount];
		 };
	};
	_i = _i + 1;
};
