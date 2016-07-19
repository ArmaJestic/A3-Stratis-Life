// A_hunting_fnc_unit_despawn

#include "../../includes/macro.h"

 _this spawn {
player groupChat format["A_hunting_fnc_unit_despawn %1", _this];
ARGV(0,_unit);
ARGV(1,_delay);

if (undefined(_unit)) exitWith {null};
if (typeName _unit != "OBJECT") exitWith {null};
if (isNull _unit) exitWith {null};
if (undefined(_delay)) exitWith {null};
if (typeName _delay != "SCALAR") exitWith {null};

_delay = ((_delay - 5) max (0));
player groupChat format["A_hunting_fnc_unit_despawn waiting %1, %2", _unit, _delay];
[_delay] call A_player_fnc_isleep;

player groupChat format["A_hunting_fnc_unit_despawn hiding %1", _unit];
private["_i"];
_i = 0;
while { _i < 5 } do {
	hideBody _unit;
	sleep 1;
	_i = _i + 1;
};

if (isServer) then {
	sleep 5;
	deleteVehicle _unit;
};
};
