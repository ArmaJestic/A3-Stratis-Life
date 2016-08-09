// A_license_fnc_remove_actions

#include "..\..\includes\constants.h"
#include "..\..\includes\macro.h"


//player groupChat format["A_license_fnc_remove_actions %1", _this];
if (count A_license_var_actions == 0) exitWith {null};
ARGV(0,_player);
if (!([_player] call A_player_fnc_human)) exitWith {null};

{
	private["_action_id"];
	_action_id = _x;
	_player removeAction _action_id;
} forEach A_license_var_actions;
A_license_var_actions = [];
