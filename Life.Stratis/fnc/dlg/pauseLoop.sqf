// A_dlg_fnc_pauseLoop
// not used anymore


disableSerialization;
params["_display","_ctrl","_text","_time"];
if (isNull _display) exitwith {};
if (_time <= 0) exitwith {
	_ctrl ctrlSetText _text;
	_ctrl ctrlEnable true;
};
_ctrl ctrlSetText format["%1(%2)",_text,_time];

[_display,_ctrl,_text,(_time-1)] call A_dlg_fnc_pauseLoopAdd;