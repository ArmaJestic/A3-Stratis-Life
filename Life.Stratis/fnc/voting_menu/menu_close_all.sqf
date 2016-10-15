// A_voting_menu_fnc_menu_close_all

#include "header.h"


private["_timeout"];
_timeout = time + 0.5;

waitUntil {
	closeDialog 0;
	(time > _timeout)
};
