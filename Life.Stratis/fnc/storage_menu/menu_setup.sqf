// A_storage_menu_fnc_menu_setup

#include "..\..\includes\constants.h"
#include "..\..\includes\macro.h"


disableSerialization;
player groupChat format["A_storage_menu_fnc_menu_setup"];
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
