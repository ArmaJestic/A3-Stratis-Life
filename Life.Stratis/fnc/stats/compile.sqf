// A_stats_fnc_compile

#include "..\..\includes\macro.h"

private["_data", "_object", "_sequential", "_loading"];
_data = _this select 0;
_object = _this select 1;
_sequential = _this select 2;
_loading = _this select 3;

if (undefined(_data)) exitWith {null};
if (typeName _data != "ARRAY") exitWith {null};

if (undefined(_object)) exitWith {null};
if (typeName _object != "OBJECT") exitWith {null};

if (undefined(_sequential)) exitWith {null};
if (typeName _sequential != "BOOL") exitWith {null};

if (undefined(_loading)) exitWith {null};
if (typeName _loading != "BOOL") exitWith {null};


private["_i", "_count"];

_count = count _data;
_i = 0;
while { _i < _count } do {
	private["_entry"];
	_entry = _data select _i;
	
	[_entry, _object] spawn A_stats_fnc_compile_entry;
	
	if (_loading) then {
		[format["Initializing %1/%2 client stats ... ", (_i + 1), (count _data)]] call A_stats_fnc_client_update_loading_title;
	};
	
	if (_sequential) then {
		//uses a time-out approach as opposed to just "CALLING" A_stats_fnc_compile_entry
		//this is so that compilation errors of a single stat entry do not affect compliation
		//of all other stats ... since the error happens in a separate thread
		[_entry, _object, 0.2] call A_stats_fnc_wait_entry;
	};
	_i = _i + 1;
};
