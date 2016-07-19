// A_list_fnc_remove_key

#include "../../includes/macro.h"


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

_values set [_index, _key];

_keys = _keys - [_key];
_values = _values - [_key];

_data set [A_list_var_keys, _keys];
_data set [A_list_var_values, _values];

[_list_id,  _data, false] call A_server_fnc_set_array_checked;
