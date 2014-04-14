#include "macro.h"
#include "constants.h"

if (not(undefined(main_menu_functions_defined))) exitWith {};


main_menu_dialog_title = 0;
main_menu_dialog_handler = 1;
main_menu_dialog_handler_variables = 2;

main_menu_handle_finances = {
	ARGV(0,_title);
	private["_list"];
	_list = [toUpper(_title), 0.14, 0.14, 0.6, 0.7] call main_menu_right_setup;
	lbClear (ctrlIDC _list);
	
	private["_player"];
	_player = player;
	
	private["_total_money", "_inventory_money", "_private_money", "_factory_money", "_bank_money"];
	_total_money = [_player] call player_get_total_money;
	_inventory_money = [_player] call player_get_inventory_money;
	_private_money = [_player] call player_get_private_storage_money;
	_factory_money = [_player] call player_get_factory_money;
	
	_bank_money = [_player] call bank_get_value;
	
	_list lbAdd format ["Total money: $%1", strM(_total_money)];
	_list lbAdd format ["Inventory: $%2", localize "STRS_statdialog_health", strM(_inventory_money)];
	_list lbAdd format ["Bank account: $%2", localize "STRS_statdialog_health", strM(_bank_money)];
	_list lbAdd format ["Private storage: $%1", strM(_private_money)];
	_list lbAdd format ["Factory storage: $%1", strM(_factory_money)];
};


main_menu_handle_statistics = {
	ARGV(0,_title);
	private["_list"];
	_list = [toUpper(_title), 0.14, 0.14, 0.6, 0.7] call main_menu_right_setup;
	lbClear (ctrlIDC _list);
	
	_list lbAdd format ["Date: %3.%2.%1", (date select 0), (date select 1), (date select 2)];
	_list lbAdd format ["Runtime: %1 minutes", (round(time/60))];
	_list lbAdd format ["%1: %2/%3", "Weight", (call inventory_get_own_weight), INV_CarryingCapacity];
	_list lbAdd format ["%1: %2",    "Cops killed", ([player, "copskilled"] call player_get_scalar)];
	_list lbAdd format ["%1: %2",    "Civilians killed", ([player, "civskilled"] call player_get_scalar)];
	_list lbAdd format ["%1: %2",    "Arrests Made", ([player, "arrestsmade"] call player_get_scalar)];
	_list lbAdd format ["%1: %2",    "Suicides", ([player, "selfkilled"] call player_get_scalar)];
	_list lbAdd format ["%1: %2",    "Deaths", ([player, "deadtime"] call player_get_scalar)];
	_list lbAdd format ["%1: %2 seconds", "Respawn time", round(_dead_wait_time)];
};


main_menu_handle_factories = {
	ARGV(0,_title);
	private["_list"];
	_list = [toUpper(_title), 0.14, 0.14, 0.6, 0.7] call main_menu_right_setup;
	lbClear (ctrlIDC _list);
	
	private["_i"];
	_i = 0;
	while {_i <  (count all_factories)} do {
		if (((all_factories select _i) select 1) in INV_Fabrikowner) then {
			private["_workers"];
			_workers = missionNamespace getVariable [format["%1workers",((all_factories select _i) select 8)], 0];
			_list lbAdd format['%1: %2 workers', ((all_factories select _i) select 2), _workers];
		};
		_i = _i + 1;
	};
};



main_menu_handle_gangs = {
	ARGV(0,_title);
	private["_list"];
	_list = [toUpper(_title), 0.14, 0.14, 0.6, 0.7] call main_menu_right_setup;
	lbClear (ctrlIDC _list);
	
	private["_gangs_list"];
	_gangs_list = call gangs_get_list;
	
	{if (true) then {
		private["_gang"];
		_gang = _x;
		private["_gang_name"];
		_gang_name = _gang select gang_name;
		
		private["_member_uids", "_member_names"];
		_member_uids = _gang select gang_members;
		_member_names = [_member_uids] call gangs_uids_2_names;
		
		if (count(_member_names) == 0) exitWith {null};
		private["_leader_name"];
		_leader_name = _member_names select 0;
		
		_list lbAdd format["%1 (%2)", _gang_name, _leader_name];
		
		private["_i"];
		_i = 1; //(starting at 1 because 0 is the leader)
		while {_i < (count _member_names) } do {
			private["_member_name"];
			_member_name = _member_names select _i;
			_list lbAdd format["    %1. %2", _i, _member_name];
			_i = _i + 1;
		};
	};} forEach _gangs_list;
};


main_menu_handle_gang_areas = {
	ARGV(0,_title);
	private["_list"];
	_list = [toUpper(_title), 0.14, 0.14, 0.6, 0.7] call main_menu_right_setup;
	lbClear (ctrlIDC _list);
	
	
	{ if (true) then {
		private["_gang_area"];
		_gang_area = _x;
		
		private["_gang_area_name"];
		_gang_area_name = str(_gang_area);
		
		if ([_gang_area] call gang_area_neutral) then {
			_list lbAdd format["%1 - (Neutral)", _gang_area_name];
		}
		else {
			private["_gang_id"];
			_gang_id = [_gang_area] call gang_area_get_control;
			
			private["_gang"];
			_gang = [_gang_id] call gangs_lookup_id;
			
			if (undefined(_gang)) then {
				_list lbAdd format["%1 - (Abandoned)", _gang_area_name];
			}
			else {
				private["_gang_name"];
				_gang_name = _gang select gang_name;
				_list lbAdd format["%1 - (%2)", _gang_area_name, _gang_name];
			};
		};
	};} forEach gangareas;
};



main_menu_handle_licenes = {
	ARGV(0,_title);
	private["_list"];
	_list = [toUpper(_title), 0.14, 0.14, 0.6, 0.7] call main_menu_right_setup;
	lbClear (ctrlIDC _list);
	
	private["_i"];
	_i = 0;
	while {_i < (count INV_Licenses)} do {
		if (((INV_Licenses select _i) select 0) call inventory_has_license) then {
			_list lbAdd (((INV_Licenses select _i) select 2));
		};
		_i = _i + 1;
	};
};



main_menu_handle_bank = {
	ARGV(0,_title);
	private["_list"];
	_list = [toUpper(_title), 0.14, 0.14, 0.6, 0.7] call main_menu_right_setup;
	lbClear (ctrlIDC _list);
	_list lbAdd (format ["Est. total funds in the main bank safe's: $%1", strM(robpoolsafe1 + robpoolsafe2 + robpoolsafe3)]);
};

main_menu_handle_players = {
	ARGV(0,_title);
	private["_list"];
	_list = [toUpper(_title), 0.14, 0.14, 0.6, 0.7] call main_menu_right_setup;
	lbClear (ctrlIDC _list);
	
	private ["_i"];
	_i = 0;
	while { _i < (count playerstringarray) } do {
		private["_player", "_player_variable_name"];
		_player_variable_name = playerstringarray select _i;
		_player = missionNamespace getVariable [_player_variable_name, null];
		
		if ([_player] call player_human) then {
			private["_label_text", "_index"];
			_label_text =  format ["%1: %2", _player, (name _player)];
			_index = _list lbAdd _label_text;
			private["_wanted"];
			if (not([_player] call player_cop) && ([_player] call player_get_bounty) > 0) then {
				_list lbSetColor [_index, [1, 0, 0, 1]];
			};
		};
		_i = _i + 1;
	};
};


main_menu_handle_crimes = {
	ARGV(0,_title);
	private["_list"];
	_list = [toUpper(_title), 0.14, 0.14, 0.6, 0.7] call main_menu_right_setup;
	lbClear (ctrlIDC _list);
	
	private["_i"];
	_i = 0;
	while { _i < (count playerstringarray) } do {
		private["_player_variable_name", "_player_variable"];
		_player_variable_name = playerstringarray select _i;
		_player_variable = missionNamespace getVariable [_player_variable_name, null];

		if (not([_player_variable] call player_cop) && ([_player_variable] call player_get_wanted)) then {
			private["_bounty", "_reasons"];
			_reasons = [_player_variable] call player_get_reason; 
			_bounty = [_player_variable] call player_get_bounty;
			
			_list lbAdd (format ["%1 (Bounty: $%3): %2 is wanted for %4 crime/s:", _player_variable, (name _player_variable), strM(_bounty), (count _reasons)]);
			private["_j", "_count"];
			_j = 0;
			while { _j < (count _reasons) } do {
				private["_reason"];
				_reason = _reasons select _j;
				_list lbAdd (format ["    %1. %2", (_j + 1), _reason]); 
				_j = _j + 1;
			};
			_list lbAdd _trennlinie;
		};
		_i = _i + 1;
	};
	
};

main_menu_handle_workplaces = {
	ARGV(0,_title);
	private["_list"];
	_list = [toUpper(_title), 0.14, 0.14, 0.6, 0.7] call main_menu_right_setup;
	lbClear (ctrlIDC _list);
	
	private["_i"];
	_i = 0;
	while {_i < (count BuyAbleBuildingsArray)} do {
		private["_owned", "_owned_str"];
		_owned = ((BuyAbleBuildingsArray select _i) select 0) in BuildingsOwnerArray;
		_owned_str = if (_owned) then {"Owned"} else {"Available"};
		_list lbAdd (format ["%1 - (%2)", ((BuyAbleBuildingsArray select _i) select 1), _owned_str]);
		_i = _i + 1;
	};
};


main_menu_handle_elections = {
	ARGV(0,_title);
	
	private["_president_button"];
	_president_button = ["President", voting_menu_president];

	private["_police_button"];
	_police_button = ["Police Chief", voting_menu_police];

	private["_buttons_data"];

	_buttons_data = [
		_president_button,
		_police_button
	];

	[toUpper("Elections Menu"), _buttons_data] call main_menu_setup;
};

main_menu_handle_legislation = {
	ARGV(0,_title);
	ARGV(1,_player);
	
	[_player] call legislation_view_menu_create;
};


main_menu_handle_economy = {
	ARGV(0,_title);
	private["_list"];
	_list = [toUpper(_title), 0.14, 0.14, 0.6, 0.7] call main_menu_right_setup;
	
	{
		private["_tax_data", "_tax_name", "_tax_value"];
		_tax_data = _x;
		_tax_name = _tax_data select economy_tax_name;
		_tax_value = _tax_data select economy_tax_value;
		
		_list lbAdd format["%1 Tax: %2%3", _tax_name, _tax_value, "%"];
	} foreach economy_tax_data;

	_list lbAdd format["Oil demand: %1 barrel/s", strN(call shop_get_oil_barrel_demand)];
	_list lbAdd format["Fuel price: $%1 per liter", (call shop_get_fuel_price)];
	_list lbAdd _trennlinie;
};



main_menu_variable_data = null;

main_menu_setup = {
	disableSerialization;
	player groupChat format["main_menu_setup "];
	ARGV(0,_menu_title);
	ARGV(1,_buttons_data);
	
	if (not(createDialog "main_menu")) exitWith {
		player groupChat format["ERROR: cannot create main menu dialog"];	
	};

	private["_display"];
	_display = uiNamespace getVariable "MAIN_MENU";
	
	
	
	private["_header",
			"_button_1", "_button_2", "_button_3", "_button_4", "_button_5",
			"_button_6", "_button_7", "_button_8", "_button_9", "_button_10",
			"_button_11", "_button_12", "_button_13", "_button_14", "_button_15",
			"_button_16", "_button_17", "_button_18", "_button_19", "_button_20"];
			
	_header = _display displayCtrl main_menu_header_idc;
	
	
	
	private["_i", "_buttons"];
	_i = main_menu_button_start_idc;
	_buttons = [];
	while {_i <= main_menu_button_stop_idc } do {
		private["_control"];
		_control = _display displayCtrl _i;
		_buttons set [count(_buttons), _control];
		_i = _i + 1;
	};
	
	private["_ysep", "_sep"];
	_ysep = 0.003;
	_sep = 0.01;
	
	private["_hx", "_hy", "_hw","_hh"];
	//header position
	_hx = 0.14; 
	_hy = 0.14;
	_hw = 0.32; 
	_hh = 0.045;
	
	_header ctrlSetPosition [_hx, _hy, _hw, _hh];
	_header ctrlSetFontHeight (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1);
	_header ctrlSetText _menu_title;
	_header ctrlSetFont "PuristaMedium";
	_header ctrlCommit 0;
	
	private["_button_x", "_button_y"];
	_button_x = _hx;
	_button_y = _hy + _hh + _ysep;
	_button_w = _hw;
	_button_h = _hh;
	
	private["_button_prev_y", "_button_sx", "_button_sy"];
	_button_sx = _button_x;
	_button_sy = _button_y;
	
	
	if (undefined(main_menu_variable_data)) then {
		main_menu_variable_data = "Sign_Sphere10cm_F" createVehicle (getPos player); 
	};

	
	private["_button_last_x", "_button_last_y"];
	private["_i"];
	_i = 0;
	while {_i < (count _buttons_data)} do {
	
		private["_button_data", "_button_title", "_button_function"];
		_button_data = _buttons_data select _i;
		_button_title = _button_data select main_menu_dialog_title;
		_button_handler = _button_data select main_menu_dialog_handler;
		_button_variables = _button_data select main_menu_dialog_handler_variables;
		
		if (undefined(_button_variables)) then {
			_button_variables = [];
		};
		
		private["_button_control"];
		_button_control = _buttons select _i;
		
		_button_control ctrlSetText _button_title;
		[main_menu_variable_data, _button_title, _button_variables] call object_setVariable;
		
		buttonSetAction[(ctrlIDC _button_control), '[' + str(_button_title) + ', ' + str(player) +  ', ([main_menu_variable_data, ' + str(_button_title) + '] call object_getVariable)] call ' + str(_button_handler)];
		//player groupChat format["_button_handler = %1", _button_handler];
		
		_button_control ctrlSetPosition [_button_sx, _button_sy, _button_w, 0];
		_button_control ctrlCommit 0;
		_button_control ctrlSetPosition [_button_x, _button_y, _button_w, _button_h];
		_button_control ctrlCommit 0;
		_button_last_x = _button_x;
		_button_last_y = _button_y;
		_button_y = _button_y + _button_h + _ysep; 
			
		_i = _i + 1;
	};
	
};



main_menu_right_setup = {
	disableSerialization;
	ARGV(0,_title);
	ARGV(1,_x);
	ARGV(2,_y);
	ARGV(3,_w);
	ARGV(4,_h);
	
	if (not(createDialog "main_menu_right")) exitWith {
		player groupChat format["ERROR: cannot create main menu right dialog"];
	};
		

	private["_display"];
	_display = uiNamespace getVariable "MAIN_MENU_RIGHT";
	
	private["_header", "_background", 
			"_button_close", "_list"];
			
	_header = _display displayCtrl main_menu_right_header_idc;
	_background = _display displayCtrl main_menu_right_background_idc;
	_button_close = _display displayCtrl main_menu_right_button_close_idc;
	_list = _display displayCtrl main_menu_right_content_idc;
	
	private["_ysep", "_sep"];
	_ysep = 0.003;
	_sep = 0.01;
	
	private["_button_font_height"];
	_button_font_height = MENU_TITLE_FONT_HEIGHT;
	//header
	private["_hx", "_hy", "_hw", "_hh"];
	_hx = _x;
	_hy = _y;
	_hw = _w;
	_hh = 0.045;
	
	_header ctrlSetPosition [_hx, _hy, _hw, _hh];
	_header ctrlSetFontHeight _button_font_height;
	_header ctrlSetText _title;
	_header ctrlSetFont "PuristaMedium";
	_header ctrlCommit 0;
	
	//close button
	private["_cx", "_cy", "_cw", "_ch"];
	_cw = 0.14;
	_ch = _hh;
	_cx = _x + _w - _cw;
	_cy = _y + _h - _ch;
	
	_button_close ctrlSetText "Close";
	_button_close ctrlSetPosition [_cx, _cy, _cw, _ch];
	buttonSetAction [(ctrlIDC _button_close), "closeDialog 0"];
	_button_close ctrlCommit 0;
	
	//background
	private["_bx", "_by", "_bw", "_bh"];
	_bx = _x;
	_by = _hy + _hh + _ysep;
	_bw = _w;
	_bh = (_cy ) - (_hy ) - _ch - _ysep - _ysep;
	
	_background ctrlSetPosition [_bx, _by, _bw, _bh];
	_background ctrlSetBackgroundColor [0,0,0,0.45];
	_background ctrlCommit 0;
	
	//list
	private["_lx", "_ly", "_lw", "_ly"];
	_lx = _bx + _ysep * 3 ;
	_ly = _by + _ysep * 3;
	_lw = _bw - _ysep * 6;
	_lh = _bh - _ysep * 6;
	
	_list ctrlSetPosition [_lx, _ly, _lw, _lh];
	_list ctrlSetFontHeight _button_font_height - 0.003;
	_list ctrlCommit 0;
	
	_list
};





main_menu_create = {
	private["_finance_button"];
	_finance_button = ["Finances", main_menu_handle_finances, ["Hello World!"]];

	private["_statistics_button"];
	_statistics_button = ["Statistics", main_menu_handle_statistics];

	private["_factories_button"];
	_factories_button = ["Factories", main_menu_handle_factories];

	private["_gangs_button"];
	_gangs_button = ["Gangs", main_menu_handle_gangs];

	private["_gang_areas_button"];
	_gang_areas_button = ["Gang Areas", main_menu_handle_gang_areas];

	private["_licenses_button"];
	_licenses_button = ["Licenses", main_menu_handle_licenes];

	private["_bank_button"];
	_bank_button = ["Bank", main_menu_handle_bank];

	private["_players_button"];
	_players_button = ["Players", main_menu_handle_players];

	private["_crimes_button"];
	_crimes_button = ["Crime log", main_menu_handle_crimes];

	private["_workpalces_button"];
	_workpalces_button = ["Workplaces", main_menu_handle_workplaces];
	
	private["_government_button"];
	_government_button = ["Elections", main_menu_handle_elections];
		
	private["_legislation_button"];
	_legislation_button = ["Legislation", main_menu_handle_legislation];

	private["_economy_button"];
	_economy_button = ["Economy", main_menu_handle_economy];

	private["_buttons_data"];

	_buttons_data = [
		_finance_button,
		_economy_button,
		_government_button,
		_legislation_button,
		_workpalces_button,
		_crimes_button,
		_players_button,
		_bank_button,
		_licenses_button,
		_gang_areas_button,
		_gangs_button,
		_factories_button,
		_statistics_button
		];

	[toUpper("Main Menu"), _buttons_data] call main_menu_setup;
};

main_menu_functions_defined = true;

