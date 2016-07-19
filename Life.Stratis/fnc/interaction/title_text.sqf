// A_interaction_fnc_title_text

#include "../../includes/macro.h"
#include "../../includes/constants.h"
#include "../../includes/dikcodes.h"


ARGV(0,_message);
ARGV(1,_type);
ARGV(2,_speed);

if (undefined(_message)) exitWith {};
if (undefined(_type)) then {
	_type = "PLAIN";
};

if (undefined(_speed)) then {
	_speed = 1;
};

if (typeName _message != "STRING") exitWith {};	
if (typeName _type != "STRING") exitWith {};
if (typeName _speed != "SCALAR") exitWith {};

titleText[_message, _type, _speed];
