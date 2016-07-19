// A_player_fnc_intro_text

#include "..\..\includes\macro.h"

_this spawn {
private["_intro_messages"];

_intro_messages = [
	"Welcome to Stratis Life, an RPG mission. \n\n Feel free to copy or edit our mission file. \n\n This is an international server, everyone is welcome.",
	"Join our teamspeak at tlr.ts3dns.com!",
	"Cops must join TS3, may not abuse their power or teamkill.",
	"Racial slurs are prohibited here. \n\n Foul language and heated arguments are OK. \n\n Racist harassment of other players is NOT.",
	"Visit www.takistanliferevolution.com for more info.\n\nPlease be helpful to new players and don't grief."
];

private["_delay"];
_delay = 5;

{
	private["_message"];
	_message = _x;
	titleText [_message, "PLAIN", 0];
	sleep _delay;
} forEach _intro_messages;

3 fademusic 0;

};
