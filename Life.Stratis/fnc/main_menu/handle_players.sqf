// A_main_menu_fnc_handle_players

#include "header.h"


ARGV(0,_title);
private["_list"];
_list = [toUpper(_title), 0.14, 0.14, 0.6, 0.7] call A_main_menu_fnc_right_setup;
lbClear (ctrlIDC _list);

private ["_i"];
_i = 0;
while { _i < (count A_player_var_playerstringarray) } do {
	private["_player", "_player_variable_name"];
	_player_variable_name = A_player_var_playerstringarray select _i;
	_player = missionNamespace getVariable [_player_variable_name, null];
	
	if ([_player] call A_player_fnc_human) then {
		private["_label_text", "_index"];
		_label_text =  format ["%1: %2", _player, (name _player)];
		_index = _list lbAdd _label_text;
		private["_wanted"];
		if (!([_player] call A_player_fnc_blufor) && ([_player] call A_player_fnc_get_bounty) > 0) then {
			_list lbSetColor [_index, [1, 0, 0, 1]];
		};
	};
	_i = _i + 1;
};
