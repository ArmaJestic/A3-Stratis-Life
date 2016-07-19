// A_bank_fnc_get_value

#include "..\..\includes\macro.h"


ARGV(0,_player);
if (not([_player] call A_player_fnc_human)) exitWith {0};

private ["_value"];
_value = [_player, "bankaccount"] call A_player_fnc_get_array;
_value = ([_value] call A_encoding_fnc_decode_number);
//player groupChat format["A_bank_fnc_get_value: bankaccount = %1, _value = %2", bankaccount, _value];
_value
