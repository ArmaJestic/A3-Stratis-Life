// A_gang_fnc_area_actions_setup

#include "..\..\includes\macro.h"


ARGV(0,_player);
if (!([_player] call A_player_fnc_human)) exitWith {null};

//Setup actions for Gang Area 1
private["_ga1_actions", "_ga1_lsd_action", "_ga1_cocaine_action", 
		"_ga1_capture_action", "_ga1_neutralise_action", 
		"_ga1_shop_action"];

_ga1_actions  = [];
_ga1_lsd_action = [];
_ga1_lsd_action set [A_gang_var_area_action_text, "Process LSD"];
_ga1_lsd_action set [A_gang_var_area_action_code,  format['[%1, "Unprocessed_LSD", "lsd", 5] call A_interaction_fnc_item_process;', _player]];
_ga1_lsd_action set [A_gang_var_area_action_condition, format['([%1] call A_player_fnc_gang_member) && ([%1, %2] call A_gang_fnc_area_owned) && ([%1, "%3"] call A_player_fnc_has_license)', _player, gangarea1, "lsd ga1"]];

_ga1_cocaine_action = [];
_ga1_cocaine_action set [A_gang_var_area_action_text, "Process Cocaine"];
_ga1_cocaine_action set [A_gang_var_area_action_code,  format['[%1, "Unprocessed_Cocaine", "cocaine", 5] call A_interaction_fnc_item_process;', _player]];
_ga1_cocaine_action set 
[
	A_gang_var_area_action_condition, 
	format['([%1] call A_player_fnc_gang_member) && ([%1, %2] call A_gang_fnc_area_owned) && ([%1, "%3"] call A_player_fnc_has_license)', _player, gangarea1, "cocaine ga1"]
];

_ga1_capture_action = [];
_ga1_capture_action set [A_gang_var_area_action_text, "Capture"];
_ga1_capture_action set [A_gang_var_area_action_code,  format['[%1, %2] call A_interaction_fnc_gang_area_capture;', _player, gangarea1]];
_ga1_capture_action set 
[
	A_gang_var_area_action_condition, 
	format['([%1] call A_player_fnc_gang_member) && ([%2] call A_gang_fnc_area_neutral) && !(A_interaction_var_gang_animation)', _player, gangarea1]
];

_ga1_neutralise_action = [];
_ga1_neutralise_action set [A_gang_var_area_action_text, "Neutralise"];
_ga1_neutralise_action set [A_gang_var_area_action_code,  format['[%1, %2] call A_interaction_fnc_gang_area_neutralise;',_player, gangarea1]];
_ga1_neutralise_action set 
[
	A_gang_var_area_action_condition, 
	format['([%1] call A_player_fnc_gang_member) && !([%2] call A_gang_fnc_area_neutral) && !([%1, %2] call A_gang_fnc_area_owned) && !(A_interaction_var_gang_animation)', _player, gangarea1]
];

_ga1_shop_action = [];
_ga1_shop_action set [A_gang_var_area_action_text, "Gang Shop"];
_ga1_shop_action set [A_gang_var_area_action_code,  format['[(%1 call A_inventory_fnc_get_shop_number)] call A_shop_menu_fnc_open_dialog;', gangarea1]];
_ga1_shop_action set [A_gang_var_area_action_condition, format['([%1] call A_player_fnc_gang_member) && ([%1, %2] call A_gang_fnc_area_owned)', _player, gangarea1]];

_ga1_actions = [_ga1_lsd_action, _ga1_cocaine_action, _ga1_capture_action, _ga1_neutralise_action, _ga1_shop_action];
 [gangarea1, "actions", _ga1_actions] call A_object_fnc_setVariable;

//Setup actions for Gang Area 2
private["_ga2_actions", "_ga2_lsd_action", "_ga2_heroin_action", 
		"_ga2_capture_action", "_ga2_neutralise_action", 
		"_ga2_shop_action"];

_ga2_actions  = [];
_ga2_lsd_action = [];
_ga2_lsd_action set [A_gang_var_area_action_text, "Process LSD"];
_ga2_lsd_action set [A_gang_var_area_action_code,  format['[%1, "Unprocessed_LSD", "lsd", 5] call A_interaction_fnc_item_process;', _player]];
_ga2_lsd_action set 
[
	A_gang_var_area_action_condition, 
	format['([%1] call A_player_fnc_gang_member) && ([%1, %2] call A_gang_fnc_area_owned) && ([%1, "%3"] call A_player_fnc_has_license)', _player, gangarea2, "lsd ga2"]
];

_ga2_heroin_action = [];
_ga2_heroin_action set [A_gang_var_area_action_text, "Process Heroin"];
_ga2_heroin_action set [A_gang_var_area_action_code,  format['[%1, "Unprocessed_Heroin", "heroin", 5] call A_interaction_fnc_item_process;', _player]];
_ga2_heroin_action set 
[
	A_gang_var_area_action_condition, 
	format['([%1] call A_player_fnc_gang_member) && ([%1, %2] call A_gang_fnc_area_owned) && ([%1, "%3"] call A_player_fnc_has_license)', _player, gangarea2, "heroin ga2"]
];

_ga2_capture_action = [];
_ga2_capture_action set [A_gang_var_area_action_text, "Capture"];
_ga2_capture_action set [A_gang_var_area_action_code,  format['[%1, %2] call A_interaction_fnc_gang_area_capture;', _player, gangarea2]];
_ga2_capture_action set 
[
	A_gang_var_area_action_condition, 
	format['([%1] call A_player_fnc_gang_member) &&  ([%2] call A_gang_fnc_area_neutral) && !(A_interaction_var_gang_animation)', _player, gangarea2]
];

_ga2_neutralise_action = [];
_ga2_neutralise_action set [A_gang_var_area_action_text, "Neutralise"];
_ga2_neutralise_action set [A_gang_var_area_action_code,  format['[%1, %2] call A_interaction_fnc_gang_area_neutralise;', _player, gangarea2]];
_ga2_neutralise_action set 
[
	A_gang_var_area_action_condition, 
	format['([%1] call A_player_fnc_gang_member) &&  !([%2] call A_gang_fnc_area_neutral) && !([%1, %2] call A_gang_fnc_area_owned) && !(A_interaction_var_gang_animation)', _player, gangarea2]
];

_ga2_shop_action = [];
_ga2_shop_action set [A_gang_var_area_action_text, "Gang Shop"];
_ga2_shop_action set [A_gang_var_area_action_code,  format['[(%1 call A_inventory_fnc_get_shop_number)] call A_shop_menu_fnc_open_dialog;', gangarea2]];
//player groupChat format["GA2: %1", format['[(%1 call A_inventory_fnc_get_shop_number)] call A_shop_menu_fnc_open_dialog;', gangarea2]];
_ga2_shop_action set [A_gang_var_area_action_condition, format['([%1] call A_player_fnc_gang_member) && ([%1, %2] call A_gang_fnc_area_owned)', _player, gangarea2]];

_ga2_actions = [_ga2_lsd_action, _ga2_heroin_action, _ga2_capture_action, _ga2_neutralise_action, _ga2_shop_action];
[gangarea2, "actions", _ga2_actions] call A_object_fnc_setVariable;

//Setup actions for Gang Area 3
private["_ga3_actions", "_ga3_marijuana_action", "_ga3_heroin_action", 
		"_ga3_capture_action", "_ga3_neutralise_action", 
		"_ga3_shop_action"];

_ga3_actions  = [];
_ga3_marijuana_action = [];
_ga3_marijuana_action set [A_gang_var_area_action_text, "Process Marijuana"];
_ga3_marijuana_action set [A_gang_var_area_action_code,  format['[%1, "Unprocessed_Marijuana", "marijuana", 5] call A_interaction_fnc_item_process;', _player]];
_ga3_marijuana_action set 
[
	A_gang_var_area_action_condition, 
	format['([%1] call A_player_fnc_gang_member) && ([%1, %2] call A_gang_fnc_area_owned) && ([%1, "%3"] call A_player_fnc_has_license)', _player, gangarea3, "marijuana ga3"]
];

_ga3_heroin_action = [];
_ga3_heroin_action set [A_gang_var_area_action_text, "Process Heroin"];
_ga3_heroin_action set [A_gang_var_area_action_code,  format['[%1, "Unprocessed_Heroin", "heroin", 5] call A_interaction_fnc_item_process;', _player]];
_ga3_heroin_action set 
[
	A_gang_var_area_action_condition, 
	format['([%1] call A_player_fnc_gang_member) && ([%1, %2] call A_gang_fnc_area_owned) && ([%1, "%3"] call A_player_fnc_has_license)', _player, gangarea3, "heroin ga3"]
];

_ga3_capture_action = [];
_ga3_capture_action set [A_gang_var_area_action_text, "Capture"];
_ga3_capture_action set [A_gang_var_area_action_code,  format['[%1, %2] call A_interaction_fnc_gang_area_capture;', _player, gangarea3]];
_ga3_capture_action set [A_gang_var_area_action_condition, format['([%1] call A_player_fnc_gang_member) && ([%2] call A_gang_fnc_area_neutral) && !(A_interaction_var_gang_animation)',_player, gangarea3]];

_ga3_neutralise_action = [];
_ga3_neutralise_action set [A_gang_var_area_action_text, "Neutralise"];
_ga3_neutralise_action set [A_gang_var_area_action_code,  format['[%1, %2] call A_interaction_fnc_gang_area_neutralise;', _player,gangarea3]];
_ga3_neutralise_action set 
[
	A_gang_var_area_action_condition, 
	format['([%1] call A_player_fnc_gang_member) && !([%2] call A_gang_fnc_area_neutral) && !([%1, %2] call A_gang_fnc_area_owned) && !(A_interaction_var_gang_animation)',_player, gangarea3]
];

_ga3_shop_action = [];
_ga3_shop_action set [A_gang_var_area_action_text, "Gang Shop"];
_ga3_shop_action set [A_gang_var_area_action_code,  format['[(%1 call A_inventory_fnc_get_shop_number)] call A_shop_menu_fnc_open_dialog;', gangarea3]];
_ga3_shop_action set [A_gang_var_area_action_condition, format['([%1] call A_player_fnc_gang_member) && ([%1, %2] call A_gang_fnc_area_owned)',_player, gangarea3]];

_ga3_actions = [_ga3_marijuana_action, _ga3_heroin_action, _ga3_capture_action, _ga3_neutralise_action, _ga3_shop_action];
[gangarea3, "actions", _ga3_actions] call A_object_fnc_setVariable;
