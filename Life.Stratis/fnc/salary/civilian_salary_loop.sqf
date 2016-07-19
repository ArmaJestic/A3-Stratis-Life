// A_salary_fnc_civilian_salary_loop

#include "..\..\includes\macro.h"


if (isblu) exitWith {null};

private["_i", "_salary_delay"];
_salary_delay = 5;
_i = _salary_delay;
while { _i > 0 && not(isblu) } do {
	player groupChat format[localize "STRS_moneh_countdown", _i];
	[60] call A_player_fnc_isleep;
	_i = _i - 1;
};
if (isblu) exitWith {null};

[] spawn A_salary_fnc_civilian_salary_handout;
[1] call A_player_fnc_isleep;
[] spawn A_salary_fnc_civilian_salary_loop;
