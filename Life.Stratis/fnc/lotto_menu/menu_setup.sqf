// A_lotto_menu_fnc_menu_setup

#include "header.h"


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

_lotto_ticket_type_field ctrlAddEventHandler ["SetFocus", "(_this) call A_lotto_menu_fnc_menu_combo_focus"];
_lotto_ticket_type_field ctrlAddEventHandler ["KillFocus", "(_this) call A_lotto_menu_fnc_menu_combo_blur"];
_lotto_ticket_type_field ctrlAddEventHandler ["LBSelChanged", "(_this) call A_lotto_menu_fnc_menu_selection_changed"];

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
