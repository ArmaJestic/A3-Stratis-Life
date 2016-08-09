// A_bank_fnc_transaction

#include "..\..\includes\macro.h"


ARGV(0,_player);
ARGV(1,_value);

if (!([_player] call A_player_fnc_human)) exitWith {0};
if (undefined(_value)) exitWith {0};
if (typeName _value != "SCALAR") exitWith {0};


private["_cvalue"];
_cvalue = [_player] call A_bank_fnc_get_value;
_cvalue = _cvalue + _value;
[_player, _cvalue] call A_bank_fnc_set_value;
_cvalue
