// A_shop_menu_fnc_sell_vehicle

#include "../../includes/constants.h"
#include "../../includes/macro.h"


disableSerialization;
ARGV(0,_data);

if (undefined(_data)) exitWith {null};
if (typeName _data != "ARRAY") exitWith {null};
private["_player"];
_player = player;

private ["_class", "_item", "_total_return", "_class", "_item_name", "_i", "_amount", "_type", "_vehicles", "_vehicle"];

_item = _data select A_shop_menu_var_sell_item_key;
_item_name = _data select A_shop_menu_var_sell_item_name;
_class = _data select A_shop_menu_var_sell_item_class;
_total_return = _data select A_shop_menu_var_sell_item_total_return;
_amount = _data select A_shop_menu_var_sell_item_amount;
_type = _data select A_shop_menu_var_sell_item_type;

_vehicles = [_player, _class, _item, 50] call A_shop_menu_fnc_get_vehicles_by_class_item;
_vehicles_count = (count _vehicles);
_vehicle = null;
if  (_vehicles_count == 0) exitWith { false };
if (_vehicles_count > 1) then {
	_vehicle = [_vehicles] call A_shop_menu_fnc_sell_select_vehicle_wait;
}
else {
	_vehicle = _vehicles select 0;
};

[_player, _vehicle] call A_vehicle_fnc_remove;
if (undefined(_vehicle)) exitWith { false };


private["_uid"];
_uid = getPlayerUID _player;

[_vehicle, "uid_sold", _uid, true] call A_object_fnc_setVariable;
player groupChat format["Vehicle being sold, please wait 5 seconds"];
closeDialog 0;
sleep 5;
private["_uid_sold"];
_uid_sold = [_vehicle, "uid_sold"] call A_object_fnc_getVariable;
_uid_sold = if (undefined(_uid_sold)) then {""} else {_uid_sold};
_uid_sold = if (typeName _uid_sold != "STRING") then {""} else {_uid_sold};

if (_uid_sold != _uid || undefined(_vehicle)) exitWith {
	player groupChat format["ERROR: Someone already sold this vehicle"];
	false
};

player groupChat format["You sold the vehicle for $%1.", strM(_total_return)];
deleteVehicle _vehicle;
true
