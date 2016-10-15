// A_dlg_fnc_pause
// run on escape menu


disableSerialization;
params["_display"];

//private _ctrl = (findDisplay 49) displayCtrl 1010;
private _ctrl = _display displayCtrl 1010;
_ctrl ctrlEnable false;
_ctrl buttonSetAction 'missionNamespace setVariable["respawnButtonPressed",true];';

private _text = ctrlText _ctrl;
// todo: calculate/get value for delay value
// or for getting current difference
// example: delay set to 60, but resets back to 30
// dont need to display its at 60 each time the menu is opened
// just have the delay below account for the difference
// note: executes in own namespace, remeber to use missionNamespace
private _respawnDelay = 30;

// cannot access missionNamespace
// security issue with pulling function via string
// could have function named verified via config checks, too much work atm
//[_display,_ctrl,_text,_respawnDelay] call A_dlg_fnc_pauseLoopAdd;

// still cannot do this as it would have to access the missionNamespace
/*
[1,[_display,_ctrl,_text,_respawnDelay,diag_tickTime],{!(isNull (_this select 0)) && {(diag_tickTime - (_this select 4)) >= (_this select 3)}},{
	// loop code
	disableSerialization;
	params["_display","_ctrl","_text","_respawnDelay","_startTime"];
	if (isNull _display) exitwith {};
	if (isNull _ctrl) exitwith {};
	private _time = floor(diag_tickTime - _startTime);
	_time = 0 max _time;
	_ctrl ctrlSetText format["%1(%2)",_text,_time];
},{
	// exit code
	disableSerialization;
	params["_display","_ctrl","_text","_respawnDelay","_startTime"];
	if (isNull _display) exitwith {};
	if (isNull _ctrl) exitwith {};
	_ctrl ctrlSetText _text;
	_ctrl ctrlEnable true;
}] call A_frame_fnc_while;
*/

private _start = diag_tickTime;
private _end = _start + _respawnDelay;
private _time = 0;

while {(diag_tickTime <= _end)&&{!isNull _display}&&{!isNull _ctrl}} do {
	_time = floor(_end - diag_tickTime);
	_time = 0 max _time;
	
	_ctrl ctrlSetText format["%1(%2)",_text,_time];
	
	_time=diag_tickTime+1;
	waitUntil{(diag_tickTime >= _time)||{isNull _display}||{isNull _ctrl}};
};

if (isNull _display) exitwith {};
if (isNull _ctrl) exitwith {};

_ctrl ctrlSetText _text;
_ctrl ctrlEnable true;
