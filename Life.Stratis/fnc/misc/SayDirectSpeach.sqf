// A_misc_fnc_SayDirectSpeach

#include "..\..\includes\macro.h"

private ["_text", "_dis"];
_text = _this select 0;
_art = _this select 1;
if (!((_text == "")||(_text == " "))) then {
	_text = format["%1-%2 shouts: %3", player, name player, _text];
	if (_art == "direct") then {
		_dis = 50;
		format ["
		if ((player distance %1) < %3) then {
			cutText[""%2"", ""PLAIN""];
		};
		", player, _text, _dis] call A_broadcast_fnc_broadcast;
	};

	if (_art == "side") then {
		format ["%1 sideChat ""%2"";", player, _text] call A_broadcast_fnc_broadcast;
	};

	if (_art == "global") then {
		format ["%1 globalChat ""%2"";", player, _text] call A_broadcast_fnc_broadcast;
	};
};
