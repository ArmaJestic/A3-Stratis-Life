// A_stats_fnc_compile_entry

#include "../../includes/macro.h"

//player groupChat format["A_stats_fnc_compile_entry %1", _this];
private["_entry", "_object"];

_entry = _this select 0;
_object = _this select 1;

if (undefined(_entry)) exitWith {null};
if (typeName _entry != "ARRAY") exitWith {null};
if (count _entry != 2) exitWith {null};

if (undefined(_object)) exitWith {null};
if (typeName _object != "OBJECT") exitWith {null};

private["_name", "_value"];

_name = _entry select 0;
_value = _entry select 1;
_value = (call compile _value) select 0;

if (undefined(_value)) then {
	_value = null;
};

[_object, _name, _value] call A_stats_fnc_init_entry;
