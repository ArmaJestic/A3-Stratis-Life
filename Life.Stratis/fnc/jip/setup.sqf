// A_jip_fnc_setup

#include "..\..\includes\macro.h"
#include "..\..\includes\constants.h"

if (not(isServer)) exitWIth {};
[] call A_jip_fnc_register_setup;
[] call A_jip_fnc_get_setup;
