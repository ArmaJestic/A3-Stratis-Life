// A_prison_menu_fnc_prison_menu_setup

#include "..\..\includes\constants.h"
#include "..\..\includes\macro.h"


//player groupChat format["A_prison_menu_fnc_prison_menu_setup %1", _this];
ARGV(0,_player);
ARGV(1,_menu_title);

disableSerialization;

if (!(createDialog "prison_menu")) exitWith {
	player groupChat format["ERROR: Could not prison menu dialog"];
};

private["_display"];
_display = (uiNamespace getVariable 'PRISON_MENU');

_prison_menu_header = _display displayCtrl prison_menu_header_idc;
_prison_menu_background = _display displayCtrl prison_menu_background_idc;
_prison_menu_pay_button = _display displayCtrl prison_menu_pay_button_idc;
_prison_menu_close_button = _display displayCtrl prison_menu_close_button_idc;
_prison_bail_amount_label = _display displayCtrl prison_menu_bail_label_idc;
_prison_bail_amount_field = _display displayCtrl prison_menu_bail_field_idc;


private["_x", "_y", "_ysep", "_sep", "_w", "_h", "_header_title"];
_x = 0.14;
_y = 0.14;
_w = 0.35;
_h = 0.18;
_ysep = 0.003;
_sep = 0.01;
_header_title = toUpper(_menu_title);

private["_button_font_height", "_font_family"];
_button_font_height = MENU_TITLE_FONT_HEIGHT;
_font_family = "PuristaMedium";


//header
private["_phx", "_phy", "_phw", "_phh"];
_phx = _x;
_phy = _y;
_phw = _w;
_phh = 0.045;

//player groupChat format["[_phx, _phy, _phw, _phh] = %1", [_phx, _phy, _phw, _phh]];
_prison_menu_header ctrlSetPosition [_phx, _phy, _phw, _phh];
_prison_menu_header ctrlSetFontHeight _button_font_height;
_prison_menu_header ctrlSetFont _font_family;
_prison_menu_header ctrlSetText _header_title;
_prison_menu_header ctrlCommit 0;

//background
private["_pbx", "_pby", "_pbw", "_pbh"];
_pbx = _phx;
_pby = _phy + _phh + _ysep;
_pbw = _w;
_pbh = _h - _phh - _phh - _ysep - _ysep;

_prison_menu_background ctrlSetPosition [_pbx, _pby, _pbw, _pbh];
_prison_menu_background ctrlSetBackgroundColor [0,0,0,0.65];
_prison_menu_background ctrlCommit 0;

//pay button
private["_ppx", "_ppy", "_ppw", "_pph"];
_ppw = 0.12;
_pph = _phh;
_ppx = _phx;
_ppy = _pby + _pbh + _ysep;

_prison_menu_pay_button ctrlSetText "Pay";
_prison_menu_pay_button ctrlSetPosition [_ppx, _ppy, _ppw, _pph];
_prison_menu_pay_button ctrlCommit 0;


//close button
private["_pcx", "_pcy", "_pcw", "_pch"];
_pcw = 0.14;
_pch = _phh;
_pcx = _phx + _phw - _pcw;
_pcy = _phy + _h - _pch;

_prison_menu_close_button ctrlSetText "Close";
_prison_menu_close_button ctrlSetPosition [_pcx, _pcy, _pcw, _pch];
buttonSetAction [(ctrlIDC _prison_menu_close_button), "closeDialog 0"];
_prison_menu_close_button ctrlCommit 0;

//bail amount label
private["_pblx", "_pbly", "_pblw", "_pblh"];
_pblx = _phx + _sep; 
_pbly = _phy + _phh + _sep * 2;
_pblw = _phw / 2  - _sep * 2;
_pblh = 0.04;

_prison_bail_amount_label ctrlSetText "Bail amount: ";
_prison_bail_amount_label ctrlSetPosition [_pblx, _pbly, _pblw, _pblh];
_prison_bail_amount_label ctrlSetFontHeight _button_font_height - 0.003;
_prison_bail_amount_label ctrlCommit 0;

//bail amount field
private["_pbfx", "_pbfy", "_pbfw", "_pbfh"];
_pbfx = _pblx + _pblw + _sep ;
_pbfy = _pbly;
_pbfw = _pblw;
_pbfh = _pblh;

_prison_bail_amount_field ctrlSetFontHeight _button_font_height - 0.003;;
_prison_bail_amount_field ctrlSetFont _font_family;
_prison_bail_amount_field ctrlSetPosition [_pbfx, _pbfy, _pbfw, _pbfh];
_prison_bail_amount_field ctrlSetBackgroundColor [1,1,1,0.08];
_prison_bail_amount_field ctrlCommit 0;
