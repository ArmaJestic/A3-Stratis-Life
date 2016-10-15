// A_loading_fnc_update
// updates title and progress
//	for calling, 
//		0	title, if blank - will only update progress bar (a space can be used for a blank title)
//		1	progress, percent (0-1) to set update bar to

#include "header.h"


if (isServer) exitwith {};
if (A_loading_var_active) exitwith {};

params [["_title","",[""]],["_progress",0,[0]]];

if !(_title isEqualTo "") exitwith {
	A_loading_var_progress = _progress;
	[_title] call A_loading_fnc_update_title;
};
[_progress] call A_loading_fnc_update_progress;