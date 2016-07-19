// A_player_fnc_escape_menu_check

#include "../../includes/macro.h"

 _this spawn {
if (not(isClient)) exitWith {null};
disableSerialization;
sleep 10;

while {true} do {
	waitUntil {not(isnull (findDisplay 49))};

	_ctrl = (findDisplay 49) displayCtrl 1010;
	_ctrl ctrlEnable false;
	//escape menu opened
	_enCtrl = [_ctrl] spawn {
		disableSerialization;
		ARGV(0,_ctrl);
		_stext = ctrlText _ctrl;
		private["_i"];
		_ctrl buttonSetAction "respawnButtonPressed = true;";
		for "_i" from 30 to 1 step -1 do {
			if (isnull (findDisplay 49)) exitWith {null};
			_text = _stext + format ["(%1)",_i]; _ctrl ctrlSetText _text;
			sleep 1;
		};
			
		if (!isnull (findDisplay 49)) then {
			_ctrl ctrlSetText _stext; 
			_ctrl ctrlEnable true;
		};
	};

	waitUntil {isNull (findDisplay 49)};
	//escape menu closed
	if (!scriptDone _enCtrl) then {
		terminate _enCtrl
	};
};
};
