// A_halo_fnc_add_smoke_actions

#include "..\..\includes\macro.h"


ARGV(0,_unit);

private ["_actions"];
//player groupChat "Adding A_other_fnc_smoke actions";
_smokes = [ ["A_other_fnc_smoke White", "A_other_fnc_smokeShell"],
          ["A_other_fnc_smoke Red", "A_other_fnc_smokeShellRed"],
		  ["A_other_fnc_smoke Green", "A_other_fnc_smokeShellGreen"],
		  ["A_other_fnc_smoke Yellow", "A_other_fnc_smokeShellYellow"],
		  ["A_other_fnc_smoke Orange", "A_other_fnc_smokeShellOrange"],
		  ["A_other_fnc_smoke Purple", "A_other_fnc_smokeShellPurple"],
		  ["A_other_fnc_smoke Blue", "A_other_fnc_smokeShellBlue"]
		 ];
		 
_actions = [];
    {

	_smoke_name = _x select 0;
	_smoke_class = _x select 1;
	_action_id = _unit addaction [format["Activate %1", _smoke_name],A_other_fnc_noscript,format['[_this select 1, "%1"] call A_halo_fnc_activate_smoke;', _smoke_class],1,false,true,"","true"];
	_actions = _actions + [[_action_id,_smoke_class]];
} foreach _smokes;

_action_id = _unit addaction [format["Deactivate A_other_fnc_smoke"],A_other_fnc_noscript,format['[_this select 1] call A_halo_fnc_deactivate_A_other_fnc_smoke;'],1,false,true,"","true"];
_actions = _actions + [[_action_id, "SmokeDeactivate"]];
[_unit, "halo_smoke_actions", _actions] call A_object_fnc_setVariable;
_actions
