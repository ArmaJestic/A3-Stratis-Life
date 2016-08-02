// A_camera_menu_fnc_activate_command

#include "..\..\includes\macro.h"
#include "..\..\includes\constants.h"

 _this spawn {
//player groupChat format["A_camera_menu_fnc_activate_command %1", _this];
ARGV(0,_player);
ARGV(1,_command);
ARGV(2,_text);
ARGV(3,_target);


if (not([_player] call A_object_fnc_exists)) exitWith {null};

player groupChat format["_command = %1", _command];
if (undefined(_command)) exitWith {null};
if (typeName _command != "STRING") exitWith {null};

closeDialog 0;


_text = if (undefined(_text)) then {""} else {_text};
_text = if (typeName _text != "STRING") then {""} else {_text};


private["_code"];
_code = compile ( "_this call " + _command);
diag_log format["%1", _command];
[_player, _target, _text] spawn _code;
sleep 1;
hint "Code Activated";

};
