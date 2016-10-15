// A_convoy_fnc_state2str

#include "header.h"



ARGV(0,_state);

if (_state == CONVOY_ST_UNKNOWN) exitWith {"CONVOY_ST_UNKNOWN"};
if (_state == CONVOY_ST_INITIAL) exitWith {"CONVOY_ST_INITIAL"};
if (_state == CONVOY_ST_STUCK) exitWith {"CONVOY_ST_STUCK"};
if (_state == CONVOY_ST_MOVING) exitWith {"CONVOY_ST_MOVING"};
"INVALID"
