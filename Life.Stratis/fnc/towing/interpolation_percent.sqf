// A_towing_fnc_interpolation_percent

#include "../../includes/constants.h"
#include "../../includes/macro.h"


ARGV(0,_speed);
ARGV(1,_angle);

private["_percent"];

if (_speed < 0) then {
	//going backwards
	_percent = 0.9999;
	if (_angle < 90) then {
		_percent = 1.001;
	};
}
else {
	//going forward
	_percent = 1;
	if (_angle != 0) then {
		_percent = 0.9999;
	};
};

_percent
