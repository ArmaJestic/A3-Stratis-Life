// A_stats_fnc_compile

#include "header.h"


params[["_data",null,[[]]],["_object",null,[objNull]],["_sequential",null,[true]],["_loading",null,[true]]];

if (UNDEFINED(_data)) exitWith {null};
if (UNDEFINED(_object)) exitWith {null};
if (UNDEFINED(_sequential)) exitWith {null};
if (UNDEFINED(_loading)) exitWith {null};

private _entry = null;
{
	private _entry = _x;
	
	[_entry, _object] spawn A_stats_fnc_compile_entry;
	
	if (_loading) then {
		[format["Initializing %1/%2 client stats ... ", (_forEachIndex + 1), (count _data)]] call A_loading_fnc_update;
	};
	
	if (_sequential) then {
		//uses a time-out approach as opposed to just "CALLING" A_stats_fnc_compile_entry
		//this is so that compilation errors of a single stat entry do not affect compliation
		//of all other stats ... since the error happens in a separate thread
		[_entry, _object, 0.2] call A_stats_fnc_wait_entry;
	};
} forEach _data;