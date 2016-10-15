// A_misc_fnc_DialogPlayerList

#include "..\..\includes\macro.h"

private ["_control_id", "_show_civ", "_show_cop", "_show_ins", "_show_opf"];

_control_id = _this select 0;
_show_civ = _this select 1;
_show_cop = _this select 2;
_show_ins = _this select 3;
_show_opf = _this select 4;

if (UNDEFINED(_control_id)) exitWith {null};
if (typeName _control_id != "SCALAR") exitWith {null};

private["_index", "_my_index"];
_index = 0;
_my_index = -1;

private["_c"];
_c = 0;
while { _c <  (count A_player_var_playerstringarray) } do {
	private["_player_variable_name", "_player_variable"];
	
	_player_variable_name = A_player_var_playerstringarray select _c;
	_player_variable = missionNamespace getVariable [_player_variable_name, null];
	
	if (true) then {
		if (!([_player_variable] call A_player_fnc_exists)) exitWith {null};
		private["_is_civ", "_is_cop", "_is_ins", "_is_opf"];
		_is_civ = [_player_variable] call A_player_fnc_civilian;
		_is_cop = [_player_variable] call A_player_fnc_blufor;
		_is_ins = [_player_variable] call A_player_fnc_independent;
		_is_opf = [_player_variable] call A_player_fnc_opfor;
		
		if (_is_civ && !(_show_civ)) exitWith {null};
		if (_is_cop && !(_show_cop)) exitWith {null};
		if (_is_ins && !(_show_ins)) exitWith {null};
		if (_is_opf && !(_show_opf)) exitWith {null};
		
		private["_player_name"];
		_player_name = (name _player_variable);
		_index = lbAdd [_control_id, format ["%1 - (%2)", _player_variable_name, _player_name]];
		lbSetData [_control_id, _index, str(_player_variable)];
		
		if (_player_variable == player) then {
			_my_index = _index;
		};
	};
	_c = _c + 1;
};

 _my_index
