// A_misc_fnc_Isse_AddCrimeLogEntry

#include "..\..\includes\macro.h"

private ["_logtime", "_logdate", "_logtext", "_logart", "_logplayer", "_zusatzinfo"];

_logart = _this select 0;
_logplayer = format["%1", _this select 1];
_zusatzinfo = "";

if (count _this > 2) then {
	_zusatzinfo = _this select 2
};

_logtime = time;
_logdate = date;
_logtext = "";
	
switch (_logart) do {
	case "Bank": {
		_logtext = format[localize "STRS_functions_crimelog_msg1", _zusatzinfo];
	};
	case "Stole": {
		_logtext = format[localize "STRS_functions_crimelog_msg2"];
	};
	case "KilledCiv": {
		_logtext = format[localize "STRS_functions_crimelog_msg3", _zusatzinfo];
	};
	case "KilledCop": {
		_logtext = format[localize "STRS_functions_crimelog_msg4", _zusatzinfo];
	};
	case "KilledWorker": {
		_logtext = format[localize "STRS_functions_crimelog_msg13", _zusatzinfo];
	};
	case "PrisonIn": {
		_logtext = format[localize "STRS_functions_crimelog_msg5"];
	};
	case "PrisonOut": {
		_logtext = format[localize "STRS_functions_crimelog_msg6"];
	};
	case "PrisonEsc": {
		_logtext = format[localize "STRS_functions_crimelog_msg7"];
	};
	case "Died": {
		_logtext = format[localize "STRS_functions_crimelog_msg8"];
	};
	case "Ticket": {
		_logtext = format[localize "STRS_functions_crimelog_msg9", _zusatzinfo];
	};
	case "Bomb": {
		_logtext = format[localize "STRS_functions_crimelog_msg10"];
	};
	case "slave": {
		_logtext = format[localize "STRS_functions_crimelog_msg11"];
	};
	case "Speed": {
		_logtext = format[localize "STRS_functions_crimelog_msg12"];
	};
	case "StoleVcl": {
		_logtext = format[localize "STRS_functions_crimelog_msg13", _zusatzinfo];
	};
	case "AttemptedStoleVcl": {
		_logtext = format[localize "STRS_functions_crimelog_msg14", _zusatzinfo];
	};
	case "Assassin": {
		_logtext = format[localize "STRS_functions_crimelog_msg15"];
	};
	case "Ill_PMC": {
		_logtext = format["Illegal PMC"];
	};
};
A_main_var_coplog = A_main_var_coplog + [ [_logplayer, _logtext, _logdate, _logtime] ];
