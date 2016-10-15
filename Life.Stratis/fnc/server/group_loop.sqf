// A_server_fnc_group_loop
// wasn't used in last version

#include "header.h"


//check the AI vendors, and make sure they are in the server group
{
	if ((group _x) != (group server)) then {
		[_x] joinSilent (group server);
	};
} forEach ai_vendors;

//look out for empty groups
{
	private _group = _x;
	private _units = units _group;
	private _count = count _units;
	if (_count <= 0) then {[_group] call A_server_fnc_delete_group;};	
} forEach allGroups;