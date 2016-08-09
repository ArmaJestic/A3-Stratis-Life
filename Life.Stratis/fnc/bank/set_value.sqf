// A_bank_fnc_set_value

#include "..\..\includes\macro.h"


ARGV(0,_player);
ARGV(1,_value);

if (!([_player] call A_player_fnc_human)) exitWith {null};
if (undefined(_value)) exitWith {null};
if (typeName _value != "SCALAR") exitWith {null};

_value = [_value] call A_encoding_fnc_encode_number;
[_player, "bankaccount", _value] call A_player_fnc_set_array;
