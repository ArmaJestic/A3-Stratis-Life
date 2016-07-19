// A_storage_menu_fnc_generic_storage_menu

#include "../../includes/constants.h"
#include "../../includes/macro.h"

 _this spawn {
ARGV(0,_left_title);
ARGV(1,_left_button_code);
ARGV(2,_left_selection_code);
ARGV(3,_left_list_code);
ARGV(4,_left_label_code);

ARGV(5,_right_title);
ARGV(6,_right_button_code);
ARGV(7,_right_selection_code);
ARGV(8,_right_list_code);
ARGV(9,_right_label_code);

if (undefined(_left_title)) exitWith {null};
if (undefined(_left_button_code)) exitWith {null};
if (undefined(_left_selection_code)) exitWith {null};
if (undefined(_left_list_code)) exitWith {null};
if (undefined(_left_label_code)) exitWith {null};

if (undefined(_right_title)) exitWith {null};
if (undefined(_right_button_code)) exitWith {null};
if (undefined(_right_selection_code)) exitWith {null};
if (undefined(_right_list_code)) exitWith {null};
if (undefined(_right_label_code)) exitWith {null};

if (typeName _left_title != "STRING") exitWith {null};
if (typeName _left_button_code != "CODE") exitWith {null};
if (typeName _left_selection_code != "CODE") exitWith {null};
if (typeName _left_list_code != "CODE") exitWith {null};
if (typeName _left_label_code != "CODE") exitWith {null};

if (typeName _right_title != "STRING") exitWith {null};
if (typeName _right_button_code != "CODE") exitWith {null};
if (typeName _right_selection_code != "CODE") exitWith {null};
if (typeName _right_list_code != "CODE") exitWith {null};
if (typeName _right_label_code != "CODE") exitWith {null};

disableSerialization;	
[_left_title, _right_title] call A_storage_menu_fnc_menu_setup;


private["_display"];
lbClear storage_menu_left_list_idc;
lbClear storage_menu_right_list_idc;

ctrlSetText [storage_menu_left_amount_field_idc, "1"];	
ctrlSetText [storage_menu_right_amount_field_idc, "1"];

CtrlSetText [storage_menu_left_total_weight_field_idc, (call _left_label_code)];
CtrlSetText [storage_menu_right_total_weight_field_idc, (call _right_label_code)];

private["_left_list"];
_left_list = call _left_list_code;

private["_right_list"];
_right_list = call _right_list_code;

{
	private["_index", "_text", "_value", "_entry", "_icon"];
	_entry = _x;
	_text = _entry select 0;
	_value = _entry select 1;
	_icon = _entry select 2;
	_index = lbAdd [storage_menu_left_list_idc, _text];
	lbSetData [storage_menu_left_list_idc, _index, _value];
	lbSetPicture [storage_menu_left_list_idc, _index, _icon];
} forEach _left_list;

{
	private["_index", "_text", "_value", "_entry", "_icon"];
	_entry = _x;
	_text = _entry select 0;
	_value = _entry select 1;
	_icon = _entry select 2;
	_index = lbAdd [storage_menu_right_list_idc, _text];
	lbSetData [storage_menu_right_list_idc, _index, _value];
	lbSetPicture [storage_menu_right_list_idc, _index, _icon];
} forEach _right_list;

buttonSetAction [storage_menu_take_button_idc, '[(lbData [storage_menu_left_list_idc, (lbCurSel storage_menu_left_list_idc)]), ([(ctrlText storage_menu_left_amount_field_idc)] call A_misc_fnc_parse_number)] call ' + str(_left_button_code) + ";"];
buttonSetAction [storage_menu_put_button_idc, '[(lbData [storage_menu_right_list_idc, (lbCurSel storage_menu_right_list_idc)]), ([(ctrlText storage_menu_right_amount_field_idc)] call A_misc_fnc_parse_number)] call ' + str(_right_button_code) + ";"];

[_left_selection_code, _right_selection_code] spawn {
	ARGV(0,_left_selection_code);
	ARGV(1,_right_selection_code);
	
	waitUntil {
		private["_left_selection"];
		_left_selection_index = (lbCurSel storage_menu_left_list_idc);

		if (_left_selection_index >= 0) then {
			private["_left_selection_value", "_left_amount"];
			_left_amount =  [(ctrlText storage_menu_left_amount_field_idc)] call A_misc_fnc_parse_number;
			_left_selection_value  = lbData [storage_menu_left_list_idc, (lbCurSel storage_menu_left_list_idc)];
			ctrlSetText [storage_menu_left_weight_field_idc,  [_left_selection_value, _left_amount] call _left_selection_code];
		}
		else {
			ctrlSetText [storage_menu_left_weight_field_idc,  "0"];
		};
		
		private["_right_selection_index"];
		_right_selection_index = (lbCurSel storage_menu_right_list_idc);

		if (_right_selection_index >= 0) then {
			private["_right_selection_value", "_right_amount"];
			_right_selection_value = lbData [storage_menu_right_list_idc, (lbCurSel storage_menu_right_list_idc)];
			_right_amount = [(ctrlText storage_menu_right_amount_field_idc)] call A_misc_fnc_parse_number;
			ctrlSetText [storage_menu_right_weight_field_idc,  [_right_selection_value, _right_amount] call _right_selection_code];
		}
		else {
			ctrlSetText [storage_menu_right_weight_field_idc,  "0"];
		};
		
		not(ctrlVisible storage_menu_left_header_idc)
	};
};

};
