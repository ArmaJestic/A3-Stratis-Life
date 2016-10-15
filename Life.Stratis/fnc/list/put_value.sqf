// A_list_fnc_put_value

#include "header.h"


params[["_list_id",null,[""]],["_key",null,[""]],"_value"];

if (UNDEFINED(_list_id)) exitWith {null};
if (UNDEFINED(_key)) exitWith {null};

private _data = [_list_id] call A_list_fnc_data;
if (UNDEFINED(_data)) exitWith {null};

private _keys = _data select INDEX_KEYS;
private _values = _data select INDEX_VALUES;

private _index = _keys find _key;
_index = [_index,count(_keys)] select (_index ==  -1);
_keys set[_index, _key];
_values set[_index, _value];

_data set [INDEX_KEYS, _keys];
_data set [INDEX_VALUES, _values];

[_list_id, _data, false] call A_server_fnc_set_array_checked;