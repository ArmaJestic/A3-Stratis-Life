// A_broadcast_fnc_setup

#include "..\..\includes\macro.h"


private["_player_number", "_player_count"];

_player_number = _this select 0;
_player_count = _this select 1;

if (undefined(_player_number)) exitWith {null};
if (undefined(_player_count)) exitWith {null};
if (typeName _player_number != "SCALAR") exitWith {null};
if (typeName _player_count != "SCALAR") exitWith {null};


player_broadcast_buffer = [_player_number] call A_broadcast_fnc_make_key;

private["_i"];
_i = 0;
while { _i < _player_count } do {
	private["_variable_name"];
	_variable_name = [_i] call A_broadcast_fnc_make_key;
	missionNamespace setVariable [_variable_name, ""];
	_variable_name addPublicVariableEventHandler { _this call A_broadcast_fnc_receive;};
	_i = _i + 1;
};
