// A_retributions_fnc_remove_killer

#include "header.h"


private["_i"];
_euid = _this select 0;

_killers = [player, "killers"] call A_object_fnc_getVariable;
if (UNDEFINED(_killers) || typeName _killers != "ARRAY") then { _killers = []; };

_i = 0;
_new_killers = [];
for [{_i = 0}, {_i < (count _killers)}, {_i = _i + 1}] do {
	_killer_data = _killers select _i;
	_ceuid = _killer_data select INDEX_KS_EUID;
	if (_ceuid != _euid) then {
		_new_killers = _new_killers + [_killer_data];
	};
};

_killers = _new_killers;

[player, "killers", _killers, true] call A_object_fnc_setVariable;
