// A_list_fnc_contains_key

#include "header.h"


params[["_list_id",null,[""]],["_key",null,[""]]];

if UNDEFINED(_list_id) exitWith {false};
if UNDEFINED(_key) exitWith {false};

private _data = [_list_id] call A_list_fnc_data;
if UNDEFINED(_data) exitWith {false};

private _keys = _data select INDEX_KEYS;
private _index = _keys find _key;
(_index != -1)