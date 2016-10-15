// A_bases_fnc_oil_derrick_barrel_loop
// loop iteration

#include "header.h"


{
	_amount = [_x, "amount", 0] call A_object_fnc_getVariable;
	if (_amount < 50) then {
		_amount = _amount + ceil(random(9));
		[_x, _amount] call A_bases_fnc_oil_derrick_barrel_update;
	};
	false
} count A_bases_var_oil_derrick_barrels;