// A_server_fnc_loop

#include "..\..\includes\macro.h"


private["_server_loop_i", "_sleep"];
_sleep = 10;
_server_loop_i = 0;
while {_server_loop_i < 5000} do {
	//check the AI vendors, and make sur ethey are in the server group
	{
		if ((group _x) != (group server)) then {
			[_x] joinSilent (group server);
		};
	} forEach ai_vendors;
		
	private["_groups"];
	_groups = allGroups;

	//look out for empty groups
	{
		private["_group", "_units", "_count"];
		_group = _x;
		_units = units _group;
		_count = count _units;
		if (_count <= 0) then {[_group] call A_server_fnc_delete_group;};	
	} forEach _groups;
	
	_server_loop_i = _server_loop_i + 1;
	sleep _sleep;
};

[] spawn A_server_fnc_loop;
