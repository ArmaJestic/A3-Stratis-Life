// A_shop_menu_fnc_sell_select_vehicle_wait

#include "header.h"


//player groupChat format["A_shop_menu_fnc_sell_select_vehicle_wait %1", _this];
ARGV(0,_vehicles);

private["_dialog"];
if (UNDEFINED(_vehicles)) exitWith {null};
if (typeName _vehicles != "ARRAY") exitWith {null};

private["_class", "_name", "_picture"];
_class = typeOf(_vehicles select 0);
_name = getText(configFile >> "CfgVehicles" >> _class >> "displayName");
_picture = [_class] call A_misc_fnc_generic_picture_path;

private["_controls", "_list", "_submit"];
_controls = [toUpper(format["%1 LIST", _name]), 0.14, 0.14, 0.55, 0.45] call A_list_simple_menu_fnc_setup;
_list = _controls select DLG_LIST_SIMPLE_INDEX_LIST;
_submit = _controls select DLG_LIST_SIMPLE_INDEX_SUBMIT;

_submit ctrlSetText "Sell";
_submit ctrlCommit 0;

private["_list_idc"];
_list_idc = (ctrlIDC _list);

buttonSetAction [(ctrlIDC _submit), '[([] call A_list_simple_menu_fnc_label_data)] call A_shop_menu_fnc_sell_select_vehicle;'];
private["_i", "_count"];
_count = count _vehicles;
_i = 0;
shop_sell_selected_vehicle = null;
while { _i < _count } do {
	private["_index", "_vehicle", "_vehicle_str", "_distance"];
	_vehicle = _vehicles select _i;
	_distance = round(player distance _vehicle);
	_vehicle_str = format["%1 (%2 meters)", _vehicle, _distance];
	_index = lbAdd [_list_idc, _vehicle_str];
	lbSetData [_list_idc, _index, str(_vehicle)];
	lbSetPicture [_list_idc, _index, _picture];
	_i = _i + 1;
};
lbSetCurSel [_list_idc, 0];

waitUntil { !(ctrlVisible _list_idc)};

_vehicle = shop_sell_selected_vehicle;
shop_sell_selected_vehicle = null;
_vehicle
