// A_speed_gun_fnc_hud_setup

#include "..\..\includes\constants.h"
#include "..\..\includes\macro.h"


disableSerialization;
11 cutRsc ["speed_gun_hud", "PLAIN", 1e+011, false];

private["_display"];
_display = uiNamespace getVariable "speed_gun_hud";

_speed_gun_background = _display displayCtrl speed_gun_background_idc;
_speed_gun_digit0 = _display displayCtrl speed_gun_digit0_idc;
_speed_gun_digit1 = _display displayCtrl speed_gun_digit1_idc;
_speed_gun_digit2 = _display displayCtrl speed_gun_digit2_idc;
_speed_gun_cursor = _display displayCtrl speed_gun_cursor_idc;

//preload the digits (to avoid flickering)
[] spawn {
	private["_i"];
	_i = 0;
	while {_i < 10} do {
		[_i] call A_speed_gun_fnc_hud_update;
		_i = _i + 1;
	};
	[0] call A_speed_gun_fnc_hud_update;
};

private["_x", "_y"];
_x = safezoneX + 0.12;
_y = safezoneY + 0.12;
_speed_gun_background ctrlSetPosition [_x,_y, 0.26, 0.26];
_speed_gun_background ctrlSetText "img\speedgun.paa";
_speed_gun_background ctrlCommit 0;

private["_d0x", "_d0y", "_dw", "_dh"];
_d0x = _x + 0.12 ;
_d0y = _y + 0.071;
_dw = 0.04;
_dh = 0.06;

_speed_gun_digit0 ctrlSetPosition [_d0x, _d0y, _dw, _dh];
_speed_gun_digit0 ctrlSetTextColor  [0.52, 0.22, 0.16, 1];
_speed_gun_digit0 ctrlSetText HUD_DIGIT_IMAGE(0);
_speed_gun_digit0 ctrlCommit 0;

private["_d1x", "_d1y"];
_d1x = _d0x + 0.013;
_d1y = _d0y;

_speed_gun_digit1 ctrlSetPosition [_d1x, _d1y, _dw, _dh];
_speed_gun_digit1 ctrlSetTextColor  [0.52, 0.22, 0.16, 1];
_speed_gun_digit1 ctrlSetText HUD_DIGIT_IMAGE(0);
_speed_gun_digit1 ctrlCommit 0;

private["_d2x", "_d2y"];
_d2x = _d1x + 0.013;
_d2y = _d1y;

_speed_gun_digit2 ctrlSetPosition [_d2x, _d2y, _dw, _dh];
_speed_gun_digit2 ctrlSetTextColor  [0.52, 0.22, 0.16, 1];
_speed_gun_digit2 ctrlSetText HUD_DIGIT_IMAGE(0);
_speed_gun_digit2 ctrlCommit 0;

private["_scx", "_scy", "_scw", "_sch"];
_scx = 0.5;
_scy = 0.5;
_scw = 0.13;
_sch = 0.13;

player groupChat format["Setting up!"];
_speed_gun_cursor ctrlSetPosition [_scx - 0.065, _scy - 0.065, _scw, _sch];
_speed_gun_cursor ctrlSetText "\a3\ui_f\data\IGUI\Cfg\WeaponCursors\throw_gs.paa";
_speed_gun_cursor ctrlCommit 0;
