// A_parameters_fnc_init2

#include "..\..\parameters.h"

debug = DEBUG;

if (isServer) then {
	if (isDedicated) then {
		useDefaultSave = !SAVE_EXTENSION_AVAILABLE;
	}else{
		useDefaultSave = true;
	}
}
