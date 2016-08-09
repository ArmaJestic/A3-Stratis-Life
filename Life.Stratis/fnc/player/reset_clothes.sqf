// A_player_fnc_reset_clothes

#include "..\..\includes\macro.h"


ARGV(0,_player);
if (!([_player] call A_player_fnc_exists)) exitWith {null};

[_player] call A_player_fnc_remove_clothes;

if ([_player] call A_player_fnc_blufor) exitWith {
	_player addUniform A_player_var_cop_default_uniform;
};

if ([_player] call A_player_fnc_civilian) exitWith {
	_player addUniform A_player_var_civilian_default_uniform;
};

if ([_player] call A_player_fnc_independent) exitWith {
	_player addUniform A_player_var_insurgent_default_uniform;
};

if ([_player] call A_player_fnc_opfor) exitWith {
	_player addUniform A_player_var_opfor_default_uniform;
};
