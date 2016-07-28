// A_inventory_fnc_storage_remove_illegal

#include "..\..\includes\constants.h"
#include "..\..\includes\macro.h"


ARGV(0,_object);
ARGV(1,_Arrayname);

if (not([_object, _arrayname, "drug"] call A_inventory_fnc_storage_has_kind)) exitWith {
	player groupchat "No illegal things found.";
	false
};

private["_drugs_value", "_Array", "_i"];
_drugs_value = 0;
_Array = [_object, (format["%1", _arrayname])] call A_object_fnc_getVariable;
_i = 0;
while { _i < (count _Array) } do {
	private["_item", "_infos"];
	_item  = ((_Array select _i) select 0);
	_infos = _item call A_inventory_fnc_get_item_array;

	if(_item call A_inventory_fnc_get_item_kind == "drug") then {
		private["_price", "_amount"];
		_amount = ([_object, _item, _arrayname] call A_inventory_fnc_get_storage_amount);
		_price  = (_infos call A_inventory_fnc_get_item_buy_cost);
		_drugs_value = _drugs_value + (_price * _amount);
	};
	_i = _i + 1;
};

[_object, _arrayname, "drug"] call A_inventory_fnc_storage_remove_kind;
(format ["if (player == %2) then {player groupChat ""%1 had A_item_fnc_drugs in its trunk, you removed them. You should jail the owner of %1 for %4 minutes or give him a ticket of $%5.""}; titletext [format[localize ""STRS_civmenucheck_hadA_item_fnc_drugs"", %1, %3], ""plain""];", _vcl, player, _A_item_fnc_drugs_value, ceil(_A_item_fnc_drugs_value/20000), ceil(_A_item_fnc_drugs_value/2)]) call A_broadcast_fnc_broadcast;
true
