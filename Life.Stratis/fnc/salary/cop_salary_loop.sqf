// A_salary_fnc_cop_salary_loop

#include "..\..\includes\macro.h"


params[["_delayBase",5,[0]],["_delay",6,[0]]];

if (!isblu) exitwith {};
if (_delay == 0) then {
	call A_salary_fnc_cop_salary_handout;
	_delay = _delayBase + 1;
}else{
	if (_delay < _delayBase) then {
		player groupChat format[localize "STRS_moneh_countdown", _delay];
	};
};

[60,[_delayBase,_delay-1],A_salary_fnc_cop_salary_loop] call A_frame_fnc_wait;