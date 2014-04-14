#include "constants.h"
#include "macro.h"

if (not(undefined(voting_menu_functions_defined))) exitWith {};


election_data_id = 0;
election_data_title = 1;
election_data_role = 2;
election_data_nomination_period = 3;
election_data_election_period = 4;
election_data_over_callback = 5;
election_data_nomination_filter = 6;

police_election_data = [];
police_election_data = [];
police_election_data set [election_data_id, "police_chief"];
police_election_data set [election_data_title, "Police Chief"];
police_election_data set [election_data_role, "police chief"];
police_election_data set [election_data_nomination_period, 60];
police_election_data set [election_data_election_period, 60];
police_election_data set [election_data_over_callback, "voting_election_police_over"];
police_election_data set [election_data_nomination_filter, "voting_nomination_police_filter"];

president_election_data = [];
president_election_data = [];
president_election_data set [election_data_id, "president"];
president_election_data set [election_data_title, "Presidential"];
president_election_data set [election_data_role, "president"];
president_election_data set [election_data_nomination_period, 10];
president_election_data set [election_data_election_period, 10];
president_election_data set [election_data_over_callback, "voting_election_president_over"];
president_election_data set [election_data_nomination_filter, ""];

voting_menu_check_changed = {
	//player groupChat format["voting_menu_check_changed %1",  _this];
	ARGV(0,_control);
	ARGV(1,_index);
	ARGV(2,_state);
	ARGV(3,_election_data);
	ARGV(4,_player);
	
	if (undefined(_state)) exitWith {};
	if (undefined(_election_data)) exitWith {};
	
	if (not([_player] call player_exists)) exitWith {};

	private["_box", "_text"];
	_text = " - Auto open window";
	_box = if (_state == 1) then {"[x]"} else {"[ ]"};
	ctrlSetText [voting_auto_pop_label_idc, _box + _text];

	private["_election_id"];
	_election_id = _election_data select election_data_id;
	[_player, format["%1_auto_show_window", _election_id], _state] call player_set_scalar;
};

voting_menu_list_changed = {
	//player groupChat format["voting_menu_list_changed %1", _this];
	ARGV(0,_control);
	ARGV(1,_index);
	ARGV(2,_election_id);
	ARGV(3,_voter);
	
	private["_candidate_uid"];
	_candidate_uid = _control lnbData [_index, 0];
	
	[_election_id, _voter, _candidate_uid] call voting_vote_candidate;
};




voting_menu_setup = {
	disableSerialization;
	ARGV(0,_election_data);
	
	if (undefined(_election_data)) exitWith {};
	
	private["_election_id", "_election_title"];
	_election_id = _election_data select election_data_id;
	_election_title = _election_data select election_data_title;
	
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

	_voting_menu_list ctrlAddEventHandler ["LBSelChanged", '(_this + [' + str(_election_id) + ', ' + str(_player) + ']) call voting_menu_list_changed'];
	
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
	_election_role = _election_data select election_data_role;
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
	
	_voting_auto_pop_checkbox ctrlAddEventHandler ["CheckBoxesSelChanged", '(_this + [(missionNamespace getVariable ' + str(_variable_name) + '), ' + str(_player) + ']) call voting_menu_check_changed;'];
	
	//private["_auto_show_window"];
	_auto_show_window = [_player, format["%1_auto_show_window", _election_id], 1] call player_get_scalar;
	[_voting_auto_pop_checkbox, 0, _auto_show_window, _election_data,_player] call voting_menu_check_changed;
	_voting_auto_pop_checkbox ctrlSetChecked (_auto_show_window == 1);
	
	_voting_auto_pop_label ctrlSetPosition [_vxlx, _vxly, _vxlw, _vxlh];
	_voting_auto_pop_label ctrlSetFontHeight _button_font_height - 0.003;
	_voting_auto_pop_label ctrlCommit 0;
	
	[_election_data, _voting_menu_timeout_field, _voting_menu_current_field] call voting_menu_update_fields;
	
	(_voting_menu_list)
};

voting_menu_update_fields = { _this spawn {
	disableSerialization;
	ARGV(0,_election_data)
	ARGV(1,_timeout_control);
	ARGV(2,_current_control);
	if (undefined(_election_data)) exitWith {};
	
	private["_election_id"];
	_election_id = _election_data select election_data_id;
	
	waitUntil {
		private["_timeout"];
		_timeout =  [_election_id] call voting_election_timeout_value;
		_timeout = if (undefined(_timeout)) then {"(unknown)"} else {_timeout};
		_timeout_control ctrlSetText format["%1", _timeout];
		
		private["_current_candidate_data", "_current_candidate_name"];
		_current_candidate_data = [_election_id] call voting_get_incumbent_candidate;
		_current_candidate_name = if (undefined(_current_candidate_data)) then {"(none)"} else {_current_candidate_data select election_candidates_data_entry_name};
		_current_control ctrlSetText _current_candidate_name;
		
		(not(ctrlShown _timeout_control))
	};
};};

voting_menu_update_current = { _this spawn {
	disableSerialization;
	ARGV(0,_election_data)
	ARGV(1,_control);
	if (undefined(_election_data)) exitWith {};
	
	private["_election_id"];
	_election_id = _election_data select election_data_id;
	
	waitUntil {
		private["_timeout"];
		_timeout =  [_election_id] call voting_election_timeout_value;
		if (undefined(_timeout)) then {
			_timeout = "(unknown)";
		};
		
	
		
		
		(not(ctrlShown _control))
	};
};};




voting_nomination_menu_combo_focus = {
	ARGV(0,_control);
	_control ctrlSetBackgroundColor [0.1,0.1,0.1,1];
};

voting_nomination_menu_combo_blur = {
	ARGV(0,_control);
	_control ctrlSetBackgroundColor [1,1,1,0.08];
};

voting_nomination_menu_submit_button_handler = {
	ARGV(0,_election_data);
	
	
};

voting_nomination_menu_setup = {
	disableSerialization;
	ARGV(0,_election_data);
	
	if (undefined(_election_data)) exitWith {};
	
	private["_election_id", "_election_title"];
	_election_id = _election_data select election_data_id;
	_election_title = _election_data select election_data_title;
	
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
	buttonSetAction [voting_nomination_menu_submit_button_idc,  '[(missionNamespace getVariable ' + str(_variable_name) + '),' + str(_player) + ',(voting_nomination_menu_option_field_selected)] call voting_nominate_player;'];

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
	
	_voting_nomination_menu_option_field ctrlAddEventHandler ["SetFocus", "(_this) call voting_nomination_menu_combo_focus"];
	_voting_nomination_menu_option_field ctrlAddEventHandler ["KillFocus", "(_this) call voting_nomination_menu_combo_blur"];
	
	
	[_election_data, _voting_nomination_menu_timeout_field] call voting_nomination_menu_update_timeout;
	
	private["_result"];
	_result = [];
	_result set [nomination_menu_data_list_nominees, _voting_nomination_menu_list];
	_result set [nomination_menu_data_list_players, _voting_nomination_menu_option_field];

	_result
};

voting_nomination_menu_update_timeout = { _this spawn {
	disableSerialization;
	ARGV(0,_election_data)
	ARGV(1,_control);
	if (undefined(_election_data)) exitWith {};
	
	private["_election_id"];
	_election_id = _election_data select election_data_id;
	
	waitUntil {
		private["_timeout"];
		_timeout =  [_election_id] call voting_nomination_timeout_value;
		if (undefined(_timeout)) then {
			_timeout = "(unknown)";
		};
		_control ctrlSetText format["%1", _timeout];
		(not(ctrlShown _control))
	};
};};

voting_clear_nominations = {
	ARGV(0,_election_id);
	[_election_id, [[],[]]] call  voting_set_nominations;
	([_election_id] call voting_update_nomination_version)
	
};

voting_clear_candidates = {
	ARGV(0,_election_id);
	[_election_id, [[],[]]] call  voting_set_candidates;
	([_election_id] call voting_update_election_version)
};

election_nominations_index = 0;
election_nominations_data = 1;

election_nominations_data_entry_uid = 0;
election_nominations_data_entry_name = 1;

voting_player_nominated = {
	ARGV(0,_election_id);
	ARGV(1,_nominee);
	
	if (undefined(_election_id)) exitWith {false};
	if (typeName _election_id != "STRING") exitWith {false};
	if (not([_nominee] call player_exists)) exitWith {false};
	
	private["_nominations"];
	_nominations = [_election_id] call voting_get_nominations;
	if (undefined(_nominations)) exitWith {false};
	
	private["_nomintions_index"];
	_nominations_index = _nominations select election_nominations_index;
	
	private["_uid"];
	_uid = getPlayerUID _nominee;
	
	//auto nominate the incumbent
	private["_incumbent_candidate_data", "_incumbent_candidate_uid"];
	_incumbent_candidate_data = [_election_id] call voting_get_incumbent_candidate;
	_incumbent_candidate_uid = if (undefined(_incumbent_candidate_data)) then {""} else {_incumbent_candidate_data select election_candidates_data_entry_uid};

	(((_nominations_index find _uid) >= 0) || (_uid == _incumbent_candidate_uid))
};

voting_get_nominations = {
	ARGV(0,_election_id);
	
	private["_default"];
	_default = [[],[]];
	
	if (undefined(_election_id)) exitWith {null};
	if (typeName _election_id != "STRING") exitWith {null};
	
	private["_variable_name"];
	_variable_name = format["%1_nominiations", _election_id];
	
	private["_nominations"];
	_nominations = server getVariable [_variable_name, _default];
	(_nominations)
};

voting_set_nominations = {
	ARGV(0,_election_id);
	ARGV(1,_nominations);
	
	if (undefined(_election_id)) exitWith {null};
	if (undefined(_nominations)) exitWith {null};
	if (typeName _election_id != "STRING") exitWith {null};
	if (typeName _nominations != "ARRAY") exitWith {null};
	
	private["_variable_name"];
	_variable_name = format["%1_nominiations", _election_id];
	
	private["_nominations"];
	server setVariable [_variable_name, _nominations, true];
	(_nominations)
};


voting_update_nominations_setup = {
	if (not(isServer)) exitWith {};
	voting_update_nominations_request_buffer =  " ";
	publicVariableServer "voting_update_nominations_request_buffer";
	"voting_update_nominations_request_buffer" addPublicVariableEventHandler { _this call voting_update_nominations_request_receive;};
};

voting_update_nominations = {
	voting_update_nominations_request_buffer = _this;
	if (isServer) then {
		["", voting_update_nominations_request_buffer] call voting_update_nominations_request_receive;
	}
	else {
		publicVariable "voting_update_nominations_request_buffer";
	};
};

voting_update_nominations_request_receive = {
	player groupChat format["voting_update_nominations_request_receive %1", _this];
	ARGV(1,_this);
	ARGV(0,_election_id);
	ARGV(1,_nominee);
	
	if (undefined(_election_id)) exitWith {};
	if (not([_nominee] call player_exists)) exitWith {};
	if (typeName _election_id != "STRING") exitWith {};
	
	private["_uid", "_name"];
	_uid = getPlayerUID _nominee;
	_name = name _nominee;
	
	private["_nominations"];
	_nominations = [_election_id] call voting_get_nominations;
	if (undefined(_nominations)) exitWith {};
	
	private["_nominations_index"];
	_nominations_index = _nominations select election_nominations_index;
	if ((_nominations_index find _uid) >= 0) exitWith {};
	
	private["_nominations_data"];
	_nominations_data = _nominations select election_nominations_data;
	if (undefined(_nominations_data)) exitWith {};
	
	
	private["_nominee_data"];
	_nominee_data = [];
	_nominee_data set [election_nominations_data_entry_uid, _uid];
	_nominee_data set [election_nominations_data_entry_name, _name];
	
	_nominations_index set [count(_nominations_index), _uid];
	_nominations_data set[count(_nominations_data), _nominee_data];
	
	[_election_id, _nominations] call voting_set_nominations;
};

voting_nomination_timeout_update = {
	ARGV(0,_election_id);
	ARGV(1,_value);

	private["_variable_name"];
	_variable_name = format["%1_nomination_timeout", _election_id];
	server setVariable [_variable_name, _value, true];	
};

voting_nomination_timeout_value = {
	ARGV(0,_election_id);
	private["_variable_name"];
	_variable_name = format["%1_nomination_timeout", _election_id];
	(server getVariable [_variable_name, 0])	
};

voting_election_timeout_update = {
	ARGV(0,_election_id);
	ARGV(1,_value);

	private["_variable_name"];
	_variable_name = format["%1_election_timeout", _election_id];
	server setVariable [_variable_name, _value, true];	
};

voting_election_timeout_value = {
	ARGV(0,_election_id);
	private["_variable_name"];
	_variable_name = format["%1_election_timeout", _election_id];
	(server getVariable [_variable_name, 0])
};

voting_nomination_timeout_start = {_this spawn {
	//player groupChat format["voting_nomination_timeout_start %1", _this];
	ARGV(0,_election_data);

	if (undefined(_election_data)) exitWith {};
	
	private["_election_id", "_election_role", "_nomination_period"];
	_election_id = _election_data select election_data_id;
	_election_role = _election_data select election_data_role;
	_nomination_period = _election_data select election_data_nomination_period;
	
	private["_value"];
	_value = [_election_id] call voting_nomination_timeout_value;
	
	//if the timeout is greater than 0 it means are already in nominations period
	if (_value > 0) exitWith {};
	
	[_election_id, 0] call voting_set_nomination_version;
	private["_i"];
	_i = _nomination_period;
	while {_i >= 0} do {
		[_election_id, _i] call voting_nomination_timeout_update;
		sleep 1;
		_i = _i - 1;
	};
	[_election_id, nil] call voting_nomination_timeout_update;
	
	//setup the candidate's list, from the nominations list
	
	private["_nominations"];
	_nominations = [_election_id] call voting_get_nominations;
	
	private["_nominations_index", "_nominations_data"];
	_nominations_index =  _nominations select election_nominations_index;
	_nominations_data = _nominations select election_nominations_data;
	
	//auto nominate the incumbent
	private["_incumbent_candidate_data"];
	_incumbent_candidate_data = [_election_id] call voting_get_incumbent_candidate;

	if (not(undefined(_incumbent_candidate_data))) then {
		[_election_id, _incumbent_candidate_data] call voting_add_candidate;
	};
	
	
	{
		private["_nomination_cdata", "_nomination_entry_uid", "_nomination_entry_name"];
		_nomination_cdata = _nominations_data select _forEachIndex;
		_nomination_entry_uid = _nomination_cdata select election_nominations_data_entry_uid;
		_nomination_entry_name = _nomination_cdata select election_nominations_data_entry_name;
		
		private["_candidate_data"];

		
		_candidate_data = [];
		_candidate_data set [election_candidates_data_entry_uid, _nomination_entry_uid];
		_candidate_data set [election_candidates_data_entry_name, _nomination_entry_name];
		_candidate_data set [election_candidates_data_entry_vote_data, []];
		
		
		[_election_id, _candidate_data] call voting_add_candidate;
	} forEach _nominations_data;
	
	[_election_id, 0] call voting_set_election_version;
	[_election_id] call voting_clear_nominations;
	
	[[_election_data], "voting_election_start", true] call BIS_fnc_MP;
	[_election_data] call voting_election_timeout_start;
};};

election_candidates_index = 0;
election_candidates_data = 1;

election_candidates_data_entry_uid = 0;
election_candidates_data_entry_name = 1;
election_candidates_data_entry_vote_data = 2;

election_candidates_data_entry_vote_data_entry_uid = 0;
election_candidates_data_entry_vote_data_entry_name = 1;

voting_get_candidates = {
	ARGV(0,_election_id);
	
	private["_default"];
	_default = [[],[]];
	
	if (undefined(_election_id)) exitWith {null};
	
	private["_variable_name"];
	_variable_name = format["%1_candidates", _election_id];
	
	(server getVariable [_variable_name, _default])
};

voting_set_candidates = {
	ARGV(0,_election_id);
	ARGV(1,_candidates);
	
		
	if (undefined(_election_id)) exitWith {};
	if (undefined(_candidates)) exitWith {};
	
	private["_variable_name"];
	_variable_name = format["%1_candidates", _election_id];
	
	server setVariable [_variable_name, _candidates, true];
	(_candidates)
};

voting_add_candidate = {
	ARGV(0,_election_id);
	ARGV(1,_candidate_data);
	
	if (undefined(_election_id)) exitWith {};
	if (undefined(_candidate_data)) exitWith {};
	
	private["_candidates"];
	_candidates = [_election_id] call voting_get_candidates;
	if (undefined(_candidates)) exitWith {};
	
	private["_canidates_index", "_candidates_data"];
	_candidates_index = _candidates select election_candidates_index;
	_candidates_data = _candidates select election_candidates_data;
	
	private["_candidate_uid"];
	_candidate_uid = _candidate_data select election_candidates_data_entry_uid;
	
	_candidates_index set [count(_candidates_index), _candidate_uid];
	_candidates_data set [count(_candidates_data), _candidate_data];
	[_election_id, _candidates] call voting_set_candidates;
};

voting_vote_candidate_setup = {
	if (not(isServer)) exitWith {};
	voting_vote_candidate_request_buffer =  " ";
	publicVariableServer "voting_vote_candidate_request_buffer";
	"voting_vote_candidate_request_buffer" addPublicVariableEventHandler { _this call voting_vote_candidate_request_receive;};
};

voting_vote_candidate = {
	voting_vote_candidate_request_buffer = _this;
	if (isServer) then {
		["", voting_vote_candidate_request_buffer] call voting_vote_candidate_request_receive;
	}
	else {
		publicVariable "voting_vote_candidate_request_buffer";
	};
};

voting_vote_candidate_request_receive = {
	player groupChat format["voting_vote_candidate_request_receive %1", _this];
	ARGV(1,_this);
	ARGV(0,_election_id);
	ARGV(1,_voter);
	ARGV(2,_candidate_uid);
	
	if (undefined(_election_id)) exitWith {};
	if (not([_voter] call player_exists)) exitWith {};
	if (undefined(_candidate_uid)) exitWith {};
	if (typeName _election_id != "STRING") exitWith {};
	if (typeName _candidate_uid != "STRING") exitWith {};
	
	private["_candidates"];
	_candidates = [_election_id] call voting_get_candidates;
	if (undefined(_candidates)) exitWith {};
	
	private["_candidates_index", "_candidates_data"];
	_candidates_index = _candidates select election_candidates_index;
	_candidates_data = _candidates select election_candidates_data;
	
	private["_candidate_index"];
	_candidate_index = _candidates_index find _candidate_uid;
	if (not(_candidate_index >=0)) exitWith {};
	
		
	private["_voter_uid"];
	_voter_uid = getPlayerUID _voter;
	
	private["_voter_found"];
	_voter_found = false;
	
	
	{
		private["_candidate_cdata", "_candidate_cuid", "_candidate_vote_data"];
		_candidate_cdata = _candidates_data select _forEachIndex;
		_candidate_cuid = _candidate_cdata select election_candidates_data_entry_uid;
		_candidate_vote_data = _candidate_cdata select election_candidates_data_entry_vote_data;
	
		private["_voter_found_index"];
		_voter_found_index = -1;
		{
			private["_vote_data_entry", "_vote_data_cuid"];
			_vote_data_entry = _x;
			_vote_data_cuid = _vote_data_entry select election_candidates_data_entry_vote_data_entry_uid;
			if (_vote_data_cuid == _voter_uid) then {
				_voter_found = true;
				_voter_found_index = _forEachIndex;
			};
		} forEach _candidate_vote_data;
		
		//remove the existing vote
		if (_voter_found_index >= 0) then {
			_candidate_vote_data set [_voter_found_index, objNull];
			_candidate_vote_data = _candidate_vote_data - [objNull];
			_candidate_cdata set [election_candidates_data_entry_vote_data, _candidate_vote_data];
		};
	} forEach _candidates_index;
	
	
	private["_candidate_data"];
	_candidate_data = _candidates_data select _candidate_index;
	if (undefined(_candidate_data)) exitWith {};
	
	private["_candidate_votes"];
	_candidate_votes = _candidate_data select election_candidates_data_entry_vote_data;
	if (undefined(_candidate_votes)) exitWith {};
	
	private["_vote"];
	_vote = [];
	_vote set [election_candidates_data_entry_vote_data_entry_uid, _voter_uid];
	_candidate_votes set [(count _candidate_votes), _vote];
	
	[_election_id, _candidates] call voting_set_candidates;
	[_election_id] call voting_update_election_version;
};

voting_update_election_version = {
	ARGV(0,_election_id);
	
	if (undefined(_election_id)) exitWith {};
	
	private["_version_value"];
	_version_value = [_election_id] call voting_get_election_version;
	_version_value = _version_value + 1;
	[_election_id, _version_value] call voting_set_election_version;
};

voting_set_election_version = {
	ARGV(0,_election_id);
	ARGV(1,_version_value);

	if (undefined(_election_id)) exitWith {};
	
	private["_variable_name"];
	_variable_name = format["%1_election_version", _election_id];
	
	server setVariable [_variable_name, _version_value, true];
	_version_value
};

voting_get_election_version = {
	ARGV(0,_election_id);
	private["_default"];
	_default = 0;
	
	if (undefined(_election_id)) exitWith {_default};
	
	private["_variable_name"];
	_variable_name = format["%1_election_version", _election_id];
	
	(server getVariable [_variable_name, _default])
};

voting_update_nomination_version = {
	ARGV(0,_election_id);
	
	if (undefined(_election_id)) exitWith {};
	
	private["_version_value"];
	_version_value = [_election_id] call voting_get_nomination_version;
	_version_value = _version_value + 1;
	[_election_id, _version_value] call voting_set_nomination_version;
};

voting_set_nomination_version = {
	ARGV(0,_election_id);
	ARGV(1,_version_value);

	if (undefined(_election_id)) exitWith {};
	
	private["_variable_name"];
	_variable_name = format["%1_nomination_version", _election_id];
	
	server setVariable [_variable_name, _version_value, true];
	_version_value
};

voting_get_nomination_version = {
	ARGV(0,_election_id);
	private["_default"];
	_default = 0;
	
	if (undefined(_election_id)) exitWith {_default};
	
	private["_variable_name"];
	_variable_name = format["%1_nomination_version", _election_id];
	(server getVariable [_variable_name, _default])
};

voting_election_timeout_start = { _this spawn {
	ARGV(0,_election_data);

	if (undefined(_election_data)) exitWith {};
	
	private["_election_id", "_election_role", "_election_period"];
	_election_id = _election_data select election_data_id;
	_election_role = _election_data select election_data_role;
	_election_period = _election_data select election_data_election_period;
		
	private["_i"];
	_i = _election_period;
	while {_i >= 0} do {
		[_election_id, _i] call voting_election_timeout_update;
		sleep 1;
		_i = _i - 1;
	};
	[_election_id, nil] call voting_election_timeout_update;
	
	[_election_data] call voting_election_over;
};};

voting_election_over = {
	//player groupChat format["voting_election_over %1", _this];
	ARGV(0,_election_data);
		
	private["_election_id", "_election_over_callback"];
	_election_id = _election_data select election_data_id;
	_election_over_callback = _election_data select election_data_over_callback;
	
	private["_candidates"];
	_candidates = [_election_id] call voting_get_candidates;
	if (undefined(_candidates)) exitWith {};
	
	private["_candidates_data"];
	_candidates_data = _candidates select election_candidates_data;
	
	_max_votes_value = 0;
	_max_votes_uid = "";
	private["_ballots_data"];
	_ballots_data = [];
	
	{
		private["_candidate_data", "_candidate_uid", "_candidate_votes"];
		_candidate_data = _candidates_data select _forEachIndex;
		_candidate_uid = _candidate_data select election_candidates_data_entry_uid;
		_candidate_votes = [_candidate_data] call voting_count_candidate_votes;
		
		private["_ballot"];
		_ballot = [];
		_ballot set [sort_key,_candidate_votes];
		_ballot set [sort_data,_candidate_data];
		_ballots_data set [count(_ballots_data), _ballot];
	} forEach _candidates_data;
	
	_ballots_data call quicksort;
	
	private["_first_place_data", "_first_place_votes"];
	_first_place_data = (_ballots_data select ((count _ballots_data) - 1)) select sort_data;
	_first_place_votes = (_ballots_data select ((count _ballots_data) - 1)) select sort_key;
	
	private["_tie"];
	_tie = false;
	if (count(_ballots_data) > 1) then {
		private["_second_place_votes"];
		_second_place_votes = (_ballots_data select ((count _ballots_data) - 2)) select sort_key;
		_tie = (_first_place_votes == _second_place_votes);
	};
	
	if (_first_place_votes > 0 && not(_tie)) then {
		[_election_id, _first_place_data] call voting_set_incumbent_candidate;
	};
	
	[_election_id] call voting_clear_candidates;
	[[_election_data,_first_place_votes, _first_place_data,_tie], _election_over_callback, true] call BIS_fnc_MP;
};

voting_set_incumbent_candidate = {
	ARGV(0,_election_id);
	ARGV(1,_candidate_data);
	
	if (undefined(_election_id)) exitWith {null};
	if (undefined(_candidate_data)) exitWith {null};
	
	private["_variable_name"];
	_variable_name = format["%1_incumbent", _election_id];
	
	server setVariable [_variable_name, _candidate_data, true];
	(_candidate_data)
};

voting_get_incumbent_candidate = {
	ARGV(0,_election_id);
	if (undefined(_election_id)) exitWith {null};
	
	private["_variable_name"];
	_variable_name = format["%1_incumbent", _election_id];
	
	(server getVariable [_variable_name, null])
};

voting_menu_close_all = {
	private["_timeout"];
	_timeout = time + 0.5;
	
	waitUntil {
		closeDialog 0;
		(time > _timeout)
	};
};


voting_election_start = {
	//player groupChat format["voting_election_start %1", _this];
	ARGV(0,_election_data);

	if (undefined(_election_data)) exitWith {};
	
	private["_election_id", "_election_role"];
	_election_id = _election_data select election_data_id;
	_election_role = _election_data select election_data_role;

	[] call voting_menu_close_all;
	private["_player"];
	_player = player;
	
	private["_auto_show_window"];
	_auto_show_window = [_player, format["%1_auto_show_window", _election_id], 1] call player_get_scalar;
	
	if (_auto_show_window == 0) exitWith {
		player groupChat format["%1-%2, the election for %3 is starting now.", _player, (name _player), _election_role];
	};

	[_election_data] call voting_menu_create;	
};

voting_menu_create = {
	ARGV(0,_election_data);
	if (undefined(_election_data)) exitWith {};
	private["_list"];
	_list = [_election_data] call voting_menu_setup;
	[_election_data, _list] call voting_menu_update_list;
};

voting_menu_update_list_reload = {
	ARGV(0,_election_id);
	
	if (undefined(_election_id)) exitWith {};
	
	private["_candidates"];
	_candidates = [_election_id] call voting_get_candidates;
	if (undefined(_candidates)) exitWith {};
	
	
	private["_candidates_data"];
	_candidates_data = _candidates select election_candidates_data;
	
	private["_display"];
	_display = (uiNamespace getVariable 'VOTING_MENU');
	_voting_menu_list = _display displayCtrl voting_menu_list_idc;
	
	lnbClear _voting_menu_list;
	_voting_menu_list lnbAddRow ["","Nominee", "Votes", ""];
	
	{
		private["_candidates_cdata"];
		_candidates_cdata = _x;
		private["_candidate_name", "_candidate_uid", "_candidate_votes"];
		_candidate_name = _candidates_cdata select election_candidates_data_entry_name;
		_candidate_uid = _candidates_cdata select election_candidates_data_entry_uid;
		_candidate_votes = [_candidates_cdata] call voting_count_candidate_votes;
		
		private["_index"];
		_index = _voting_menu_list lnbAddRow ["",_candidate_name, str(_candidate_votes), ""];
		_voting_menu_list lnbSetData [[_index, 0], _candidate_uid];
		
	} forEach _candidates_data
};

voting_menu_update_list = { _this spawn {
	disableSerialization;
	ARGV(0,_election_data);
	ARGV(1,_list);
	
	if (undefined(_election_data)) exitWith {};
	if (undefined(_list)) exitWith {};
	
	private["_election_id"];
	_election_id = _election_data select election_data_id;
	
	private["_candidates", "_version"];
	_version = [_election_id] call voting_get_election_version;
	
	[_election_id] call voting_menu_update_list_reload;
	
	
	waitUntil {
		private["_new_version"];
		_new_version = [_election_id] call voting_get_election_version;
		if (_new_version != _version) then {
			_version = _new_version;
			[_election_id] call voting_menu_update_list_reload;
		};
		not(ctrlShown _list)
	};
};};

voting_count_candidate_votes = {
	ARGV(0,_candidate_data);
	
	if (undefined(_candidate_data)) exitWith {0};
	
	private["_candidate_votes"];
	
	_candidate_votes = _candidate_data select election_candidates_data_entry_vote_data;
	
	(count (_candidate_votes))
};

voting_nomination_menu_update_list_reload = {
	ARGV(0,_election_id);
	if (undefined(_election_id)) exitWith {};
	
	private["_nominations"];
	_nominations = [_election_id] call voting_get_nominations;
	if (undefined(_nominations)) exitWith {};
	

	
	
	private["_nominations_data"];
	_nominations_data = _nominations select election_nominations_data;
	
	private["_display"];
	_display = (uiNamespace getVariable 'VOTING_NOMINATION_MENU');
	_voting_nomination_menu_list = _display displayCtrl voting_nomination_menu_list_idc;
	
	lbClear _voting_nomination_menu_list;
	
	private["_incumbent_candidate_data"];
	_incumbent_candidate_data = [_election_id] call voting_get_incumbent_candidate;
	
	if (not(undefined(_incumbent_candidate_data))) then {
		private["_incumbent_candidate_name", "_incumbent_candidate_uid"];
		_inclumbent_candidate_name = _incumbent_candidate_data select election_candidates_data_entry_name;
		_inclumbent_candidate_uid = _incumbent_candidate_data select election_candidates_data_entry_uid;
		private["_index"];
		_index = _voting_nomination_menu_list lbAdd format["%1 (incumbent)", _inclumbent_candidate_name];
		_voting_nomination_menu_list lbSetData [_index, _inclumbent_candidate_uid];
	};
	
	{
		private["_nomination_cdata"];
		_nomination_cdata = _x;
		private["_nomination_name", "_nomination_uid"];
		_nomination_name = _nomination_cdata select election_nominations_data_entry_name;
		_nomination_uid = _nomination_cdata select election_nominations_data_entry_uid;

		private["_index"];
		_index = _voting_nomination_menu_list lbAdd _nomination_name;
		_voting_nomination_menu_list lbSetData [_index, _nomination_uid];
	} forEach _nominations_data
};

voting_nomination_menu_update_list = { _this spawn {
	//player groupChat format["voting_nomination_menu_update_list = %1", _this];
	disableSerialization;
	ARGV(0,_election_data);
	ARGV(1,_list);
	
	if (undefined(_election_data)) exitWith {};
	if (undefined(_list)) exitWith {};
	
	private["_election_id"];
	_election_id = _election_data select election_data_id;
	
	private["_version"];
	_version = [_election_id] call voting_get_nomination_version;
	[_election_id] call voting_nomination_menu_update_list_reload;
	

	waitUntil {
		private["_new_version"];
		_new_version = [_election_id] call voting_get_nomination_version;
		if (_new_version != _version) then {
			_version = _new_version;
			[_election_id] call voting_nomination_menu_update_list_reload;
		};
		not(ctrlShown _list)
	};
};};


voting_nominate_player = {
	//player groupChat format["voting_nominate_player %1", _this];
	ARGV(0,_election_data);
	ARGV(1,_voter);
	ARGV(2,_nominee);


	if (undefined(_election_data)) exitWith {};	
	if (not([_voter] call player_exists)) exitWith {};
	if (not([_nominee] call player_exists)) exitWith {};
	
	private["_election_id", "_election_title", "_election_role"];
	_election_id = _election_data select election_data_id;
	_election_title = _election_data select election_data_title;
	_election_role = _election_data select election_data_role;

	private["_election_timeout"];
	_election_timeout = [_election_id] call voting_election_timeout_value;
	
	if (_election_timeout > 0) exitWith {
		player groupChat format["%1-%2, you cannot nominate players for %3 now. There is a %4 election in progress", (_voter), (name _voter), _election_role, toLower(_election_title)];
	};
	
	if ([_election_id, _nominee] call voting_player_nominated) exitWith {
		if (_nominee == _voter) then {
			player groupChat format["%1-%2, you are already nominated for %3", _voter, (name _voter), _election_role];
		}
		else {
			player groupChat format["%1-%2, player %3-%4 has already been nominated for %5", _voter, (name _voter), _nominee, (name _nominee), _election_role];
		};
	};
	
	private["_nominations"];
	_nominations = [_election_id] call voting_get_nominations;
	if (undefined(_nominations)) exitWith {};
	
	private["_nominations_index"];
	_nominations_index = _nominations select election_nominations_index;
	
	if (count(_nominations_index) == 0) then {
		[[_election_data], "voting_nomination_timeout_start", false] call BIS_fnc_MP;
	};
	
	
	[_election_id, _nominee] call voting_update_nominations;
	[_election_id] call voting_update_nomination_version;
	
	[[_election_data, _voter,_nominee], "voting_nominate_player_announce", true] call BIS_fnc_MP;
};

voting_nominate_player_announce = {
	ARGV(0,_election_data);
	ARGV(1,_voter);
	ARGV(2,_nominee);
	
	if (undefined(_election_data)) exitWith {};
	if (not([_voter] call player_exists)) exitWith {};
	if (not([_nominee] call player_exists)) exitWith {};

	private["_election_role"];
	_election_role = _election_data select election_data_role;
	
	if (_voter == _nominee) then {
		player groupChat format["%1-%2 has nominated himself %3", _voter, (name _voter), _election_role];
	}
	else {
		player groupChat format["%1-%2 has nominated %3-%4 for %5", _voter, (name _voter), _nominee, (name _nominee), _election_role];
	};
};

voting_nomination_menu_update_options = {
	ARGV(0,_election_data);
	ARGV(1,_list);
	
	if (undefined(_election_data)) exitWith {};
	if (undefined(_list)) exitWith {};

	private["_my_index", "_player"];
	_my_index = 0;
	_player = player;
	
	private["_filter_name", "_filter_function"];
	_filter_name = _election_data select election_data_nomination_filter;
	_filter_function = missionNamespace getVariable [_filter_name, {true}];

	
	{if (true) then {
		private["_variable_name", "_variable_value"];
		_variable_name = _x;
		_variable_value = missionNamespace getVariable [_variable_name, null];
		if (not([_variable_value] call player_exists)) exitWith {};
		if (not([_variable_value] call _filter_function)) exitWith {};
		
		private["_index"];
		_index = _list lbAdd format["%1-%2", _variable_value, (name _variable_value)];
		_list lbSetData [_index, _variable_name];
		
		if (_variable_value == _player) then {
			_my_index = _index;
		};
	};} forEach playerstringarray;
	
	_list lbSetCurSel _my_index;
};

voting_election_president_over = {
	ARGV(0,_election_data);
	ARGV(1,_first_place_votes);
	ARGV(2,_first_place_data);
	ARGV(3,_tie);
	
	private["_player"];
	_player = player;
		
	private["_election_id", "_election_title", "_election_role"];
	_election_id = _election_data select election_data_id;
	_election_title = _election_data select election_data_title;
	_election_role = _election_data select election_data_role;
	
	if (_first_place_votes == 0) exitWith {
		hint format["%1 election has ended with no votes cast. The current %2 stays.", _election_title, _election_role];
	};
	
	if (_tie) exitWith {
		hint format["%1 election has ended in a tie. The current %2 stays.", _election_title, _election_role];
	};
	
	private["_first_place_name", "_first_place_uid"];
	_first_place_name = _first_place_data select election_candidates_data_entry_name;
	_first_place_uid = _first_place_data select election_candidates_data_entry_uid;
	
	private["_player_uid"];
	_player_uid = getPlayerUID player;
	if (_player_uid == _first_place_uid) then {
		[_first_place_uid] call player_set_president_uid;
		hint format["%1-%2, Congratutations!\n You have won the %3 election with %4 votes.", _player, (name _player), toLower(_election_title), _first_place_votes];
	}
	else {
		hint format["%1 has won the %2 election with %3 votes.", _first_place_name, toLower(_election_title), _first_place_votes];
	};
};

nomination_menu_data_list_nominees = 0;
nomination_menu_data_list_players = 1;

voting_nomination_menu_create = {
	ARGV(0,_election_data);
	
	if (undefined(_election_data)) exitWith {};
	private["_nomination_menu_data"];
	_nomination_menu_data = [_election_data] call voting_nomination_menu_setup;
	
	private["_list_nominees", "_list_players"];
	_list_nominees = _nomination_menu_data select nomination_menu_data_list_nominees;
	_list_players = _nomination_menu_data select nomination_menu_data_list_players;
	
	[_election_data, _list_nominees] call voting_nomination_menu_update_list;
	[_election_data, _list_players] call voting_nomination_menu_update_options;
};

voting_nomination_police_filter = {
	ARGV(0,_player)
	([_player] call player_cop)
};

voting_election_police_over = {
	ARGV(0,_election_data);
	ARGV(1,_first_place_votes);
	ARGV(2,_first_place_data);
	ARGV(3,_tie);
	
	private["_player"];
	_player = player;
		
	private["_election_id", "_election_title", "_election_role"];
	_election_id = _election_data select election_data_id;
	_election_title = _election_data select election_data_title;
	_election_role = _election_data select election_data_role;
	
	if (_first_place_votes == 0) exitWith {
		hint format["%1 election has ended with no votes cast. The current %2 stays.", _election_title, _election_role];
	};
	
	if (_tie) exitWith {
		hint format["%1 election has ended in a tie. The current %2 stays.", _election_title, _election_role];
	};
	
	private["_first_place_name", "_first_place_uid"];
	_first_place_name = _first_place_data select election_candidates_data_entry_name;
	_first_place_uid = _first_place_data select election_candidates_data_entry_uid;
	
	private["_player_uid"];
	_player_uid = getPlayerUID player;
	if (_player_uid == _first_place_uid) then {
		[_first_place_uid] call player_set_chief_uid;
		hint format["%1-%2, Congratutations!\n You have won the %3 election with %4 votes.", _player, (name _player), toLower(_election_title), _first_place_votes];
	}
	else {
		hint format["%1 has won the %2 election with %3 votes.", _first_place_name, toLower(_election_title), _first_place_votes];
	};
	
	
};

voting_nomination_menu_police = {
	[police_election_data] call voting_nomination_menu_create;
};

voting_nomination_menu_president = {
	[president_election_data] call voting_nomination_menu_create;
};


voting_menu_police = {
	[police_election_data] call voting_menu_create;
};

voting_menu_president = {
	[president_election_data] call voting_menu_create;
};


call voting_update_nominations_setup;
call voting_vote_candidate_setup;

voting_menu_functions_defined = true;
