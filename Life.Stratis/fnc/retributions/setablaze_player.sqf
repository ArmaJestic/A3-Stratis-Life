// A_retributions_fnc_setablaze_player

#include "..\..\includes\macro.h"


[] spawn {
	if (!(alive player)) exitWith {null};
	
	private ["_damage"];
	format["[%1, 5, time, false,false] spawn BIS_Effects_Burn;", player] call A_broadcast_fnc_broadcast;
	_damage = damage player;
	if (undefined(_damage) || typeName _damage != "SCALAR" || _damage < 0) then { _damage = 0;};
	while { _damage < 1 } do {
		format["[%1, player] say3D ""wilhelm"";", player] call A_broadcast_fnc_broadcast;
		_damage = _damage + 0.1;
		player setDamage _damage;
		sleep 6;
	};
};
