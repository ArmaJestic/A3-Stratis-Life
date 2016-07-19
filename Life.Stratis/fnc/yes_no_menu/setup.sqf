// A_yes_no_menu_fnc_setup

#include "..\..\includes\constants.h"
#include "..\..\includes\macro.h"


ARGV(0,_title);
ARGV(1,_yes_button_text);
ARGV(2,_no_button_text);
ARGV(3,_message_text);
ARGV(4,_x);
ARGV(5,_y);
ARGV(6,_w);
ARGV(7,_h);

disableSerialization;

if (!(createDialog "yes_no_menu")) exitWith {
	player groupChat format["ERROR: Could not create yes/no menu dialog"];
};

private["_display"];
_display = (uiNamespace getVariable 'YES_NO_MENU');


_yes_no_menu_header = _display displayCtrl yes_no_menu_header_idc;
_yes_no_menu_background = _display displayCtrl yes_no_menu_background_idc;
_yes_no_menu_yes_button = _display displayCtrl yes_no_menu_yes_button_idc;
_yes_no_menu_no_button = _display displayCtrl yes_no_menu_no_button_idc;
_yes_no_menu_label = _display displayCtrl yes_no_menu_label_idc;

private["_ysep", "_sep", "_header_title"];
_ysep = 0.003;
_sep = 0.01;
_header_title = _title;

private["_button_font_height", "_font_family"];
_button_font_height = MENU_TITLE_FONT_HEIGHT;
_font_family = "PuristaMedium";

//header
private["_yhx", "_yhy", "_yhw", "_yhh"];
_yhx = _x;
_yhy = _y;
_yhw = _w;
_yhh = 0.045;

_yes_no_menu_header ctrlSetPosition [_yhx, _yhy, _yhw, _yhh];
_yes_no_menu_header ctrlSetFontHeight _button_font_height;
_yes_no_menu_header ctrlSetFont _font_family;
_yes_no_menu_header ctrlSetText _header_title;
_yes_no_menu_header ctrlCommit 0;


//background
private["_ybx", "_yby", "_ybw", "_ybh"];
_ybx = _yhx;
_yby = _yhy + _yhh + _ysep;
_ybw = _w;
_ybh = _h - _yhh - _yhh - _ysep - _ysep;

_yes_no_menu_background ctrlSetPosition [_ybx, _yby, _ybw, _ybh];
_yes_no_menu_background ctrlSetBackgroundColor [0,0,0,0.65];
_yes_no_menu_background ctrlCommit 0;

//yes button
private["_yyx", "_yyy", "_ysw", "_yyh"];
_ysw = 0.14;
_yyh = _yhh;
_yyx = _yhx;
_yyy = _yby + _ybh + _ysep;

_yes_no_menu_yes_button ctrlSetText _yes_button_text;
_yes_no_menu_yes_button ctrlSetPosition [_yyx, _yyy, _ysw, _yyh];
_yes_no_menu_yes_button ctrlCommit 0;


//no button
private["_ynx", "_yny", "_ynw", "_ynh"];
_ynw = 0.14;
_ynh = _yhh;
_ynx = _yhx + _yhw - _ynw;
_yny = _yhy + _h - _ynh;

_yes_no_menu_no_button ctrlSetText _no_button_text;
_yes_no_menu_no_button ctrlSetPosition [_ynx, _yny, _ynw, _ynh];
buttonSetAction [(ctrlIDC _yes_no_menu_no_button), "closeDialog 0"];
_yes_no_menu_no_button ctrlCommit 0;

//label
private["_ylx", "_yly", "_ylw", "_ylh"];
_ylx = _ybx + _sep ; 
_yly = _yby + _sep ;
_ylw = _yhw - _sep * 2;
_ylh = _ybh - _sep * 2;


_yes_no_menu_label ctrlSetPosition [_ylx, _yly, _ylw, _ylh];
_yes_no_menu_label ctrlSetFontHeight _button_font_height - 0.003;
_yes_no_menu_label ctrlSetBackgroundColor [0, 0, 0, 0.45];
_yes_no_menu_label ctrlCommit 0;
_yes_no_menu_label ctrlSetText _message_text;
_yes_no_menu_label ctrlCommit 0;
