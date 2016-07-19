// A_voting_menu_fnc_nomination_menu_setup

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

if (!(createDialog "voting_nomination_menu")) exitWith {
	player groupChat format["ERROR: Could not create voting nomination menu dialog"];
};

private["_display"];
_display = (uiNamespace getVariable 'VOTING_NOMINATION_MENU');


_voting_nomination_menu_header = _display displayCtrl voting_nomination_menu_header_idc;
_voting_nomination_menu_background = _display displayCtrl voting_nomination_menu_background_idc;
_voting_nomination_menu_submit_button = _display displayCtrl voting_nomination_menu_submit_button_idc;
_voting_nomination_menu_close_button = _display displayCtrl voting_nomination_menu_close_button_idc;
_voting_nomination_menu_list = _display displayCtrl voting_nomination_menu_list_idc;
_voting_nomination_menu_timeout_label = _display displayCtrl voting_nomination_menu_timeout_label_idc;
_voting_nomination_menu_timeout_field = _display displayCtrl voting_nomination_menu_timeout_field_idc;

_voting_nomination_menu_option_label = _display displayCtrl voting_nomination_menu_option_label_idc;
_voting_nomination_menu_option_field = _display displayCtrl voting_nomination_menu_option_field_idc;




private["_x", "_y", "_w", "_h", "_ysep", "_sep", "_header_title"];
_x = 0.14;
_y = 0.14;
_w = 0.55;
_h = 0.60;
_ysep = 0.003;
_sep = 0.01;
_header_title = toUpper(_election_title + " Nominations");

private["_button_font_height", "_font_family"];
_button_font_height = MENU_TITLE_FONT_HEIGHT;
_font_family = "PuristaMedium";

//header
private["_vhx", "_vhy", "_vhw", "_vhh"];
_vhx = _x;
_vhy = _y;
_vhw = _w;
_vhh = 0.045;

_voting_nomination_menu_header ctrlSetPosition [_vhx, _vhy, _vhw, _vhh];
_voting_nomination_menu_header ctrlSetFontHeight _button_font_height;
_voting_nomination_menu_header ctrlSetFont _font_family;
_voting_nomination_menu_header ctrlSetText _header_title;
_voting_nomination_menu_header ctrlCommit 0;

//background
private["_vbx", "_vby", "_vbw", "_vbh"];
_vbx = _vhx;
_vby = _vhy + _vhh + _ysep;
_vbw = _w;
_vbh = _h - _vhh - _vhh - _ysep - _ysep;

_voting_nomination_menu_background ctrlSetPosition [_vbx, _vby, _vbw, _vbh];
_voting_nomination_menu_background ctrlSetBackgroundColor [0,0,0,0.65];
_voting_nomination_menu_background ctrlCommit 0;

//select button
private["_vsx", "_vsy", "_vsw", "_vsh"];
_vsw = 0.20;
_vsh = _vhh;
_vsx = _vhx;
_vsy = _vby + _vbh + _ysep;

_voting_nomination_menu_submit_button ctrlSetText "Nominate";
_voting_nomination_menu_submit_button ctrlSetPosition [_vsx, _vsy, _vsw, _vsh];
_voting_nomination_menu_submit_button ctrlCommit 0;

private["_variable_name"];
_variable_name = format["%1_election_data", _election_id];
missionNamespace setVariable [_variable_name, _election_data];
buttonSetAction [voting_nomination_menu_submit_button_idc,  '[(missionNamespace getVariable ' + str(_variable_name) + '),' + str(_player) + ',(voting_nomination_menu_option_field_selected)] call A_voting_menu_fnc_nominate_player;'];

//close button
private["_vcx", "_vcy", "_vcw", "_vch"];
_vcw = 0.14;
_vch = _vhh;
_vcx = _vhx + _vhw - _vcw;
_vcy = _vhy + _h - _vch;

_voting_nomination_menu_close_button ctrlSetText "Close";
_voting_nomination_menu_close_button ctrlSetPosition [_vcx, _vcy, _vcw, _vch];
buttonSetAction [(ctrlIDC _voting_nomination_menu_close_button), "closeDialog 0"];
_voting_nomination_menu_close_button ctrlCommit 0;

//list (nominees)
private["_vlx", "_vly", "_vlw", "_vlh"];
_vlx = _vbx + _sep ; 
_vly = _vby + _sep;
_vlw = _vhw - _sep * 2;
_vlh = _vbh * 0.75;

_voting_nomination_menu_list ctrlSetText "";
_voting_nomination_menu_list ctrlSetPosition [_vlx, _vly, _vlw, _vlh];
_voting_nomination_menu_list ctrlSetFontHeight _button_font_height - 0.003;
_voting_nomination_menu_list ctrlCommit 0;


//timeout label
private["_vtlx", "_vtly", "_vtlw", "_vtlh"];
_vtlx = _vlx;
_vtly = _vly + _vlh + _sep;
_vtlw = _vlw / 2 - _sep;
_vtlh = 0.04;

_voting_nomination_menu_timeout_label ctrlSetText "Timeout (seconds):";
_voting_nomination_menu_timeout_label ctrlSetPosition [_vtlx, _vtly, _vtlw, _vtlh];
_voting_nomination_menu_timeout_label ctrlSetFontHeight _button_font_height - 0.003;
_voting_nomination_menu_timeout_label ctrlCommit 0;


//timeout field
private["_vtfx", "_vtfy", "_vtfw", "_vtfh"];
_vtfx = _vtlx + _vtlw + _sep;
_vtfy = _vtly;
_vtfw = _vtlw;
_vtfh = _vtlh;

_voting_nomination_menu_timeout_field ctrlSetText "0";
_voting_nomination_menu_timeout_field ctrlSetPosition [_vtfx, _vtfy, _vtfw, _vtfh];
_voting_nomination_menu_timeout_field ctrlSetFontHeight _button_font_height - 0.003;
_voting_nomination_menu_timeout_field ctrlSetBackgroundColor [1,1,1,0.08];
_voting_nomination_menu_timeout_field ctrlCommit 0;


//option label
private["_volx", "_voly", "_volw", "_volh"];
_volx = _vtlx;
_voly = _vtly + _vtlh + _sep;
_volw = _vtlw;
_volh = _vtlh;

_voting_nomination_menu_option_label ctrlSetText "Player to nominate:";
_voting_nomination_menu_option_label ctrlSetPosition [_volx, _voly, _volw, _volh];
_voting_nomination_menu_option_label ctrlSetFontHeight _button_font_height - 0.003;
_voting_nomination_menu_option_label ctrlCommit 0;


//option field
private["_vtfx", "_vofy", "_vofw", "_vofh"];
_vofx = _volx + _volw + _sep;
_vofy = _voly;
_vofw = _volw;
_vofh = _volh;

_voting_nomination_menu_option_field ctrlSetPosition [_vofx, _vofy, _vofw, _vofh];
_voting_nomination_menu_option_field ctrlSetFontHeight _button_font_height - 0.003;
_voting_nomination_menu_option_field ctrlSetBackgroundColor [1,1,1,0.08];
_voting_nomination_menu_option_field ctrlCommit 0;

_voting_nomination_menu_option_field ctrlAddEventHandler ["SetFocus", "(_this) call A_voting_menu_fnc_nomination_menu_combo_focus"];
_voting_nomination_menu_option_field ctrlAddEventHandler ["KillFocus", "(_this) call A_voting_menu_fnc_nomination_menu_combo_blur"];


[_election_data, _voting_nomination_menu_timeout_field] call A_voting_menu_fnc_nomination_menu_update_timeout;

private["_result"];
_result = [];
_result set [A_voting_menu_var_nomination_menu_data_list_nominees, _voting_nomination_menu_list];
_result set [A_voting_menu_var_nomination_menu_data_list_players, _voting_nomination_menu_option_field];

_result
