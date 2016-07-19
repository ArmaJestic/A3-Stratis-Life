// A_bis_expected_fnc_unitDelete

#include "..\..\includes\macro.h"

 _this spawn {
ARGV(0,_unit);
if (not([_unit] call A_player_fnc_exists)) exitWith {null};
_unit setPosATL [-1, -1, 0];
_unit setDamage 1;

private["_i"];
_i = 0;
while { _i < 10 } do {
	hideBody _unit;
	_i = _i + 1;
};
deleteVehicle _unit;
};
