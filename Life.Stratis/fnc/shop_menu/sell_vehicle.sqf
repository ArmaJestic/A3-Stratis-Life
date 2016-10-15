// A_shop_menu_fnc_sell_vehicle

#include "header.h"


disableSerialization;
ARGV(0,_data);

if (UNDEFINED(_data)) exitWith {null};
if (typeName _data != "ARRAY") exitWith {null};
private["_player"];
_player = player;

private ["_class", "_item", "_total_return", "_class", "_item_name", "_i", "_amount", "_type", "_vehicles", "_vehicle"];

_item = _data select INDEX_SELL_KEY;
_item_name = _data select INDEX_SELL_NAME;
_class = _data select INDEX_SELL_CLASS;
_total_return = _data select INDEX_SELL_TOTAL_RETURN;
_amount = _data select INDEX_SELL_AMOUNT;
_type = _data select INDEX_SELL_TYPE;

_vehicles = [_player, _class, _item, 50] call A_shop_menu_fnc_get_vehicles_by_class_item;
_vehicles_count = (count _vehicles);
_vehicle = null;
if  (_vehicles_count == 0) exitWith { false };
if (_vehicles_count > 1) then {
	_vehicle = [_vehicles] call A_shop_menu_fnc_sell_select_vehicle_wait;
}else{
	_vehicle = _vehicles select 0;
};

[_player, _vehicle] call A_vehicle_fnc_remove;
if (UNDEFINED(_vehicle)) exitWith { false };


private["_uid"];
_uid = getPlayerUID _player;

[_vehicle, "uid_sold", _uid, true] call A_object_fnc_setVariable;
player groupChat format["Vehicle being sold, please wait 5 seconds"];
closeDialog 0;
sleep 5;
private["_uid_sold"];
_uid_sold = [_vehicle, "uid_sold"] call A_object_fnc_getVariable;
_uid_sold = if (UNDEFINED(_uid_sold)) then {""} else {_uid_sold};
_uid_sold = if (typeName _uid_sold != "STRING") then {""} else {_uid_sold};

if (_uid_sold != _uid || UNDEFINED(_vehicle)) exitWith {
	player groupChat format["ERROR: Someone already sold this vehicle"];
	false
};

player groupChat format["You sold the vehicle for $%1.", strM(_total_return)];
deleteVehicle _vehicle;
true
