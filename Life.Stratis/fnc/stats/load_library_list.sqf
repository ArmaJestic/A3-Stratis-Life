// A_stats_fnc_load_library_list

#include "..\..\includes\macro.h"

ARGV(0,_list);
ARGV(1,_title);
	
{
	private["_library", "_condition", "_arguments", "_file"];
	_library = _x;
	_condition = _library select A_stats_var_library_condition;
	_arguments = _library select A_stats_var_library_arguments;
	_file = _library select A_stats_var_library_file;
	
	[format["%1 ... %2/%3", _title, (_forEachIndex + 1), (count(_list))]] call A_stats_fnc_client_update_loading_title;
	diag_log format["%1 ... %2/%3", _title, (_forEachIndex + 1), (count(_list))];
	
	if ((call _condition)) then {
		private["_h"];
		_h = _arguments execVM _file;
		waitUntil {scriptDone _h};
	};
} forEach _list
