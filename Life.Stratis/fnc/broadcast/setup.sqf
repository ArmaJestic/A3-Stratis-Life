// A_broadcast_fnc_setup

#include "header.h"


params[["_player_number",null,[0]],["_player_count",null,[0]]];

if (UNDEFINED(_player_number)) exitWith {null};
if (UNDEFINED(_player_count)) exitWith {null};

for "_i" from 0 to _player_count do {
	private _variable_name = [_i] call A_broadcast_fnc_make_key;
	if (_i == _player_number) then {
		player_broadcast_buffer = _variable_name;
	};
	missionNamespace setVariable[_variable_name, ""];
	_variable_name addPublicVariableEventHandler A_broadcast_fnc_receive;
};