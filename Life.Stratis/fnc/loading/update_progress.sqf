// A_loading_fnc_update_progress

private["_progress"];
	
_progress = _this select 0;
	
if (undefined(_progress)) exitWith {null};
if (typeName _progress != "SCALAR") exitWith {null};
if (_progress < 0 || _progress > 1) exitWith {null};
	
loading_progress = _progress;
progressLoadingScreen _progress;
