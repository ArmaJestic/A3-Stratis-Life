// A_client_fnc_check_restrains

#include "..\..\includes\macro.h"


//if (isblu) exitWith {null};

private["_player"];
_player = player;

if (not(alive _player)) exitWith {null};

private["_physicallyRestrained", "_logicallyRestrained"];
//player groupChat format["%1", (animationState _player) ];
_physicallyRestrained = (A_player_var_restrained_animations find ((animationState _player)) >= 0);
_logicallyRestrained = [_player, "restrained"] call A_player_fnc_get_bool;

//player groupChat format["_logicallyRestrained = %1", _logicallyRestrained];
//player groupChat format["_physicallyRestrained = %1", _physicallyRestrained];

if (_logicallyRestrained && not(_physicallyRestrained)) then {
	if ([_player, (vehicle _player)] call A_mounted_fnc_player_inside) exitWith {
		if (not([_player, 50] call A_player_fnc_near_cops)) exitWith {
			[_player, "restrained", false] call A_player_fnc_set_bool;
			_player groupChat format["You have managed to unrestrain yourself!"];
		};
	};
	//[[_player], "A_player_fnc_restrained_animation", true] call BIS_fnc_MP;
	[[_player], "A_player_fnc_restrained_animation", true] call BIS_fnc_MP;
}
else { if (not(_logicallyRestrained) && _physicallyRestrained) then {
	[[_player], "A_player_fnc_unrestrained_animation", true] call BIS_fnc_MP;
}
else { if (_logicallyRestrained && _physicallyRestrained) then {
	if ([_player, (vehicle _player)] call A_mounted_fnc_player_inside) then {
		[[_player], "A_player_fnc_unrestrained_animation", true] call BIS_fnc_MP;
	};
}
else { if (_logicallyRestrained || _physicallyRestrained) then {
	player groupChat format["Checking!"];
	if (not([_player, 50] call A_player_fnc_near_cops)) then {
		[_player, "restrained", false] call A_player_fnc_set_bool;
		_player groupChat format["You have managed to unrestrain yourself!"];
	};
};};};};
