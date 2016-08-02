// A_loading_fnc_update_title

if (isServer) exitwith {};
	
private["_title"];
	
_title = _this select 0;
if (undefined(_title)) exitWith {null};
if (typeName _title != "STRING") exitWith {null};
	
startLoadingScreen[_title , "customLoadingScreen"];
[A_loading_var_progress] call A_loading_fnc_update_progress;
