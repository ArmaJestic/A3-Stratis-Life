// A_towing_fnc_line_cleanup_wait

#include "..\..\includes\constants.h"
#include "..\..\includes\macro.h"


ARGV(0,_towing_line);
if (undefined(_towing_line)) exitWith {};
if (typeName _towing_line != "OBJECT") exitWith {};
if (isNull _towing_line) exitWith {};

private["_towed", "_towing"];
//player groupChat format["A_towing_fnc_line_cleanup_wait[%1]: start", _towing_line];
waitUntil {
	sleep 1;
	_towed = _towing_line getVariable ["towed", null];
	_towing = _towing_line getVariable ["towing", null];
	
	if (undefined(_towed) && {undefined(_towing)}) exitWith {true};
	if (isNull _towed && {isNull _towing}) exitWith {true};
	if (!(alive _towed) && {!(alive _towing)}) exitWith {true};
	if ((_towed distance _towing) > 10) then {
		[_towing_line] call A_towing_fnc_line_clear_endpoints;
	};
	false
};

//player groupChat format["A_towing_fnc_line_cleanup_wait[%1]: stop", _towing_line];
deleteVehicle _towing_line;
