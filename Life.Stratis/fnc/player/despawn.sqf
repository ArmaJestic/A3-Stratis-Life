// A_player_fnc_despawn

#include "..\..\includes\macro.h"

 _this spawn {
//player groupChat format["A_player_fnc_despawn %1", _this];
ARGV(0,_unit);
ARGV(1,_delay);

if (undefined(_unit)) exitWith {null};
if (typeName _unit != "OBJECT") exitWith {null};
if (isNull _unit) exitWith {null};
if (undefined(_delay)) exitWith {null};
if (typeName _delay != "SCALAR") exitWith {null};

_delay = ((_delay - 5) max (0));
//diag_log format["A_player_fnc_despawn waiting %1, %2", _unit, _delay];
[_delay] call A_player_fnc_isleep;

if ([_unit] call A_underwater_base_fnc_under_base) exitWIth {
	_unit setPos [0,0,0];
	deleteVehicle _unit;
};

//diag_log format["A_player_fnc_despawn hiding %1", _unit];
private["_i"];
_i = 0;
while { _i < 5 } do {
	hideBody _unit;
	sleep 1;
	_i = _i + 1;
};

//diag_log format["A_player_fnc_despawn deleting %1", _unit];
//_unit setPos [-1,-1,-1];

if (isServer) then {
	sleep 5;
	deleteVehicle _unit;
};
};
