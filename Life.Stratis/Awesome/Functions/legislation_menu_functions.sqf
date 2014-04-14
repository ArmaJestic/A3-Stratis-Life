#include "constants.h"
#include "macro.h"

if (not(undefined(legislation_menu_functions_defined))) exitWith {};

if (undefined(legislation_laws)) then {
	legislation_laws = [
		"Always drive on the right side of the road.", 
		"Always holster weapons in towns ($1000 fine or 1 minute in prison).",
		"Completing an assassination mission is an act of murder.", 
		"", 
		"", 
		"", 
		"", 
		"",  
		"",  
		""
	];
};

legislation_menu_setup = {
	disableSerialization;
	ARGV(0,_editable);
	
	if (!(createDialog "legislation_menu")) exitWith {
		player groupChat format["ERROR: Could not create legislation menu dialog"];
	};
	
	private["_display"];
	_display = (uiNamespace getVariable 'LEGISLATION_MENU');
	
	_legislation_menu_header = _display displayCtrl legislation_menu_header_idc;
	_legislation_menu_background = _display displayCtrl legislation_menu_background_idc;
	_legislation_menu_select_button = _display displayCtrl legislation_menu_select_button_idc;
	_legislation_menu_close_button = _display displayCtrl legislation_menu_close_button_idc;
	_legislation_menu_list = _display displayCtrl legislation_menu_list_idc;
	
	private["_x", "_y", "_ysep", "_sep", "_w", "_h", "_header_title"];
	_x = 0.14;
	_y = 0.14;
	_w = 0.55;
	_h = 0.60;
	_ysep = 0.003;
	_sep = 0.01;
	_header_title = "LEGISLATION MENU";
	
	private["_button_font_height", "_font_family"];
	_button_font_height = MENU_TITLE_FONT_HEIGHT;
	_font_family = "PuristaMedium";
	
	//header
	private["_lhx", "_lhy", "_lhw", "_lhh"];
	_lhx = _x;
	_lhy = _y;
	_lhw = _w;
	_lhh = 0.045;
	
	_legislation_menu_header ctrlSetPosition [_lhx, _lhy, _lhw, _lhh];
	_legislation_menu_header ctrlSetFontHeight _button_font_height;
	_legislation_menu_header ctrlSetFont _font_family;
	_legislation_menu_header ctrlSetText _header_title;
	_legislation_menu_header ctrlCommit 0;
	

	//background
	private["_lbx", "_lby", "_lbw", "_lbh"];
	_lbx = _lhx;
	_lby = _lhy + _lhh + _ysep;
	_lbw = _w;
	_lbh = _h - _lhh - _lhh - _ysep - _ysep;
	
	_legislation_menu_background ctrlSetPosition [_lbx, _lby, _lbw, _lbh];
	_legislation_menu_background ctrlSetBackgroundColor [0,0,0,0.65];
	_legislation_menu_background ctrlCommit 0;
	
	//select button
	private["_lsx", "_lsy", "_lsw", "_lsh"];
	_lsw = 0.12;
	_lsh = _lhh;
	_lsx = _lhx;
	_lsy = _lby + _lbh + _ysep;
	
	private["_select_text"];
	_select_text = if (_editable) then {"Edit"} else {"View"};
	_legislation_menu_select_button ctrlSetText _select_text;
	_legislation_menu_select_button ctrlSetPosition [_lsx, _lsy, _lsw, _lsh];
	_legislation_menu_select_button ctrlCommit 0;
	
	
	//close button
	private["_lcx", "_lcy", "_lcw", "_lch"];
	_lcw = 0.14;
	_lch = _lhh;
	_lcx = _lhx + _lhw - _lcw;
	_lcy = _lhy + _h - _lch;
	
	_legislation_menu_close_button ctrlSetText "Close";
	_legislation_menu_close_button ctrlSetPosition [_lcx, _lcy, _lcw, _lch];
	buttonSetAction [(ctrlIDC _legislation_menu_close_button), "closeDialog 0"];
	_legislation_menu_close_button ctrlCommit 0;
	
	//list
	private["_llx", "_lly", "_llw", "_llh"];
	_llx = _lbx + _sep * 2; 
	_lly = _lby + _sep * 2;
	_llw = _lhw - _sep * 4;
	_llh = _lbh - _sep * 4;;

	_legislation_menu_list ctrlSetText "";
	_legislation_menu_list ctrlSetPosition [_llx, _lly, _llw, _llh];
	_legislation_menu_list ctrlSetFontHeight _button_font_height - 0.003;
	_legislation_menu_list ctrlCommit 0;
	
	
	_legislation_menu_list	
};

legislation_modify_law_menu_setup = {
	disableSerialization;
	ARGV(0,_title);
	ARGV(1,_editable);
	
	if (undefined(_editable)) then {
		_editable = true;
	};
	
	if (!(createDialog "legislation_modify_law_menu")) exitWith {
		player groupChat format["ERROR: Could not create legislation modify law menu dialog"];
	};
	
	private["_display"];
	_display = (uiNamespace getVariable 'LEGISLATION_MODIFY_LAW_MENU');
	
	_legislation_modify_law_menu_header = _display displayCtrl legislation_modify_law_menu_header_idc;
	_legislation_modify_law_menu_background = _display displayCtrl legislation_modify_law_menu_background_idc;
	_legislation_modify_law_menu_submit_button = _display displayCtrl legislation_modify_law_menu_submit_button_idc;
	_legislation_modify_law_menu_close_button = _display displayCtrl legislation_modify_law_menu_close_button_idc;
	_legislation_modify_law_menu_field = _display displayCtrl legislation_modify_law_menu_field_idc;
	
	private["_x", "_y", "_ysep", "_sep", "_w", "_h", "_header_title"];
	_x = 0.14;
	_y = 0.14;
	_w = 0.55;
	_h = 0.25;
	_ysep = 0.003;
	_sep = 0.01;
	_header_title = _title;
	
	private["_button_font_height", "_font_family"];
	_button_font_height = MENU_TITLE_FONT_HEIGHT;
	_font_family = "PuristaMedium";
	
	//header
	private["_lhx", "_lhy", "_lhw", "_lhh"];
	_lhx = _x;
	_lhy = _y;
	_lhw = _w;
	_lhh = 0.045;
	
	_legislation_modify_law_menu_header ctrlSetPosition [_lhx, _lhy, _lhw, _lhh];
	_legislation_modify_law_menu_header ctrlSetFontHeight _button_font_height;
	_legislation_modify_law_menu_header ctrlSetFont _font_family;
	_legislation_modify_law_menu_header ctrlSetText _header_title;
	_legislation_modify_law_menu_header ctrlCommit 0;
	
	//background
	private["_lbx", "_lby", "_lbw", "_lbh"];
	_lbx = _lhx;
	_lby = _lhy + _lhh + _ysep;
	_lbw = _w;
	_lbh = _h - _lhh - _lhh - _ysep - _ysep;
	
	_legislation_modify_law_menu_background ctrlSetPosition [_lbx, _lby, _lbw, _lbh];
	_legislation_modify_law_menu_background ctrlSetBackgroundColor [0,0,0,0.65];
	_legislation_modify_law_menu_background ctrlCommit 0;
	
	//submit button
	private["_lsx", "_lsy", "_lsw", "_lsh"];
	_lsw = 0.12;
	_lsh = _lhh;
	_lsx = _lhx;
	_lsy = _lby + _lbh + _ysep;
	
	_legislation_modify_law_menu_submit_button ctrlSetText "Submit";
	_legislation_modify_law_menu_submit_button ctrlSetPosition [_lsx, _lsy, _lsw, _lsh];
	_legislation_modify_law_menu_submit_button ctrlShow _editable;
	_legislation_modify_law_menu_submit_button ctrlCommit 0;
	
	
	//close button
	private["_lcx", "_lcy", "_lcw", "_lch"];
	_lcw = 0.14;
	_lch = _lhh;
	_lcx = _lhx + _lhw - _lcw;
	_lcy = _lhy + _h - _lch;
	
	_legislation_modify_law_menu_close_button ctrlSetText "Close";
	_legislation_modify_law_menu_close_button ctrlSetPosition [_lcx, _lcy, _lcw, _lch];
	buttonSetAction [(ctrlIDC _legislation_modify_law_menu_close_button), "closeDialog 0"];
	_legislation_modify_law_menu_close_button ctrlCommit 0;
	
	//field
	private["_llx", "_lly", "_llw", "_llh"];
	_llx = _lbx + _sep * 2; 
	_lly = _lby + _sep * 2;
	_llw = _lhw - _sep * 4;
	_llh = _lbh - _sep * 4;;

	_legislation_modify_law_menu_field ctrlSetText "";
	_legislation_modify_law_menu_field ctrlSetPosition [_llx, _lly, _llw, _llh];
	_legislation_modify_law_menu_field ctrlSetFontHeight _button_font_height - 0.003;
	_legislation_modify_law_menu_field ctrlEnable _editable;
	_legislation_modify_law_menu_field ctrlCommit 0;
	

	_legislation_modify_law_menu_field	
};

legislation_menu_update_list = {	
	player groupChat format["legislation_menu_update_list %1", _this];
	private["_i", "_max_length"];
	_i = 0;
	_max_length = 50;
	lbClear legislation_menu_list_idc;
	
	while {_i < (count legislation_laws)} do {
		private["_law_text", "_index"];
		_law_text = legislation_laws select _i;
		if (([_law_text] call strlen) > _max_length) then {
			_law_text = ([_law_text, 0, _max_length] call substr) + "...";
		};
		_index = lbAdd [legislation_menu_list_idc, format["%1. %2", (_i + 1), _law_text]];
		lbSetData[legislation_menu_list_idc, _index, str(_i)];
		_i = _i + 1;
	};
};

legislation_menu_create = {
	ARGV(0,_this);
	ARGV(0,_player);
	
	if (not([_player] call player_exists)) exitWith {};
	

	[true] call legislation_menu_setup;
	[] call legislation_menu_update_list;

	buttonSetAction [legislation_menu_select_button_idc, '[' + str(_player) + ', ([(lbData [legislation_menu_list_idc, (lbCurSel legislation_menu_list_idc)])] call parse_number)] call legislation_modify_law_menu_create;'];
};

legislation_modify_law_menu_create = {
	ARGV(0,_player);
	ARGV(1,_law_index);
	
	if (not([_player] call player_exists)) exitWith {};
	if (undefined(_law_index)) exitWith {};
	if (typeName _law_index != "SCALAR") exitWith {};
	if (_law_index >= (count legislation_laws)) exitWith {};
	
	_field = [toUpper("Legislation Amendment"), true] call legislation_modify_law_menu_setup;
	
	private["_law_text"];
	_law_text = legislation_laws select _law_index;
	_field ctrlSetText _law_text;
	
	buttonSetAction [legislation_modify_law_menu_submit_button_idc, '[' + str(_player) + ',' + str(_law_index) + ', (ctrlText legislation_modify_law_menu_field_idc)] call legislation_modify_law'];
};

legislation_modify_law_announce = {
	ARGV(0,_law_index);
	ARGV(1,_law_text);
	
	private["_message"];
	_message = format["Law #%1 has changed.\n%2", (_law_index + 1), _law_text];	
	hint _message;
};

legislation_modify_law = {
	ARGV(0,_player);
	ARGV(1,_law_index);
	ARGV(2,_law_text);
	
	
	private["_law_length", "_max_law_length"];
	_law_length = [_text] call strlen;
	_max_law_length = 120;
	if (_law_length > _max_law_length) exitWith {
		player groupChat format["The text for this law is too long. It must must be %1 characters or less.", _max_law_length];
	};
	
	legislation_laws set [_law_index, _law_text]; 
	publicVariable "legislation_laws";
	
	[[_law_index, _law_text],  "legislation_modify_law_announce", true] call BIS_fnc_MP;
	closeDialog 0;
	[] spawn {
		waitUntil {ctrlVisible legislation_menu_header_idc};
		[] call legislation_menu_update_list;
	};
};

legislation_view_law_menu_create = {
	ARGV(0,_player);
	ARGV(1,_law_index);
	
	if (not([_player] call player_exists)) exitWith {};
	if (undefined(_law_index)) exitWith {};
	if (typeName _law_index != "SCALAR") exitWith {};
	if (_law_index >= (count legislation_laws)) exitWith {};
	
	_field = [toUpper(format["Law #%1", (_law_index + 1)]), false] call legislation_modify_law_menu_setup;
	
	private["_law_text"];
	_law_text = legislation_laws select _law_index;
	_field ctrlSetText _law_text;
};

legislation_view_menu_create = {
	ARGV(0,_title);
	ARGV(0,_player);
	
	if (not([_player] call player_exists)) exitWith {};
	
	[false] call legislation_menu_setup;
	[] call legislation_menu_update_list;
	
	buttonSetAction [legislation_menu_select_button_idc, '[' + str(_player) + ', ([(lbData [legislation_menu_list_idc, (lbCurSel legislation_menu_list_idc)])] call parse_number)] call legislation_view_law_menu_create;'];
};

legislation_menu_functions_defined = true;