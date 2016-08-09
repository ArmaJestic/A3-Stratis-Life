// A_client_fnc_check_inventory

#include "..\..\includes\macro.h"


if (!(alive player)) exitWith {null};

private["_player"];
_player = player;

call A_client_fnc_check_keychain;
