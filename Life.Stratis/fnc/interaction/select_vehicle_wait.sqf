// A_interaction_fnc_select_vehicle_wait

#include "..\..\includes\macro.h"
#include "..\..\includes\constants.h"
#include "..\..\includes\dikcodes.h"


//player groupChat format["A_interaction_fnc_select_vehicle_wait %1", _this];
disableSerialization;
ARGV(0,_vehicle_names_list);

private["_dialog"];

if (undefined(_vehicle_names_list)) exitWith {null};
if (typeName _vehicle_names_list != "ARRAY") exitWith {null};

private["_controls", "_list", "_submit"];
_controls = [toUpper("Owned Vehicles"), 0.14, 0.14, 0.55, 0.45] call A_list_simple_menu_fnc__setup;
_list = _controls select A_list_simple_menu_var_list;
_submit = _controls select A_list_simple_menu_var_submit;

_submit ctrlSetText "Select";

buttonSetAction [(ctrlIDC _submit), '[([] call A_list_simple_menu_fnc__label_data)] call A_interaction_fnc_select_vehicle;'];

_submit ctrlCommit 0;

private["_i"];
_i = 0;
interact_selected_vehicle = null;
while { _i < count(_vehicle_names_list) } do {
	private["_index", "_vehicle_name"];
	_vehicle_name = _vehicle_names_list select _i;
	private["_vehicle", "_info"];
	_vehicle = missionNamespace getVariable [_vehicle_name, null];
	
	private["_name", "_picture"];
	
	_picture= "";
	if ([_vehicle] call A_vehicle_fnc_exists) then {
		private["_class"];
		_class = typeOf _vehicle;
		_name = getText(configFile >> "CfgVehicles" >> _class >> "displayName");
		_picture = [_class] call A_misc_fnc_generic_picture_path;	
		_info = format["(%1)",_name];
	}
	else { if (["impound_lot", _vehicle_name] call A_vehicle_storage_fnc_contains) then {
		private["_impund_data", "_class"];
		_impound_data = ["impound_lot", _vehicle_name] call A_vehicle_storage_fnc_get;
		_class = _impound_data select A_vehicle_storage_var_data_entry_class;
		_name = getText(configFile >> "CfgVehicles" >> _class >> "displayName");
		_picture = [_class] call A_misc_fnc_generic_picture_path;
		_info = format["(%1 - impounded)", _name];
	}
	else {
		_info = "(destroyed)";
	};};
	
	_index = _list lbAdd format["%1 %2", _vehicle_name, _info];
	_list lbSetData [_index, _vehicle_name];
	_list lbSetPicture [_index, _picture];
	_i = _i + 1;
};

_list lbSetCurSel 0;
waitUntil {not(ctrlShown _list)};

private["_vehicle_name"];
_vehicle_name = interact_selected_vehicle;
interact_selected_vehicle = null;
_vehicle_name
