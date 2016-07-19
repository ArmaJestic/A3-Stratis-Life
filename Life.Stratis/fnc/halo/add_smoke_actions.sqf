// A_halo_fnc_add_smoke_actions

#include "..\..\includes\macro.h"


ARGV(0,_unit);

private ["_actions"];
//player groupChat "Adding smoke actions";
_smokes = [ ["Smoke White", "SmokeShell"],
          ["Smoke Red", "SmokeShellRed"],
		  ["Smoke Green", "SmokeShellGreen"],
		  ["Smoke Yellow", "SmokeShellYellow"],
		  ["Smoke Orange", "SmokeShellOrange"],
		  ["Smoke Purple", "SmokeShellPurple"],
		  ["Smoke Blue", "SmokeShellBlue"]
		 ];
		 
_actions = [];
    {

	_smoke_name = _x select 0;
	_smoke_class = _x select 1;
	_action_id = _unit addaction [format["Activate %1", _smoke_name],"noscript.sqf",format['[_this select 1, "%1"] call A_halo_fnc_activate_smoke;', _smoke_class],1,false,true,"","true"];
	_actions = _actions + [[_action_id,_smoke_class]];
} foreach _smokes;

_action_id = _unit addaction [format["Deactivate smoke"],"noscript.sqf",format['[_this select 1] call A_halo_fnc_deactivate_smoke;'],1,false,true,"","true"];
_actions = _actions + [[_action_id, "SmokeDeactivate"]];
[_unit, "halo_smoke_actions", _actions] call A_object_fnc_setVariable;
_actions
