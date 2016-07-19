// A_misc_fnc_SayDirectSpeach

#include "..\..\includes\macro.h"

private ["_text", "_dis"];
_text = _this select 0;
_art = _this select 1;
if (not ((_text == "") or (_text == " ")) ) then {
	_text = format["%1-%2 shouts: %3", player, name player, _text];
	if (_art == "direct") then {
		_dis = 50;
		format ["
		if ((player distance %1) < %3) then {
			titleText[""%2"", ""PLAIN""];
		};
		", player, _text, _dis] call broadcast;
	};

	if (_art == "side") then {
		format ["%1 sideChat ""%2"";", player, _text] call broadcast;
	};

	if (_art == "global") then {
		format ["%1 globalChat ""%2"";", player, _text] call broadcast;
	};
};
