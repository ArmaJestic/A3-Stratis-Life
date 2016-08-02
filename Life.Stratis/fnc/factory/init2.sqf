// init2

#include "..\..\includes\macro.h"
#include "..\..\includes\constants.h"


[] call A_factory_fnc_globals;

if (isClient) then {
	call A_factory_fnc_setup;
};