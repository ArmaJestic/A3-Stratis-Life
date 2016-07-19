#include "includes\macro.h"

broadcast_make_key = {
	private["_id"];
	_id = _this select 0;
	if (undefined(_id)) exitWith {null};
	if (typeName _id != "SCALAR") exitWith {null};
	format["ISSE_pub_Pstr_%1",_id];
};

broadcast_receive = {
	private["_value"];
	_code = _this select 1;
	if (undefined(_code)) exitWith {null};
	if (typeName _code != "STRING") exitWith {null};
	call compile _code;
};

broadcast = {
	private["_code"];
	_code = _this;
	if (undefined(_code)) exitWith {null};
	if (typeName _code != "STRING") exitWith {null};
	
	missionNamespace setVariable [player_broadcast_buffer, _code];
	publicVariable player_broadcast_buffer;
	call compile _code;
};

broadcast_setup = {
	private["_player_number", "_player_count"];
	
	_player_number = _this select 0;
	_player_count = _this select 1;
	
	if (undefined(_player_number)) exitWith {null};
	if (undefined(_player_count)) exitWith {null};
	if (typeName _player_number != "SCALAR") exitWith {null};
	if (typeName _player_count != "SCALAR") exitWith {null};
	
	
	player_broadcast_buffer = [_player_number] call broadcast_make_key;
	
	private["_i"];
	_i = 0;
	while { _i < _player_count } do {
		private["_variable_name"];
		_variable_name = [_i] call broadcast_make_key;
		missionNamespace setVariable [_variable_name, ""];
		_variable_name addPublicVariableEventHandler { _this call broadcast_receive;};
		_i = _i + 1;
	};
};

[rolenumber, (count playerstringarray)] call broadcast_setup;
