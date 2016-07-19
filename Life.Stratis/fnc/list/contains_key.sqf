// A_list_fnc_contains_key

#include "..\..\includes\macro.h"


ARGV(0,_list_id);
ARGV(1,_key);

if (undefined(_list_id)) exitWith {false};
if (typeName _list_id != "STRING") exitWith {false};
if (undefined(_key)) exitWith {false};
if (typeName _key != "STRING") exitWIth {false};

private["_data"];
_data = [_list_id] call A_list_fnc_data;
if (undefined(_data)) exitWith {false};

private["_keys", "_values"];
_keys = _data select A_list_var_keys;

private["_index"];
_index = _keys find _key;
if (_index == -1) exitWith {false};

(true)
