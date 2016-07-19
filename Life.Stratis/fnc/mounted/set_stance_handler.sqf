// A_mounted_fnc_set_stance_handler

#include "../../includes/macro.h"
#include "../../includes/dikcodes.h"


ARGV(0,_player);
ARGV(1,_sequence);
player groupChat format["_player = %1, _sequence = %2", _player, _sequence];

private["_i"];
_i = 10;
while {_i > 0 } do {
	_player switchAction "AdjustF";
	_i = _i - 1;
};

{
	_player switchAction _x;
} forEach _sequence;
