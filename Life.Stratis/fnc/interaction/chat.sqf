// A_interaction_fnc_chat

#include "header.h"


params[["_message",null,[""]],["_channel",INTERACT_INDEX_CHAT_GROUP,[0]],["_speaker",player,[objNull]]];

if (UNDEFINED(_message)) exitWith {};
	
if (_channel == INTERACT_INDEX_CHAT_GLOBAL) exitWith {
	_speaker globalChat _message;
};
if (_channel == INTERACT_INDEX_CHAT_SIDE) exitWith {
	_speaker sideChat _message;
};
if (_channel == INTERACT_INDEX_CHAT_GROUP) exitWith {
	_speaker groupChat _message;
};
if (_channel == INTERACT_INDEX_CHAT_VEHICLE) exitWith {
	_speaker vehicleChat _message;
};
if (_channel == INTERACT_INDEX_CHAT_COMMAND) exitWith {
	_speaker commandChat _message;
};
if (_channel == INTERACT_INDEX_CHAT_SYSTEM) exitWith {
	systemChat _message;
};