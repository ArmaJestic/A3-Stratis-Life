// A_factory_fnc_setup

#include "../../includes/macro.h"
#include "../../includes/constants.h"


{
	private["_factory", "_factory_id"];
	_factory = _x;
	
	_factory_id = _factory select factory_id;
	[player, _factory_id] call A_factory_fnc_init;
	[_factory_id] spawn A_factory_fnc_loop;
} forEach all_factories;
