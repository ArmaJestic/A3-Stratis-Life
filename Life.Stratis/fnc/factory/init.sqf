// A_factory_fnc_init

#include "header.h"


call A_factory_fnc_globals;
if (!isServer) then {
	A_factory_var_actions = [];
	A_factory_var_selected = null;
	call A_factory_fnc_setup_factories;
};