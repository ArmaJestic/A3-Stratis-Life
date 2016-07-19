// A_interaction_fnc_chat

#include "..\..\includes\macro.h"
#include "..\..\includes\constants.h"
#include "..\..\includes\dikcodes.h"


ARGV(0,_message);
ARGV(1,_channel);
ARGV(2,_speaker);

if (undefined(_message)) exitWith {};
if (typeName _message != "STRING") exitWith {};

if (undefined(_speaker)) exitWith {
	_speaker = player;
};

if (undefined(_channel)) then {
	_channel = A_interaction_var_CHAT_GROUP;
};
	
if (_channel == A_interaction_var_CHAT_GLOBAL) exitWith {
	_speaker globalChat _message;
};

if (_channel == A_interaction_var_CHAT_SIDE) exitWith {
	_speaker sideChat _message;
};

if (_channel == A_interaction_var_CHAT_GROUP) exitWith {
	_speaker groupChat _message;
};

if (_channel == A_interaction_var_CHAT_VEHICLE) exitWith {
	_speaker vehicleChat _message;
};

if (_channel == A_interaction_var_CHAT_COMMAND) exitWith {
	_speaker commandChat _message;
};

if (_channel == A_interaction_var_CHAT_SYSTEM) exitWith {
	systemChat _message;
};
