// A_economy_menu_fnc_tax_menu_setup

#include "header.h"


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

_economy_tax_menu_info_slider ctrlAddEventHandler ["SliderPosChanged", "(_this) call A_economy_menu_fnc_tax_menu_slider_changed"];
_economy_tax_menu_info_slider sliderSetRange _range;
_economy_tax_menu_info_slider sliderSetPosition _default; 
[_economy_tax_menu_info_slider] call A_economy_menu_fnc_tax_menu_slider_changed;
	
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
