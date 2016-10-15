// A_list_fnc_remove_key

#include "header.h"


params[["_list_id",null,[""]],["_key",null,[""]]];

if (UNDEFINED(_list_id)) exitWith {null};
if (UNDEFINED(_key)) exitWith {null};

private _data = [_list_id] call A_list_fnc_data;
if (UNDEFINED(_data)) exitWith {null};

private _keys = _data select INDEX_KEYS;
private _values = _data select INDEX_VALUES;
private _index = _keys find _key;
if (_index == -1) exitWith {null};

_values set [_index, _key];

_keys = _keys - [_key];
_values = _values - [_key];

_data set [INDEX_KEYS, _keys];
_data set [INDEX_VALUES, _values];

[_list_id,  _data, false] call A_server_fnc_set_array_checked;