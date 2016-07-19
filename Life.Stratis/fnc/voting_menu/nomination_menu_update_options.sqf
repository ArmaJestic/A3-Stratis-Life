// A_voting_menu_fnc_nomination_menu_update_options

#include "..\..\includes\constants.h"
#include "..\..\includes\macro.h"


ARGV(0,_election_data);
ARGV(1,_list);

if (undefined(_election_data)) exitWith {};
if (undefined(_list)) exitWith {};

private["_my_index", "_player"];
_my_index = 0;
_player = player;

private["_filter_name", "_filter_function"];
_filter_name = _election_data select A_voting_menu_var_election_data_nomination_filter;
_filter_function = missionNamespace getVariable [_filter_name, {true}];


{if (true) then {
	private["_variable_name", "_variable_value"];
	_variable_name = _x;
	_variable_value = missionNamespace getVariable [_variable_name, null];
	if (not([_variable_value] call A_player_fnc_exists)) exitWith {};
	if (not([_variable_value] call _filter_function)) exitWith {};
	
	private["_index"];
	_index = _list lbAdd format["%1-%2", _variable_value, (name _variable_value)];
	_list lbSetData [_index, _variable_name];
	
	if (_variable_value == _player) then {
		_my_index = _index;
	};
};} forEach playerstringarray;

_list lbSetCurSel _my_index;
