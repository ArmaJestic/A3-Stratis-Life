#include "Awesome\Functions\macro.h"

hint "Please read the SL tabs on map before playing";
server globalchat "[MoTD]Welcome to Stratis Life!";
custom_motd = null;
while {true} do {
	server globalchat "[MoTD] http://www.takistanliferevolution.com";
	server globalchat "[MoTD] TS3: tlr.ts3dns.com";
	server globalChat "[MoTD] All Blufor, Opfor, and Independent factions are required to be on TS3";
	if (not(undefined(custom_motd))) then { if (typeName custom_motd == "STRING") then { if (custom_motd != "") then {
		server globalChat format["[MoTD] %1", custom_motd];
	};};};
	sleep (3 * motdwaittime);
};
