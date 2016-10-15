// A_retributions_fnc_remove_victim

#include "header.h"


_euid = _this select 0;

_victims = [player, "victims"] call A_object_fnc_getVariable;
if (UNDEFINED(_victims) || typeName _victims != "ARRAY") then { _victims = []; };

_i = 0;
_new_victims = [];
for [{_i = 0}, {_i < (count _victims)}, {_i = _i + 1}] do {
	_victim_data = _victims select _i;
	_ceuid = _victim_data select INDEX_VS_EUID;
	if (_ceuid != _euid) then {
		_new_victims = _new_victims + [_victim_data];
	};
};

_victims = _new_victims;
[player, "victims", _victims, true] call A_object_fnc_setVariable;
