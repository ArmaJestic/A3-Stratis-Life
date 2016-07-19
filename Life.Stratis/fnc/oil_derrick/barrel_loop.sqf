// A_oil_derrick_fnc_barrel_loop

#include "../../includes/dikcodes.h"
#include "../../includes/macro.h"


if (not(isServer)) exitWith {};
waitUntil {
	private["_time"];
	_time = floor(serverTime);
	//player groupChat format["_time = %1", _time];
	if ((_time % 30) == 0) then {
		{
			private["_barrel", "_amount"];
			_barrel = _x;
			_amount = [_barrel, "amount", 0] call A_object_fnc_getVariable;
			if (_amount < 50) then {
				_amount = _amount + ceil(random(9));
				[_barrel, _amount] call A_oil_derrick_fnc_barrel_update;
			};
		} forEach A_oil_derrick_var_barrels;
	};
	sleep 1;
	false
};
