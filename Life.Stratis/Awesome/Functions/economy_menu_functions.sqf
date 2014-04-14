#include "constants.h"
#include "macro.h"

if (not(undefined(economy_menu_functions_defined))) exitWith {};

economy_tax_type = 0;
economy_tax_name = 1;
economy_tax_value = 2;
economy_tax_range = 3;

if (undefined(economy_tax_data)) then {
	economy_tax_data = [
		["Item", "Item", 5, [1, 25]], 
		["Vehicle", "Vehicle", 5, [1, 25]], 
		["Magazine","Magazine", 5, [1, 25]], 
		["Weapon", "Weapon", 5, [1, 25]],
		["Bank", "Bank", 5, [1, 25]]
	];
};

economy_tax_menu_slider_changed = {
	ARGV(0,_control);
	
	private["_position"];
	_position = sliderPosition (ctrlIDC _control);
	_position = round(_position);
	
	ctrlSetText [economy_tax_menu_info_field_idc, format["%1%2",_position, "%"]];
};

economy_lookup_tax_type = {
	ARGV(0,_tax_type);
	if (undefined(_tax_type)) exitWith {null};
	if (typeName _tax_type != "STRING") exitWith {null};
	
	private["_tax_data"];
	_tax_data = null;
	{
		private["_ctax_type", "_ctax_data", "_ctax_value"];
		_ctax_data = _x;
		_ctax_type = _ctax_data select economy_tax_type;
		if (_tax_type == _ctax_type) then {
			_tax_data = _ctax_data;
		};
	} forEach economy_tax_data;
	
	_tax_data
};

economy_lookup_tax_value_type = {
	ARGV(0,_tax_type);
	if (undefined(_tax_type)) exitWith {0};
	
	private["_tax_data"];
	_tax_data = [_tax_type] call economy_lookup_tax_type;
	if (undefined(_tax_data)) exitWith {0};
	
	(_tax_data select economy_tax_value)
};

economy_modify_tax_announce = {
	ARGV(0,_player);
	
	private["_tax_str"];
	_tax_str = "";
	
	{
		private["_tax_data", "_tax_name", "_tax_value"];
		_tax_data = _x;
		_tax_name = _tax_data select economy_tax_name;
		_tax_value = _tax_data select economy_tax_value;
		_tax_str = _tax_str + format["%1 tax: %2%3\n", _tax_name, _tax_value, "%"];
	} forEach economy_tax_data;
	hint (format["%1-%2 has changed the taxes.\n", _player, (name _player)] + _tax_str);
};

economy_modify_tax = {
	//player groupChat format["economy_modify_tax %1", _this];
	ARGV(0,_player);
	ARGV(1,_tax_id);
	ARGV(2,_tax_value);
	
	{
		private["_tax_data", "_ctax_id"];
		_tax_data = _x;
		_ctax_id = _tax_data select economy_tax_type;
		if (_ctax_id == _tax_id) then {
			_tax_data set [economy_tax_value, _tax_value];
		};
	} forEach economy_tax_data;
	
	publicVariable "economy_tax_data";
	
	[[_player], "economy_modify_tax_announce", true] call BIS_fnc_MP;
};

economy_tax_menu_setup = {
	disableSerialization;
	ARGV(0,_title);
	ARGV(1,_range);
	ARGV(2,_default);
	
	if (!(createDialog "economy_tax_menu")) exitWith {
		player groupChat format["ERROR: Could not create economy_tax_menu menu dialog"];
	};
	
	private["_display"];
	_display = (uiNamespace getVariable 'ECONOMY_TAX_MENU');
	
	_economy_tax_menu_dialog = _display displayCtrl economy_tax_menu_dialog_idd;
	_economy_tax_menu_header = _display displayCtrl economy_tax_menu_header_idc;
	_economy_tax_menu_background = _display displayCtrl economy_tax_menu_background_idc;
	_economy_tax_menu_submit_button = _display displayCtrl economy_tax_menu_submit_button_idc;
	_economy_tax_menu_close_button = _display displayCtrl economy_tax_menu_close_button_idc;
	_economy_tax_menu_info_slider = _display displayCtrl economy_tax_menu_info_slider_idc;
	_economy_tax_menu_info_label = _display displayCtrl economy_tax_menu_info_label_idc;
	_economy_tax_menu_info_field = _display displayCtrl economy_tax_menu_info_field_idc;
	
	_economy_tax_menu_info_slider ctrlAddEventHandler ["SliderPosChanged", "(_this) call economy_tax_menu_slider_changed"];
	_economy_tax_menu_info_slider sliderSetRange _range;
	_economy_tax_menu_info_slider sliderSetPosition _default; 
	[_economy_tax_menu_info_slider] call economy_tax_menu_slider_changed;
		
	private["_x", "_y", "_ysep", "_sep", "_w", "_h", "_header_title"];
	_x = 0.14;
	_y = 0.14;
	_w = 0.35;
	_h = 0.25;
	_ysep = 0.003;
	_sep = 0.01;
	_header_title = _title;
	
	private["_button_font_height", "_font_family"];
	_button_font_height = MENU_TITLE_FONT_HEIGHT;
	_font_family = "PuristaMedium";
	
	
	//header
	private["_ehx", "_ehy", "_ehw", "_ehh"];
	_ehx = _x;
	_ehy = _y;
	_ehw = _w;
	_ehh = 0.045;
	
	_economy_tax_menu_header ctrlSetPosition [_ehx, _ehy, _ehw, _ehh];
	_economy_tax_menu_header ctrlSetFontHeight _button_font_height;
	_economy_tax_menu_header ctrlSetFont _font_family;
	_economy_tax_menu_header ctrlSetText _header_title;
	_economy_tax_menu_header ctrlCommit 0;
	
	//background
	private["_ebx", "_eby", "_ebw", "_ebh"];
	_ebx = _ehx;
	_eby = _ehy + _ehh + _ysep;
	_ebw = _w;
	_ebh = _h - _ehh - _ehh - _ysep - _ysep;
	
	_economy_tax_menu_background ctrlSetPosition [_ebx, _eby, _ebw, _ebh];
	_economy_tax_menu_background ctrlSetBackgroundColor [0,0,0,0.65];
	_economy_tax_menu_background ctrlCommit 0;
	
	//submit button
	private["_esx", "_esy", "_esw", "_esh"];
	_esw = 0.12;
	_esh = _ehh;
	_esx = _ehx;
	_esy = _eby + _ebh + _ysep;
	
	_economy_tax_menu_submit_button ctrlSetText "Submit";
	_economy_tax_menu_submit_button ctrlSetPosition [_esx, _esy, _esw, _esh];
	_economy_tax_menu_submit_button ctrlCommit 0;
	
	//close button
	private["_ecx", "_ecy", "_ecw", "_ech"];
	_ecw = 0.14;
	_ech = _ehh;
	_ecx = _ehx + _ehw - _ecw;
	_ecy = _ehy + _h - _ech;
	
	_economy_tax_menu_close_button ctrlSetText "Close";
	_economy_tax_menu_close_button ctrlSetPosition [_ecx, _ecy, _ecw, _ech];
	buttonSetAction [(ctrlIDC _economy_tax_menu_close_button), "closeDialog 0"];
	_economy_tax_menu_close_button ctrlCommit 0;
	
	
	//amount slider
	private["_easx", "_easy", "_easw", "_eash"];
	_easx = _ebx + _sep * 2;
	_easy = _eby + _sep * 2;
	_easw = _ebw - _sep * 4;
	_eash = _ehh;
	
	//player groupChat format["[_easx, _easy, _easw, _eash] = %1", [_easx, _easy, _easw, _eash]];
	_economy_tax_menu_info_slider ctrlSetPosition [_easx, _easy, _easw, _eash];
	_economy_tax_menu_info_slider ctrlCommit 0;

	//tax label
	private["_ltlx", "_ltly", "_ltlw", "_ltlh"];
	_ltlx = _ebx + _sep; 
	_ltly = _easy + _eash + _sep * 2;
	_ltlw = _ebw / 2  - _sep * 2;
	_ltlh = 0.04;

	_economy_tax_menu_info_label ctrlSetText "Tax bracket: ";
	_economy_tax_menu_info_label ctrlSetPosition [_ltlx, _ltly, _ltlw, _ltlh];
	_economy_tax_menu_info_label ctrlSetFontHeight _button_font_height - 0.003;
	_economy_tax_menu_info_label ctrlCommit 0;
	
	//tax field
	private["_ltfx", "_ltfy", "_ltfw", "_ltfh"];
	_ltfx = _ltlx + _ltlw + _sep ;
	_ltfy = _ltly;
	_ltfw = _ltlw;
	_ltfh = _ltlh;
	
	_economy_tax_menu_info_field ctrlSetFontHeight _button_font_height - 0.003;;
	_economy_tax_menu_info_field ctrlSetFont _font_family;
	_economy_tax_menu_info_field ctrlSetPosition [_ltfx, _ltfy, _ltfw, _ltfh];
	_economy_tax_menu_info_field ctrlSetBackgroundColor [1,1,1,0.08];
	_economy_tax_menu_info_field ctrlCommit 0;
};

economy_menu_handle_tax = {
	ARGV(0,_title);
	ARGV(1,_player);
	ARGV(2,_this);
	
	ARGV(0,_tax_type);
		
	private["_tax_data"];
	_tax_data = [_tax_type] call economy_lookup_tax_type;
	if (undefined(_tax_data)) exitWith {};
	
	private["_tax_name", "_tax_value", "_tax_range"];
	_tax_name = _tax_data select economy_tax_name;
	_tax_value = _tax_data select economy_tax_value;
	_tax_range = _tax_data select economy_tax_range;
	
	[toUpper(format["%1 Tax", _tax_name]), _tax_range, _tax_value] call economy_tax_menu_setup;
	
	buttonSetAction [economy_tax_menu_submit_button_idc, '[' + str(_player) + ', ' + str(_tax_type) + ', round(sliderPosition economy_tax_menu_info_slider_idc)] call economy_modify_tax'];
};

economy_menu_create = {		
	ARGV(0,_this);
	ARGV(0,_player);
	
	private["_item_tax_button"];
	_item_tax_button = ["Item Tax", economy_menu_handle_tax, ["Item"]];

	private["_vehicle_tax_button"];
	_vehicle_tax_button = ["Vehicle Tax", economy_menu_handle_tax, ["Vehicle"]];

	private["_magazine_tax_button"];
	_magazine_tax_button = ["Magazines Tax", economy_menu_handle_tax, ["Magazine"]];

	private["_weapon_tax_button"];
	_weapon_tax_button = ["Weapons Tax", economy_menu_handle_tax, ["Weapon"]];

	private["_bank_tax"];
	_bank_tax = ["Banking Tax", economy_menu_handle_tax, ["Bank"]];

	private["_buttons_data"];

	_buttons_data = [
		_item_tax_button,
		_vehicle_tax_button,
		_magazine_tax_button,
		_weapon_tax_button,
		_bank_tax
		];

	[toUpper("Economy Menu"), _buttons_data] call main_menu_setup;
};

economy_menu_functions_defined = true;