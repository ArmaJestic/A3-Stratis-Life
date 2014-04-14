#include "constants.h"
#include "macro.h"

if (not(undefined(lotto_menu_functions_defined))) exitWith {};

lotto_ticket_id = 0;
lotto_ticket_name = 1;
lotto_ticket_price = 2;
lotto_ticket_payout = 3;
lotto_ticket_chance = 4;

lotto_ticket_data =[
	["lotto1", 	"Cheap",	100, 10000, 10],
	["lotto2", 	"Normal", 500, 50000, 7],
	["lotto3", 	"Super", 1000, 250000, 5],
	["lotto4",	"Mega", 5000, 500000, 2]
];

lotto_data_id = 0;
lotto_data_shop = 1;
lotto_data_tickets = 2;

lotto_data = [
	[0, shop1, ["lotto1", "lotto2", "lotto3", "lotto4"]],
	[1, shop2, ["lotto1", "lotto2", "lotto3", "lotto4"]],
	[2, shop3, ["lotto1", "lotto2", "lotto3", "lotto4"]],
	[3, shop4, ["lotto1", "lotto2", "lotto3", "lotto4"]]
];



lotto_menu_combo_focus = {
	ARGV(0,_control);
	_control ctrlSetBackgroundColor [0.1,0.1,0.1,1];
};

lotto_menu_combo_blur = {
	ARGV(0,_control);
	_control ctrlSetBackgroundColor [1,1,1,0.08];
};

lotto_menu_setup = {
	disableSerialization;
	
	if (!(createDialog "lotto_menu")) exitWith {
		player groupChat format["ERROR: Could not create lotto menu dialog"];
	};
	
	private["_display"];
	_display = (uiNamespace getVariable 'LOTTO_MENU');
	
	_lotto_menu_dialog = _display displayCtrl lotto_menu_dialog_idd;
	_lotto_header = _display displayCtrl lotto_header_idc;
	_lotto_background = _display displayCtrl lotto_background_idc;
	_lotto_buy_button = _display displayCtrl lotto_buy_button_idc;
	_lotto_close_button = _display displayCtrl lotto_close_button_idc;
	_lotto_ticket_type_label = _display displayCtrl lotto_ticket_type_label_idc;
	_lotto_ticket_type_field = _display displayCtrl lotto_ticket_type_field_idc;
	_lotto_ticket_price_label = _display displayCtrl lotto_ticket_price_label_idc;
	_lotto_ticket_price_field = _display displayCtrl lotto_ticket_price_field_idc;
	_lotto_ticket_info_label = _display displayCtrl lotto_ticket_info_label_idc;
	_lotto_ticket_info_field = _display displayCtrl lotto_ticket_info_field_idc;
	
	_lotto_ticket_payout_label = _display displayCtrl lotto_ticket_payout_label_idc;
	_lotto_ticket_payout_field = _display displayCtrl lotto_ticket_payout_field_idc;
	
	_lotto_ticket_type_field ctrlAddEventHandler ["SetFocus", "(_this) call lotto_menu_combo_focus"];
	_lotto_ticket_type_field ctrlAddEventHandler ["KillFocus", "(_this) call lotto_menu_combo_blur"];
	_lotto_ticket_type_field ctrlAddEventHandler ["LBSelChanged", "(_this) call lotto_menu_selection_changed"];
	
	player groupChat format["_display = %1", _display];
	player groupChat format["_lotto_background = %1", _lotto_background];
	
	private["_x", "_y", "_ysep", "_sep", "_w", "_h", "_header_title"];
	_x = 0.14;
	_y = 0.14;
	_w = 0.35;
	_h = 0.33;
	_ysep = 0.003;
	_sep = 0.01;
	_header_title = "LOTTERY";
	
	private["_button_font_height", "_font_family"];
	_button_font_height = MENU_TITLE_FONT_HEIGHT;
	_font_family = "PuristaMedium";
	
	
	//header
	private["_lhx", "_lhy", "_lhw", "_lhh"];
	_lhx = _x;
	_lhy = _y;
	_lhw = _w;
	_lhh = 0.045;
	
	_lotto_header ctrlSetPosition [_lhx, _lhy, _lhw, _lhh];
	_lotto_header ctrlSetFontHeight _button_font_height;
	_lotto_header ctrlSetFont _font_family;
	_lotto_header ctrlSetText _header_title;
	_lotto_header ctrlCommit 0;
	
	//background
	private["_lbx", "_lby", "_lbw", "_lbh"];
	_lbx = _lhx;
	_lby = _lhy + _lhh + _ysep;
	_lbw = _w;
	_lbh = _h - _lhh - _lhh - _ysep - _ysep;
	
	_lotto_background ctrlSetPosition [_lbx, _lby, _lbw, _lbh];
	_lotto_background ctrlSetBackgroundColor [0,0,0,0.65];
	_lotto_background ctrlCommit 0;
	
	//buy button
	private["_ltx", "_lty", "_ltw", "_lth"];
	_ltw = 0.12;
	_lth = _lhh;
	_ltx = _lhx;
	_lty = _lby + _lbh + _ysep;
	
	_lotto_buy_button ctrlSetText "Buy";
	_lotto_buy_button ctrlSetPosition [_ltx, _lty, _ltw, _lth];
	_lotto_buy_button ctrlCommit 0;
	
	
	//close button
	private["_lcx", "_lcy", "_lcw", "_lch"];
	_lcw = 0.14;
	_lch = _lhh;
	_lcx = _lhx + _lhw - _lcw;
	_lcy = _lhy + _h - _lch;
	
	_lotto_close_button ctrlSetText "Close";
	_lotto_close_button ctrlSetPosition [_lcx, _lcy, _lcw, _lch];
	buttonSetAction [(ctrlIDC _lotto_close_button), "closeDialog 0"];
	_lotto_close_button ctrlCommit 0;
	
	//type label
	private["_ltlx", "_ltly", "_ltlw", "_ltlh"];
	_ltlx = _lhx + _sep; 
	_ltly = _lhy + _lhh + _sep * 2;
	_ltlw = _lhw / 2  - _sep * 2;
	_ltlh = 0.04;

	_lotto_ticket_type_label ctrlSetText "Ticket type: ";
	_lotto_ticket_type_label ctrlSetPosition [_ltlx, _ltly, _ltlw, _ltlh];
	_lotto_ticket_type_label ctrlSetFontHeight _button_font_height - 0.003;
	_lotto_ticket_type_label ctrlCommit 0;
	
	//type field
	private["_ltfx", "_ltfy", "_ltfw", "_ltfh"];
	_ltfx = _ltlx + _ltlw + _sep ;
	_ltfy = _ltly;
	_ltfw = _ltlw;
	_ltfh = _ltlh;
	
	_lotto_ticket_type_field ctrlSetFontHeight _button_font_height - 0.003;;
	_lotto_ticket_type_field ctrlSetFont _font_family;
	_lotto_ticket_type_field ctrlSetPosition [_ltfx, _ltfy, _ltfw, _ltfh];
	_lotto_ticket_type_field ctrlSetBackgroundColor [1,1,1,0.08];
	_lotto_ticket_type_field ctrlCommit 0;
	
	//price label
	private["_lplx", "_lply", "_lplw", "_lplh"];
	_lplx = _ltlx; 
	_lply = _ltly + _ltlh + _ysep * 3;
	_lplw = _ltlw;
	_lplh = _ltlh;

	_lotto_ticket_price_label ctrlSetText "Ticket price: ";
	_lotto_ticket_price_label ctrlSetPosition [_lplx, _lply, _lplw, _lplh];
	_lotto_ticket_price_label ctrlSetFontHeight _button_font_height - 0.003;
	_lotto_ticket_price_label ctrlCommit 0;
	
	//price field
	private["_lpfx", "_lpfy", "_lpfw", "_lpfh"];
	_lpfx = _lplx + _lplw + _sep ;
	_lpfy = _lply;
	_lpfw = _lplw;
	_lpfh = _lplh;
	
	_lotto_ticket_price_field ctrlSetFontHeight _button_font_height - 0.003;;
	_lotto_ticket_price_field ctrlSetFont _font_family;
	_lotto_ticket_price_field ctrlSetPosition [_lpfx, _lpfy, _lpfw, _lpfh];
	_lotto_ticket_price_field ctrlSetBackgroundColor [1,1,1,0.08];
	_lotto_ticket_price_field ctrlCommit 0;
	
	
	//info label
	private["_lilx", "_lply", "_lplw", "_lplh"];
	_lilx = _lplx; 
	_lily = _lply + _lplh + _ysep * 3;
	_lilw = _lplw;
	_lilh = _lplh;

	_lotto_ticket_info_label ctrlSetText "Winning chance: ";
	_lotto_ticket_info_label ctrlSetPosition [_lilx, _lily, _lilw, _lilh];
	_lotto_ticket_info_label ctrlSetFontHeight _button_font_height - 0.003;
	_lotto_ticket_info_label ctrlCommit 0;
	
	//info field
	private["_lifx", "_lify", "_lifw", "_lifh"];
	_lifx = _lilx + _lilw + _sep ;
	_lify = _lily;
	_lifw = _lilw;
	_lifh = _lilh;
	
	_lotto_ticket_info_field ctrlSetFontHeight _button_font_height - 0.003;;
	_lotto_ticket_info_field ctrlSetFont _font_family;
	_lotto_ticket_info_field ctrlSetPosition [_lifx, _lify, _lifw, _lifh];
	_lotto_ticket_info_field ctrlSetBackgroundColor [1,1,1,0.08];
	_lotto_ticket_info_field ctrlCommit 0;
	
	
	
	//payout label
	private["_lolx", "_loly", "_lolw", "_lolh"];
	_lolx = _lilx; 
	_loly = _lily + _lilh + _ysep * 3;
	_lolw = _lilw;
	_lolh = _lilh;

	_lotto_ticket_payout_label ctrlSetText "Payout: ";
	_lotto_ticket_payout_label ctrlSetPosition [_lolx, _loly, _lolw, _lolh];
	_lotto_ticket_payout_label ctrlSetFontHeight _button_font_height - 0.003;
	_lotto_ticket_payout_label ctrlCommit 0;
	
	//payout field
	private["_lofx", "_lify", "_lifw", "_lifh"];
	_lofx = _lolx + _lolw + _sep ;
	_lofy = _loly;
	_lofw = _lolw;
	_lofh = _lolh;
	
	_lotto_ticket_payout_field ctrlSetFontHeight _button_font_height - 0.003;;
	_lotto_ticket_payout_field ctrlSetFont _font_family;
	_lotto_ticket_payout_field ctrlSetPosition [_lofx, _lofy, _lofw, _lofh];
	_lotto_ticket_payout_field ctrlSetBackgroundColor [1,1,1,0.08];
	_lotto_ticket_payout_field ctrlCommit 0;
	
	
	
	_lotto_ticket_type_field	
};



lotto_ticket_lookup_id = {
	ARGV(0,_ticket_id);
	if (undefined(_ticket_id)) exitWith {null};
	if (typeName _ticket_id != "STRING") exitWith {null};
	
	private["_ticket_data"];
	_ticket_data = null;
	
	{
		private["_cticked_id", "_cticket_data"];
		_cticket_data = _x;
		_cticket_id = _cticket_data select lotto_ticket_id;
		
		if (_cticket_id == _ticket_id) then {
			_ticket_data = _cticket_data;
		};
		
	} forEach lotto_ticket_data;
	
	_ticket_data
};


lotto_lookup_id = {
	ARGV(0,_id);
	
	if (undefined(_id)) exitWith {null};
	private["_lotto"];
	
	_lotto = null;
	
	{
		private["_cid", "_clotto"];
		_clotto = _x;
		_cid = _clotto select lotto_data_id;
		if (_cid == _id) then {
			_lotto = _clotto;
		};
	} forEach (lotto_data);
	
	_lotto
};

lotto_player_near = {
	//player groupChat format["lotto_player_near %1", _this];
	ARGV(0,_player);
	ARGV(1,_distance);
	
	if (not([_player] call player_exists)) exitWith {null};
	if (undefined(_distance)) exitWith {null};
	if (typeName _distance != "SCALAR") exitWith {null};
	
	private["_min_distance", "_min_lotto"];
	_min_distance = _distance;
	_min_lotto = null;
	
	{
		private["_clotto", "_cdistance", "_cobject"];
		_clotto = _x;
		_cobject = _clotto select lotto_data_shop;
		_cdistance = _player distance _cobject;
		if (_cdistance < _min_distance) then {
			_min_distance = _cdistance;
			_min_lotto = _clotto;
		};
	} forEach lotto_data;
	
	_min_lotto
};



lotto_actions = [];
lotto_remove_actions = {
	if (count lotto_actions == 0) exitWith {};
	private["_player"];
	ARGV(0,_player);
	if (not([_player] call player_human)) exitWith {};
	
	{
		private["_action_id"];
		_action_id = _x;
		_player removeAction _action_id;
	} forEach lotto_actions;
	lotto_actions = [];
};


lotto_add_actions = {
	if (count lotto_actions > 0) exitWith {};
	ARGV(0,_player);
	ARGV(1,_lotto_id);

	if (not([_player] call player_human)) exitWith {};
	if (undefined(_lotto_id)) exitWith {};

	private["_action_id"];
	_action_id = player addAction ["Play Lottery", "noscript.sqf", format['[%1, %2] call lotto_menu_create;', _player, _lotto_id]];
	lotto_actions = lotto_actions + [_action_id];
};

lotto_menu_selection_changed = {
	ARGV(0,_control);
	ARGV(1,_index);
	
	private["_ticked_id"];
	_ticked_id = _control lbData _index;
	
	private["_ticket"];
	_ticket = [_ticked_id]  call lotto_ticket_lookup_id;
	
	if (undefined(_ticket)) exitWith {};
	private["_ticket_price", "_ticket_chance", "_ticket_payout"];
	_ticket_price = _ticket select lotto_ticket_price;
	_ticket_chance = _ticket select lotto_ticket_chance;
	_ticket_payout = _ticket select lotto_ticket_payout;

	ctrlSetText [lotto_ticket_price_field_idc, format["$%1", strM(_ticket_price)]];
	ctrlSetText [lotto_ticket_info_field_idc, format["%1", str(_ticket_chance) + "%"]];
	ctrlSetText [lotto_ticket_payout_field_idc, format["$%1", strM(_ticket_payout)]];
};

lotto_menu_create = {
	ARGV(0,_player);
	ARGV(1,_lotto_id);
	
	if (not([_player] call player_human)) exitWith{};
	if (undefined(_lotto_id)) exitWith {};
	if (typeName _lotto_id != "SCALAR") exitWith {};
	
	private["_list"];
	_list = [] call lotto_menu_setup;
	

	private["_lotto"];
	_lotto = [_lotto_id] call lotto_lookup_id;
	
	if (undefined(_lotto)) exitWith {};
	
	private["_tickets"];
	_tickets = _lotto select lotto_data_tickets;
	
	{if (true) then {
		private["_ticket_id", "_ticket_data"];
		_ticket_id = _x;
		_ticket_data = [_ticket_id] call lotto_ticket_lookup_id;
		
		private["_ticket_name"];
		_ticket_name = _ticket_data  select lotto_ticket_name;
		
		private["_index"];
		_index = lbAdd [lotto_ticket_type_field_idc, format["%1", _ticket_name]];
		lbSetData [lotto_ticket_type_field_idc, _index, _ticket_id];
		
	};} forEach _tickets;
	
	lbSetCurSel[lotto_ticket_type_field_idc, 0];
	buttonSetAction [lotto_buy_button_idc, format['[%1, lbData[lotto_ticket_type_field_idc, (lbCurSel lotto_ticket_type_field_idc)]] call interact_lotto_play', _player]];

	lbSetCurSel [1, 0];

};


playing_lotto = 0;
interact_lotto_play = { _this spawn {
	ARGV(0,_player);
	ARGV(1,_ticket_id);
	
	if (not([_player] call player_human)) exitWith {};
	if (undefined(_ticket_id)) exitWith {};
	if (typeName _ticket_id != "STRING") exitWith {};
	
	private["_ticket_data"];
	_ticket_data = [_ticket_id] call lotto_ticket_lookup_id;
	
	if (undefined(_ticket_data)) exitWith {};
	
	private["_price", "_chance", "_payout"];
	_price = _ticket_data select lotto_ticket_price;
	_payout = _ticket_data select lotto_ticket_payout;
	_chance = _ticket_data select lotto_ticket_chance;
	
	private["_draw", "_money"];
	_draw = floor(random 100);
	_money = [_player, 'money'] call inventory_get_item_amount;

	if (playing_lotto == 1) exitWith {
		player groupChat "WARNING: You can only buy one ticket at a time.";
	};

	if (_money < _price) exitWith {
		role groupChat localize "STRS_lotto_nomoney";
	};

	[_player, 'money', -(_price)] call inventory_add_item;

	private["_wait_time"];
	_wait_time = 10;
	
	player groupChat format["You will be notified of the lottery results in %1 seconds(s)", round(_wait_time)];
	
	playing_lotto = 1;
	sleep _wait_time;
	playing_lotto = 0;

	if (_draw > _chance) then {
		player groupChat format["%1-%2, sorry, your lottery ticket didn't get drawn this time.", _player, (name _player)];
	}
	else {
		[_player, 'money', _payout] call inventory_add_item;
		player groupChat format["%1-%2, Congratulations, your have won the lottery, you payout is $%3", _player, (name _player), strM(_payout)];
	};
};};

lotto_menu_functions_defined = true;