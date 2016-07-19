// A_voting_menu_fnc_menu_setup

#include "../../includes/constants.h"
#include "../../includes/macro.h"


disableSerialization;
ARGV(0,_election_data);

if (undefined(_election_data)) exitWith {};

private["_election_id", "_election_title"];
_election_id = _election_data select A_voting_menu_var_election_data_id;
_election_title = _election_data select A_voting_menu_var_election_data_title;

private["_player"];
_player = player;

if (!(createDialog "voting_menu")) exitWith {
	player groupChat format["ERROR: Could not create voting menu dialog"];
};

private["_display"];
_display = (uiNamespace getVariable 'VOTING_MENU');

_voting_menu_header = _display displayCtrl voting_menu_header_idc;
_voting_menu_background = _display displayCtrl voting_menu_background_idc;
_voting_menu_submit_button = _display displayCtrl voting_menu_submit_button_idc;
_voting_menu_close_button = _display displayCtrl voting_menu_close_button_idc;
_voting_menu_list = _display displayCtrl voting_menu_list_idc;

_voting_menu_current_label = _display displayCtrl voting_menu_current_label_idc;
_voting_menu_current_field = _display displayCtrl voting_menu_current_field_idc;

_voting_menu_timeout_label = _display displayCtrl voting_menu_timeout_label_idc;
_voting_menu_timeout_field = _display displayCtrl voting_menu_timeout_field_idc;

_voting_auto_pop_label = _display displayCtrl voting_auto_pop_label_idc;
_voting_auto_pop_checkbox = _display displayCtrl voting_auto_pop_checkbox_idc;
_voting_menu_list_background1 = _display displayCtrl voting_menu_list_background1_idc;
_voting_menu_list_background2 = _display displayCtrl voting_menu_list_background2_idc;

_voting_menu_list ctrlAddEventHandler ["LBSelChanged", '(_this + [' + str(_election_id) + ', ' + str(_player) + ']) call A_voting_menu_fnc_menu_list_changed'];

private["_variable_name"];
_variable_name = format["%1_election_data", _election_id];
missionNamespace setVariable [_variable_name, _election_data];

private["_x", "_y", "_w", "_h", "_ysep", "_sep", "_header_title"];
_x = 0.14;
_y = 0.14;
_w = 0.55;
_h = 0.60;
_ysep = 0.003;
_sep = 0.01;
_header_title = toUpper(_election_title + " Election");

private["_button_font_height", "_font_family"];
_button_font_height = MENU_TITLE_FONT_HEIGHT;
_font_family = "PuristaMedium";

//header
private["_vhx", "_vhy", "_vhw", "_vhh"];
_vhx = _x;
_vhy = _y;
_vhw = _w;
_vhh = 0.045;

_voting_menu_header ctrlSetPosition [_vhx, _vhy, _vhw, _vhh];
_voting_menu_header ctrlSetFontHeight _button_font_height;
_voting_menu_header ctrlSetFont _font_family;
_voting_menu_header ctrlSetText _header_title;
_voting_menu_header ctrlCommit 0;

//background
private["_vbx", "_vby", "_vbw", "_vbh"];
_vbx = _vhx;
_vby = _vhy + _vhh + _ysep;
_vbw = _w;
_vbh = _h - _vhh - _vhh - _ysep - _ysep;

_voting_menu_background ctrlSetPosition [_vbx, _vby, _vbw, _vbh];
_voting_menu_background ctrlSetBackgroundColor [0,0,0,0.65];
_voting_menu_background ctrlCommit 0;

//select button
private["_vsx", "_vsy", "_vsw", "_vsh"];
_vsw = 0.20;
_vsh = _vhh;
_vsx = _vhx;
_vsy = _vby + _vbh + _ysep;

_voting_menu_submit_button ctrlSetText "Submit";
_voting_menu_submit_button ctrlSetPosition [_vsx, _vsy, _vsw, _vsh];
_voting_menu_submit_button ctrlCommit 0;
_voting_menu_submit_button ctrlShow false;

//close button
private["_vcx", "_vcy", "_vcw", "_vch"];
_vcw = 0.14;
_vch = _vhh;
_vcx = _vhx + _vhw - _vcw;
_vcy = _vhy + _h - _vch;

_voting_menu_close_button ctrlSetText "Close";
_voting_menu_close_button ctrlSetPosition [_vcx, _vcy, _vcw, _vch];
buttonSetAction [(ctrlIDC _voting_menu_close_button), "closeDialog 0"];
_voting_menu_close_button ctrlCommit 0;

//list (candidates)
private["_vlx", "_vly", "_vlw", "_vlh"];
_vlx = _vbx + _sep ; 
_vly = _vby + _sep;
_vlw = _vhw - _sep * 2;
_vlh = _vbh * 0.65;

_voting_menu_list ctrlSetText "";
_voting_menu_list ctrlSetPosition [_vlx, _vly, _vlw, _vlh];
_voting_menu_list ctrlSetFontHeight _button_font_height - 0.003;
_voting_menu_list ctrlCommit 0;

private["_split"];
_split = 0.85;

_voting_menu_list lnbAddColumn 0;
_voting_menu_list lnbAddColumn _split;

_voting_menu_list lnbAddRow ["","Nominee", "Votes", ""];

_voting_menu_list_background1 ctrlSetBackgroundColor [0,0,0,0.15];
_voting_menu_list_background1 ctrlSetPosition [_vlx, _vly, _vlw *_split, _vlh];
_voting_menu_list_background1 ctrlCommit 0;

_voting_menu_list_background2 ctrlSetBackgroundColor [0,0,0,0.25];
_voting_menu_list_background2 ctrlSetPosition [(_vlx + (_vlw * _split)), _vly, (_vlw * (1 - _split)), _vlh];
_voting_menu_list_background2 ctrlCommit 0;
 
//_voting_menu_list lbAdd "hello world!";

//current label
private["_vclx", "_vcly", "_vclw", "_vclh"];
_vclx = _vlx;
_vcly = _vly + _vlh + _sep;
_vclw = _vlw / 2 - _sep;
_vclh = 0.04;

private["_election_role"];
_election_role = _election_data select A_voting_menu_var_election_data_role;
_voting_menu_current_label ctrlSetText format["Current %1:", toLower(_election_role)];
_voting_menu_current_label ctrlSetPosition [_vclx, _vcly, _vclw, _vclh];
_voting_menu_current_label ctrlSetFontHeight _button_font_height - 0.003;
_voting_menu_current_label ctrlCommit 0;


//current field
private["_vcfx", "_vcfy", "_vcfw", "_vcfh"];
_vcfx = _vclx + _vclw + _sep;
_vcfy = _vcly;
_vcfw = _vclw;
_vcfh = _vclh;


_voting_menu_current_field ctrlSetText "(none)";
_voting_menu_current_field ctrlSetPosition [_vcfx, _vcfy, _vcfw, _vcfh];
_voting_menu_current_field ctrlSetFontHeight _button_font_height - 0.003;
_voting_menu_current_field ctrlSetBackgroundColor [1,1,1,0.08];
_voting_menu_current_field ctrlCommit 0;


//timeout label
private["_vtlx", "_vtly", "_vtlw", "_vtlh"];
_vtlx = _vclx;
_vtly = _vcly + _vclh + _ysep * 2;
_vtlw = _vclw;
_vtlh = _vclh;

_voting_menu_timeout_label ctrlSetText "Timeout (seconds):";
_voting_menu_timeout_label ctrlSetPosition [_vtlx, _vtly, _vtlw, _vtlh];
_voting_menu_timeout_label ctrlSetFontHeight _button_font_height - 0.003;
_voting_menu_timeout_label ctrlCommit 0;


//timeout field
private["_vtfx", "_vtfy", "_vtfw", "_vtfh"];
_vtfx = _vtlx + _vtlw + _sep;
_vtfy = _vtly;
_vtfw = _vtlw;
_vtfh = _vtlh;

_voting_menu_timeout_field ctrlSetText "0";
_voting_menu_timeout_field ctrlSetPosition [_vtfx, _vtfy, _vtfw, _vtfh];
_voting_menu_timeout_field ctrlSetFontHeight _button_font_height - 0.003;
_voting_menu_timeout_field ctrlSetBackgroundColor [1,1,1,0.08];
_voting_menu_timeout_field ctrlCommit 0;

//voting checkbox
private["_vxlx", "_vxly", "_vxlw", "_vxlh"];
_vxlx = _vtlx;
_vxly = _vtly + _vtlh + _ysep * 2;
_vxlw = _vtlw * 2 + _sep;
_vxlh = _vtlh;

_voting_auto_pop_checkbox ctrlSetPosition [_vxlx, _vxly, _vxlw, _vxlh];
_voting_auto_pop_checkbox ctrlSetBackgroundColor [1,0,0,1];
_voting_auto_pop_checkbox ctrlCommit 0;

_voting_auto_pop_checkbox ctrlAddEventHandler ["CheckBoxesSelChanged", '(_this + [(missionNamespace getVariable ' + str(_variable_name) + '), ' + str(_player) + ']) call A_voting_menu_fnc_menu_check_changed;'];

//private["_auto_show_window"];
_auto_show_window = [_player, format["%1_auto_show_window", _election_id], 1] call A_player_fnc_get_scalar;
[_voting_auto_pop_checkbox, 0, _auto_show_window, _election_data,_player] call A_voting_menu_fnc_menu_check_changed;
_voting_auto_pop_checkbox ctrlSetChecked (_auto_show_window == 1);

_voting_auto_pop_label ctrlSetPosition [_vxlx, _vxly, _vxlw, _vxlh];
_voting_auto_pop_label ctrlSetFontHeight _button_font_height - 0.003;
_voting_auto_pop_label ctrlCommit 0;

[_election_data, _voting_menu_timeout_field, _voting_menu_current_field] call A_voting_menu_fnc_menu_update_fields;

(_voting_menu_list)
