// A_list_fnc_get_value

#include "..\..\includes\macro.h"


ARGV(0,_list_id);
ARGV(1,_key);

if (undefined(_list_id)) exitWith {null};
if (typeName _list_id != "STRING") exitWith {null};
if (undefined(_key)) exitWith {null};
if (typeName _key != "STRING") exitWith {null};

private["_data"];
_data = [_list_id] call A_list_fnc_data;
if (undefined(_data)) exitWith {null};

private["_keys", "_values"];
_keys = _data select A_list_var_keys;
_values = _data select A_list_var_values;

private["_index"];
_index = _keys find _key;
if (_index == -1) exitWith {null};

private["_value"];
if (_index >= count(_values)) exitWith {null};

_value = _values select _index;

(_value)
