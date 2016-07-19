// A_speed_gun_fnc_hud_update

#include "../../includes/constants.h"
#include "../../includes/macro.h"


disableSerialization;
ARGV(0,_value);
if (undefined(_value)) exitWith {};
if (typeName _value != "SCALAR") exitWith {};

_value = round(_value);

_d2 = floor(_value % 10);
_d1 = floor((_value % 100) / 10);
_d0 = floor((_value % 1000) / 100);

private["_display"];
_display = uiNamespace getVariable "speed_gun_hud";

_speed_gun_digit0 = _display displayCtrl speed_gun_digit0_idc;
_speed_gun_digit1 = _display displayCtrl speed_gun_digit1_idc;
_speed_gun_digit2 = _display displayCtrl speed_gun_digit2_idc;


_speed_gun_digit0 ctrlSetText HUD_DIGIT_IMAGE(_d0);
_speed_gun_digit0 ctrlCommit 0;

_speed_gun_digit1 ctrlSetText HUD_DIGIT_IMAGE(_d1);
_speed_gun_digit1 ctrlCommit 0;

_speed_gun_digit2 ctrlSetText HUD_DIGIT_IMAGE(_d2);
_speed_gun_digit2 ctrlCommit 0;
