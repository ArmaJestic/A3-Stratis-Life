#include "constants.h"
#include "macro.h"

if (not(undefined(storage_menu_functions))) exitWith {};


storage_generic_storage_menu = { _this spawn {
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
	[_left_title, _right_title] call storage_menu_setup;
	

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
	
	buttonSetAction [storage_menu_take_button_idc, '[(lbData [storage_menu_left_list_idc, (lbCurSel storage_menu_left_list_idc)]), ([(ctrlText storage_menu_left_amount_field_idc)] call parse_number)] call ' + str(_left_button_code) + ";"];
	buttonSetAction [storage_menu_put_button_idc, '[(lbData [storage_menu_right_list_idc, (lbCurSel storage_menu_right_list_idc)]), ([(ctrlText storage_menu_right_amount_field_idc)] call parse_number)] call ' + str(_right_button_code) + ";"];
	
	[_left_selection_code, _right_selection_code] spawn {
		ARGV(0,_left_selection_code);
		ARGV(1,_right_selection_code);
		
		waitUntil {
			private["_left_selection"];
			_left_selection_index = (lbCurSel storage_menu_left_list_idc);

			if (_left_selection_index >= 0) then {
				private["_left_selection_value", "_left_amount"];
				_left_amount =  [(ctrlText storage_menu_left_amount_field_idc)] call parse_number;
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
				_right_amount = [(ctrlText storage_menu_right_amount_field_idc)] call parse_number;
				ctrlSetText [storage_menu_right_weight_field_idc,  [_right_selection_value, _right_amount] call _right_selection_code];
			}
			else {
				ctrlSetText [storage_menu_right_weight_field_idc,  "0"];
			};
			
			not(ctrlVisible storage_menu_left_header_idc)
		};
	};

};};


storage_menu_generate_list_code = {
	ARGV(0,_object);
	ARGV(1,_storage);
	
	if (undefined(_object)) exitWith {{}};
	if (undefined(_storage)) exitWith {{}};
	if (typeName _object != "OBJECT") exitWith {{}};
	if (typeName _storage != "STRING") exitWith {{}};

	private["_code"];
	_code = compile (format[
	'
		_entries = [];
		{if (true) then {
			private["_entry", "_item", "_count", "_data"];
			_entry = _x;
			_item = _entry select 0;
			_count = [(_entry select 1)] call decode_number;
			_data  = _item call inventory_get_item_array;
			
			if (count(_data) == 0) exitWith {};
			private["_item_weight", "_name", "_droppable", "_loseable", "_class", "_icon"];
			_item_weight = ITEM_DATA_WEIGHT(_data);
			_name = (ITEM_DATA_NAME(_data));
			_droppable = (_data call inventory_get_item_droppable);
			_loseable = (_data call inventory_get_item_loseable);
			
			
			private["_picture", "_class", "_type"];
			_class = ITEM_DATA_CLASS(_data);
			_type = ITEM_DATA_TYPE(_data);
			_picture = [_item, _class, _type] call object_icon;
			
			//player groupChat ("_name = " + str(_name) + ", _loseable = " + str(_loseable));;
			if (_count > 0 && _droppable && _loseable) then {
				private["_text"];
				_text = _name + " (" + strM(_count) + " - " + str(_item_weight * _count ) + "Kg)";
				_entries = _entries + [[_text, _item, _picture]];	
			};
		};} forEach ([%1, "%2"] call object_getVariable);
		(_entries)
	', _object, _storage]);
	
	_code
};


storage_menu_generate_selection_code = {
	ARGV(0,_action);
	if (undefined(_action)) exitWith {{""}};
	if (typeName _action != "STRING") exitWith {{""}};
	
	private["_code"];
	_code = compile (format[
	' 
		private["_item", "_count"];
		ARGV(0,_item);
		ARGV(1,_count);
		private["_infos", "_weight", "_text"];
		_infos  = _item call inventory_get_item_array;
		if (count(_infos) == 0) exitWith {""};
		_weight = ITEM_DATA_WEIGHT(_infos) * _count;
		_text = (strM(_weight) + "");
		(_text)
	', _action]);
	
	_code
};


storage_menu_private_storage = {
	ARGV(0,_player);
	if (not([_player] call player_exists)) exitWith {null};

	private["_private_storage_name", "_player_storage_name"];
	_private_storage_name = "private_storage";
	_player_storage_name = ([_player] call object_storage_name);
	
	private["_left_button_code", "_right_button_code", 
			"_left_label_code", "_right_label_code", 
			"_left_list_code", "_right_list_code", 
			"_right_selection_code", "_left_selection_code"];
			
	
	private["_left_title", "_right_title"];
	_left_title = "Private Storage";
	_right_title = "Inventory Storage";
	
	_left_list_code = [_player, _private_storage_name] call storage_menu_generate_list_code;
	_right_list_code = [_player, _player_storage_name] call storage_menu_generate_list_code;
	
	_left_selection_code = ["Take"] call storage_menu_generate_selection_code;
	_right_selection_code = ["Put"] call storage_menu_generate_selection_code;
	
	_left_button_code = compile (
	'	ARGV(0,_item);' +
	'	ARGV(1,_count);' +
	'	if (_count <= 0) exitWith {null};'+
	'	[' + str(_player) + ', ' + str(_private_storage_name) + ', _item, -(_count)] call interact_generic_storage;' 
	);
	
	_right_button_code = compile (
	'	player groupChat format["%1", _this];' +
	'	ARGV(0,_item);' +
	'	ARGV(1,_count);' +
	'	if (_count <= 0) exitWith {null};' +
	'	[' + str(_player) + ', ' + str(_private_storage_name) + ', _item, _count] call interact_generic_storage;'
	);
	
	
	_left_label_code = compile (
	'	private["_class", "_player", "_max_weight", "_weight"];' +
	'	_player = ' + str(_player) + ';' +
	'	_storage = ' + str(_private_storage_name) + ';' +
	'	_weight = [_player, _storage] call inventory_get_storage_weight;' +
	'	("" + strM(_weight) + "/Unlimited" )'
	);
	
	_right_label_code = compile (
	'	private["_class", "_player", "_max_weight", "_weight"];' +
	'	_player = ' + str(_player) + ';' +
	'	_storage = ' + str(_player_storage_name) + ';' +
	'	_weight = [_player, _storage] call inventory_get_storage_weight;' +
	'	_max_weight = INV_CarryingCapacity;' +
	'	("" + strM(_weight) + "/" + strM(_max_weight))'
	);
	
	[
		_left_title, _left_button_code, _left_selection_code, _left_list_code, _left_label_code,
		_right_title, _right_button_code, _right_selection_code, _right_list_code, _right_label_code
	] call storage_generic_storage_menu;
};



storage_menu_factory_storage = {
	//player groupChat format["storage_menu_factory_storage %1", _this];
	ARGV(0,_player);
	ARGV(1,_factory_storage_name);
	if (not([_player] call player_exists)) exitWith {null};
	if (undefined(_factory_storage_name)) exitWith {null};
	if (typeName _factory_storage_name != "STRING") exitWith {null};

	private["_factory"];
	_factory = [_factory_storage_name] call factory_lookup_storage;
	
	if(undefined(_factory)) exitWith{null};
	
	private["_factory_name"];
	_factory_name = _factory select factory_name;
	
	private["_left_title", "_right_title"];
	_left_title =  format["%1 Storage", _factory_name];
	_right_title = "Inventory Storage";

	private["_player_storage_name"];
	_player_storage_name = ([_player] call object_storage_name);
	
	private["_left_button_code", "_right_button_code", 
			"_left_label_code", "_right_label_code", 
			"_left_list_code", "_right_list_code", 
			"_right_selection_code", "_left_selection_code"];
			
	_left_list_code = [_player, _factory_storage_name] call storage_menu_generate_list_code;
	_right_list_code = [_player, _player_storage_name] call storage_menu_generate_list_code;
	
	_left_selection_code = ["Take"] call storage_menu_generate_selection_code;
	_right_selection_code = ["Put"] call storage_menu_generate_selection_code;
	
	_left_button_code = compile (
	'ARGV(0,_item);' +
	'ARGV(1,_count);' +
	"if (_count <= 0) exitWith {null}; " +
	format['[%1, "%2", _item, -(_count)] call interact_factory_storage; ', _player, _factory_storage_name]);

	_right_button_code = compile (
	'ARGV(0,_item);' +
	'ARGV(1,_count);' +
	"if (_count <= 0) exitWith {null}; "+
	format['[%1, "%2", _item, _count] call interact_factory_storage;', _player, _factory_storage_name]);

	_left_label_code = compile (format['
		private["_class", "_player", "_max_weight", "_weight"];
		_player = %1;
		_storage = "%2";
		_weight = [_player, _storage] call inventory_get_storage_weight;
		(strM(_weight) + "/Unlimited" )
	', _player, _factory_storage_name]);
	
	_right_label_code = compile (format['
		private["_class", "_player", "_max_weight", "_weight"];
		_player = %1;
		_storage = "%2";
		_weight = [_player, _storage] call inventory_get_storage_weight;
		_max_weight = INV_CarryingCapacity;
		(strM(_weight) + "/" + strM(_max_weight))
	', _player, _player_storage_name]);
	
	[
		_left_title, _left_button_code, _left_selection_code, _left_list_code, _left_label_code,
		_right_title, _right_button_code, _right_selection_code, _right_list_code, _right_label_code
	] call storage_generic_storage_menu;
};

storage_menu_vehicle_storage = {
	ARGV(0,_player);
	ARGV(1,_vehicle);
	
	if (not([_player] call player_exists)) exitWith {null};
	if (not([_vehicle] call vehicle_exists)) exitWith {null};
	
	private["_left_title", "_right_title"];
	_left_title = "Vehicle Trunk Storage";
	_right_title = "Inventory Storage";
	
	private["_vehicle_storage_name", "_player_storage_name"];
	_vehicle_storage_name = ([_vehicle] call object_storage_name);
	_player_storage_name = ([_player] call object_storage_name);
	
	private["_left_button_code", "_right_button_code", 
			"_left_label_code", "_right_label_code", 
			"_left_list_code", "_right_list_code", 
			"_right_selection_code", "_left_selection_code"];
			
	_left_list_code = [_vehicle, _vehicle_storage_name] call storage_menu_generate_list_code;
	_right_list_code = [_player, _player_storage_name] call storage_menu_generate_list_code;
	
	_left_selection_code = ["Take"] call storage_menu_generate_selection_code;
	_right_selection_code = ["Put"] call storage_menu_generate_selection_code;
	
	_left_button_code = compile (
	'ARGV(0,_item);' +
	'ARGV(1,_count);' +
	"if (_count <= 0) exitWith {null};" +
	format['[%1, _item, -(_count)] call interact_vehicle_storage;', _vehicle]);
	
	_right_button_code = compile (
	'ARGV(0,_item);' +
	'ARGV(1,_count);' +
	"if (_count <= 0) exitWith {null};" +
	format['[%1, _item, _count] call interact_vehicle_storage;', _vehicle]);
	
	_left_label_code = compile (format['
		private["_class", "_vehicle", "_max_weight", "_weight"];
		_vehicle = %1;
		_storage = "%2";
		_class = typeOf _vehicle;
		_weight = [_vehicle, _storage] call inventory_get_storage_weight;
		_max_weight = _class call inventory_get_vehicle_max_kg;
		(strM(_weight) + "/" + strM(_max_weight))
	', _vehicle, _vehicle_storage_name]);
	
	_right_label_code = compile (format['
		private["_class", "_player", "_max_weight", "_weight"];
		_player = %1;
		_storage = "%2";
		_weight = [_player, _storage] call inventory_get_storage_weight;
		_max_weight = INV_CarryingCapacity;
		(strM(_weight) + "/" + strM(_max_weight))
	', _player, _player_storage_name]);
	
	[
		_left_title, _left_button_code, _left_selection_code, _left_list_code, _left_label_code,
		_right_title, _right_button_code, _right_selection_code, _right_list_code, _right_label_code
	] call storage_generic_storage_menu;
};


storage_menu_setup = {
	disableSerialization;
	player groupChat format["storage_menu_setup"];
	ARGV(0,_storage_name_left);
	ARGV(1,_storage_name_right);
	
	if (!(createDialog "storage_menu")) exitWith {
		player groupChat format["ERROR: Could not create storage menu dialog"];
	};
	
	private["_display"];
	_display = uiNamespace getVariable "STORAGE_MENU";
	
	_storage_menu_left_header = _display displayCtrl storage_menu_left_header_idc;
	_storage_menu_right_header = _display displayCtrl storage_menu_right_header_idc;
	_storage_menu_left_background = _display displayCtrl storage_menu_left_background_idc;
	_storage_menu_right_background = _display displayCtrl storage_menu_right_background_idc;
	_storage_menu_left_list = _display displayCtrl storage_menu_left_list_idc;
	_storage_menu_right_list = _display displayCtrl storage_menu_right_list_idc;
	_storage_menu_left_amount_label = _display displayCtrl storage_menu_left_amount_label_idc;
	_storage_menu_left_amount_field = _display displayCtrl storage_menu_left_amount_field_idc;
	_storage_menu_left_weight_label = _display displayCtrl storage_menu_left_weight_label_idc;
	_storage_menu_left_weight_field = _display displayCtrl storage_menu_left_weight_field_idc;
	_storage_menu_right_amount_label = _display displayCtrl storage_menu_right_amount_label_idc;
	_storage_menu_right_amount_field = _display displayCtrl storage_menu_right_amount_field_idc;
	_storage_menu_right_weight_label = _display displayCtrl storage_menu_right_weight_label_idc;
	_storage_menu_right_weight_field = _display displayCtrl storage_menu_right_weight_field_idc;
	_storage_menu_take_button = _display displayCtrl storage_menu_take_button_idc;
	_storage_menu_put_button = _display displayCtrl storage_menu_put_button_idc;
	_storage_menu_close_button = _display displayCtrl storage_menu_close_button_idc;
	_storage_menu_left_total_weight_label = _display displayCtrl storage_menu_left_total_weight_label_idc;
	_storage_menu_left_total_weight_field = _display displayCtrl storage_menu_left_total_weight_field_idc;
	_storage_menu_right_total_weight_label = _display displayCtrl storage_menu_right_total_weight_label_idc;
	_storage_menu_right_total_weight_field = _display displayCtrl storage_menu_right_total_weight_field_idc;
	
	
	private["_x", "_y", "_ysep", "_sep", "_w", "_h"];
	_x = 0.14;
	_y = 0.14;
	_w = 0.45;
	_h = 0.65;
	_ysep = 0.003;
	_sep = 0.01;
	
	private["_button_font_height", "_font_family"];
	_button_font_height = MENU_TITLE_FONT_HEIGHT;
	_font_family = "PuristaMedium";
	
	_storage_menu_left_header ctrlSetText toUpper(format["%1", _storage_name_left]);
	_storage_menu_right_header ctrlSetText toUpper(format["%1", _storage_name_right]);
	
	
	//left header
	private["_lhx", "_lhy", "_lhw", "_lhh"];
	_lhx = _x;
	_lhy = _y;
	_lhw = _w;
	_lhh = 0.045;
	
	_storage_menu_left_header ctrlSetPosition [_lhx, _lhy, _lhw, _lhh];
	_storage_menu_left_header ctrlSetFontHeight _button_font_height;
	_storage_menu_left_header ctrlSetFont _font_family;
	_storage_menu_left_header ctrlCommit 0;
	
	//left background
	private["_lbx", "_lby", "_lbw", "_lbh"];
	_lbx = _lhx;
	_lby = _lhy + _lhh + _ysep;
	_lbw = _w;
	_lbh = _h - _lhh - _lhh - _ysep - _ysep;
	
	_storage_menu_left_background ctrlSetPosition [_lbx, _lby, _lbw, _lbh];
	_storage_menu_left_background ctrlSetBackgroundColor [0,0,0,0.65];
	_storage_menu_left_background ctrlCommit 0;
	
	//left take button
	private["_ltx", "_lty", "_ltw", "_lth"];
	_ltw = 0.18;
	_lth = _lhh;
	_ltx = _lhx;
	_lty = _lby + _lbh + _ysep;
	
	_storage_menu_take_button ctrlSetText "Take";
	_storage_menu_take_button ctrlSetPosition [_ltx, _lty, _ltw, _lth];
	_storage_menu_take_button ctrlCommit 0;
	
		
	//left list
	private["_llx", "_lly", "_llw", "_llh"];
	_llx = _lbx + _sep;
	_lly = _lby + _sep;
	_llw = _lbw - _sep * 2;
	_llh = _lbh * 0.65;
	
	_storage_menu_left_list ctrlSetPosition [_llx, _lly, _llw, _llh];
	_storage_menu_left_list ctrlSetFontHeight _button_font_height * 0.9;
	_storage_menu_left_list ctrlCommit 0;
	
	
	//left weight label
	private["_lwlx", "_lwly", "_lwlw", "_lwlh"];
	_lwlx = _llx; 
	_lwly = _lly + _llh + _sep * 2;
	_lwlw = _llw / 2  - _sep;
	_lwlh = 0.04;

	_storage_menu_left_weight_label ctrlSetText "Item(s) weight (Kg): ";
	_storage_menu_left_weight_label ctrlSetPosition [_lwlx, _lwly, _lwlw, _lwlh];
	_storage_menu_left_weight_label ctrlSetFontHeight _button_font_height - 0.003;
	_storage_menu_left_weight_label ctrlCommit 0;
	
	//left weight field
	private["_lwfx", "_lwfy", "_lwfw", "_lwfh"];
	_lwfx = _lwlx + _lwlw + _sep ;
	_lwfy = _lwly;
	_lwfw = _lwlw;
	_lwfh = _lwlh;
	
	_storage_menu_left_weight_field ctrlSetFontHeight _button_font_height - 0.003;;
	_storage_menu_left_weight_field ctrlSetFont _font_family;
	_storage_menu_left_weight_field ctrlSetPosition [_lwfx, _lwfy, _lwfw, _lwfh];
	_storage_menu_left_weight_field ctrlSetBackgroundColor [1,1,1,0.08];
	_storage_menu_left_weight_field ctrlCommit 0;
	
	//left total weight label
	private["_ltlx", "_ltly", "_ltlw", "_ltlh"];
	_ltlx = _lwlx; 
	_ltly = _lwly + _lwlh + _ysep * 2;
	_ltlw = _lwlw;
	_ltlh = _lwlh;

	_storage_menu_left_total_weight_label ctrlSetText "Storage weight (Kg):";
	_storage_menu_left_total_weight_label ctrlSetPosition [_ltlx, _ltly, _ltlw, _ltlh];
	_storage_menu_left_total_weight_label ctrlSetFontHeight _button_font_height - 0.003;
	_storage_menu_left_total_weight_label ctrlCommit 0;
	
	//left total weight field
	private["_ltfx", "_ltfy", "_ltfw", "_ltfh"];
	_ltfx = _ltlx + _ltlw + _sep ;
	_ltfy = _ltly;
	_ltfw = _ltlw;
	_ltfh = _ltlh;
	
	_storage_menu_left_total_weight_field ctrlSetFontHeight _button_font_height - 0.003;;
	_storage_menu_left_total_weight_field ctrlSetFont _font_family;
	_storage_menu_left_total_weight_field ctrlSetPosition [_ltfx, _ltfy, _ltfw, _ltfh];
	_storage_menu_left_total_weight_field ctrlSetBackgroundColor [1,1,1,0.08];
	_storage_menu_left_total_weight_field ctrlCommit 0;
	
	//left amount label
	private["_lalx", "_laly", "_lalw", "_lalh"];
	_lalx = _ltlx; 
	_laly = _ltly + _ltlh + _ysep * 2;
	_lalw = _ltlw;
	_lalh = _ltlh;

	_storage_menu_left_amount_label ctrlSetText "Amount to take:";
	_storage_menu_left_amount_label ctrlSetPosition [_lalx, _laly, _lalw, _lalh];
	_storage_menu_left_amount_label ctrlSetFontHeight _button_font_height - 0.003;
	_storage_menu_left_amount_label ctrlCommit 0;
	
	//left amount field
	private["_lafx", "_lafy", "_lafw", "_lafh"];
	_lafx = _lalx + _lalw + _sep ;
	_lafy = _laly;
	_lafw = _lalw;
	_lafh = _lalh;
	
	_storage_menu_left_amount_field ctrlSetFontHeight _button_font_height - 0.003;;
	_storage_menu_left_amount_field ctrlSetFont _font_family;
	_storage_menu_left_amount_field ctrlSetPosition [_lafx, _lafy, _lafw, _lafh];
	_storage_menu_left_amount_field ctrlSetBackgroundColor [1,1,1,0.08];
	_storage_menu_left_amount_field ctrlCommit 0;
	
	
	//right header
	private["_rhx", "_rhy", "_rhw", "_rhh"];
	_rhx = _lhx + _lhw + _sep * 2;
	_rhy = _lhy;
	_rhw = _lhw;
	_rhh = _lhh;
	
	_storage_menu_right_header ctrlSetPosition [_rhx, _rhy, _rhw, _rhh];
	_storage_menu_right_header ctrlSetFontHeight _button_font_height;
	_storage_menu_right_header ctrlSetFont _font_family;
	_storage_menu_right_header ctrlCommit 0;
	
	//right close button
	private["_rcx", "_rcy", "_rcw", "_rch"];
	_rcw = 0.14;
	_rch = _rhh;
	_rcx = _rhx + _rhw - _rcw;
	_rcy = _rhy + _h - _rch;
	
	_storage_menu_close_button ctrlSetText "Close";
	_storage_menu_close_button ctrlSetPosition [_rcx, _rcy, _rcw, _rch];
	buttonSetAction [(ctrlIDC _storage_menu_close_button), "closeDialog 0"];
	_storage_menu_close_button ctrlCommit 0;
	
	//right background
	private["_rbx", "_rby", "_rbw", "_rbh"];
	_rbx = _rhx;
	_rby = _rhy + _rhh + _ysep;
	_rbw = _w;
	_rbh = (_rcy ) - (_rhy ) - _rch - _ysep - _ysep;
	
	_storage_menu_right_background ctrlSetPosition [_rbx, _rby, _rbw, _rbh];
	_storage_menu_right_background ctrlSetBackgroundColor [0,0,0,0.65];
	_storage_menu_right_background ctrlCommit 0;
	
	//right put button
	private["_rpx", "_rpy" ,"_rpw", "_rph"];
	_rpx = _rhx;
	_rpy = _rby + _rbh + _ysep;
	_rpw = _rcw * 1.2;
	_rph = _rch;
	
	_storage_menu_put_button ctrlSetText "Put";
	_storage_menu_put_button ctrlSetPosition [_rpx, _rpy, _rpw, _rph];
	_storage_menu_put_button ctrlCommit 0;
	
	//right list
	private["_rlx", "_rly", "_rlw", "_rlh"];
	_rlx = _rbx + _sep;
	_rly = _rby + _sep;
	_rlw = _rbw - _sep * 2;
	_rlh = _rbh * 0.65;
	
	_storage_menu_right_list ctrlSetPosition [_rlx, _rly, _rlw, _rlh];
	_storage_menu_right_list ctrlSetFontHeight _button_font_height * 0.9;
	_storage_menu_right_list ctrlCommit 0;
	
	
	//right weight label
	private["_rwlx", "_rwly", "_rwlw", "_rwlh"];
	_rwlx = _rlx; 
	_rwly = _rly + _rlh + _sep * 2;
	_rwlw = _rlw / 2  - _sep;
	_rwlh = 0.04;
	
	_storage_menu_right_weight_label ctrlSetText "Item(s) weight (Kg):";
	_storage_menu_right_weight_label ctrlSetPosition [_rwlx, _rwly, _rwlw, _rwlh];
	_storage_menu_right_weight_label ctrlSetFontHeight _button_font_height - 0.003;
	_storage_menu_right_weight_label ctrlCommit 0;
	
	//right weight field
	private["_rwfx", "_rwfy", "_rwfw", "_rwfh"];
	_rwfx = _rwlx + _rwlw + _sep ;
	_rwfy = _rwly;
	_rwfw = _rwlw;
	_rwfh = _rwlh;
	
	_storage_menu_right_weight_field ctrlSetFontHeight _button_font_height - 0.003;;
	_storage_menu_right_weight_field ctrlSetFont _font_family;
	_storage_menu_right_weight_field ctrlSetPosition [_rwfx, _rwfy, _rwfw, _rwfh];
	_storage_menu_right_weight_field ctrlSetBackgroundColor [1,1,1,0.08];
	_storage_menu_right_weight_field ctrlCommit 0;
	
	
	//right total weight label
	private["_rtlx", "_rtly", "_rtlw", "_rtlh"];
	_rtlx = _rwlx; 
	_rtly = _rwly + _rwlh + _ysep * 2;
	_rtlw = _rwlw;
	_rtlh = _rwlh;

	_storage_menu_right_total_weight_label ctrlSetText "Storage weight (Kg):";
	_storage_menu_right_total_weight_label ctrlSetPosition [_rtlx, _rtly, _rtlw, _rtlh];
	_storage_menu_right_total_weight_label ctrlSetFontHeight _button_font_height - 0.003;
	_storage_menu_right_total_weight_label ctrlCommit 0;
	
	//right total weight field
	private["_rtfx", "_rtfy", "_rtfw", "_rtfh"];
	_rtfx = _rtlx + _rtlw + _sep ;
	_rtfy = _rtly;
	_rtfw = _rtlw;
	_rtfh = _rtlh;
	
	_storage_menu_right_total_weight_field ctrlSetFontHeight _button_font_height - 0.003;;
	_storage_menu_right_total_weight_field ctrlSetFont _font_family;
	_storage_menu_right_total_weight_field ctrlSetPosition [_rtfx, _rtfy, _rtfw, _rtfh];
	_storage_menu_right_total_weight_field ctrlSetBackgroundColor [1,1,1,0.08];
	_storage_menu_right_total_weight_field ctrlCommit 0;
	
	
	//right amount label
	private["_ralx", "_raly", "_ralw", "_ralh"];
	_ralx = _rtlx; 
	_raly = _rtly + _rtlh + _ysep * 2;
	_ralw = _rtlw;
	_ralh = _rtlh;

	_storage_menu_right_amount_label ctrlSetText "Amount to put:";
	_storage_menu_right_amount_label ctrlSetPosition [_ralx, _raly, _ralw, _ralh];
	_storage_menu_right_amount_label ctrlSetFontHeight _button_font_height - 0.003;
	_storage_menu_right_amount_label ctrlCommit 0;
	
	//right amount field
	private["_rafx", "_rafy", "_rafw", "_rafh"];
	_rafx = _ralx + _ralw + _sep ;
	_rafy = _raly;
	_rafw = _ralw;
	_rafh = _ralh;
	
	_storage_menu_right_amount_field ctrlSetFontHeight _button_font_height - 0.003;;
	_storage_menu_right_amount_field ctrlSetFont _font_family;
	_storage_menu_right_amount_field ctrlSetPosition [_rafx, _rafy, _rafw, _rafh];
	_storage_menu_right_amount_field ctrlSetBackgroundColor [1,1,1,0.08];
	_storage_menu_right_amount_field ctrlCommit 0;
};

storage_menu_functions = true;