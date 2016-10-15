// A_interaction_fnc_mobile_use

#include "header.h"


[] call A_mobile_menu_fnc_setup;

//populate the list of player
{
	private["_variable_name", "_variable_value"];
	_variable_name = _x;
	_variable_value = missionNamespace getVariable [_variable_name, null];
	
	if ([_variable_value] call A_player_fnc_exists) then {
		player groupChat format["_variable_value = %1", _variable_value];
		private["_index"];
		_index = lbAdd[mobile_players_field_idc, format["%1 - (%2)", _variable_value, (name _variable_value)]];
		lbSetData [mobile_players_field_idc, _index, _variable_name];
		if (_index == 0) then {
			lbSetCurSel [mobile_players_field_idc, _index];
		};
	};
} forEach A_player_var_playerstringarray;
