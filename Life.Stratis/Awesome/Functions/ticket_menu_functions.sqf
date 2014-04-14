#include "constants.h"
#include "macro.h"

if (not(undefined(ticket_menu_functions_defined))) exitWith {};


ticket_menu_setup = {
	disableSerialization;
	
	if (!(createDialog "ticket_menu")) exitWith {
		player groupChat format["ERROR: Could not create ticket menu dialog"];
	};
	
	private["_display"];
	_display = (uiNamespace getVariable 'TICKET_MENU');
	
	_ticket_menu_header = _display displayCtrl ticket_menu_header_idc;
	_ticket_menu_background = _display displayCtrl ticket_menu_background_idc;
	_ticket_menu_submit_button = _display displayCtrl ticket_menu_submit_button_idc;
	_ticket_menu_close_button = _display displayCtrl ticket_menu_close_button_idc;
	_ticket_menu_price_label = _display displayCtrl ticket_menu_price_label_idc;
	_ticket_menu_price_field = _display displayCtrl ticket_menu_price_field_idc;
	
	private["_x", "_y", "_ysep", "_sep", "_w", "_h", "_header_title"];
	_x = 0.14;
	_y = 0.14;
	_w = 0.35;
	_h = 0.18;
	_ysep = 0.003;
	_sep = 0.01;
	_header_title = "INFRACTION TICKET";
	
	private["_button_font_height", "_font_family"];
	_button_font_height = MENU_TITLE_FONT_HEIGHT;
	_font_family = "PuristaMedium";
	
	//header
	private["_thx", "_thy", "_thw", "_thh"];
	_thx = _x;
	_thy = _y;
	_thw = _w;
	_thh = 0.045;
	
	_ticket_menu_header ctrlSetPosition [_thx, _thy, _thw, _thh];
	_ticket_menu_header ctrlSetFontHeight _button_font_height;
	_ticket_menu_header ctrlSetFont _font_family;
	_ticket_menu_header ctrlSetText _header_title;
	_ticket_menu_header ctrlCommit 0;
	
	//background
	private["_tbx", "_tby", "_tbw", "_tbh"];
	_tbx = _thx;
	_tby = _thy + _thh + _ysep;
	_tbw = _w;
	_tbh = _h - _thh - _thh - _ysep - _ysep;
	
	_ticket_menu_background ctrlSetPosition [_tbx, _tby, _tbw, _tbh];
	_ticket_menu_background ctrlSetBackgroundColor [0,0,0,0.65];
	_ticket_menu_background ctrlCommit 0;
	
	//submit button
	private["_tsx", "_tsy", "_tsw", "_tsh"];
	_tsw = 0.14;
	_tsh = _thh;
	_tsx = _thx;
	_tsy = _tby + _tbh + _ysep;
	
	_ticket_menu_submit_button ctrlSetText "Submit";
	_ticket_menu_submit_button ctrlSetPosition [_tsx, _tsy, _tsw, _tsh];
	_ticket_menu_submit_button ctrlCommit 0;
	
	
	//close button
	private["_tcx", "_tcy", "_tcw", "_tch"];
	_tcw = 0.14;
	_tch = _thh;
	_tcx = _thx + _thw - _tcw;
	_tcy = _thy + _h - _tch;
	
	_ticket_menu_close_button ctrlSetText "Close";
	_ticket_menu_close_button ctrlSetPosition [_tcx, _tcy, _tcw, _tch];
	buttonSetAction [(ctrlIDC _ticket_menu_close_button), "closeDialog 0"];
	_ticket_menu_close_button ctrlCommit 0;
	
	//amount label
	private["_talx", "_taly", "_talw", "_talh"];
	_talx = _thx + _sep; 
	_taly = _thy + _thh + _sep * 2;
	_talw = _thw / 2  - _sep * 2;
	_talh = 0.04;

	_ticket_menu_price_label ctrlSetText "Ticket amount: ";
	_ticket_menu_price_label ctrlSetPosition [_talx, _taly, _talw, _talh];
	_ticket_menu_price_label ctrlSetFontHeight _button_font_height - 0.003;
	_ticket_menu_price_label ctrlCommit 0;
	
	//amount field
	private["_tafx", "_tafy", "_tafw", "_tafh"];
	_tafx = _talx + _talw + _sep ;
	_tafy = _taly;
	_tafw = _talw;
	_tafh = _talh;
	
	_ticket_menu_price_field ctrlSetFontHeight _button_font_height - 0.003;;
	_ticket_menu_price_field ctrlSetFont _font_family;
	_ticket_menu_price_field ctrlSetPosition [_tafx, _tafy, _tafw, _tafh];
	_ticket_menu_price_field ctrlSetBackgroundColor [1,1,1,0.08];
	_ticket_menu_price_field ctrlCommit 0;
	
};



ticket_menu_create = {
	ARGV(0,_player);
	ARGV(1,_target);
	
	if (not([_player] call player_exists)) exitWith {};
	if (not([_target] call player_exists)) exitWith {};
	
	[] call ticket_menu_setup;
	buttonSetAction [ticket_menu_submit_button_idc, '[' + str(_player) + ',' + str(_target) + ', ([(ctrlText ticket_menu_price_field_idc)] call parse_number)] call interact_ticket; closeDialog 0;'];
};



ticket_menu_functions_defined = true;