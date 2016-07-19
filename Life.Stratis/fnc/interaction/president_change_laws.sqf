// A_interaction_fnc_president_change_laws

#include "../../includes/macro.h"
#include "../../includes/constants.h"
#include "../../includes/dikcodes.h"


ARGV(0,_number);
ARGV(1,_text);

if (undefined(_number)) exitWith {null};
if (typeName _number != "SCALAR") exitWith {null};

if (undefined(_text)) exitWith {null};
if (typeName _text != "STRING") exitWith {null};

if (_number == -1) exitWith {null};

private["_text_length"];

_text_length = [_text] call A_misc_fnc_strlen;
if (_text_length > 60) exitWith {
	player groupChat "The text for this law is too long";
};

legislation_laws set [_number, _text]; 
publicVariable "legislation_laws";

private["_message"];
_message = format["Law #%1 has changed.\n%2", _number, _text];
format['hint toString(%1);', toArray(_message)] call broadcast;
