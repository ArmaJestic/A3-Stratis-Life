// A_main_menu_fnc_handle_crimes

#include "header.h"


ARGV(0,_title);
private["_list"];
_list = [toUpper(_title), 0.14, 0.14, 0.6, 0.7] call A_main_menu_fnc_right_setup;
lbClear (ctrlIDC _list);

private["_i"];
_i = 0;
while { _i < (count A_player_var_playerstringarray) } do {
	private["_player_variable_name", "_player_variable"];
	_player_variable_name = A_player_var_playerstringarray select _i;
	_player_variable = missionNamespace getVariable [_player_variable_name, null];

	if (!([_player_variable] call A_player_fnc_blufor) && ([_player_variable] call A_player_fnc_get_wanted)) then {
		private["_bounty", "_reasons"];
		_reasons = [_player_variable] call A_player_fnc_get_reason; 
		_bounty = [_player_variable] call A_player_fnc_get_bounty;
		
		_list lbAdd (format ["%1 (Bounty: $%3): %2 is wanted for %4 crime/s:", _player_variable, (name _player_variable), strM(_bounty), (count _reasons)]);
		private["_j", "_count"];
		_j = 0;
		while { _j < (count _reasons) } do {
			private["_reason"];
			_reason = _reasons select _j;
			_list lbAdd (format ["    %1. %2", (_j + 1), _reason]); 
			_j = _j + 1;
		};
		_list lbAdd _trennlinie;
	};
	_i = _i + 1;
};
