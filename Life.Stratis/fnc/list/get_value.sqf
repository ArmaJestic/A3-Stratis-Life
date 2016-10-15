// A_list_fnc_get_value

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
if (_index >= count(_values)) exitWith {null};

private _value = _values select _index;
(_value)