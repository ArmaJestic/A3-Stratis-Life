#include "constants.h"
#include "macro.h"

if (not(undefined(mobile_menu_functions_defined))) exitWith {};

mobile_default_text = "Text message (140 charactes maximum)";
mobile_max_text = 140;

mobile_menu_combo_focus = {
	ARGV(0,_control);
	_control ctrlSetBackgroundColor [0.1,0.1,0.1,1];
};

mobile_menu_combo_blur = {
	ARGV(0,_control);
	_control ctrlSetBackgroundColor [1,1,1,0.08];
};

mobile_menu_text_blur = {
	player grouPChat format["mobile_menu_text_blur %1", _this];
	ARGV(0,_control);
	private["_text", "_len"];
	_text = ctrlText _control;
	_len = [_text] call strlen;
	if (_len == 0) then {
		_control ctrlSetText mobile_default_text;
		_control ctrlCommit 0;
	};
	
	if (_len > mobile_max_text) then {
		_text = [_text, 0, mobile_max_text -1] call substr;
		_control ctrlSetText _text;
	};
};

mobile_menu_text_focus = {
	player groupChat format["mobile_menu_text_focus %1", _this];
	ARGV(0,_control);
	private["_text", "_len"];
	_text = ctrlText _control;
	
	if (_text == mobile_default_text) then {
		_control ctrlSetText "";
		_control ctrlCommit 0;
	};
	
	if (_len > mobile_max_text) then {
		_text = [_text, 0, mobile_max_text - 1] call substr;
		_control ctrlSetText _text;
	};
};

mobile_menu_text_keydown = {
	ARGV(0,_control);
	ARGV(1,_key);
	
	private["_text", "_len"];
	_text = ctrlText _control;
	_len = [_text] call strlen;
	private["_menu"];
	_menu = (uiNamespace getVariable 'MOBILE_MENU');
	if (_len > mobile_max_text && (_key != DIK_BACKSPACE)) exitWith {
		ctrlSetFocus (_menu displayCtrl mobile_menu_overflow_field_idc);
	};
	
	private["_count_field"];
	_count_field = (_menu displayCtrl mobile_characters_field_idc);
	_count_field ctrlSetText str(_len);
};


mobile_menu_setup = {
	disableSerialization;
	
	if (!(createDialog "mobile_menu")) exitWith {
		player groupChat format["ERROR: Could not create mobile menu dialog"];
	};
	
	private["_display"];
	_display = (uiNamespace getVariable 'MOBILE_MENU');
	
	_mobile_menu_dialog = _display displayCtrl mobile_menu_dialog_idd;
	_mobile_header = _display displayCtrl mobile_header_idc;
	_mobile_background = _display displayCtrl mobile_background_idc;
	_mobile_text_button = _display displayCtrl mobile_text_button_idc;
	_mobile_close_button = _display displayCtrl mobile_close_button_idc;
	_mobile_players_label = _display displayCtrl mobile_players_label_idc;
	_mobile_players_field = _display displayCtrl mobile_players_field_idc;
	_mobile_text_price_label = _display displayCtrl mobile_text_price_label_idc;
	_mobile_text_price_field = _display displayCtrl mobile_text_price_field_idc;
	_mobile_menu_text_field = _display displayCtrl mobile_menu_text_field_idc;
	_mobile_characters_label = _display displayCtrl mobile_characters_label_idc;
	_mobile_characters_field = _display displayCtrl mobile_characters_field_idc;
	_mobile_menu_overflow_field = _display displayCtrl mobile_menu_overflow_field_idc;

	_mobile_players_field ctrlAddEventHandler ["SetFocus", "(_this) call mobile_menu_combo_focus"];
	_mobile_players_field ctrlAddEventHandler ["KillFocus", "(_this) call mobile_menu_combo_blur"];
	
	player groupChat format["_display = %1", _display];
	player groupChat format["_mobile_menu_text_field = %1", _mobile_menu_text_field];
	
	
	private["_x", "_y", "_ysep", "_sep", "_w", "_h", "_header_title"];
	_x = 0.14;
	_y = 0.14;
	_w = 0.55;
	_h = 0.44;
	_ysep = 0.003;
	_sep = 0.01;
	_header_title = "MOBILE";
	
	private["_button_font_height", "_font_family"];
	_button_font_height = MENU_TITLE_FONT_HEIGHT;
	_font_family = "PuristaMedium";
	
	
	//header
	private["_mhx", "_mhy", "_mhw", "_mhh"];
	_mhx = _x;
	_mhy = _y;
	_mhw = _w;
	_mhh = 0.045;
	
	_mobile_header ctrlSetPosition [_mhx, _mhy, _mhw, _mhh];
	_mobile_header ctrlSetFontHeight _button_font_height;
	_mobile_header ctrlSetFont _font_family;
	_mobile_header ctrlSetText _header_title;
	_mobile_header ctrlCommit 0;
	
	//background
	private["_mbx", "_mby", "_mbw", "_mbh"];
	_mbx = _mhx;
	_mby = _mhy + _mhh + _ysep;
	_mbw = _w;
	_mbh = _h - _mhh - _mhh - _ysep - _ysep;
	
	_mobile_background ctrlSetPosition [_mbx, _mby, _mbw, _mbh];
	_mobile_background ctrlSetBackgroundColor [0,0,0,0.65];
	_mobile_background ctrlCommit 0;
	
	//text button
	private["_mtx", "_mty", "_mtw", "_mth"];
	_mtw = 0.12;
	_mth = _mhh;
	_mtx = _mhx;
	_mty = _mby + _mbh + _ysep;
	
	_mobile_text_button ctrlSetText "Send";
	_mobile_text_button ctrlSetPosition [_mtx, _mty, _mtw, _mth];
	_mobile_text_button ctrlCommit 0;
	
	buttonSetAction [mobile_text_button_idc, (
		'[player, ' +
		'(missionNamespace getVariable (lbData [mobile_players_field_idc, lbCurSel mobile_players_field_idc])),' +
		'(ctrlText mobile_menu_text_field_idc)] call interact_mobile_send;' +
		'closedialog 0;')];

	//close button
	private["_mcx", "_mcy", "_mcw", "_mch"];
	_mcw = 0.14;
	_mch = _mhh;
	_mcx = _mhx + _mhw - _mcw;
	_mcy = _mhy + _h - _mch;
	
	_mobile_close_button ctrlSetText "Close";
	_mobile_close_button ctrlSetPosition [_mcx, _mcy, _mcw, _mch];
	buttonSetAction [(ctrlIDC _mobile_close_button), "closeDialog 0"];
	_mobile_close_button ctrlCommit 0;
	
	
	private["_mtx", "_mty", "_mtw", "_mth"];
	_mtx = _mbx + _sep;
	_mty = _mby + _sep;
	_mtw = _mbw - _sep * 2;
	_mth = _mhh * 3;
	
	
	_mobile_menu_text_field ctrlSetPosition [_mtx, _mty, _mtw, _mth];
	_mobile_menu_text_field ctrlCommit 0;
	_mobile_menu_text_field ctrlSetText mobile_default_text;
	_mobile_menu_text_field ctrlCommit 0;

	
	_mobile_menu_text_field ctrlAddEventHandler ["SetFocus", "(_this) call mobile_menu_text_focus"];
	_mobile_menu_text_field ctrlAddEventHandler ["KillFocus", "(_this) call mobile_menu_text_blur"];
	_mobile_menu_text_field ctrlAddEventHandler ["KeyDown", "(_this) call mobile_menu_text_keydown"];
	
	//characters label
	private["_mclx", "_mcly", "_mclw", "_mclh"];
	_mclx = _mtx; 
	_mcly = _mty + _mth + _sep * 2;
	_mclw = _mtw / 2 - _sep;
	_mclh = 0.04;

	_mobile_characters_label ctrlSetText "Text length: ";
	_mobile_characters_label ctrlSetPosition [_mclx, _mcly, _mclw, _mclh];
	_mobile_characters_label ctrlSetFontHeight _button_font_height - 0.003;
	_mobile_characters_label ctrlCommit 0;
	
	//characters field
	private["_mcfx", "_mcfy", "_mcfw", "_mcfh"];
	_mcfx = _mclx + _mclw + _sep * 2 ;
	_mcfy = _mcly;
	_mcfw = _mclw;
	_mcfh = _mclh;
	
	_mobile_characters_field ctrlSetFontHeight _button_font_height - 0.003;;
	_mobile_characters_field ctrlSetFont _font_family;
	_mobile_characters_field ctrlSetText "0";
	_mobile_characters_field ctrlSetPosition [_mcfx, _mcfy, _mcfw, _mcfh];
	_mobile_characters_field ctrlSetBackgroundColor [1,1,1,0.08];
	_mobile_characters_field ctrlCommit 0;
	
	//price label
	private["_mplx", "_mply", "_mplw", "_mplh"];
	_mplx = _mclx; 
	_mply = _mcly + _mclh + _sep;
	_mplw = _mclw;
	_mplh = _mclh;

	_mobile_text_price_label ctrlSetText "Text price: ";
	_mobile_text_price_label ctrlSetPosition [_mplx, _mply, _mplw, _mplh];
	_mobile_text_price_label ctrlSetFontHeight _button_font_height - 0.003;
	_mobile_text_price_label ctrlCommit 0;
	
	//price field
	private["_mpfx", "_mpfy", "_mpfw", "_mpfh"];
	_mpfx = _mplx + _mplw + _sep * 2 ;
	_mpfy = _mply;
	_mpfw = _mplw;
	_mpfh = _mplh;
	
	_mobile_text_price_field ctrlSetFontHeight _button_font_height - 0.003;;
	_mobile_text_price_field ctrlSetFont _font_family;
	_mobile_text_price_field ctrlSetText format["$%1", INV_smscost];
	_mobile_text_price_field ctrlSetPosition [_mpfx, _mpfy, _mpfw, _mpfh];
	_mobile_text_price_field ctrlSetBackgroundColor [1,1,1,0.08];
	_mobile_text_price_field ctrlCommit 0;
	
	
	//destination label
	private["_mdlx", "_mdly", "_mdlw", "_mdlh"];
	_mdlx = _mplx; 
	_mdly = _mply + _mplh + _sep;
	_mdlw = _mplw;
	_mdlh = _mplh;

	_mobile_players_label ctrlSetText "Text destination: ";
	_mobile_players_label ctrlSetPosition [_mdlx, _mdly, _mdlw, _mdlh];
	_mobile_players_label ctrlSetFontHeight _button_font_height - 0.003;
	_mobile_players_label ctrlCommit 0;
	
	//destination field
	private["_mdfx", "_mdfy", "_mdfw", "_mdfh"];
	_mdfx = _mdlx + _mdlw + _sep * 2 ;
	_mdfy = _mdly;
	_mdfw = _mdlw;
	_mdfh = _mdlh;
	
	_mobile_players_field ctrlSetFontHeight _button_font_height - 0.003;;
	_mobile_players_field ctrlSetFont _font_family;
	_mobile_players_field ctrlSetText format["$%1", 55];
	_mobile_players_field ctrlSetPosition [_mdfx, _mdfy, _mdfw, _mdfh];
	_mobile_players_field ctrlSetBackgroundColor [1,1,1,0.08];
	_mobile_players_field ctrlCommit 0;
	
};

mobile_menu_functions_defined = true;