// A_factory_fnc_menu_setup

#include "header.h"


disableSerialization;
player groupChat format["A_factory_fnc_menu_setup"];
ARGV(0,_factory_name);

private["_display"];
_display = uiNamespace getVariable "FACTORY_MENU";

_factory_dialog = _display displayCtrl factory_dialog_idd;
_factory_left_background = _display displayCtrl factory_left_background_idc;
_factory_left_header = _display displayCtrl factory_left_header_idc;
_factory_enqueue_list = _display displayCtrl factory_enqueue_list_idc;
_factory_item_produced_label = _display displayCtrl factory_item_produced_label_idc;
_factory_item_produced_field = _display displayCtrl factory_item_produced_field_idc;
_factory_item_cost_label = _display displayCtrl factory_item_cost_label_idc;
_factory_item_cost_field = _display displayCtrl factory_item_cost_field_idc;
_factory_amount_label = _display displayCtrl factory_amount_label_idc;
_factory_amount_field_background = _display displayCtrl factory_amount_field_background_idc;
_factory_amount_field = _display displayCtrl factory_amount_field_idc;
_factory_enqueue_button = _display displayCtrl factory_enqueue_button_idc;
_factory_create_button = _display displayCtrl factory_create_button_idc;
_factory_right_background = _display displayCtrl factory_right_background_idc;
_factory_right_header = _display displayCtrl factory_right_header_idc;
_factory_dequeue_list = _display displayCtrl factory_dequeue_list_idc;
_factory_in_production_label = _display displayCtrl factory_in_production_label_idc;
_factory_production_field = _display displayCtrl factory_production_field_idc;
_factory_in_production_eta_label = _display displayCtrl factory_in_production_eta_label_idc;
_factory_production_eta_field = _display displayCtrl factory_production_eta_field_idc;
_factory_dequeue_button = _display displayCtrl factory_dequeue_button_idc;
_factory_close_button = _display displayCtrl factory_close_button_idc;
_factory_status_frame1 = _display displayCtrl factory_status_frame1_idc;
_factory_status_background1 = _display displayCtrl factory_status_background1_idc;
_factory_status_field1 = _display displayCtrl factory_status_field1_idc;
_factory_status_frame2 = _display displayCtrl factory_status_frame2_idc;
_factory_status_background2 = _display displayCtrl factory_status_background2_idc;
_factory_status_field2 = _display displayCtrl factory_status_field2_idc;

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

_factory_left_header ctrlSetText toUpper(format["%1 Items", _factory_name]);
_factory_right_header ctrlSetText toUpper(format["%1 Queue", _factory_name]);

//items header
private["_ihx", "_ihy", "_ihw", "_ihh"];
_ihx = _x;
_ihy = _y;
_ihw = _w;
_ihh = 0.045;

_factory_left_header ctrlSetPosition [_ihx, _ihy, _ihw, _ihh];
_factory_left_header ctrlSetFontHeight _button_font_height;
_factory_left_header ctrlSetFont _font_family;
_factory_left_header ctrlCommit 0;

//items background
private["_ibx", "_iby", "_ibw", "_ibh"];
_ibx = _ihx;
_iby = _ihy + _ihh + _ysep;
_ibw = _w;
_ibh = _h - _ihh - _ihh - _ysep - _ysep;

_factory_left_background ctrlSetPosition [_ibx, _iby, _ibw, _ibh];
_factory_left_background ctrlSetBackgroundColor [0,0,0,0.65];
_factory_left_background ctrlCommit 0;

//items produce button
private["_ipx", "_ipy", "_ipw", "_iph"];
_ipw = 0.18;
_iph = _ihh;
_ipx = _ihx;
_ipy = _iby + _ibh + _ysep;

_factory_enqueue_button ctrlSetText "Produce item";
_factory_enqueue_button ctrlSetPosition [_ipx, _ipy, _ipw, _iph];
buttonSetAction [(ctrlIDC _factory_enqueue_button), "closeDialog 0"];
_factory_enqueue_button ctrlCommit 0;

//items create button
private["_icx", "_icy" ,"_icw", "_ich"];
_icx = _ipx + _ipw + _sep;
_icy = _ipy;
_icw = _ipw;
_ich = _iph;

_factory_create_button ctrlSetText "Create item";
_factory_create_button ctrlSetPosition [_icx, _icy, _icw, _ich];
_factory_create_button ctrlCommit 0;

//items list
private["_ilx", "_ily", "_ilw", "_ilh"];
_ilx = _ibx + _sep;
_ily = _iby + _sep;
_ilw = _ibw - _sep * 2;
_ilh = _ibh * 0.55;

_factory_enqueue_list ctrlSetPosition [_ilx, _ily, _ilw, _ilh];
_factory_enqueue_list ctrlSetFontHeight _button_font_height * 0.9;
_factory_enqueue_list ctrlCommit 0;

//items produced label
private["_iplx", "_iply", "_iplw", "_iplh"];
_iplx = _ilx; 
_iply = _ily + _ilh + _sep * 4;
_iplw = _ilw / 2  - _sep;
_iplh = 0.04;

_factory_item_produced_label ctrlSetText "Produced:";
_factory_item_produced_label ctrlSetPosition [_iplx, _iply, _iplw, _iplh];
_factory_item_produced_label ctrlSetFontHeight _button_font_height - 0.003;
_factory_item_produced_label ctrlCommit 0;

//items produced field
private["_ipfx", "_ipfy", "_ipfw", "_ipfh"];
_ipfx = _iplx + _iplw + _sep ;
_ipfy = _iply;
_ipfw = _iplw;
_ipfh = _iplh;

_factory_item_produced_field ctrlSetFontHeight _button_font_height - 0.003;;
_factory_item_produced_field ctrlSetFont _font_family;
_factory_item_produced_field ctrlSetPosition [_ipfx, _ipfy, _ipfw, _ipfh];
_factory_item_produced_field ctrlSetBackgroundColor [1,1,1,0.08];
_factory_item_produced_field ctrlCommit 0;

//item production cost label
private["_iclx", "_icly", "_iclw", "_iclh"];
_iclx = _iplx; 
_icly = _iply + _iplh + _ysep * 2;
_iclw = _iplw;
_iclh = _iplh;

_factory_in_production_eta_label ctrlSetText "Production cost:";
_factory_in_production_eta_label ctrlSetPosition [_iclx, _icly, _iclw, _iclh];
_factory_in_production_eta_label ctrlSetFontHeight _button_font_height - 0.003;
_factory_in_production_eta_label ctrlCommit 0;

//item prodcution cost field
private["_icfx", "_icfy", "_icfw", "_icfh"];
_icfx = _iclx + _iclw + _sep ;
_icfy = _icly;
_icfw = _iclw;
_icfh = _iclh;

_factory_item_cost_field ctrlSetFontHeight _button_font_height - 0.003;;
_factory_item_cost_field ctrlSetFont _font_family;
_factory_item_cost_field ctrlSetPosition [_icfx, _icfy, _icfw, _icfh];
_factory_item_cost_field ctrlSetBackgroundColor [1,1,1,0.08];
_factory_item_cost_field ctrlCommit 0;

//items amount label
private["_ialx", "_ialy", "_ialw", "_ialh"];
_ialx = _iclx; 
_ialy = _icly + _iclh + _ysep * 2;
_ialw = _iclw;
_ialh = _iclh;

_factory_amount_label ctrlSetText "Amount:";
_factory_amount_label ctrlSetPosition [_ialx, _ialy, _ialw, _ialh];
_factory_amount_label ctrlSetFontHeight _button_font_height - 0.003;
_factory_amount_label ctrlCommit 0;

//items amount field
private["_iafx", "_iafy", "_iafw", "_iafh"];
_iafx = _ialx + _ialw + _sep ;
_iafy = _ialy;
_iafw = _ialw;
_iafh = _ialh;

_factory_amount_field ctrlSetFontHeight _button_font_height - 0.003;;
_factory_amount_field ctrlSetFont _font_family;
_factory_amount_field ctrlSetPosition [_iafx, _iafy, _iafw, _iafh];
_factory_amount_field ctrlSetBackgroundColor [1,1,1,0.08];
_factory_amount_field ctrlCommit 0;

//queue header
private["_qhx", "_qhy", "_qhw", "_qhh"];
_qhx = _ihx + _ihw + _sep * 2;
_qhy = _ihy;
_qhw = _ihw;
_qhh = _ihh;

_factory_right_header ctrlSetPosition [_qhx, _qhy, _qhw, _qhh];
_factory_right_header ctrlSetFontHeight _button_font_height;
_factory_right_header ctrlSetFont _font_family;
_factory_right_header ctrlCommit 0;

//queue close button
private["_qox", "_qoy", "_qow", "_qoh"];
_qow = 0.14;
_qoh = _qhh;
_qox = _qhx + _qhw - _qow;
_qoy = _qhy + _h - _qoh;

_factory_close_button ctrlSetText "Close";
_factory_close_button ctrlSetPosition [_qox, _qoy, _qow, _qoh];
buttonSetAction [(ctrlIDC _factory_close_button), "closeDialog 0"];
_factory_close_button ctrlCommit 0;

//queue background
private["_qbx", "_qby", "_qbw", "_qbh"];
_qbx = _qhx;
_qby = _qhy + _qhh + _ysep;
_qbw = _w;
_qbh = (_qoy ) - (_qhy ) - _qoh - _ysep - _ysep;

_factory_right_background ctrlSetPosition [_qbx, _qby, _qbw, _qbh];
_factory_right_background ctrlSetBackgroundColor [0,0,0,0.65];
_factory_right_background ctrlCommit 0;

//queue cancel button
private["_qcx", "_qcy" ,"_qcw", "_qch"];
_qcx = _qhx;
_qcy = _qby + _qbh + _ysep;
_qcw = _qow * 1.2;
_qch = _qoh;

_factory_dequeue_button ctrlSetText "Cancel item";
_factory_dequeue_button ctrlSetPosition [_qcx, _qcy, _qcw, _qch];
_factory_dequeue_button ctrlCommit 0;

//queue list
private["_qlx", "_qly", "_qlw", "_qlh"];
_qlx = _qbx + _sep;
_qly = _qby + _sep;
_qlw = _qbw - _sep * 2;
_qlh = _qbh * 0.55;

_factory_dequeue_list ctrlSetPosition [_qlx, _qly, _qlw, _qlh];
_factory_dequeue_list ctrlSetFontHeight _button_font_height * 0.9;
_factory_dequeue_list ctrlCommit 0;

//queue production label
private["_qplx", "_qply", "_qplw", "_qplh"];
_qplx = _qlx; 
_qply = _qly + _qlh + _sep * 4;
_qplw = _qlw / 2  - _sep;
_qplh = 0.04;

_factory_in_production_label ctrlSetText "Production:";
_factory_in_production_label ctrlSetPosition [_qplx, _qply, _qplw, _qplh];
_factory_in_production_label ctrlSetFontHeight _button_font_height - 0.003;
_factory_in_production_label ctrlCommit 0;

//queue production field
private["_qpfx", "_qpfy", "_qpfw", "_qpfh"];
_qpfx = _qplx + _qplw + _sep ;
_qpfy = _qply;
_qpfw = _qplw;
_qpfh = _qplh;

_factory_production_field ctrlSetFontHeight _button_font_height - 0.003;;
_factory_production_field ctrlSetFont _font_family;
_factory_production_field ctrlSetPosition [_qpfx, _qpfy, _qpfw, _qpfh];
_factory_production_field ctrlSetBackgroundColor [1,1,1,0.08];
_factory_production_field ctrlCommit 0;

//queue production time label
private["_qtlx", "_qtly", "_qtlw", "_qtlh"];
_qtlx = _qplx; 
_qtly = _qply + _qplh + _ysep * 2;
_qtlw = _qplw;
_qtlh = _qplh;

_factory_item_cost_label ctrlSetText "Production time:";
_factory_item_cost_label ctrlSetPosition [_qtlx, _qtly, _qtlw, _qtlh];
_factory_item_cost_label ctrlSetFontHeight _button_font_height - 0.003;
_factory_item_cost_label ctrlCommit 0;

//queue prodcution time field
private["_qtfx", "_qtfy", "_qtfw", "_qtfh"];
_qtfx = _qtlx + _qtlw + _sep ;
_qtfy = _qtly;
_qtfw = _qtlw;
_qtfh = _qtlh;

_factory_production_eta_field ctrlSetFontHeight _button_font_height - 0.003;;
_factory_production_eta_field ctrlSetFont _font_family;
_factory_production_eta_field ctrlSetPosition [_qtfx, _qtfy, _qtfw, _qtfh];
_factory_production_eta_field ctrlSetBackgroundColor [1,1,1,0.08];
_factory_production_eta_field ctrlCommit 0;

//error label1
private["_e1x", "_e1y", "_e1w", "_e1h"];
_e1x = _ipx; 
_e1y = _ipy + _iph + _sep * 2;
_e1w = (_qhx + _qhw) - (_ihx);
_e1h = _iph;

_factory_status_field1 ctrlSetText "Status field1";
_factory_status_field1 ctrlSetPosition [_e1x, _e1y - 0.003, _e1w, _e1h];
_factory_status_field1 ctrlSetFontHeight _button_font_height - 0.003;
_factory_status_field1 ctrlSetBackgroundColor [0,0,0,0];
_factory_status_field1 ctrlCommit 0;

_factory_status_frame1 ctrlSetPosition [_e1x, _e1y, _e1w, _e1h];
_factory_status_frame1 ctrlCommit 0;

_factory_status_background1 ctrlSetPosition [_e1x, _e1y, _e1w, _e1h];
_factory_status_background1 ctrlSetBackgroundColor [0,0,0,0.65];
_factory_status_background1 ctrlCommit 0;

//error label2
private["_e2x", "_e2y", "_e2w", "_e2h"];
_e2x = _e1x; 
_e2y = _e1y + _e1h + _sep * 2;
_e2w = _e1w;
_e2h = _e1h;

_factory_status_field2 ctrlSetText "Status field2";
_factory_status_field2 ctrlSetPosition [_e2x, _e2y - 0.003, _e2w, _e2h];
_factory_status_field2 ctrlSetFontHeight _button_font_height - 0.003;
_factory_status_field2 ctrlSetBackgroundColor [0,0,0,0];
_factory_status_field2 ctrlCommit 0;

_factory_status_frame2 ctrlSetPosition [_e2x, _e2y, _e2w, _e2h];
_factory_status_frame2 ctrlCommit 0;

_factory_status_background2 ctrlSetPosition [_e2x, _e2y, _e2w, _e2h];
_factory_status_background2 ctrlSetBackgroundColor [0,0,0,0.65];
_factory_status_background2 ctrlCommit 0;
