// A_interaction_fnc_impound_vehicle_menu

#include "header.h"


disableSerialization;
params["_player","_logic"];
if (!([_player] call A_player_fnc_human)) exitWith {null};
if (UNDEFINED(_logic)) exitWith {null};

private _impound_lot_data = ["impound_lot"] call A_vehicle_storage_fnc_data;
if (UNDEFINED(_impound_lot_data)) exitWith {
	player groupChat format["ERROR: The impound lot has not been initialized"];
};

private _vehicles_name_list = [_player, "vehicles_name_list"] call A_player_fnc_get_array;
private _impounded_vehicles_name_list = _impound_lot_data select VEH_STR_INDEX_ID;
private _impounded_vehicles_entry_list = _impound_lot_data select A_vehicle_storage_var_data_entries;

private _controls = [toUpper("Impount Lot"), 0.14, 0.14, 0.55, 0.45] call A_list_simple_menu_fnc_setup;
private _list = _controls select DLG_LIST_SIMPLE_INDEX_LIST;
private _select = _controls select DLG_LIST_SIMPLE_INDEX_SUBMIT;

_select ctrlSetText "Retrieve";
_select ctrlCommit 0;

buttonSetAction[(ctrlIDC _select), '[' + str(_player) + ',' + str(_logic) + ', ([] call A_list_simple_menu_fnc_label_data)] spawn A_interaction_fnc_impound_vehicle_retrieve;'];
lbClear (ctrlIDC _list);

{
	private _vehicle_name = _x;
	private _index = _impounded_vehicles_name_list find _vehicle_name;
	if (_index < 0) exitWith {null};
	
	private _vehicle_entry = _impounded_vehicles_entry_list select _index;
	
	private _vehicle_class = _vehicle_entry select VEH_STR_INDEX_DATA_CLASS;
	private _picture = [_vehicle_class] call A_misc_fnc_generic_picture_path;
	
	_index = _list lbAdd format["%1 (%2)", _vehicle_name, _vehicle_class];
	_list lbSetData [_index, format["%1", _vehicle_name]];
	_list lbSetPicture[_index, _picture];
} forEach _vehicles_name_list;