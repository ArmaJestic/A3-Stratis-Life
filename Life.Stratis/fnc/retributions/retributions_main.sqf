// A_retributions_fnc_retributions_main

#include "..\..\includes\macro.h"


handling_retribution = if (undefined(handling_retribution)) then {false} else {handling_retribution};

_action = _this select 0;
switch _action do {
	case "open": {
		[] call A_retributions_fnc_open_retributions;
	};
	case "compensate": {
		if (handling_retribution) exitWith { hint "Cannot handle compensation request";};
		handling_retribution = true;
		[] call A_retributions_fnc_compensate_player;
		handling_retribution = false;
	};
	case "punish": {
		if (handling_retribution) exitWith { hint "Cannot handle punish request";};
		handling_retribution = true;
		[] call A_retributions_fnc_punish_player;
		handling_retribution = false;
	};
	case "forgive": {
		if (handling_retribution) exitWith { hint "Cannot handle forgiveness request";};
		handling_retribution = true;
		[] call A_retributions_fnc_forgive_player;
		handling_retribution = false;
	};
};
