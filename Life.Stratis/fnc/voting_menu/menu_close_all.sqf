// A_voting_menu_fnc_menu_close_all

#include "..\..\includes\constants.h"
#include "..\..\includes\macro.h"


private["_timeout"];
_timeout = time + 0.5;

waitUntil {
	closeDialog 0;
	(time > _timeout)
};
