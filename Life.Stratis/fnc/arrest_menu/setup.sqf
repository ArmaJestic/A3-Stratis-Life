// A_arrest_menu_fnc_setup

#include "..\..\includes\macro.h"
#include "..\..\includes\constants.h"


disableSerialization;
ARGV(0,_title);
ARGV(1,_time_range);
ARGV(2,_time_default);
ARGV(3,_bail_range);
ARGV(4,_bail_default);

if (!(createDialog "arrest_menu")) exitWith {
	player groupChat format["ERROR: Could not create arrest_menu menu dialog"];
};

private["_display"];
_display = (uiNamespace getVariable 'ARREST_MENU');

_arrest_menu_dialog = _display displayCtrl arrest_menu_dialog_idd;
_arrest_menu_header = _display displayCtrl arrest_menu_header_idc;
_arrest_menu_background = _display displayCtrl arrest_menu_background_idc;
_arrest_menu_submit_button = _display displayCtrl arrest_menu_submit_button_idc;
_arrest_menu_close_button = _display displayCtrl arrest_menu_close_button_idc;

_arrest_menu_time_slider = _display displayCtrl arrest_menu_time_slider_idc;
_arrest_menu_time_label = _display displayCtrl arrest_menu_time_label_idc;
_arrest_menu_time_field = _display displayCtrl arrest_menu_time_field_idc;

_arrest_menu_bail_slider = _display displayCtrl arrest_menu_bail_slider_idc;
_arrest_menu_bail_label = _display displayCtrl arrest_menu_bail_label_idc;
_arrest_menu_bail_field = _display displayCtrl arrest_menu_bail_field_idc;

_arrest_menu_time_slider ctrlAddEventHandler ["SliderPosChanged", "(_this) call A_arrest_menu_fnc_time_slider_changed"];
_arrest_menu_time_slider sliderSetRange _time_range;
_arrest_menu_time_slider sliderSetPosition _time_default; 
[_arrest_menu_time_slider] call A_arrest_menu_fnc_time_slider_changed;

_arrest_menu_bail_slider ctrlAddEventHandler ["SliderPosChanged", "(_this) call A_arrest_menu_fnc_bail_slider_changed"];
_arrest_menu_bail_slider sliderSetRange _bail_range;
_arrest_menu_bail_slider sliderSetPosition _bail_default; 
[_arrest_menu_bail_slider] call A_arrest_menu_fnc_bail_slider_changed;

	
private["_x", "_y", "_ysep", "_sep", "_w", "_h", "_header_title"];
_x = 0.14;
_y = 0.14;
_w = 0.35;
_h = 0.42;
_ysep = 0.003;
_sep = 0.01;
_header_title = _title;

private["_button_font_height", "_font_family"];
_button_font_height = MENU_TITLE_FONT_HEIGHT;
_font_family = "PuristaMedium";


//header
private["_ahx", "_ahy", "_ahw", "_ahh"];
_ahx = _x;
_ahy = _y;
_ahw = _w;
_ahh = 0.045;

_arrest_menu_header ctrlSetPosition [_ahx, _ahy, _ahw, _ahh];
_arrest_menu_header ctrlSetFontHeight _button_font_height;
_arrest_menu_header ctrlSetFont _font_family;
_arrest_menu_header ctrlSetText _header_title;
_arrest_menu_header ctrlCommit 0;

//background
private["_abx", "_aby", "_abw", "_abh"];
_abx = _ahx;
_aby = _ahy + _ahh + _ysep;
_abw = _w;
_abh = _h - _ahh - _ahh - _ysep - _ysep;

_arrest_menu_background ctrlSetPosition [_abx, _aby, _abw, _abh];
_arrest_menu_background ctrlSetBackgroundColor [0,0,0,0.65];
_arrest_menu_background ctrlCommit 0;

//arrest button
private["_asx", "_asy", "_asw", "_ash"];
_asw = 0.12;
_ash = _ahh;
_asx = _ahx;
_asy = _aby + _abh + _ysep;

_arrest_menu_submit_button ctrlSetText "Arrest";
_arrest_menu_submit_button ctrlSetPosition [_asx, _asy, _asw, _ash];
_arrest_menu_submit_button ctrlCommit 0;

//close button
private["_acx", "_acy", "_acw", "_ach"];
_acw = 0.14;
_ach = _ahh;
_acx = _ahx + _ahw - _acw;
_acy = _ahy + _h - _ach;

_arrest_menu_close_button ctrlSetText "Close";
_arrest_menu_close_button ctrlSetPosition [_acx, _acy, _acw, _ach];
buttonSetAction [(ctrlIDC _arrest_menu_close_button), "closeDialog 0"];
_arrest_menu_close_button ctrlCommit 0;


//time slider
private["_atsx", "_atsy", "_atsw", "_atsh"];
_atsx = _abx + _sep * 2;
_atsy = _aby + _sep * 4;
_atsw = _abw - _sep * 4;
_atsh = _ahh;

_arrest_menu_time_slider ctrlSetPosition [_atsx, _atsy, _atsw, _atsh];
_arrest_menu_time_slider ctrlCommit 0;

//time label
private["_atlx", "_atly", "_atlw", "_atlh"];
_atlx = _abx + _sep; 
_atly = _atsy + _atsh + _sep * 2;
_atlw = _abw / 2  - _sep * 2;
_atlh = 0.04;

_arrest_menu_time_label ctrlSetText "Time in prison: ";
_arrest_menu_time_label ctrlSetPosition [_atlx, _atly, _atlw, _atlh];
_arrest_menu_time_label ctrlSetFontHeight _button_font_height - 0.003;
_arrest_menu_time_label ctrlCommit 0;

//time field
private["_atfx", "_atfy", "_atfw", "_atfh"];
_atfx = _atlx + _atlw + _sep ;
_atfy = _atly;
_atfw = _atlw;
_atfh = _atlh;

_arrest_menu_time_field ctrlSetFontHeight _button_font_height - 0.003;;
_arrest_menu_time_field ctrlSetFont _font_family;
_arrest_menu_time_field ctrlSetPosition [_atfx, _atfy, _atfw, _atfh];
_arrest_menu_time_field ctrlSetBackgroundColor [1,1,1,0.08];
_arrest_menu_time_field ctrlCommit 0;


//bail slider
private["_absx", "_absy", "_absw", "_absh"];
_absx = _atsx;
_absy = _atly + _atlh + _sep * 4;
_absw = _atsw;
_absh = _atsh;

_arrest_menu_bail_slider ctrlSetPosition [_absx, _absy, _absw, _absh];
_arrest_menu_bail_slider ctrlCommit 0;


//bail label
private["_ablx", "_ably", "_atlw", "_ablh"];
_ablx = _atlx; 
_ably = _absy + _absh + _sep * 2;
_ablw = _atlw;
_ablh = _atlh;

_arrest_menu_bail_label ctrlSetText "Bail amount: ";
_arrest_menu_bail_label ctrlSetPosition [_ablx, _ably, _ablw, _ablh];
_arrest_menu_bail_label ctrlSetFontHeight _button_font_height - 0.003;
_arrest_menu_bail_label ctrlCommit 0;

//bail field
private["_abfx", "_abfy", "_abfw", "_abfh"];
_abfx = _ablx + _ablw + _sep ;
_abfy = _ably;
_abfw = _ablw;
_abfh = _ablh;

_arrest_menu_bail_field ctrlSetFontHeight _button_font_height - 0.003;;
_arrest_menu_bail_field ctrlSetFont _font_family;
_arrest_menu_bail_field ctrlSetPosition [_abfx, _abfy, _abfw, _abfh];
_arrest_menu_bail_field ctrlSetBackgroundColor [1,1,1,0.08];
_arrest_menu_bail_field ctrlCommit 0;
