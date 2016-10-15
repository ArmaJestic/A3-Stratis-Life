// A_list_fnc_contains_key

#include "header.h"


params[["_list_id",null,[""]],["_key",null,[""]]];

diag_log format['A_list_fnc_contains_key(%1): '];

if UNDEFINED(_list_id) exitWith {diag_log format['A_list_fnc_contains_key(%1): exit1',_this]; false};
if UNDEFINED(_key) exitWith {diag_log format['A_list_fnc_contains_key(%1): exit2',_this]; false};

private _data = [_list_id] call A_list_fnc_data;
if UNDEFINED(_data) exitWith {diag_log format['A_list_fnc_contains_key(%1): exit3',_this]; false};

private _keys = _data select INDEX_ID;
private _index = _keys find _key;
diag_log format['A_list_fnc_contains_key(%1): _data:%2, _keys: %3, _key: %4, _index: %5',_this,_data,_keys,_key,_index]; 
(_index != -1)