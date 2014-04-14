#include "macro.h"

if (!undefined(bank_functions_defined)) exitWith {null};

bank_get_value = {
	ARGV(0,_player);
	if (not([_player] call player_human)) exitWith {0};
	
	private ["_value"];
	_value = [_player, "bankaccount"] call player_get_array;
	_value = ([_value] call decode_number);
	//player groupChat format["bank_get_value: bankaccount = %1, _value = %2", bankaccount, _value];
	_value
};

bank_set_value = {
	ARGV(0,_player);
	ARGV(1,_value);
	
	if (not([_player] call player_human)) exitWith {null};
	if (undefined(_value)) exitWith {null};
	if (typeName _value != "SCALAR") exitWith {null};
	
	_value = [_value] call encode_number;
	[_player, "bankaccount", _value] call player_set_array;
};


bank_transaction = {
	ARGV(0,_player);
	ARGV(1,_value);
	
	if (not([_player] call player_human)) exitWith {0};
	if (undefined(_value)) exitWith {0};
	if (typeName _value != "SCALAR") exitWith {0};
	

	private["_cvalue"];
	_cvalue = [_player] call bank_get_value;
	_cvalue = _cvalue + _value;
	[_player, _cvalue] call bank_set_value;
	_cvalue
};

bank_functions_defined = true;