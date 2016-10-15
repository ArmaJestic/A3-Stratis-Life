// A_factory_fnc_setup_factories

#include "header.h"


{
	private _factory = _x;
	private _factory_id = _factory select INDEX_ID;
	[player, _factory_id] call A_factory_fnc_setup_factory;
} forEach all_factories;