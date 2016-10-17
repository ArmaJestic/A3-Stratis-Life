// A_dlg_fnc_pause
// run on escape menu

#include "header.h"


disableSerialization;
params["_display"];

//private _ctrl = (findDisplay 49) displayCtrl 1010;
private _ctrlRespawn = _display displayCtrl 1010;
private _ctrlAbort = _display displayCtrl 104;

_ctrlRespawn ctrlEnable false;
_ctrlAbort ctrlEnable false;

_ctrlRespawn buttonSetAction 'missionNamespace setVariable["respawnButtonPressed",true];';

private _textRespawn = ctrlText _ctrlRespawn;
private _textAbort = ctrlText _ctrlAbort;
// todo: calculate/get value for delay value
// or for getting current difference
// example: delay set to 60, but resets back to 30
// dont need to display its at 60 each time the menu is opened
// just have the delay below account for the difference
// note: executes in own namespace, remeber to use missionNamespace
private _respawnDelay = 15;

// cannot access missionNamespace
// security issue with pulling function via string
// could have function named verified via config checks, too much work atm

private _start = diag_tickTime;
private _end = _start + _respawnDelay;
private _time = 0;

while {(diag_tickTime <= _end)&&{!isNull _display}} do {
	_time = floor(_end - diag_tickTime);
	_time = 0 max _time;
	
	_ctrlRespawn ctrlSetText format["%1(%2)",_textRespawn,_time];
	_ctrlAbort ctrlSetText format["%1(%2)",_textAbort,_time];
	
	_time=diag_tickTime+1;
	waitUntil{(diag_tickTime >= _time)||{isNull _display}};
};

if (isNull _display) exitwith {};

_ctrlRespawn ctrlSetText _textRespawn;
_ctrlRespawn ctrlEnable true;

_ctrlAbort ctrlSetText _textAbort;
_ctrlAbort ctrlEnable true;
